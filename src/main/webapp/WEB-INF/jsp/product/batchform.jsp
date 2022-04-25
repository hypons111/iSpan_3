<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h1>批次更新</h1>

		<button id="batchButton">批次更新</button>

<button id="showAll">顯示全部產品</button>
	<table border="1">
		<thead>
			<tr>
				<th>
					<p class="productid" id="sort">編號</p> <input id="id"
					class="columnSearchInput" type="text" placeholder="" value="">
				</th>
				<th>
					<p class="productname" id="sort">名稱</p> <input id="name"
					class="columnSearchInput" type="text" placeholder="" value="">
				</th>
				<th>
					<p class="producttype" id="sort">種類</p> <input id="type"
					class="columnSearchInput" type="text" placeholder="" value="">
				</th>
				<th>
					<p class="productstock" id="sort">庫存</p> <input id="stock"
					class="columnSearchInput" type="text" placeholder="" value="">
				</th>
				<th>
					<p class="productcost" id="sort">成本</p> <input id="cost"
					class="columnSearchInput" type="text" placeholder="" value="">
				</th>
				<th>
					<p class="productprice" id="sort">售價</p> <input id="price"
					class="columnSearchInput" type="text" placeholder="" value="">
				</th>

			</tr>
			<tr>
			<td></td>
				<td></td>
				<td id='typeList' width='155px'><input id='producttype' type='text' class='產品種類 type' name='type' value=''>
					<p></p>
				</td>
				<td><select id='stockEdit' class='產品存量 stock' name='stock'>
						<option value=''></option>
						<option value='+'>+</option>
						<option value='='>=</option>
						<option value='-'>-</option>
					</select>
					<input id='newStockInput' type='text' class='產品存量' name='stock' value="0">
					<p></p>
				</td>
				<td>
					<select id='costEdit' class='產品買價 cost' name='cost'>
						<option value=''></option>
						<option value='+'>+</option>
						<option value='='>=</option>
						<option value='-'>-</option>
					</select>
					<input id='newCostInput' type='text' class='產品買價' name='cost' value="0">
					<p id="costUnit"></p></td>
				<td>
					<select id='priceEdit' class='產品售價 price' name='price'>
						<option value=''></option>
						<option value='+'>+</option>
						<option value='='>=</option>
						<option value='-'>-</option>
					</select>
					<input id='newPriceInput' type='text' class='產品售價' name='price' value="0">
					<p id="priceUnit"></p>
				</td>
			</tr>


		</thead>
		<tbody id="resultTable">

		</tbody>
	</table>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script src="/js/product/batch.js"></script>
</body>

</html>