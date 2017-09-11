<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:url value="/goods/list" var="readUrl" />
<c:url value="/goods/updateone" var="updateUrl" />
<c:url value="/goods/deleteone" var="deleteUrl" />
<c:url value="/goods/createone" var="createUrl" />
<c:url var="eUrl" value="/goods/excel" />
<c:url var="vendorComboUrl" value="/vendor/combo" />

<body>

	<script>
	var grid;
	$(document).ready(function(){
		if(!"${vendors}"){
			location.href="${vendorComboUrl}";
		}
	})
	</script>
	<br>
	<p />
	<br>
	<p />
	<br>
	<p />

	<kendo:grid title="그리드" name="grid" pageable="true" sortable="true" scrollable="true"
height="450" navigatable="true" dataBound="onDataBound">
		<kendo:grid-editable mode="inline" confirmation="Are you sure you want to remove this item?"/>
	<kendo:grid-toolbar>
		<kendo:grid-toolbarItem name="create" text="생성"/>
		<kendo:grid-toolbarItem name="excel" text="엑셀저장"/>
		<kendo:grid-toolbarItem name="reload" text="리로드" />
		<kendo:grid-toolbarItem name="save" text="저장" />
	</kendo:grid-toolbar>
	<kendo:grid-excel fileName="상품정보.xlsx" allPages="true" filterable="true" proxyURL="${eUrl}" />
	
		
		<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="5">
		</kendo:grid-pageable>
	
		<kendo:grid-columns>
			<kendo:grid-column title="제품번호" field="giNum"  />
			<kendo:grid-column title="제품이름" field="giName" />
			<kendo:grid-column title="제품설명" field="giDesc" />
			<kendo:grid-column title="회사번호" field="viNum" >
				<kendo:grid-column-values value="${vendors}"/>
			</kendo:grid-column>
			<kendo:grid-column title="생산일자" field="giCredat" format="{0:yyyy-MM-dd}"/>
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
			
			
				<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-destroy url="${deleteUrl}" dataType="json" type="POST" contentType="application/json" />
                <kendo:dataSource-transport-parameterMap>
                
                	<script>
                	function parameterMap(options,type) { 
               			var str = JSON.stringify(options);
               			return str;
                	}
                	</script>
                	</script>
                </kendo:dataSource-transport-parameterMap>
			</kendo:dataSource-transport>
			
			
			
            <kendo:dataSource-schema>
                <kendo:dataSource-schema-model id="giNum">
                    <kendo:dataSource-schema-model-fields>
                    <kendo:dataSource-schema-model-field name="giNum" type="number" editable="false"/>
                        <kendo:dataSource-schema-model-field name="giName" type="string">
                        	<kendo:dataSource-schema-model-field-validation required="true"/>
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="userName" type="string">
                        	<kendo:dataSource-schema-model-field-validation required="true"/>
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="viNum" type="number">
                        	<kendo:dataSource-schema-model-field-validation required="true" min="1" />
                      	 </kendo:dataSource-schema-model-field>
                      	  <kendo:dataSource-schema-model-field name="giCredat" editable="true" type="date">
                      	 </kendo:dataSource-schema-model-field>
                      	  <kendo:dataSource-schema-model-field name="giCretim" editable="false">
                    
                      	 </kendo:dataSource-schema-model-field>
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
		</kendo:dataSource>
	</kendo:grid>
<script>
var onDataBound = function(){
	var btn = $(".k-grid-reload");
	btn.click(function(){
		
	})
}
</script>


</body>
</html>