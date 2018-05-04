<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, target-densityDpi=device-dpi, user-scalable=no" />
<title>OPUS MOBILE</title>
<spring:url value="/resources/OM.css" var="omCSS"/>
<link href="${omCSS}" rel="stylesheet" />
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>


function loadProduct(productId){
	quantity=$("#quantity"+productId).text();
	salesRep=$("#salesRep"+productId).text();
	itemID=$("#itemID"+productId).text();
    
	$("#quantity").val(quantity);
    $("#itemID").val(itemID);
    $("#salesRep").val(salesRep);
    $("#productId").val(productId);
    $("#add-product").hide();
    $("#update-product").show();
}


function deleteProduct(productId){
	
	
         var data = JSON.stringify({"productId":productId});
         var divId= "#product"+productId;
         $.ajax({
         type : "DELETE",
         url : "${pageContext.request.contextPath}/deleteProduct",
         contentType: "application/json",
         data : data,
         success: function(data){
            $(divId).remove();
         }
         });

         var noofproducts=$( "div[id^='product']" ).length;
         if (noofproducts == 0)
        	 {
             $("#noitemsDiv").show();
             $("#itemsListDiv").hide();
        	 }
	
}

$(document).ready(function() {
    
    $("#add-product").click(function(){
        var quantity= $("#quantity").val();
        var itemID = $("#itemID").val();
        var salesRep=$("#salesRep").val();

        var data = JSON.stringify({"quantity":quantity,"itemID":itemID,"salesRep":salesRep});
        //var data = JSON.stringify({"quantity":quantity});
	
        $.ajax({
        type : "POST",
        url : "${pageContext.request.contextPath}/addProduct",
        contentType: "application/json",
        dataType: 'json',
        data : data,
        success: function(data){
           $("#noitemsDiv").hide();
           $("#itemsListDiv").show();
           $("#itemsListDiv").append(
		   		'<div id="product'+data.productId+'">'+
		        '<div class="alignCenter padding15">'+
		            '<div class="floatLeft selectWidth20 alignLeft blueText">'+
		            '<div class="floatLeft selectWidth70"><a href="#" id="'+data.productId+'" onclick="loadProduct('+data.productId+');return false;" >Edit Item</a></div>'+
		                '<div class="floatLeft">|</div>'+
		                '<div class="floatRight trashBlack" onclick="deleteProduct('+data.productId+')"></div>'+
		                '<div class="clear"></div>'+
		            '</div>'+                
		            '<div id="salesRep'+data.productId+'" class="floatLeft selectWidth15">'+data.salesRep+'</div>'+
		            '<div id="itemID'+data.productId+'" class="floatLeft selectWidth45 alignLeft">'+data.itemID+'</div>'+
		            '<div id="quantity'+data.productId+'" class="floatLeft selectWidth10">'+data.quantity+'</div>'+
		            '<div class="clear"></div>'+
		        '</div>'+
		        '</div>'
           );
           $("#quantity").val("");
           $("#itemID").val("");
           $("#salesRep").val("AB1234");
           $("#productID").val("");
        }
        });
    });
    
    $("#update-product").click(function(){
    	
        var quantity= $("#quantity").val();
        var itemID = $("#itemID").val();
        var salesRep=$("#salesRep").val();
        var productId=$("#productId").val();
    	var data = JSON.stringify({"productId":productId,"quantity":quantity,"itemID":itemID,"salesRep":salesRep});

        $.ajax({
            type : "PUT",
            url : "${pageContext.request.contextPath}/updateProduct",
            contentType: "application/json",
            data : data,
            success: function(data){

            	$("#quantity"+productId).text(quantity);
            	$("#salesRep"+productId).text(salesRep);
            	$("#itemID"+productId).text(itemID);
            	
                $("#productID").val("");
                $("#itemID").val("");
                $("#quantity").val("");
                $("#salesRep").val("AB1234");
                $("#add-product").show();
                $("#update-product").hide();

            }
          });
        
        
    });
    
    });
</script>
<%-- 	<form:form name="submitForm" method="POST"> --%>
		<div class="container">
    	<div class="orangeText boldText padding10">Home Page: Product Management</div>                
        <div class="headerBarblock">
        	<div class="floatLeft boldText">&minus;</div>
            <div class="floatLeft paddingLeft10">Product Inventory</div>
            <div class="clear"></div>
        </div>
    	<!-- Below class to show LEFT and Right border -->
        <div class="headercontentblock1">                      
            <div class="container1"> 
            	<div class="floatLeft scanner"></div>
                <div class="floatLeft selectWidth85 marginLeft20">
                	<div class="boldText">Scan an item or enter information below</div>
                    <div class="spacer2"></div>
                    <div class="floatLeft selectWidth15">
                    		<input id="productId" name="productId" type="hidden"/>	
                        <input id="quantity" name="quantity" type="text" class="inputboxBg selectWidth45" size="15" maxlength="15" placeholder="">
                        <div class="padding10">*Qty</div>
                    </div>
                    <div class="floatLeft selectWidth45">
                        <input id="itemID" name="itemID" type="text" class="inputboxBg selectWidth80" size="15" maxlength="15" placeholder="">
                        <div class="padding10">*Item ID, UPC, SIM, or IMEI</div>
                    </div>
                    <div class="floatLeft selectWidth25">
                         <label class="custom-select selectWidth90">
                            <select id="salesRep" name="salesRep">
                                <option selected> AB1234 </option>
                                <option value="Option 1">- Select two -</option>
                                <option value="Option 2">- Select three -</option>
                            </select>
                        </label>
                        <div class="padding10">Sales Rep</div>
                    </div>
                    <div class="floatLeft selectWidth15">
                        <input id="add-product" type="button" value=" Quick Add " class="greenButton">
                        <input id="update-product" type="button" value=" Update " class="greenButton" style="display: none;">
                    </div>                
                    <div class="clear"></div>
                    <div class="spacer2"></div>
                </div>
                <div class="clear"></div>                                            	                
            </div>
            <div class="sharpblueBar">Added Items</div>
            <div id="itemsListDiv">
            <c:if test="${!empty allproducts}">
				 <c:forEach items="${allproducts}" var="prod">
			   		<div id="product${prod.productId}">
		        		<div class="alignCenter padding15">
		            <div class="floatLeft selectWidth20 alignLeft blueText">
		             	<div class="floatLeft selectWidth70"><a href="#" id="${prod.productId}" onclick="loadProduct(${prod.productId});return false;" >Edit Item</a></div>
		                <div class="floatLeft">|</div>
		                <div class="floatRight trashBlack" onclick="deleteProduct(${prod.productId})"></div>
		                <div class="clear"></div>
		            </div>                
		            <div id="salesRep${prod.productId}" class="floatLeft selectWidth15">${prod.salesRep}</div>
		            <div id="itemID${prod.productId}" class="floatLeft selectWidth45 alignLeft">${prod.itemID}</div>
		            <div id="quantity${prod.productId}" class="floatLeft selectWidth10">${prod.quantity}</div>
		            <div class="clear"></div>
		        </div>
		        </div>
				 </c:forEach>
            </c:if>
            </div>
            <c:if test="${empty allproducts}">

	            <div id="noitemsDiv">
		            <div class="container1">
		            	<div class="spacer2"></div>
		            	<div class="instructionText">No items added</div>
		                <div class="spacer2"></div>
		            </div>
	            </div>
	         </c:if>
            <div class="omblueLine"></div>
            <div class="container1">
            	<div class="blueText boldText">These items will be tied to Sales Rep AB1234.</div>
                <div>To change the rep, select from dropdown.</div>
                <div class="spacer2"></div>
                <div class="boldText">
                	AT&T Any City, USA<br>
                	(555) 555-5555
                </div>
                <div class="spacer2"></div>
                <div class="floatLeft selectWidth15">
                    <input type="submit" value=" Update Stock " class="blueButton">
                </div>                
                <div class="clear"></div>
            </div>
        </div>
        <!-- End to show LEFT and Right border -->
        <!-- Below class to show Bottom border with LEFT and RIGHT rounded corners. -->
    	<div class="headercontentblock0"></div>
    	<!-- End to show Bottom border with LEFT and RIGHT rounded corners. -->
    	<div class="spacer2"></div>        
    </div> 
<%-- 	</form:form> --%>
</body>
</html>