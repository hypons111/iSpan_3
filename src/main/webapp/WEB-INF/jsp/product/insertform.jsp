<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="insertForm">
		<table border="1">
			<thead>
				<tr>
					<th>產品編號</th>
					<th>產品種類</th>
					<th>產品名稱</th>
					<th>產品存量</th>
					<th>產品買價</th>
					<th>產品售價</th>
					<th>產品介紹 </th>
					<th>產品圖片</th>
				</tr>
			</thead>
			<tbody id="resultTable">
				<td id='id'>						<input id='productid' 			type='text' class='產品編號' name='id' value='' disabled ></td>
				<td id='typeList' width='155px'>	<input id='producttype' 		type='text' class='產品種類 input' name='type' value=''></td>
				<td id='name'>						<input id='productname' 		type='text' class='產品名稱 input' name='name' value=''></td>
				<td>								<input id='productstock'		type='text' class='產品存量 input' name='stock' value=''></td>
				<td>								<input id='productcost' 		type='text' class='產品買價 input' name='cost' value=''></td>
				<td>								<input id='productprice' 		type='text' class='產品售價 input' name='price' value=''></td>
				<td>								<input id='productdescription' 	type='text' class='產品介紹 input' name='description' value=''></td>
				<td id='imageTD'>					<input id='productimage' 		type='file' class='產品圖片 input' name='imageFile' value=''></td>
				<td><button id='submitButton'>新增</button></td>
			</tbody>
		</table>
	</form>
	<p id="inputChecking"></p>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.26.1/axios.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="/js/product/insert.js"></script>

</body>
</html>

