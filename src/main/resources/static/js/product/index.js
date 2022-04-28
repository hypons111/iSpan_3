const BASE_URL = "http://localhost:8081/admin/product/productjson"
const batchHiddenInput = document.querySelector('#batchHiddenInput')
const resultTable = document.querySelector("#resultTable")
const id = document.querySelector('#id')
const columnSearchs = document.querySelectorAll('.columnSearch')
const columnSearchInputs = document.querySelectorAll('.columnSearchInput')
const deleteButton = document.querySelector("#deleteButton")
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
		addDeleteButtonEventListener()
		setDataTable()

	})
	.catch(error => console.log(error));


// 顯示全部產品
function showData(data) {
	currentData = []
	currentData.push(...data)

	contents = ""
	for (let i = 0; i < data.length; i++) {
		contents += "<tr>"
		contents += "<td>" + data[i].producttype + "</td>"
		contents += "<td>" + data[i].productid + "</td>"
		contents += "<td>" + data[i].productname + "</td>"
		contents += "<td>" + data[i].productstock + "</td>"
		contents += "<td>" + data[i].productcost + "</td>"
		contents += "<td>" + data[i].productprice + "</td>"
		contents += "<td>" + data[i].productdescription + "</td>"
		contents += "<td>" + data[i].productstate + "</td>"
		contents += "<td><img src='/image/product/" + data[i].productimage + "?" + Math.random() + "' ></td>"
		contents += "<td><a href=updateform?systemid=" + data[i].systemid + "><button>修改</button></a></td>"
		contents += "<td><button id='deleteButton' data-productid='" + data[i].productid + "' data-systemid='" + data[i].systemid + "'>刪除</button></td></tr>"
	}
	resultTable.innerHTML = contents
}

function setDataTable() {
	const datatablesSimple = document.getElementById('datatablesSimple')
	if (datatablesSimple) {
		new simpleDatatables.DataTable(datatablesSimple)
	}
	
//	let text = document.querySelector(".dataTable-dropdown label").innerHTML; 
//	document.querySelector(".dataTable-dropdown label").innerHTML = text.replace("entries per page", "項結果")

	document.querySelector(".dataTable-search").remove()
	
	
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
	const KEY = ["", "productid", "", "productstock", "productcost", "productprice", "productstate"]


	for (let k = 0; k < columnSearchInputs.length; k++) {
	
		if (columnSearchInputs[k].value !== "") {
			if (k === 0) {
				tempData = tempData.filter(product => product.producttype.toLowerCase().includes(columnSearchInputs[0].value))
			} else if (k === 1) {
				tempData = tempData.filter(product => product.productid.includes(columnSearchInputs[k].value))
			} else if (k === 2) {
				tempData = tempData.filter(product => product.productname.toLowerCase().includes(columnSearchInputs[k].value.toLowerCase()))
			} else if (k === 6) {
				tempData = tempData.filter(product => product.productdescription.toLowerCase().includes(columnSearchInputs[k].value.toLowerCase()))
			} else if (k === 7) {
				tempData.forEach(product => {console.log()})
				tempData = tempData.filter(product => product.productstate.toString().match(columnSearchInputs[k].value))
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


// 更新版刪取
function addDeleteButtonEventListener() {
	resultTable.addEventListener("click", (event) => {
		if (event.target.id === "deleteButton") {

			if (window.confirm("確定要刪除嗎?")) {
				const rows = document.querySelectorAll("#deleteButton")
				for (let i = 0; i < rows.length; i++) {
					if (rows[i].dataset.productid === event.target.dataset.productid) {

						let formData = new FormData()
						formData.append('systemid', rows[i].dataset.systemid)
						formData.append('productid', rows[i].dataset.productid)
						axios({
							url: "/admin/product/delete",
							method: "delete",
							data: formData,
							headers: { 'Content-Type': 'multipart/form-data' }
						})
							.catch(error => { })
						event.target.parentElement.parentElement.remove()
					}

				}

			}

		}
	})
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////