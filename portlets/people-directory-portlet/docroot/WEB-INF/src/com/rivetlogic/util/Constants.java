package com.rivetlogic.util;

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

public interface Constants extends com.liferay.portal.kernel.util.Constants  {
	
	static final String COMMAND = "pdAction";

	static final String MVC_PATH = "mvcPath";

    static final String COMMAND_SEARCH = "keyword-search";

    static final String COMMAND_SHOW_COMPLETE_PROFILE = "show-complete-profile";
    
    static final String COMMAND_SEARCH_SKILLS = "skills-search";
    
    static final String COMMAND_SKILLS_SUGGESTION = "skills-suggestion";

    static final String LOG_SERVER_RESOURCE_ERROR = "Error from server resource";

    static final String LOG_COMPLETE_PROFILE_SEARCH_ERROR = "Error while performing complete profile search";

    static final String LOG_KEYWORD_SEARCH_ERROR = "Error while performing keyword search";

    static final String LOG_ORG_TEAM_CATEGORY_ERROR = "Error retrieving Org team category Name";

    static final String LOG_RETURNING_JSON_ERROR = "Error while returning json";

    static final String DOB_FORMAT = "MMM d, yyyy";

    static final String TAB = "tab";

    static final String ORDER_BY_COL = "orderByCol";

    static final String ORDER_BY_TYPE = "orderByType";

    static final String PARAMETER_KEYWORDS = "keywords";

    static final String PARAMETER_USER_ID = "userId";

    static final String PARAMETER_START = "start";

    static final String PARAMETER_END = "end";
    
    static final String PARAMETER_SKILLS = "skills";
    
    static final String PARAMETER_SKILL_SUGGESTION = "q";

    static final String JSON_USER_ID = "id";

    static final String JSON_USER_FULL_NAME = "fullName";

    static final String JSON_USER_SCREEN_NAME = "screenName";
    static final String DISPLAY_USER_SCREEN_NAME = "displayScreenName";

    static final String JSON_USER_EMAIL_ADDRESS = "emailAddress";

    static final String JSON_USER_PORTRAIT_URL = "portraitUrl";
    static final String JSON_USER_PROFILE_URL = "profileURL";

    static final String JSON_USER_ORG_VOCABULARY = "orgVocabularyName";
    static final String JSON_USER_ORG_CATEGORY = "orgCategoryName";

    static final String JSON_USER_JOB_TITLE = "jobTitle";
    static final String DISPLAY_USER_JOB_TITLE = "displayJobTitle";

    static final String JSON_USER_DOB = "dob";
    static final String DISPLAY_USER_DOB = "displayDob";

    static final String JSON_USER_CITY = "city";
    static final String DISPLAY_USER_CITY = "displayCity";

    static final String JSON_USER_PHONE = "phone";
    static final String DISPLAY_USER_PHONE = "displayPhone";
    
    static final String JSON_USER_SKYPE_NAME = "skypeName";

    static final String JSON_RESULTS_ARRAY = "resultsArray";

    static final String JSON_RESULTS_SEARCH_COUNT = "searchCount";
    
    static final String JSON_SKILLS_ARRAY = "skills";
    
    static final String PEOPLE_DIRECTORY_PROFILE_PAGE = "/html/profile.jsp";
    
    static final String BACK_URL = "backURL";
    
    static final String PORTLET_RESOURCE = "portletResource";

    static final String ORG_TEAM_VOCABULARY = "orgTeamVocabulary";

    static final String VIEW_MODE = "viewMode";
    
    static final String PREFERENCE_VIEW_ALL_RESULTS_PER_PAGE = "VIEW_ALL_RESULTS_PER_PAGE";
    
    static final String PREFERENCE_SEARCH_RESULTS_PER_PAGE = "SEARCH_RESULTS_PER_PAGE";
    
    static final String PARAMETER_VIEW_ALL_RESULTS_PER_PAGE = "viewAllResultsPerPage";
    
    static final String PARAMETER_SEARCH_RESULTS_PER_PAGE = "searchResultsPerPage";
    
    static final String SKYPE_INTEGRATION = "skypeIntegratiion";
    
    static final String HANGOUTS_INTEGRATION = "hangoutsIntegration";
    
    static final String SKILLS_INTEGRATION = "skillsIntegration";
    
}
