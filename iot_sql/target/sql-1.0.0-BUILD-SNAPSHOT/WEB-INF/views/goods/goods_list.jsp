<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:url value="/grid/events/read" var="transportReadUrl" />
<c:url value="/goods/list" var="readUrl" />
<c:url value="/goods/update" var="updateUrl" />
<c:url value="/goods/delete" var="deleteUrl" />
<c:url value="/goods/create" var="createUrl" />
<br><br><p><br><p><br>

	<kendo:grid title="그리드" name="grid" pageable="true" sortable="true" scrollable="true" height="450">
		<kendo:grid-editable mode="inline" confirmation="Are you sure you want to remove this item?"/>
	<kendo:grid-toolbar>
		<kendo:grid-toolbarItem name="create" text="생성"/>
		<kendo:grid-toolbarItem name="save" text="저장"/>
	</kendo:grid-toolbar>
		<kendo:grid-editable mode="incell" />
		<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="5">
		</kendo:grid-pageable>
	
		<kendo:grid-columns>
			<kendo:grid-column title="제품번호" field="giNum" editable="false" />
			<kendo:grid-column title="제품이름" field="giName" />
			<kendo:grid-column title="제품설명" field="giDesc" />
			<kendo:grid-column title="회사번호" field="viNum" />
			<kendo:grid-column title="생산일자" field="giCredat"/>
			<kendo:grid-column title="생산시간" field="giCretim" />
			<kendo:grid-column title="&nbsp;" width="250px">
            	<kendo:grid-column-command>
            		<kendo:grid-column-commandItem name="edit" />
            		<kendo:grid-column-commandItem name="destroy" />
            	</kendo:grid-column-command>
            </kendo:grid-column>
			  
			
			  </kendo:grid-columns>
		
		
		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-transport>
			<kendo:dataSource-transport-read url="${transportReadUrl}"/>
			
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
                        	<kendo:dataSource-schema-model-field-validation required="true"/>
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="userName" type="string">
                        	<kendo:dataSource-schema-model-field-validation required="true"/>
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="viNum" type="number">
                        	<kendo:dataSource-schema-model-field-validation required="true" min="1" />
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
/*
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
*/
</script>
<body>
<br><br><br><br>
<!--  
<form action="${rootpath}/goods/list" method="post">
<input type="button" value="전송">
-->
</form>
</body>
</html>