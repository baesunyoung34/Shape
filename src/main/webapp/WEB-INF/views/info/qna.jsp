<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../common/header.jsp"%>
<!-- 지현 qna main(list) page -->

	<div class="container">
		<header class="my-2 p-5 text-center">
			<h1>Q&amp;A</h1>
			<p>문의를 남겨주시면 영업시간(09:30 ~ 17:30)내에 답변드리겠습니다.</p>
		</header>

		<main class="my-2">
			<div class="card">
				<table class="card-body table table-hover">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">진행상태</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach items="${ infoQnAs }" var="infoQnA">
							<tr>
								<th scope="row" class="col-1">${ infoQnA.qid }</th>
								<!-- secret 여부에 따라 제목이 달라짐 -->
								<c:if test="${infoQnA != null}">
									<c:choose>
										<c:when test="${infoQnA.secret.equals('N')}">
											<td><c:url var="infoQnADetailPage" value="/info/qna/detail">
													<c:param name="qid" value="${ infoQnA.qid }" />
												</c:url> <a href="${ infoQnADetailPage }">${ infoQnA.title }</a></td>
										</c:when>
										<c:otherwise>
											<td><c:url var="infoQnADetailPage" value="/info/qna/detail">
													<c:param name="qid" value="${ infoQnA.qid }" />
												</c:url> <a href="${ infoQnADetailPage }">🔒비밀글입니다.</a></td>
										</c:otherwise>
									</c:choose>
								</c:if>
								<td class="col-2"><fmt:formatDate value="${ infoQnA.created_date }"
										pattern="yyyy-MM-dd" /></td>
								<!-- an_title이 null인지 아닌지에 따라 진행상태가 달라짐 -->
								<c:if test="${infoQnA != null}">
									<c:choose>
										<c:when test="${infoQnA.an_title=='확인중'}">
											<td class="col-2">확인중</td>
										</c:when>
										<c:otherwise>
											<td class="col-2">답변완료</td>
										</c:otherwise>
									</c:choose>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="my-2 d-grid d-md-flex justify-content-md-end">
				<c:url var="qnaCreate" value="/info/qna/create" />
				<button onclick="location.href='${ qnaCreate }'" class="btn btn-primary" type="button">질문하기</button>
			</div>
		</main>


	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>