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

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>

<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="com.liferay.portal.service.GroupLocalServiceUtil" %>
<%@ page import="com.liferay.portal.service.UserLocalServiceUtil" %>
<%@ page import="com.liferay.portal.model.Group" %>
<%@ page import="com.liferay.portal.model.User" %>
<%@ page import="com.liferay.portal.kernel.dao.orm.CustomSQLParam"%>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow"%>
<%@ page import="com.liferay.portal.kernel.util.Validator" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.OrderByComparator"%>
<%@ page import="com.liferay.portal.kernel.util.GetterUtil"%>
<%@ page import="com.liferay.portal.kernel.servlet.SessionMessages" %>
<%@ page import="com.liferay.portal.kernel.servlet.SessionErrors" %>
<%@ page import="com.liferay.portal.kernel.workflow.WorkflowConstants"%>
<%@ page import="com.liferay.portal.util.PortalUtil" %>
<%@ page import="com.liferay.portlet.PortletPreferencesFactoryUtil"%>
<%@ page import="com.liferay.util.portlet.PortletProps"%>
<%@ page import="com.liferay.portal.kernel.util.StringPool"%>
<%@ page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil"%>
<%@ page import="com.liferay.portal.NoSuchUserException"%>
<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import="com.liferay.portal.kernel.util.ArrayUtil" %>
<%@ page import="com.liferay.portlet.asset.model.AssetVocabulary" %>
<%@ page import="com.liferay.portlet.asset.service.AssetVocabularyServiceUtil" %>

<%@ page import="com.rivetlogic.util.comparator.CustomComparatorUtil"%>
<%@ page import="com.rivetlogic.util.PeopleDirectoryUtil"%>
<%@ page import="com.rivetlogic.util.Constants"%>
<%@ page import="com.rivetlogic.util.PropsValues"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="javax.portlet.PortletPreferences"%>
<%@ page import="javax.portlet.PortletURL"%>


<portlet:defineObjects />
<liferay-theme:defineObjects />

<% 
String currentURL = PortalUtil.getCurrentURL(renderRequest);
PortletPreferences preferences = renderRequest.getPreferences();

long orgTeamVocabularyId = GetterUtil.getLong(preferences.getValue(Constants.ORG_TEAM_VOCABULARY, PropsValues.ORG_TEAM_VOCABULARY));
long viewMode = GetterUtil.getLong(preferences.getValue(Constants.VIEW_MODE, PropsValues.VIEW_MODE));

int searchResultsPerPage = GetterUtil.getInteger(preferences.getValue(Constants.PREFERENCE_SEARCH_RESULTS_PER_PAGE, PropsValues.DEFAULT_RECORD_COUNT));
int viewAllResultsPerPage = GetterUtil.getInteger(preferences.getValue(Constants.PREFERENCE_VIEW_ALL_RESULTS_PER_PAGE, PropsValues.DEFAULT_RECORD_COUNT));
boolean displayJobTitle = GetterUtil.getBoolean(preferences.getValue(Constants.DISPLAY_USER_JOB_TITLE, PropsValues.DISPLAY_USER_JOB_TITLE), true);
boolean displayScreenName = GetterUtil.getBoolean(preferences.getValue(Constants.DISPLAY_USER_SCREEN_NAME, PropsValues.DISPLAY_USER_SCREEN_NAME), true);
boolean displayCity = GetterUtil.getBoolean(preferences.getValue(Constants.DISPLAY_USER_CITY, PropsValues.DISPLAY_USER_CITY), true);
boolean displayPhone = GetterUtil.getBoolean(preferences.getValue(Constants.DISPLAY_USER_PHONE, PropsValues.DISPLAY_USER_PHONE), true);
boolean skypeEnabled = GetterUtil.getBoolean(preferences.getValue(Constants.SKYPE_INTEGRATION, PropsValues.SKYPE_ENABLED));
boolean hangoutsEnabled = GetterUtil.getBoolean(preferences.getValue(Constants.HANGOUTS_INTEGRATION, PropsValues.HANGOUTS_INTEGRATION));
boolean skillsEnabled = GetterUtil.getBoolean(preferences.getValue(Constants.SKILLS_INTEGRATION, PropsValues.SKILLS_INTEGRATION));
%>
