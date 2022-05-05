const FAVORITE_URL = "http://localhost:8081/home/favoritejson"
const PRODUCT_URL = "http://localhost:8081/admin/product/productjson"
const PRODUCT_TYPE_URL = "http://localhost:8081/admin/product/producttypejson"
const filterCatagories = document.querySelector("#productCatagories")
const productListRow = document.querySelector(".product-list .row")
const slider = document.querySelector('.slider')
const sortButton = document.querySelector('.nice-select')
let sortStates = "ASC"



//////////////////////////////////////////

// memberid 預設值是 1001
// 如果要動態取得會員編號，請寫在第16行 "=" 後面，把預設的 1001 取代。
const memberid = 1001

//////////////////////////////////////////


let allFavoriteList				// 全部會員的全部收藏
let allProductList				// 全部產品
let filteredProductList			// 1001 號會員全部收藏產品		
let currentProductList			// 現在畫面上的產品


axios.get(FAVORITE_URL)
	.then(response => {
		allFavoriteList = response.data.filter(product => product.memberid === memberid)
	})
	.catch(error => { console.log(error) })

axios.get(PRODUCT_URL)
	.then(response => {
		allProductList = response.data
		setFilteredProductList(response.data)
		showProduct(sorting())
		showPriceRange()
		addSortButtonListener()
	})
	.catch(error => { console.log(error) })


// 取得目標產品
function setFilteredProductList(data) {
	let temp = []
	for(let i=0; i<allFavoriteList.length; i++){
		temp.push(data.filter(product => product.productid == allFavoriteList[i].productid))
	}
	filteredProductList = temp.flat()
	currentProductList = filteredProductList.flat()
}


// 顯示產品
function showProduct(data) {

	productListRow.innerHTML = ""
	
	if(data.length === 0) {
		productListRow.innerHTML += `<h3>沒有產品</h3>`
		return 0
	}
	
	data.forEach(product => {
		productListRow.innerHTML += `
			<div class="col-lg-4 col-sm-6">
				<div class="product-item">
					<div class="pi-pic">
						<img src="/image/product/${product.productimage}" alt="">
						<div class="sale pp-sale">Sale</div>
						<div class="icon">
							<i class="icon_heart_alt"></i>
						</div>
						<ul>
							<li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
							<li class="quick-view"><a href="/home/product?productid=${product.productid}">+ Quick View</a></li>
							<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
						</ul>
					</div>
					<div class="pi-text">
						<div class="catagory-name">${product.productname}</div>
							<div class="product-price">$${product.productprice} <span>${product.productprice * 10}</span></div>
						</div>
					</div>
			</div>`
	})
}


// 顯示價錢範圍
function showPriceRange() {
	const price = document.querySelector('#price')
	const priceResult = document.querySelector('#priceResult')
	
	let min = 99999
	let max = 0
	
	filteredProductList.filter(product => {
		if(product.productprice < min) {
			min = product.productprice
		}
		if(product.productprice > max) {
			max = product.productprice
		}
	})
	

	price.min = min
	price.max = max
	price.value = max
	priceResult.value = max
		
	slider.addEventListener('click', event => {
		if(event.target.id === "price") {
			event.target.nextElementSibling.value = Math.ceil(event.target.value)
			let priceFilterdProductList = filteredProductList.filter(product => product.productprice <= event.target.nextElementSibling.value)
			currentProductList = priceFilterdProductList
			showProduct(sorting())
		}
	})
	
	priceResult.addEventListener('input', event => {
		event.target.previousElementSibling.value = event.target.value
		let priceFilterdProductList = filteredProductList.filter(product => product.productprice <= event.target.value)
		currentProductList = priceFilterdProductList
		showProduct(sorting())
	})
}


// 排序按鈕 listener
function addSortButtonListener() {
	sortButton.addEventListener("click", event => {
		if(event.target.dataset.value === "DESC") {
			sortStates = "DESC"
			showProduct(sorting())
		} else if (event.target.dataset.value === "ASC") {
			sortStates = "ASC"
			showProduct(sorting())
		}
	})
}

function sorting() {
		if(sortStates === "DESC") {
			currentProductList.sort((a, b) => {
				if (a.productprice < b.productprice) { return -1 }
				if (a.productprice > b.productprice) { return 1 }
					return 0
			})
			return currentProductList
		} else if (sortStates === "ASC"){
			currentProductList.sort((a, b) => {
				if (a.productprice < b.productprice) { return 1 }
				if (a.productprice > b.productprice) { return -1 }
				return 0
			})
			return currentProductList
		}
}

