const PRODUCT_URL = "http://localhost:8081/admin/product/productjson";
const PRODUCT_TYPE_URL = "http://localhost:8081/admin/product/producttypejson";
const date = new Date()
const columnSearchInputs = document.querySelectorAll('.columnSearchInput')
const typeInput = document.querySelector("#typeValue")
const stockInput = document.querySelector("#stockValue")
const stockEdit = document.querySelector("#stockEdit")
const costInput = document.querySelector("#costValue")
const costEdit = document.querySelector("#costEdit")
const costUnit = document.querySelector("#costUnit")
const priceInput = document.querySelector("#priceValue")
const priceEdit = document.querySelector("#priceEdit")
const priceUnit = document.querySelector("#priceUnit")
const submit = document.querySelector("#submit")
const typeList = document.querySelector("#typeList")
let rawData = ""




// 取得 product type json
axios.get(PRODUCT_TYPE_URL)
	.then(response => {
		productTypeRawData = response.data
		showPullDownList()
	})
	.catch(error => { console.log(error) })

// 取得 product json
axios
	.get(PRODUCT_URL)
	.then(response => {
		rawData = response.data
		showData(response.data)
		addListeners()
	})
	.catch(error => console.log(error));

///////////////////////////////////////////////////////////////////

function showData(data) {
	currentData = []
	currentData.push(...data)
	contents = ""
	for (let i = 0; i < data.length; i++) {
		contents += "<tr>"
		contents += "<td>" + data[i].productid + "</td>"
		contents += "<td>" + data[i].producttype + "</td>"
		contents += "<td>" + data[i].productname + "</td>"
		contents += "<td>" + data[i].productstock + "</td>"
		contents += "<td>" + data[i].productcost + "</td>"
		contents += "<td>" + data[i].productprice + "</td>"
	}
	resultTable.innerHTML = contents
}

// 產品種類輸入變成 pull down menu
function showPullDownList() {
	let typeContent = "	<select id='producttype' class='type' name='type'>"
	for (let i = 0; i < productTypeRawData.length; i++) {
		typeContent += `<option value='${productTypeRawData[i].producttypename}'>${productTypeRawData[i].producttypename}</option>`
	}
	typeContent += "<option value='newProductType'>新增產品種類</option></select>"
	typeList.innerHTML = typeContent
}

////////////////////////////////////////////////////////////////////

// 搜尋
function ultraFuckingSearch() {
	let tempData = rawData

	const KEY = ["productid", "producttype", "productname", "productstock", "productcost", "productprice"]


	for (let k = 0; k < columnSearchInputs.length; k++) {

		if (columnSearchInputs[k].value !== "") {
			if (k === 1) {
				tempData = tempData.filter(product => product.producttype.includes(columnSearchInputs[1].value))
			} else if (k === 2) {
				tempData = tempData.filter(product => product.productname.toLowerCase().includes(columnSearchInputs[2].value.toLowerCase()))
			} else {
				if (columnSearchInputs[k].value.includes("<")) {
					tempData = tempData.filter(product => product[KEY[k]] < Number(columnSearchInputs[k].value.slice(1)))
				} else if (columnSearchInputs[k].value.includes(">")) {
					tempData = tempData.filter(product => product[KEY[k]] > Number(columnSearchInputs[k].value.slice(1)))
				} else {
					tempData = tempData.filter(product => product[KEY[k]] == Number(columnSearchInputs[k].value))
				}
			}
		}
	}
	return tempData
}

////////////////////////////////////////////////////////////////////

function addListeners() {

	// 成本調整單位 listener
	costEdit.addEventListener("change", (event) => {
		setUnitCharacter(event.target, costUnit)
	})

	// 售價調整單位 listener
	priceEdit.addEventListener("change", (event) => {
		setUnitCharacter(event.target, priceUnit)
	})

	// submit 按鈕 listener
	submit.addEventListener("click", (event) => {
		trimInputs()
		checkInputs()
		submitInputs()
	})

	// 搜尋按鈕 listener
	columnSearchInputs.forEach(columnSearchInput => {
		columnSearchInput.addEventListener("keyup", (event) => {
			showData(ultraFuckingSearch())
		})
	})

}

////////////////////////////////////////////////////////////////////

// 轉換單位
function setUnitCharacter(editTarget, unitTarget) {
	if (editTarget.value === "+" || editTarget.value === "-") {
		unitTarget.innerText = "%"
	} else if (editTarget.value === "=") {
		unitTarget.innerText = "$"
	} else {
		unitTarget.innerText = ""
	}
}
////////////////////////////////////////////////////////////////////

function trimInputs() {
	console.log("parseValues")
	document.querySelectorAll("input").forEach(input => {
		input.value = input.value.trim()
	})
}

function checkInputs() {
	console.log("checkValues")

}

function submitInputs() {
	console.log("submitValues")

	if (typeInput.value !== "") {
		console.log(typeInput.value)
	}
	if (stockInput.value !== "") {
		console.log(stockEdit.value)
		console.log(stockInput.value)
	}
	if (costInput.value !== "") {
		console.log(costEdit.value)
		console.log(costInput.value)
	}
	if (priceValue.value !== "") {
		console.log(priceEdit.value)
		console.log(priceInput.value)
	}
}

