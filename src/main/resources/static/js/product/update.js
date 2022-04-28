const PRODUCT_URL = "http://localhost:8081/admin/product/productjson";
const PRODUCT_TYPE_URL = "http://localhost:8081/admin/product/producttypejson";
const queryString = window.location.search
const urlParams = new URLSearchParams(queryString)
const targetID = urlParams.get('systemid')

let productRawData = []
let productTypeRawData = []
let oldProductName = ""

axios.get(PRODUCT_TYPE_URL)
	.then(response => {
		productTypeRawData = response.data
	})
	.catch(error => { console.log(error) })

axios.get(PRODUCT_URL)
	.then(response => {
		showData(getTargetProduct(response.data))
		addEventListeners(response.data)
	})
	.catch(error => { console.log(error) })

function getTargetProduct(data) {
	return data.find(product => product.systemid == targetID)
}

function showData(data) {
let productstate = "<td><input id='productstate' type='checkbox' value='true' ><label for='productstate'>上架</label></td>"
if(data.productstate) {
	productstate = "<td><input id='productstate' type='checkbox' value='true' checked='false'><label for='productstate'>上架</label></td>"
}
	let contents = "<tr>"
	contents += "<td>								<input id='systemid'			type='hidden' class=''				name='type'			value='" + data.systemid + "'></td>"
	contents += "<td id='id'>						<input id='productid'			type='text' class='產品編號 input'	name='id'			value='" + data.productid + "' disabled ></td>"
	contents += "<td id='typeList' width='155px'>	<input id='producttype'			type='text' class='產品種類 input'	name='type'			value='" + data.producttype + "'></td>"
	contents += "<td id='name'>						<input id='productname'			type='text' class='產品名稱 input'	name='name'	 		value='" + data.productname + "'></td>"
	contents += "<td>								<input id='productstock'		type='text' class='產品存量 input'	name='stock' 		value='" + data.productstock + "'></td>"
	contents += "<td>								<input id='productcost'			type='text' class='產品買價 input'	name='cost'	 		value='" + data.productcost + "'></td>"
	contents += "<td>								<input id='productprice'		type='text' class='產品售價 input'	name='price' 		value='" + data.productprice + "'></td>"
//	contents += "<td>								<input id='productdescription'	type='text' class='產品介紹 input'	name='description'	value='" + data.productdescription + "'></td>"
	
	contents += "<td>								<textarea id='productdescription' name='description' rows='10' cols='50'>" + data.productdescription + "</textarea></td>"
	
	contents += productstate
	contents += "<td id='imageTD'>					<input id='productimage' 		type='file'	class='產品圖片 input'	name='imageFile'	value=''></td></tr>"
	resultTable.innerHTML = contents
	oldProductName = data.productname
}


function addEventListeners(data) {
	const inputs = document.querySelectorAll("table .input")
	const typeList = document.querySelector("#typeList")
	const producttype = document.querySelector("#producttype")
	const submitButton = document.getElementById("submitButton")
	const inputChecking = document.getElementById("inputChecking")

	// 防止更改產品編號
	document.querySelector("#id").addEventListener("click", () => {
		event.preventDefault()
		alert("產品編號不能更改")
	})
	
	// 檢查重複產品名稱
	document.querySelector("#name input").addEventListener("change", (event) => {
		for (let i = 0; i < data.length; i++) {
			if (data[i].productname.toLowerCase() == event.target.value.trim().toLowerCase()) {
				alert("已有同名稱產品")
				event.target.value = oldProductName
				i = data.length
			}
		}
	})
	
	// 產品種類輸入變成 pull down menu
	producttype.addEventListener("click", event => {
		let typeContent = "	<select id='producttype' class='type' name='type'>"
		for (let j = 0; j < productTypeRawData.length; j++) {
			typeContent += `<option value='${productTypeRawData[j].producttypename}'>${productTypeRawData[j].producttypename}</option>`
		}
		typeContent += "<option value='newProductType'>新增產品種類</option></select>"
		typeList.innerHTML = typeContent
	})

	// 判斷是否需要新增產品種類
	typeList.addEventListener('click', event => {
		if (event.target.value === "newProductType") {
			event.target.parentElement.innerHTML = `<input id="producttype" class="input" type="text" name="type" placeholder="輸入產品種類">`
		}
	})

	// 檢查輸入資料
	submitButton.addEventListener("click", (event) => {
		event.preventDefault()
		inputChecking.innerHTML = ""
		let switcher = "on"

console.log(inputs)

		for (let i = 0; i < inputs.length - 1; i++) {
			
			// 刪除前後空白
			inputs[i].value = inputs[i].value.trim()
			
			// 檢查空白輸入
			if (inputs[i].value === "" && i <= 6) {
				switcher = "off"
				inputChecking.innerHTML += "請輸入" + inputs[i].classList[0] + "<br>"
			}



			// 檢查 stock 輸入小數
			if (i === 3 && inputs[i].value.match(/\./)) {
				switcher = "off"
				inputChecking.innerHTML += inputs[i].classList[0] + "只可輸入整數" + "<br>"
			}
			
			// 檢查 stock cost price 輸入非數字
			if (i >= 3 && i <= 5) {
				if (inputs[i].value.match(/[\`\~\!\@\#\$\%\^\&\*\(\)\_\+\-\=\{\}\[\]\;\:\'\"\<\>\?\,\\]/) ||
					inputs[i].value.match(/[\u4E00-\u9FFF]/) ||
					inputs[i].value.match(/[a-zA-Z]/)) {
					switcher = "off"
					inputChecking.innerHTML += inputs[i].classList[0] + "只可輸入數字" + "<br>"
				}
			}
			
			// 檢查 description 輸入數字超過上限
			if (i === 6 && inputs[i].value.length > 50) {
				inputChecking.innerHTML += inputs[i].classList[0] + "不可超過50個字" + "<br>"
			}
		}

		// 送出請求
		if (switcher === "on") {
			document.querySelector(".產品編號").disabled = false
			sendRequests()
		}
	})
}


// 發出請求
function sendRequests() {
	document.addEventListener("click", (event) => {
		event.preventDefault()
		axios.all([update(), uploadImage()])
			.then(axios.spread(function(acct, perms) {
			}))
	})
}

// 更新資料
function update() {
	let productstate = false
	if(document.getElementById("productstate").checked) {
		productstate = true
	}

	return axios.post('/admin/product/save', {
		systemid: document.getElementById("systemid").value,
		producttype: document.getElementById("producttype").value,
		productid: document.getElementById("productid").value,
		productname: document.getElementById("productname").value,
		productstock: document.getElementById("productstock").value,
		productcost: document.getElementById("productcost").value,
		productprice: document.getElementById("productprice").value,
		productdescription: document.getElementById("productdescription").value,
		productstate: productstate,
		productimage: document.getElementById("productid").value + ".jpg"
	})
		.then(function(response) {
			location.href = "/admin/product/productindex"
		})
		.catch(function(error) {
			console.log(error)
		});
}

// 更新圖片
function uploadImage() {
	let formData = new FormData(updateForm)
	formData.append('file', document.getElementById("productimage").value)
	formData.append('imageName', document.getElementById("productid").value + ".jpg")
	return axios({
		url: "/admin/product/uploadimage",
		method: "post",
		data: formData,
		headers: { 'Content-Type': 'multipart/form-data' }
	})
		.then(function(response) { })
		.catch(function(error) {
			console.log(error)
		});
}
