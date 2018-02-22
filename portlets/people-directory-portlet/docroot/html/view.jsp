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

<div id="<portlet:namespace/>view">
	<c:choose>
		<c:when test="<%= themeDisplay.isSignedIn() %>">
			<div id="people-directory-container">
				<aui:input type="hidden" id="maxItems" name="maxItems" value='<%= PropsValues.MAX_SEARCH_ITEMS %>' />				
				<c:choose>
	 				<c:when test='<%= viewMode == 1 %>'>
						<%
							String tabValue = ParamUtil.getString(request, Constants.TAB, Constants.SEARCH);
							PortletURL portletURL = renderResponse.createRenderURL();
							portletURL.setParameter(Constants.TAB, tabValue);
						%>
						<liferay-ui:tabs names="search,view-all" tabsValues="search,view" url='<%=portletURL.toString()%>' param="tab" />
						<%@include file="include/skype_hangouts.jsp"%>
						<c:choose>
							<c:when test='<%= tabValue.equals(Constants.SEARCH) %>'>
								<%@include file="include/search-form.jsp"%>
							</c:when>
			 				<c:when test='<%= tabValue.equals(Constants.VIEW) %>'>
								<%@include file="include/datatable.jsp"%>
			 				</c:when>
						</c:choose>
	 				</c:when>
	 				<c:when test='<%= viewMode == 2 %>'>
						<%@include file="include/skype_hangouts.jsp"%>
						<%@include file="include/search-form.jsp"%>
	 				</c:when>
					<c:when test='<%= viewMode == 3 %>'>
						<%@include file="include/grid-view.jsp"%>
					</c:when>
				</c:choose>					
				
				
			</div>
		</c:when>
		<c:otherwise>
			<%
				SessionMessages.add(renderRequest, portletDisplay.getId() + SessionMessages.KEY_SUFFIX_HIDE_DEFAULT_ERROR_MESSAGE);
				SessionErrors.add(renderRequest, "portlet-user-not-logged");
			%>
			<liferay-ui:error key="portlet-user-not-logged" message="portlet-user-not-logged" />
		</c:otherwise>
	</c:choose>
</div>
<aui:script>
	AUI().applyConfig({
	    groups : {
	    	'jquery': {
	    		base : '<%= request.getContextPath()%>/js/third-party/',
	            async : false,
	            modules : {
	            	'jquery': {
	                	path: 'jquery-1.6.4.min.js'
	                }
	            }
	    	},
	        'people-directory' : {
	            base : '<%= request.getContextPath()%>/js/',
	            async : false,
	            modules : {
	        		'skype-plugin-people-directory': {
	        			path: 'skype-plugin.js'
	        		},
	        		'skype-ui': {
	        			path: 'third-party/skype-uri.js'
	        		},
	        		'hangouts-plugin-people-directory': {
	        			path: 'hangouts-plugin.js'
	        		}
	            }
	        }
	    }
	});
</aui:script>
<aui:script use="people-directory-plugin,skype-plugin-people-directory,hangouts-plugin-people-directory,liferay-asset-tags-selector">
	Liferay.PeopleDirectory.init(
		{
			portletId: "<%= request.getAttribute(WebKeys.PORTLET_ID) %>",
			namespace: "<portlet:namespace/>",
			container: A.one("#<portlet:namespace/>view"),
			rowCount: "<%=searchResultsPerPage%>",
			fields: ["name", "email", "job-title", "city", "phone"],
			skillsEnabled: <%= skillsEnabled %>
		}
	);
	<c:if test="<%= skypeEnabled %>">
		Liferay.SkypePluginPeopleDirectory.init(
			{
				namespace: "<portlet:namespace/>",
				container: A.one("#<portlet:namespace/>view"),
			}
		);	
	</c:if>
	<c:if test="<%= hangoutsEnabled %>">
		Liferay.HangoutsPluginPeopleDirectory.init(
			{
				namespace: "<portlet:namespace/>",
				container: A.one("#<portlet:namespace/>view"),
			}
		);	
	</c:if>
	<c:if test="<%= skillsEnabled %>">
		Liferay.PeopleDirectory.initSkillSelector({
			allowSuggestions: true,
			contentBox: '#<portlet:namespace/>assetTagsSelector',
			groupIds: String(Liferay.ThemeDisplay.getCompanyGroupId()),
			hiddenInput: '#<portlet:namespace/>search-skills',
			input: '#<portlet:namespace/>assetTagsNames',
			portalModelResource: false
		});
		
		function toggleSearchType() {
			A.all('.skills-criteria, .search-criteria').toggleView();
		}
		
		A.all('.toggle-search-type').on('click', toggleSearchType);
	</c:if>
</aui:script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<%@ include file="include/templates.jspf"%>
