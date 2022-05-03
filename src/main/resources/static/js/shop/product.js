const PRODUCT_URL = "http://localhost:8081/admin/product/productjson"
const PRODUCT_TYPE_URL = "http://localhost:8081/admin/product/producttypejson"
const queryString = window.location.search
const urlParams = new URLSearchParams(queryString)
const targetProductId = urlParams.get('productid')
const filterCatagories = document.querySelector(".filter-catagories")
const productDetil = document.querySelector(".col-lg-10 .row")

// 目標產品
let targetProduct



//setNodes
let favoriteButton
let sizeButtonGroup
let newProductPrice
let oldPproductPrice
let incButton
let decButton
let smlValue = 1
let quantityValue



axios.get(PRODUCT_TYPE_URL)
	.then(response => {
		showProductType(response.data)
	})
	.catch(error => { console.log(error) })

axios.get(PRODUCT_URL)
	.then(response => {
		targetProduct = response.data.filter(product => product.productid === targetProductId)[0]
		showRelativeProducts(response.data)
		showProduct(targetProduct)
		setNodes(targetProduct)
		addsizeButtonGroupListener()
		addFavoriteButtonListener()
		setQuantityButtons()
	})
	.catch(error => { console.log(error) })


// 顯示產品種類
function showProductType(data) {
	data.forEach(type => {
		filterCatagories.innerHTML += `<li><a href="/home/shop/?producttypename=${type.producttypename}">${type.producttypename}</a></li>`
	})
}


// 顯示同類型產品
function showRelativeProducts(data) {
	const relativeProductType = targetProduct.producttype
	const RelativeProductRow = document.querySelector(".related-products .container").lastElementChild
	let relativeProduct = data.filter(product => product.producttype === relativeProductType &&  product.productid !== targetProduct.productid)
	let temp = ""
	
	for(i=0; i<=3; i++) {
		temp += `<div class="col-lg-3 col-sm-6">
					<div class="product-item">
						<div class="pi-pic">
							<img src="/image/product/${relativeProduct[i].productimage}" alt="">
							<div class="sale">Sale</div>
							<div class="icon">
								<i class="icon_heart_alt"></i>
							</div>
							<ul>
								<li class="w-icon active">
									<a href="/home/product?productid=${relativeProduct[i].productid}"><i class="icon_bag_alt"></i></a>
								</li>
								<li class="quick-view"><a href="/home/product?productid=${relativeProduct[i].productid}">+ Quick View</a></li>
		
							</ul>
						</div>
						<div class="pi-text">
							<div class="catagory-name">${relativeProduct[i].productname}</div>
							<div class="product-price">$${relativeProduct[i].productprice}
								<span>原價 $<del>${relativeProduct[i].productprice * 10}</del></span>
							</div>
						</div>
					</div>
				</div>`
	}
	RelativeProductRow.innerHTML = temp
}


// 顯示產品
function showProduct(product) {
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
									<a id="favorite" href="" class="heart-icon"><i class="icon_heart_alt"></i></a>
								</div>
								<div class="pd-rating">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star-o"></i> <span>(5)</span>
								</div>
								<div class="pd-desc">
									<p>${product.productdescription}</p>
									<h4>$${product.productprice}</h4>
									<span>原價 $<del>${product.productprice * 10}</del></span>
								</div>
								
								<div class="pd-size-choose">
									<div class="sc-item">
										<input type="radio" id="sm-size" value="1"> <label for="sm-size">小</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="md-size" value="1.25"> <label for="md-size">中</label>
									</div>
									<div class="sc-item">
										<input type="radio" id="lg-size" value="1.5"> <label for="lg-size">大</label>
									</div>
								</div>
								
								<div class="quantity">
                                    <div class="pro-qty"><span class="dec qtybtn">-</span>
                                        <input type="text" value="1">
                                    <span class="inc qtybtn">+</span></div>
                                    <a href="#" class="primary-btn pd-cart">加到購物車</a>
                                </div>
							</div>
						</div>
`
}


// 設定參數
function setNodes(targetProduct) {
	sizeButtonGroup = document.querySelector(".pd-size-choose")
	newProductPrice = document.querySelector(".pd-desc h4")
	oldProductPrice = document.querySelector(".pd-desc span")
	favoriteButton = document.querySelector("#favorite")
	incButton = document.querySelector(".inc")
	decButton = document.querySelector(".dec")
	quantityValue = document.querySelector(".quantity input")
}



// sml 按鈕 Listener
function addsizeButtonGroupListener() {
	sizeButtonGroup.addEventListener("click", event => {
		if(event.target.parentElement.classList[0] === "sc-item") {
			smlValue = event.target.value
			
			getTotalPrice(targetProduct.productprice, smlValue, quantityValue.value)
		}
	})
}


// 數量按鈕 listener
function setQuantityButtons() {
	incButton.addEventListener("click", event => {
			quantityValue.value ++
			newProductPrice.innerText = "$" + targetProduct.productprice * quantityValue.value
			getTotalPrice(targetProduct.productprice, smlValue, quantityValue.value)
	})
	decButton.addEventListener("click", event => {
		if(quantityValue.value > 1) {
			quantityValue.value --
			getTotalPrice(targetProduct.productprice, smlValue, quantityValue.value)
		}
	})
}


function getTotalPrice(oriPrice, size, quantity) {
console.log(size)
	newProductPrice.innerText = "$" + oriPrice * size * quantity
	document.querySelector(".pd-desc").lastElementChild.innerHTML = `原價 $<del>${oriPrice * size * quantity * 10}</del>`
}


// favorite 按鈕 Listener
function addFavoriteButtonListener () {
	favoriteButton.addEventListener("click", event => {
		event.preventDefault()
		
		let formData = new FormData()
		formData.append('productid', targetProduct.productid)
		
		axios({
			url: "/home/favorite",
			method: "post",
			data: formData,
			headers: { 'Content-Type': 'multipart/form-data' }
		})
		.then(response => {
			console.log(response)
		})
		.catch(error => {
			console.log(error)
		})
	})
}