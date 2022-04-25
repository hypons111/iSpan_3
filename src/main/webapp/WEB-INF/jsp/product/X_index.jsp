
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT INDEX PAGE</title>

</head>
<body>
	<div style="margin-top: 20px">
		<table>
			<tbody>
				<tr>
					<th><a href="insertform"><button>新增產品</button></a></th>
					<th><button id="showAll">顯示全部產品</button></th>
					<th>
						<form>
							<button id="batchButton">批次處理</button>
							<input id="batchHiddenInput" type="hidden" name="idList" value="" />
						</form>
					</th>
				</tr>
			</tbody>
		</table>
		<table border="2" class="table table-bordered">
			<thead>
				<tr>
					<th><p id="totalNum"></p></th>
					<th><button class="producttype" id="sort">種類</button> <input
						id="type" class="columnSearchInput" type="text" placeholder=""
						value=""></th>
					<th><button class="productid" id="sort">ID</button> <input
						id="id" class="columnSearchInput" type="text" placeholder=""
						value=""></th>
					<th><button class="productname" id="sort">名稱</button> <input
						id="name" class="columnSearchInput" type="text" placeholder=""
						value=""></th>
					<th><button class="productstock" id="sort">庫存</button> <input
						id="stock" class="columnSearchInput" type="text" placeholder=""
						value=""></th>
					<th><button class="productcost" id="sort">成本</button> <input
						id="cost" class="columnSearchInput" type="text" placeholder=""
						value=""></th>
					<th><button class="productprice" id="sort">售價</button> <input
						id="price" class="columnSearchInput" type="text" placeholder=""
						value=""></th>
					<th><button class="productdescription" id="sort">簡介</button> <input
						id="description" class="columnSearchInput" type="text" placeholder=""
						value=""></th>
					<th>圖片</th>
				</tr>
			</thead>
			<tbody id="resultTable"></tbody>
		</table>
	</div>


	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/js/product/index.js"></script>


</body>
</html>