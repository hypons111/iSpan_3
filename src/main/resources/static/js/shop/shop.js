const PRODUCT_URL = "http://localhost:8081/admin/product/productjson"
const PRODUCT_TYPE_URL = "http://localhost:8081/admin/product/producttypejson"
const queryString = window.location.search
const urlParams = new URLSearchParams(queryString)
const targetProducTtype = urlParams.get('producttypename')
const filterCatagories = document.querySelector(".filter-catagories")
const productListRow = document.querySelector(".product-list .row")

axios.get(PRODUCT_TYPE_URL)
	.then(response => {
		showProductType(response.data)
	})
	.catch(error => { console.log(error) })

axios.get(PRODUCT_URL)
	.then(response => {
		showProduct(response.data)
	})
	.catch(error => { console.log(error) })


// 顯示產品種類
function showProductType(data) {
	data.forEach(type => {
		filterCatagories.innerHTML += `<li><a href="/home/shop/?producttypename=${type.producttypename}">${type.producttypename}</a></li>`
	})
}

// 顯示產品
function showProduct(data) {
	const filterdProductList = data.filter(product => product.producttype === targetProducTtype && product.productstate == true)
	filterdProductList.forEach(product => {
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
							<li class="quick-view"><a href="#">+ Quick View</a></li>
							<li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
						</ul>
					</div>
					<div class="pi-text">
						<div class="catagory-name">${product.productname}</div>
							<a href="#"><h5>Pure Pineapple</h5></a>
							<div class="product-price">$${product.productprice} <span>${product.productprice * 100}</span></div>
						</div>
					</div>
			</div>`
	})
}

