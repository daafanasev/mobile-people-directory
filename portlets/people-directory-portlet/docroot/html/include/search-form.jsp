<div id="modal"></div>
<div id="simpleSearchForm">
	<aui:fieldset cssClass="search-criteria">
		<aui:input id="<%= Constants.PARAMETER_KEYWORDS %>" name="<%= Constants.PARAMETER_KEYWORDS %>" type="text"
		cssClass="simple-search-keywords" label="people-directory.label.search-user" placeholder="people-directory.label.type-keywords"
		/>
		<c:if test="<%= skillsEnabled %>">
			<a class="toggle-search-type" href="javascript:;">
				<liferay-ui:message key="people-directory.label.search-by-skills"/>
			</a>
		</c:if>
	</aui:fieldset>
	<c:if test="<%= skillsEnabled %>">
		<aui:fieldset cssClass="skills-criteria hide">
			<form>
				<label class="control-label"><liferay-ui:message key="people-directory.label.search-skills"/></label>
				<div class="lfr-tags-selector-content" id="<portlet:namespace/>assetTagsSelector">
					<aui:input name="search-skills" type="hidden" />
					<input class="lfr-tag-selector-input" id="<portlet:namespace/>assetTagsNames" maxlength="75" size="15" title="<liferay-ui:message key="add-tags" />" type="text" />
				</div>
				<a class="toggle-search-type" href="javascript:;"><liferay-ui:message key="people-directory.label.search-by-name"/></a>
			</form>
		</aui:fieldset>
	</c:if>
</div>
<%@include file="loader.jsp"%>

<div id="searchResults" class="people_paginator"></div>
<div id="paginator"></div>
