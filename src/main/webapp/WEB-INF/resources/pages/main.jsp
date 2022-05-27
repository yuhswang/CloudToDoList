<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>待辦事項 Web App</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="nav-header">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">網路工具箱</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
                    aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">待辦事項</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <div class="main-content">
        <div class="header">
            <h4>待辦事項</h4>
            <form id="inputForm">
                <div class="form-group">
                    <input type="text" id="inputContent" class="form-control" placeholder="請輸入內容">
                    <button type="button" id="addTask" class="btn btn-outline-primary">新增</button>
                    <div id="errMsg" class="invalid-feedback"></div>
                </div>
            </form>
        </div>
        <hr>
        <div class="body">
            <div class="row">
                <div class="col-12">
                    <ul class="nav nav-pills mb-3 nav-fill" role="tablist">
                        <li class="nav-item">
                            <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab"
                                data-bs-target="#navs-pills-toDo" aria-controls="navs-pills-toDo" aria-selected="true">
                                <i class="icon_calendar"></i> 待完成項目
                                <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-danger">${taskNum}</span>
                            </button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="nav-link" role="tab" data-bs-toggle="tab"
                                data-bs-target="#navs-pills-finished" aria-controls="navs-pills-finished"
                                aria-selected="false">
                                <i class="icon_box-checked"></i> 已完成
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="navs-pills-toDo" role="tabpanel">
                            <ul class="list-unstyled">
                            	<c:forEach var="task" items="${undoList}">
                            		<li class="eachItem">
	                                    <div class="row">
	                                        <div class="col-9">
	                                            <span class="list-content">${task.content}</span>
	                                        </div>
	                                        <div class="col-3">
	                                            <button type="button" class="btn btn-outline-dark deleteTask" value="${task.id }">刪除</button>
	                                            <a href="<c:url value="/myTasks/finish/${task.id }"/>" class="btn btn-outline-dark">完成</a>
<!-- 	                                            <button type="button" class="btn btn-outline-dark">完成</button> -->
	                                        </div>
	                                    </div>
                                	</li>
                                <hr>
                            	</c:forEach>
                            </ul>
                        </div>

                        <div class="tab-pane fade" id="navs-pills-finished" role="tabpanel">
                            <ul class="list-unstyled">
                            	<c:set var = "now" value = "<%= new java.util.Date()%>" />
                            	<c:forEach var="task" items="${finishedList}">
                            		<li class="eachItem">
	                                    <div class="row">
	                                        <div class="col-9">
	                                            <span class="list-content">${task.content}</span>
	                                        </div>
	                                        <div class="col-3">
	                                            <span class="finishTime">
	                                            <c:choose>
	                                            	<c:when test="${(now.time - task.finishedTime.time)/(1000*60*60) > 24}">
	                                            		<fmt:formatDate pattern = "yyyy-MM-dd" value = "${task.finishedTime}" />
	                                            	</c:when>
	                                            	<c:when test="${(now.time - task.finishedTime.time)/(1000*60) > 60}">
	                                            		<fmt:formatNumber value="${(now.time - task.finishedTime.time)/1000/60/60}" pattern="#0"/>小時前
	                                            	</c:when>
	                                            	<c:when test="${(now.time - task.finishedTime.time)/(1000*60) < 1}">
	                                            		剛剛
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            		<fmt:formatNumber value="${(now.time - task.finishedTime.time)/1000/60}" pattern="#0"/>分鐘前
	                                            	</c:otherwise>
	                                            </c:choose>
	                                            	
	                                            </span>
	                                        </div>
	                                    </div>
	                                </li>
                                	<hr>
                            	</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
            integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js"
            integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.17/dist/sweetalert2.all.min.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>