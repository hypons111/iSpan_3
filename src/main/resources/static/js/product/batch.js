const BASE_URL = "http://localhost:8081/admin/product/productjson"

const resultTable = document.querySelector("#resultTable")
const columnSearchInputs = document.querySelectorAll('.columnSearchInput')
//const batchHiddenInput = document.querySelector('#batchHiddenInput')
//const id = document.querySelector('#id')

const newStockInput = document.querySelector("#newStockInput")
const stockEdit = document.querySelector("#stockEdit")
const newCostInput = document.querySelector("#newCostInput")
const costEdit = document.querySelector("#costEdit")
const costtUnit = document.querySelector("#costUnit")
const newPriceInput = document.querySelector("#newPriceInput")
const priceEdit = document.querySelector("#priceEdit")
const pricetUnit = document.querySelector("#priceUnit")

const batchButton = document.querySelector("#batchButton")



const sorts = document.querySelectorAll('#sort')
let currentData = []
let rawData = ""
let sortStates = "ASC"


// 取得 json
axios
	.get(BASE_URL)
	.then(response => {
		rawData = response.data
		showData(response.data)
		addSearchEventListeners()
		addSortEventListeners()
		addStateSwitchButtonListener()
	})
	.catch(error => console.log(error));


// 顯示全部產品
function showData(data) {

	currentData = []
	currentData.push(...data)

	contents = ""
	for (let i = 0; i < data.length; i++) {
		contents += "<tr>"
		contents += "<td>" + data[i].systemid + "</td>"
		contents += "<td>" + data[i].productname + "</td>"
		contents += "<td>" + data[i].producttype + "</td>"
		contents += "<td>" + data[i].productstock + "</td>"
		contents += "<td>" + data[i].productcost + "</td>"
		contents += "<td>" + data[i].productprice + "</td>"
		contents += "<td>" + data[i].productstate + "</td>"
	}
	resultTable.innerHTML = contents
}



// 顯示全部產品按鈕 listener
document.querySelector('#showAll').addEventListener('click', () => {
	showData(rawData)
	columnSearchInputs.forEach(columnSearchInput => {
		columnSearchInput.value = ""
	})
})

// 搜尋按鈕 listener
function addSearchEventListeners() {
	columnSearchInputs.forEach(columnSearchInput => {
		columnSearchInput.addEventListener("keyup", (event) => {
			showData(ultraFuckingSearch())
		})
	})
}


// 搜尋
function ultraFuckingSearch() {
	let tempData = rawData
	const KEY = ["systemid", "producttype", "productname", "productstock", "productcost", "productprice"]

	for (let k = 0; k < columnSearchInputs.length; k++) {
		if (columnSearchInputs[k].value !== "") {
			if (k === 0) {
				tempData = tempData.filter(product => product.systemid.trim().includes(columnSearchInputs[k].value).trim())
			} else if (k === 1) {
				tempData = tempData.filter(product => product.productname.toLowerCase().trim().includes(columnSearchInputs[k].value.toLowerCase().trim()))
			} else if (k === 2) {
				tempData = tempData.filter(product => product.producttype.toLowerCase().trim().includes(columnSearchInputs[k].value.toLowerCase().trim()))
			} else if (k === 6) {
				tempData = tempData.filter(product => product.productdescription.toLowerCase().trim().includes(columnSearchInputs[k].value.toLowerCase().trim()))
			} else {
				if (columnSearchInputs[k].value.includes("<")) {
					tempData = tempData.filter(product => product[KEY[k]] < Number(columnSearchInputs[k].value.trim().slice(1)))
				} else if (columnSearchInputs[k].value.includes(">")) {
					tempData = tempData.filter(product => product[KEY[k]] > Number(columnSearchInputs[k].value.trim().slice(1)))
				} else {
					tempData = tempData.filter(product => product[KEY[k]] == Number(columnSearchInputs[k].value.trim()))
				}
			}
		}
	}
	return tempData
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 排序按鈕 listener

function addSortEventListeners() {
	sorts.forEach(sort => {
		sort.addEventListener('click', (event) => {
			event.preventDefault()
			let attribute = event.target.classList[0]
			if (sortStates === "ASC") {
				currentData.sort((a, b) => {
					if (a[attribute] < b[attribute]) { return -1 }
					if (a[attribute] > b[attribute]) { return 1 }
					return 0
				})
				sortStates = "DESC"
			} else {
				currentData.sort((a, b) => {
					if (a[attribute] < b[attribute]) { return 1 }
					if (a[attribute] > b[attribute]) { return -1 }
					return 0
				})
				sortStates = "ASC"
			}
			showData(currentData)
		})
	})
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


// 更改產品狀態按鈕 listener
function addStateSwitchButtonListener() {
	const stateSwitchButton = document.querySelector("#stateSwitchButton")

	stateSwitchButton.addEventListener("click", event => {
		event.target.parentElement.innerHTML = `<input type="checkbox" id="productstate" value="true" checked="checked"><label for="productstate">上架</label>`
	})

}



// 批次處理
batchButton.addEventListener("click", event => {
	trimValues()
	//	checkValues()
	submitValues()
})


costEdit.addEventListener("change", (event) => {
	setUnitCharacter(event.target, costUnit)
})

priceEdit.addEventListener("change", (event) => {
	setUnitCharacter(event.target, priceUnit)
})

function setUnitCharacter(editTarget, unitTarget) {
	if (editTarget.value === "+" || editTarget.value === "-") {
		unitTarget.innerText = "%"
	} else if (editTarget.value === "=") {
		unitTarget.innerText = "$"
	} else {
		unitTarget.innerText = ""
	}
}

// 刪除輸入框的 space
function trimValues() {
	document.querySelectorAll("input").forEach(input => {
		input.value = input.value.trim()
	})
}

// 取得要修改的產品 id 的陣列
function getProductList() {
	const batchList = []
	for (let i = 0; i < resultTable.children.length; i++) {
		batchList.push(document.querySelector("#resultTable").children[i].children[0].innerText)
	}
	return batchList
}

function submitValues() {

	if (window.confirm("確定要修改嗎?")) {

		let productstate = false

		if (document.getElementById("productstate")) {
			if (document.getElementById("productstate").checked) {
				productstate = true
			}
		}

		let formData = new FormData()
		
		if (newStockInput.value !== "") {
			formData.append("newStock", newStockInput.value)
		} else {
			formData.append("newStock", 0)
		}
		
		if (newCostInput.value !== "") {
			formData.append("newCost", newCostInput.value)
		} else {
			formData.append("newCost", 0)
		}
		
		if (newPriceInput.value !== "") {
			formData.append("newPrice", newPriceInput.value)
		} else {
			formData.append("newPrice", 0)
		}

		formData.append("newState", productstate)

		formData.append("stockEdit", stockEdit.value)
		formData.append("costEdit", costEdit.value)
		formData.append("priceEdit", priceEdit.value)

		formData.append("batchList", getProductList())

		axios({
			url: "/admin/product/batch",
			method: "put",
			data: formData,
			headers: { 'Content-Type': 'multipart/form-data' }
		})
			.then(response => {
				window.location = "/admin/product/productindex"
			})
			.catch(error => {
				console.log(error)
			})
	}
}




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
function checkValues() {
	console.log("checkValues")
	document.querySelectorAll("input").forEach(input => {
		input.value = input.value.trim()
	})
}
*/
