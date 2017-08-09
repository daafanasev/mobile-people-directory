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
long userId = ParamUtil.getLong(request, Constants.PARAMETER_USER_ID);

User userSelected = null;

try {
	userSelected = UserLocalServiceUtil.getUser(userId);
	
} catch (NoSuchUserException e) {
	SessionErrors.add(renderRequest, e.getClass());
}

String backURL = ParamUtil.getString(request, Constants.BACK_URL);
String imageId = userId + "-picture";
String title = "<a href=\""+userSelected.getDisplayURL(themeDisplay)+"\">"+HtmlUtil.escape(userSelected.getFullName())+"</a>";
%>

<liferay-ui:error exception="<%= NoSuchUserException.class %>" message="user-could-not-be-found"/>

<c:if test="<%= Validator.isNotNull(userSelected) %>">
	<article id="articleView">
        
        <liferay-ui:header cssClass="profile-info-title" backURL="<%=backURL%>" escapeXml="false" title="<%=title%>"/>
        		
		<a href="<%=userSelected.getDisplayURL(themeDisplay)%>"><img src="<%=userSelected.getPortraitURL(themeDisplay)%>" height="55" width="60" id="<%=imageId %>" alt="<%= HtmlUtil.escapeAttribute(userSelected.getFullName()) %>" /></a>
        
      	<dl class="profile-description">
      	    <c:if test="<%= orgTeamVocabularyId > 0 %>">
      	        <%
      	        AssetVocabulary vocabulary = AssetVocabularyServiceUtil.getVocabulary(orgTeamVocabularyId);
      	        %>
      	        <dt><%=vocabulary.getName()%>:</dt>
      	        <dd><%= HtmlUtil.escape(PeopleDirectoryUtil.getOrgTeamCategoryName(userSelected,orgTeamVocabularyId)) %></dd>
            </c:if>

      	    <c:if test="<%= displayJobTitle %>">
                <dt><liferay-ui:message key="job-title" />:</dt>
                <dd><%= HtmlUtil.escape(userSelected.getJobTitle()) %></dd>
            </c:if>

			<c:if test="<%= displayScreenName %>">
                <dt><liferay-ui:message key="screen-name" />:</dt>
                <dd><%= HtmlUtil.escape(userSelected.getScreenName()) %></dd>
            </c:if>
			
			<dt><liferay-ui:message key="email" />:</dt>
			<dd><%= HtmlUtil.escape(userSelected.getEmailAddress()) %></dd>

			<c:if test="<%= displayCity %>">
                <dt><liferay-ui:message key="city" />:</dt>
                <dd><%= PeopleDirectoryUtil.getCityField(userSelected)%></dd>
			</c:if>

			<c:if test="<%= displayPhone %>">
                <dt><liferay-ui:message key="phone" />:</dt>
                <dd><%= PeopleDirectoryUtil.getPhoneField(userSelected)%></dd>
            </c:if>
			
			<dt><liferay-ui:message key="skype" />:</dt>
			<dd><%= userSelected.getContact().getSkypeSn()%></dd>
		</dl>
		
        <div class="clearfix"></div>
        
	</article>
</c:if>
