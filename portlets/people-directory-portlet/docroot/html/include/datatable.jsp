<div id="viewAll">
	<%
	    LinkedHashMap<String, Object> userParams = PeopleDirectoryUtil.getUserParams();
				String orderByCol = ParamUtil.getString(request, Constants.ORDER_BY_COL,CustomComparatorUtil.COLUMN_FIRST_NAME);
				String orderByType = ParamUtil.getString(request, Constants.ORDER_BY_TYPE, CustomComparatorUtil.ORDER_DEFAULT);
				OrderByComparator orderComparator = CustomComparatorUtil
						.getUserOrderByComparator(orderByCol, orderByType);
	%>
	<liferay-ui:search-container delta="<%= viewAllResultsPerPage %>"
		emptyResultsMessage="no-users-were-found" orderByCol="<%=orderByCol%>"
		orderByType="<%=orderByType%>" orderByColParam="orderByCol"
		orderByTypeParam="orderByType"
		orderByComparator="<%=orderComparator%>" iteratorURL='<%=portletURL%>'>

		<liferay-ui:search-container-results
			results="<%=UserLocalServiceUtil.search(
							company.getCompanyId(), null,
							WorkflowConstants.STATUS_APPROVED, userParams,
							searchContainer.getStart(),
							searchContainer.getEnd(),
							searchContainer.getOrderByComparator())%>"
			total="<%=UserLocalServiceUtil.searchCount(
							company.getCompanyId(), null,
							WorkflowConstants.STATUS_APPROVED, userParams)%>" />

		<liferay-ui:search-container-row indexVar="indexer"
			className="com.liferay.portal.model.User" keyProperty="userId" modelVar="user">
			<%
				PortletURL profileURL = renderResponse.createRenderURL();
				profileURL.setParameter(Constants.MVC_PATH, Constants.PEOPLE_DIRECTORY_PROFILE_PAGE);
				profileURL.setParameter(Constants.PARAMETER_USER_ID, String.valueOf(user.getUserId()));
				profileURL.setParameter(Constants.BACK_URL, currentURL);
				String columnHref = profileURL.toString();
			%>
			<liferay-ui:search-container-column-text name="name"
				property="fullName" orderable="true" orderableProperty="<%= CustomComparatorUtil.COLUMN_FIRST_NAME %>"
				href='<%=columnHref%>' />
					
			<liferay-ui:search-container-column-text name="email"
				property="emailAddress" orderable="true"
				orderableProperty="<%= CustomComparatorUtil.COLUMN_EMAIL_ADDRESS %>" href='<%="mailto:"+user.getEmailAddress()%>' />

            <c:if test="<%= orgTeamVocabularyId > 0 %>">
                <%
                AssetVocabulary vocabulary = AssetVocabularyServiceUtil.getVocabulary(orgTeamVocabularyId);
                %>
                <liferay-ui:search-container-column-text name="<%=vocabulary.getName()%>">
                    <%=PeopleDirectoryUtil.getOrgTeamCategoryName(user,orgTeamVocabularyId)%>
                </liferay-ui:search-container-column-text>
            </c:if>

            <c:if test="<%= displayJobTitle %>">
                <liferay-ui:search-container-column-text name="job-title"
                    property="jobTitle" orderable="true" orderableProperty="<%= CustomComparatorUtil.COLUMN_JOB_TITLE %>"
                    href='<%=columnHref%>' />
            </c:if>

            <c:if test="<%= displayCity %>">
                <liferay-ui:search-container-column-text name="<%= CustomComparatorUtil.COLUMN_CITY %>">
                    <%=PeopleDirectoryUtil.getCityField(user)%>
                </liferay-ui:search-container-column-text>
            </c:if>

            <c:if test="<%= displayPhone %>">
			    <liferay-ui:search-container-column-jsp name="<%= CustomComparatorUtil.COLUMN_PHONE %>" path="/html/include/phone_with_skype.jsp" />
            </c:if>

		</liferay-ui:search-container-row>
		<liferay-ui:search-iterator />

	</liferay-ui:search-container>
</div>