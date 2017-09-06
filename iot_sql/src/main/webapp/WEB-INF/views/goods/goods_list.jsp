<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:url value="/goods/list" var="readUrl" />
<c:url value="/grid/api/update" var="updateUrl" />
<c:url value="/grid/api/delete" var="deleteUrl" />
<c:url value="/user/create" var="createUrl" />
<br><br><p><br><p><br>

	<kendo:grid title="그리드" name="grid" pageable="true" sortable="true"
		scrollable="false" height="450">
		<kendo:grid-editable mode="incell" />
		<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="10">
		</kendo:grid-pageable>
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="생성" />
			<kendo:grid-toolbarItem name="cancel" text="취소" />
			<kendo:grid-toolbarItem name="save"/>
		</kendo:grid-toolbar>
		<kendo:grid-columns>
			<kendo:grid-column title="제품번호" field="giNum" />
			<kendo:grid-column title="제품이름" field="giName" />
			<kendo:grid-column title="제품설명" field="giDesc" />
			<kendo:grid-column title="회사번호" field="viNum" />
			<kendo:grid-column title="날짜" field=" giCredat"/>
			<kendo:grid-column title="시간" field="giCretim" />
		</kendo:grid-columns>
		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-destroy url="${deleteUrl}" dataType="json" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-parameterMap>
                	<script>
                	function parameterMap(options,type) { 
                		if(type==="read"){
                			return JSON.stringify(options);
                		} else {
                			return JSON.stringify(options.models);
                		}
                	}
                	</script>
                </kendo:dataSource-transport-parameterMap>
			</kendo:dataSource-transport>
			
            <kendo:dataSource-schema>
                <kendo:dataSource-schema-model id="giNum">
                    <kendo:dataSource-schema-model-fields>
                        <kendo:dataSource-schema-model-field name="giName" type="string">
                        	<kendo:dataSource-schema-model-field-validation required="true" />
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="userName" type="string">
                        	<kendo:dataSource-schema-model-field-validation required="true"/>
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="viNum" type="number">
                        	<kendo:dataSource-schema-model-field-validation required="true" />
                      	 </kendo:dataSource-schema-model-field>
                      	  <kendo:dataSource-schema-model-field name="giCredat" type="number">
                      	 </kendo:dataSource-schema-model-field>
                      	  <kendo:dataSource-schema-model-field name="giCretim" type="number">
                 
                      	 </kendo:dataSource-schema-model-field>
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
		</kendo:dataSource>
	</kendo:grid>
	<script>	
</script>
<script>
function callback(results){
	alert(results.length);
	var result = "";
	$('#table').bootstrapTable('destroy');
		for(var i=0, max=results.length;i<max;i++){
    		var goods = results[i];
			result += "<tr data-view='" + goods.giNum + "'>";
			result +="<td class='text-center'>" + goods.giName + "</td>";
			result +="<td class='text-center'>" + goods.giDesc + "</td>";
			result +="<td class='text-center'>" + goods.viNum + "</td>";
			result +="<td class='text-center'>" + goods.giCredat + "</td>";
			result +="<td class='text-center'>" + goods.giCretim + "</td>";
			result +="</tr>";
    	}
		$('#result_tbody').html(resultStr);
	}

$(document).ready(function(){
	$("input[type='button']").click(function(){
		var au = new AjaxUtil("goods/list");
		au.setCallbackSuccess(callback);
		au.send();
	})
})
</script>
<body>
<br><br><br><br>
<form action="${rootpath}/goods/list" method="post">
<input type="button" value="전송">
</form>
</body>
</html>