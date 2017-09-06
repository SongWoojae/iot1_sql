<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:url value="/vendor/list" var="readUrl" />
<c:url value="/grid/api/update" var="updateUrl" />
<c:url value="/grid/api/delete" var="deleteUrl" />
<c:url value="/vendor/create" var="createUrl" />
<br>
<br>
<p>
<br>
<p>
<br>
	<kendo:grid title="그리드" name="grid" pageable="true" sortable="true"
		scrollable="false" height="450">
		<kendo:grid-editable mode="incell" />
		<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="5">
		</kendo:grid-pageable>
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="생성" />
			<kendo:grid-toolbarItem name="cancel" text="취소" />
			<kendo:grid-toolbarItem name="save"/>
		</kendo:grid-toolbar>
		<kendo:grid-columns>
			<kendo:grid-column title="회사번호" field="viNum" />
			<kendo:grid-column title="회사이름" field="viName" />
			<kendo:grid-column title="회사설명" field="viDesc" />
			<kendo:grid-column title="회사주소" field="viAddress" />
			<kendo:grid-column title="회사전화번호" field="viPhone" />
			<kendo:grid-column title="날짜" field=" viCredat"/>
			<kendo:grid-column title="시간" field="viCretim" />
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
                <kendo:dataSource-schema-model id="viNum">
                    <kendo:dataSource-schema-model-fields>
                        <kendo:dataSource-schema-model-field name="viName" type="string">
                        	<kendo:dataSource-schema-model-field-validation required="true" />
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="viDesc" type="string">
                        	<kendo:dataSource-schema-model-field-validation required="true"/>
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="viAddress" type="string">
                        	<kendo:dataSource-schema-model-field-validation required="true"/>
                        </kendo:dataSource-schema-model-field>
                        <kendo:dataSource-schema-model-field name="viPhone" type="number">
                        	<kendo:dataSource-schema-model-field-validation required="true" />
                      	 </kendo:dataSource-schema-model-field>
                      	  <kendo:dataSource-schema-model-field name="viCredat" type="number">
                      	 </kendo:dataSource-schema-model-field>
                      	  <kendo:dataSource-schema-model-field name="viCretim" type="number">
                 
                      	 </kendo:dataSource-schema-model-field>
                    </kendo:dataSource-schema-model-fields>
                </kendo:dataSource-schema-model>
            </kendo:dataSource-schema>
		</kendo:dataSource>
	</kendo:grid>
	<script>	
</script>