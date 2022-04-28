const PRODUCT_URL = "http://localhost:8081/admin/product/productjson"
const PRODUCT_TYPE_URL = "http://localhost:8081/admin/product/producttypejson"
const queryString = window.location.search
const urlParams = new URLSearchParams(queryString)
const targetProductId = urlParams.get('productid')
const filterCatagories = document.querySelector(".filter-catagories")
const productDetil = document.querySelector(".col-lg-10 .row")
let targetProduct

let sizeButtonGroup
let newPproductPrice
let oldPproductPrice

axios.get(PRODUCT_TYPE_URL)
	.then(response => {
		showProductType(response.data)
	})
	.catch(error => { console.log(error) })

axios.get(PRODUCT_URL)
	.then(response => {
		targetProduct = response.data.filter(product => product.productid === targetProductId)[0]
		showProduct(targetProduct)
		setNodes()
		addsizeButtonGroupListener()
	})
	.catch(error => { console.log(error) })


// 顯示產品種類
function showProductType(data) {
	data.forEach(type => {
		filterCatagories.innerHTML += `<li><a href="/home/shop/?producttypename=${type.producttypename}">${type.producttypename}</a></li>`
	})
}

// 顯示產品
function showProduct(product) {
console.log(product)
	productDetil.innerHTML += `
						<div class="col-lg-6">
							<div class="product-pic-zoom">
								<img class="product-big-img" src="/image/product/${product.productimage}" alt="">

							</div>
						</div>
						<div class="col-lg-6">
							<div class="product-details">
								<div class="pd-title">
									<h3>${product.productname}</h3>
									<a href="#" class="heart-icon"><i class="icon_heart_alt"></i></a>
								</div>
								<div class="pd-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i> <span>(5)</span>
								</div>
								<div class="pd-desc">
									<p>${product.productdescription}</p>
									<h4>$${product.productprice} <span>${product.productprice * 100}</span></h4>
								</div>
								
								<div class="pd-size-choose">
									<div class="sc-item">
										<input type="radio" id="sm-size" value="1"> <label for="sm-size">s</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="md-size" value="1.25"> <label for="md-size">m</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="lg-size" value="1.5"> <label for="lg-size">l</label>
									</div>
								</div>
								
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
									<a href="#" class="primary-btn pd-cart">Add To Cart</a>
								</div>
								<ul class="pd-tags">
									<li><span>CATEGORIES</span>: More Accessories, Wallets &
										Cases</li>
									<li><span>TAGS</span>: Clothing, T-shirt, Woman</li>
								</ul>
							</div>
						</div>
`

}

function setNodes() {
	sizeButtonGroup = document.querySelector(".pd-size-choose")
	newPproductPrice = document.querySelector(".pd-desc h4")
	oldProductPrice = document.querySelector(".pd-desc span")
}

function addsizeButtonGroupListener() {
	sizeButtonGroup.addEventListener("click", event => {
	console.log(event.target.parentElement.classList)
		if(event.target.parentElement.classList[0] === "sc-item") {
			newPproductPrice.innerText = "$" + targetProduct.productprice * event.target.value
		}
	})
}


