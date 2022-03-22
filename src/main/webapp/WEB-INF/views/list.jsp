<%--suppress ELValidationInJSP --%>
<%--
  User: OneIce
  Date: 2021/3/21
  Time: 17:12
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <title>List页面</title>
</head>
<body>
<%-- 定义一个栅格布局 --%>
<div class="container">
    <%-- 标题行 --%>
    <div class="row">
        <%-- 占满整行(每行最多12列) --%>
        <div class="col-md-12"><h1>SSM-CRUD</h1></div>
    </div>

    <%-- 查询行 --%>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form>
                <div class="input-group">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">姓名 <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#">姓名</a></li>
                            <li><a href="#">邮箱</a></li>
                            <li><a href="#">部门</a></li>
                        </ul>
                    </div>

                    <input type="text" class="form-control" placeholder="Search for...">

                    <span class="input-group-btn"><button class="btn btn-primary" type="submit">查询</button></span>
                </div>
            </form>
        </div>
    </div>

    <%-- 新增/删除行 --%>
    <div class="row">
        <%-- 移到最右边 --%>
        <div class="col-md-2 col-md-offset-10">
            <button class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> 新增</button>
            <button class="btn btn-danger">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
            </button>
        </div>
    </div>

    <%-- 表格行 --%>
    <div class="row">
        <%-- 占满整行 --%>
        <div class="col-md-12">
            <table class="table table-bordered table-striped table-hover">
                <caption style="display: none;">Employee List</caption>
                <tr>
                    <th id="check"><input name="#" type="checkbox"></th>
                    <th id="id">编号</th>
                    <th id="name">姓名</th>
                    <th id="gender">性别</th>
                    <th id="email">邮箱</th>
                    <th id="department">部门</th>
                    <th id="operation">操作</th>
                </tr>
                <%-- 遍历出当前页的员工数据 --%>
                <c:forEach var="emp" items="${pageInfo.list}">
                    <tr>
                        <td><input name="#" type="checkbox"></td>
                        <td>${emp.empId}</td>
                        <td>${emp.empName}</td>
                        <td>${emp.gender==1?"男":"女"}</td>
                        <td>${emp.email}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <%-- 分页信息 --%>
    <div class="row">
        <%-- 基本文字说明 --%>
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页, 共${pageInfo.pages}页, 共${pageInfo.total}条记录
        </div>
        <%-- 导航条 --%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:choose>
                        <%-- 首页+上一页 --%>
                        <c:when test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/emps_tmp?page=1&rows=${pageInfo.pageSize}">首页</a>
                            </li>
                            <li>
                                <a href="${APP_PATH}/emps_tmp?page=${pageInfo.prePage}&rows=${pageInfo.pageSize}"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="disabled">
                                <span aria-hidden="true">首页</span>
                            </li>
                            <li class="disabled">
                                <span aria-hidden="true">&laquo;</span>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <%-- 页码展示 --%>
                    <c:forEach var="navigatepageNum" items="${pageInfo.navigatepageNums}">
                        <c:choose>
                            <c:when test="${pageInfo.pageNum!=navigatepageNum}">
                                <li>
                                    <a href="${APP_PATH}/emps_tmp?page=${navigatepageNum}&rows=${pageInfo.pageSize}">
                                            ${navigatepageNum}
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="active">
                                    <span>${navigatepageNum} <span class="sr-only">(current)</span></span>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <%-- 下一页+末页 --%>
                    <c:choose>
                        <c:when test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps_tmp?page=${pageInfo.nextPage}&rows=${pageInfo.pageSize}"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li>
                                <a href="${APP_PATH}/emps_tmp?page=${pageInfo.pages}&rows=${pageInfo.pageSize}">末页</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="disabled">
                              <span>
                                <span aria-hidden="true">&raquo;</span>
                              </span>
                            </li>
                            <li class="disabled">
                              <span>
                                <span aria-hidden="true">末页</span>
                              </span>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </div>
    </div>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
