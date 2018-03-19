<%--
/**
 * Copyright (C) 2005-2014 Rivet Logic Corporation.
 * 
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation; version 3 of the License.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, write to the Free Software Foundation, Inc., 51
 * Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */
--%>

<%@ include file="init.jsp"%>

<%
long[] groupIds = {};

Group siteGroup = themeDisplay.getSiteGroup();

if (ArrayUtil.isEmpty(groupIds)) {
	groupIds = new long[] {siteGroup.getGroupId()};
}

if (!ArrayUtil.contains(groupIds, themeDisplay.getCompanyGroupId())) {
	groupIds = ArrayUtil.append(groupIds, themeDisplay.getCompanyGroupId());
}

groupIds = ArrayUtil.unique(groupIds);

List<AssetVocabulary> vocabularies = new ArrayList<AssetVocabulary>();

for (int i = 0; i < groupIds.length; i++) {
	vocabularies.addAll(AssetVocabularyServiceUtil.getGroupVocabularies(groupIds[i], false));
}

%>

<liferay-portlet:actionURL portletConfiguration="true" var="configurationURL" />
<div class="configuration">
	<aui:form action="<%=configurationURL%>" method="post" name="fm">
        <aui:input name="<%=Constants.CMD%>" type="hidden" value="<%=Constants.UPDATE%>" />
        <aui:fieldset label="label.search.container">
            <aui:select label="org-team-vocabulary" name="<%= Constants.ORG_TEAM_VOCABULARY%>" showEmptyOption="true" >
            <%
            for (AssetVocabulary vocabulary : vocabularies) {
            %>

                <aui:option selected="<%= orgTeamVocabularyId == vocabulary.getVocabularyId() %>" value="<%= vocabulary.getVocabularyId() %>"><%= vocabulary.getName() %></aui:option>

            <%
            }
            %>
            </aui:select>

            <aui:select label="View Mode" name="<%= Constants.VIEW_MODE%>" >
                <aui:option selected="<%= viewMode == 1 %>" value="1">Tabs</aui:option>
                <aui:option selected="<%= viewMode == 2 %>" value="2">List</aui:option>
                <aui:option selected="<%= viewMode == 3 %>" value="3">Grid</aui:option>
            </aui:select>


            <aui:input name="<%= Constants.PARAMETER_VIEW_ALL_RESULTS_PER_PAGE%>" label="view-all-results-per-page" value='<%=viewAllResultsPerPage%>' />
			<aui:input name="<%= Constants.PARAMETER_SEARCH_RESULTS_PER_PAGE%>" label="search-results-per-page" type="text" value="<%=searchResultsPerPage%>"/>
			<aui:input name="<%= Constants.SKYPE_INTEGRATION%>" label="skype-integrated" type="checkbox" value="<%= skypeEnabled %>"/>
			<aui:input name="<%= Constants.HANGOUTS_INTEGRATION%>" label="hangouts-integrated" type="checkbox" value="<%= hangoutsEnabled %>"/>

			<aui:input name="<%= Constants.DISPLAY_USER_JOB_TITLE %>" label="display-job-title" type="checkbox" value="<%= displayJobTitle %>"/>
			<aui:input name="<%= Constants.DISPLAY_USER_SCREEN_NAME %>" label="display-screen-name" type="checkbox" value="<%= displayScreenName %>"/>
			<aui:input name="<%= Constants.DISPLAY_USER_CITY %>" label="display-city" type="checkbox" value="<%= displayCity %>"/>
			<aui:input name="<%= Constants.DISPLAY_USER_PHONE %>" label="display-phone" type="checkbox" value="<%= displayPhone %>"/>
			<aui:input name="<%= Constants.SKILLS_INTEGRATION %>" label="skills-integrated" type="checkbox" value="<%= skillsEnabled %>"/>
	 	</aui:fieldset>
	 	
		<aui:button type="submit" />
	</aui:form>
</div>
