<%--suppress ALL --%>
<%--
  User: OneIce
  Date: 2021/3/21
  Time: 17:12
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <title>主页</title>
</head>
<body>
<%-- 显示错误消息 --%>
<%--<div id="alert_div" class="alert alert-danger fade in hide">--%>
<%--    <button type="button" class="close" data-dismiss="alert">&times;</button>--%>
<%--    <strong></strong>--%>
<%--</div>--%>

<!-- 用于员工新增的模态框 -->
<div class="modal fade" id="add_emp_modal" tabindex="-1" role="dialog" aria-labelledby="addEmpModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">新增员工</h4>
            </div>
            <%-- 表单部分 --%>
            <div class="modal-body">
                <form id="add_emp_form" action="#" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label for="add_emp_name_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="text" class="form-control" id="add_emp_name_input" placeholder="OneIce"
                                   name="empName">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误信息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_emp_email_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="email" class="form-control has-feedback" id="add_emp_email_input"
                                   placeholder="oneice@foxmail.com"
                                   name="email">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误消息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_emp_gender_input1" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input checked type="radio" name="gender" id="add_emp_gender_input1" value="1"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="add_emp_gender_input2" value="2"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_emp_dept_select" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select id="add_emp_dept_select" name="dId" class="form-control">
                                <%-- 从数据库中查询部门信息 --%>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <%-- 保存和关闭按钮 --%>
            <div class="modal-footer">
                <button id="add_emp_close_btn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="add_emp_save_btn" type="button" class="btn btn-primary">保存</button>
                <%-- 默认禁用 --%>
            </div>
        </div>
    </div>
</div>

<!-- 用于员工修改的模态框 -->
<div class="modal fade" id="update_emp_modal" tabindex="-1" role="dialog" aria-labelledby="updateEmpModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改员工</h4>
            </div>
            <%-- 表单部分 --%>
            <div class="modal-body">
                <form id="update_emp_form" action="#" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label for="update_emp_name_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <%-- 静态框 --%>
                            <p class="form-control-static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_emp_email_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10 has-feedback">
                            <input type="email" class="form-control has-feedback" id="update_emp_email_input"
                                   placeholder="oneice@foxmail.com"
                                   name="email">
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <%-- 显示错误消息 --%>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_emp_gender_input1" class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input checked type="radio" name="gender" id="update_emp_gender_input1" value="1"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="update_emp_gender_input2" value="2"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_emp_dept_select" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select id="update_emp_dept_select" name="dId" class="form-control">
                                <%-- 从数据库中查询部门信息 --%>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <%-- 更新和关闭按钮 --%>
            <div class="modal-footer">
                <button id="update_emp_close_btn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button id="emp_update_btn" type="button" class="btn btn-primary">更新</button>
                <%-- 默认禁用 --%>
            </div>
        </div>
    </div>
</div>

<%-- 定义一个栅格布局 --%>
<div class="container">
    <%-- 标题行 --%>
    <div class="row">
        <%-- 占满整行(每行最多12列) --%>
        <div class="col-md-12"><h1>SSM-CRUD</h1></div>
    </div>

    <%-- 输入框组, 用于条件查询 --%>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <form id="search_form" action="#">
                <div class="input-group">
                    <div class="input-group-btn">
                        <button id="type_btn" type="button" class="btn btn-default dropdown-toggle"
                                data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">姓名 <span class="caret"></span></button>
                        <%--下拉菜单--%>
                        <ul class="dropdown-menu">
                            <li><a name="byEmpName" href="javaScript:;">姓名</a></li>
                            <li><a name="byId" href="javaScript:;">编号</a></li>
                            <li><a name="byEmail" href="javaScript:;">邮箱</a></li>
                        </ul>
                    </div>
                    <input type="hidden" name="type" value="byEmpName">
                    <input name="keyword" type="text" class="form-control" placeholder="Search for...">

                    <span class="input-group-btn">
                        <button class="btn btn-primary" type="submit">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span> 搜索
                        </button>
                    </span>
                </div>
            </form>
        </div>
    </div>

    <%-- 新增/删除行 --%>
    <div class="row">
        <%-- 移到最右边 --%>
        <div class="col-md-2 col-md-offset-10">
            <button class="btn btn-success" id="add_emp_btn"><span class="glyphicon glyphicon-plus"></span> 新增</button>
            <button class="btn btn-danger" id="delete_all_check">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
            </button>
        </div>
    </div>

    <%-- 表格行 --%>
    <div class="row">
        <%-- 占满整行 --%>
        <div class="col-md-12">
            <table id="emp_table" class="table table-bordered table-striped table-hover">
                <caption style="display: none;">Employee List</caption>
                <thead>
                <tr>
                    <th id="check"><input id="check_all" type="checkbox"></th>
                    <th id="id">编号</th>
                    <th id="name">姓名</th>
                    <th id="gender">性别</th>
                    <th id="email">邮箱</th>
                    <th id="department">部门</th>
                    <th id="operation">操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>

    <%-- 导航条信息 --%>
    <div class="row">
        <%-- 导航条的分页信息 --%>
        <div class="col-md-6" id="page_info_area">
        </div>
        <%-- 导航条的页码显示 --%>
        <div class="col-md-6" id="page_navigate_area">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:choose>
                        <%-- 首页+上一页 --%>
                        <c:when test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/emps?page=1&rows=${pageInfo.pageSize}">首页</a>
                            </li>
                            <li>
                                <a href="${APP_PATH}/emps?page=${pageInfo.prePage}&rows=${pageInfo.pageSize}"
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
                                    <a href="${APP_PATH}/emps?page=${navigatepageNum}&rows=${pageInfo.pageSize}">
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
                                <a href="${APP_PATH}/emps?page=${pageInfo.nextPage}&rows=${pageInfo.pageSize}"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li>
                                <a href="${APP_PATH}/emps?page=${pageInfo.pages}&rows=${pageInfo.pageSize}">末页</a>
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

<%-- 分页查询 --%>
<script type="text/javascript">
    var pageNum = 1; //当前页码
    var rows = 10; //每页记录数
    var pages = 0; //总页数
    var total = 0; //总记录数
    var queryUrl = "${APP_PATH}/emps" //用于查询的url

    //页面一加载好就请求一次分页数据
    $(function () {
        toPage(1, rows)
    })

    //发送Ajax请求, 请求分页数据
    function toPage(pageNum, rows) { //页码, 记录数
        $.ajax({
            type: "GET",
            url: queryUrl,
            data: {"page": pageNum, "rows": rows},
            dataType: "json",
            success: function (result) {
                //构建员工列表
                buildEmpsTable(result.dataMap.pageInfo.list)
                //构建分页基本信息
                buildPageInfo(result.dataMap.pageInfo)
                //构建导航条
                buildPageNavigate(result.dataMap.pageInfo)
            }
        })
    }

    //构建员工表格
    function buildEmpsTable(list) {
        //清空原表格数据
        $("#emp_table tbody").empty()
        //获取每个员工信息, 追加到表格中显示
        $.each(list, function () {
            var empTr = $("<tr></tr>")
            var empCbTd = $('<td><input class="check_item" type="checkbox"></td>')
            var empIdTd = $("<td></td>").append(this.empId)
            var empNameTd = $("<td></td>").append(this.empName)
            var genderTd = $("<td></td>").append(this.gender === 1 ? "男" : "女")
            var emailTd = $("<td></td>").append(this.email)
            //避免部门为null
            var deptNameTd = $("<td></td>").append(this.department ? this.department.deptName : "")
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-edit")).append(" 编辑").attr("emp_id", this.empId)
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")
                .addClass("glyphicon glyphicon-trash")).append(" 删除").attr("emp_id", this.empId)
            var operatorTd = $("<td></td>").append(editBtn).append(" ").append(delBtn)
            empTr.append(empCbTd).append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(operatorTd)
                .appendTo("#emp_table tbody")
        })
    }

    //构建分页的基本信息
    function buildPageInfo(pageInfo) {
        $("#page_info_area").empty() //清空原信息
        pageNum = pageInfo.pageNum
        rows = pageInfo.pageSize
        pages = pageInfo.pages
        total = pageInfo.total
        $("#page_info_area").append(`当前第\${pageNum}页, 共\${pages}页, 共\${total}条记录`)
    }

    //构建导航条
    function buildPageNavigate(pageInfo) { //分页信息
        $("#page_navigate_area").empty() //清空原导航条

        var ul = $("<ul></ul>").addClass("pagination")
        //首页和上一页
        var firstPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("首页"))
        var prePageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("&laquo;"))
        //没有上一页时禁用掉按钮
        if (!pageInfo.hasPreviousPage) {
            firstPageLi.addClass("disabled")
            prePageLi.addClass("disabled")
        }
        //绑定单击事件
        clickToPage(firstPageLi, 1, pageInfo.pageSize)
        clickToPage(prePageLi, pageInfo.prePage, pageInfo.pageSize)
        ul.append(firstPageLi).append(prePageLi)

        //遍历中间页码
        $.each(pageInfo.navigatepageNums, function () {
            var pageNumLi = $("<li></li>").append($("<a></a>").attr("href", "#").append(this))
            //高亮当前页的页码
            if (pageInfo.pageNum == this) {
                pageNumLi.addClass("active")
            }
            //绑定单击事件
            clickToPage(pageNumLi, this, pageInfo.pageSize)
            ul.append(pageNumLi)
        })
        //下一页和末页
        var nextPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("&raquo;"))
        var lastPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("末页"))
        //绑定单击事件
        clickToPage(nextPageLi, pageInfo.nextPage, pageInfo.pageSize)
        clickToPage(lastPageLi, pageInfo.pages, pageInfo.pageSize)
        //没有下一页时禁用掉按钮
        if (!pageInfo.hasNextPage) {
            nextPageLi.addClass("disabled")
            lastPageLi.addClass("disabled")
        }
        ul.append(nextPageLi).append(lastPageLi)
        //创建导航条, 显示到页面上
        var nav = $("<nav></nav>").append(ul)
        $("#page_navigate_area").append(nav)
    }

    //为导航条页码绑定单击事件
    function clickToPage(obj, page, rows) { //按钮对象, 页码, 页大小
        $(obj).click(function () {
            if (!$(this).hasClass("disabled") && !$(this).hasClass("active")) {
                toPage(page, rows)
            }
            return false
        })
    }

</script>

<%-- 新增员工 --%>
<script type="text/javascript">

    //点击"新增"按钮, 弹出"新增"模态框
    $("#add_emp_btn").click(function () {
        resetForm("#add_emp_form")//重置表单(内容+样式)
        getDepts("#add_emp_dept_select") //查询所有部门信息显示在模态框上
        $("#add_emp_modal").modal() //展示模态框
    })

    //重置表单(内容+样式)
    function resetForm(selector) { //表单选择器
        //重置表单内容
        $(selector)[0].reset()
        //重置表单样式
        $(selector).find("*").removeClass("has-error has-success")
        $(selector).find(".glyphicon").removeClass("glyphicon-remove glyphicon-ok")
        $(selector).find(".help-block").text("")
    }

    //点击"关闭"按钮, 清空下拉列表的部门信息
    $("#add_emp_close_btn").click(function () {
        $("#add_emp_dept_select").empty()
    })

    //查询所有部门信息, 显示在selector所指定的下拉列表中
    function getDepts(selector) {
        $(selector).empty()
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/depts",
            dataType: "json",
            success: function (result) {
                $.each(result.dataMap.depts, function () {
                    var option = $("<option></option>").attr("value", this.deptId).append(this.deptName)
                    $(selector).append(option)
                })
            }
        })
    }

    //校验新增表单的姓名和邮箱
    function validateAddForm() {
        //校验姓名
        var empName = $("#add_emp_name_input").val()
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,8}$)/ //匹配2-8位中文, 或3-16字母下划线数字
        if (regName.test(empName)) { //姓名格式正确
            //Ajax再校验姓名是否存在
            $.ajax({
                type: "GET",
                url: "${APP_PATH}/checkEmpName",
                data: $("#add_emp_name_input").serialize(),
                dateType: "json",
                success: function (result) {
                    if (result.errorCode.value == "00000") {
                        showValidateMsg("#add_emp_name_input", "success", "")
                    } else if (result.errorCode.value == "A0111") { //姓名已存在
                        showValidateMsg("#add_emp_name_input", "error", "该员工姓名已存在, 请重新输入")
                    } else {
                        showValidateMsg("#add_emp_name_input", "error", "姓名错误, 请重新输入")
                    }
                }
            })
        } else { //姓名格式错误
            showValidateMsg("#add_emp_name_input", "error", "姓名格式错误, 必须是2-8位中文, 或3-16字母下划线数字")
            return false
        }

        //校验邮箱
        var empEmail = $("#add_emp_email_input").val()
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/ //匹配电子邮箱
        if (regEmail.test(empEmail)) { //邮箱格式正确
            showValidateMsg("#add_emp_email_input", "success", "")
        } else { //邮箱格式错误
            showValidateMsg("#add_emp_email_input", "error", "邮箱格式错误")
            return false
        }
        //完全正确
        return true
    }

    //显示校验结果信息
    function showValidateMsg(selector, status, msg) { //选择器, 结果状态, 结果信息

        //初始化状态
        $(selector).parent().removeClass("has-error has-success")
        $(selector).nextAll(".glyphicon").removeClass("glyphicon-remove glyphicon-ok")
        $(selector).nextAll(".help-block").text("")
        if (status == "success") {
            $(selector).parent().addClass("has-success") //颜色
            $(selector).nextAll(".glyphicon").addClass("glyphicon-ok") //图标
            $(selector).nextAll(".help-block").text(msg) //提示信息
        } else if (status == "error") {
            $(selector).parent().addClass("has-error")
            $(selector).nextAll(".glyphicon").addClass("glyphicon-remove")
            $(selector).nextAll(".help-block").text(msg)
        }
    }

    //内容一改变就进行校验
    $("#add_emp_name_input,#add_emp_email_input").change(function () {
        validateAddForm()
    })

    //点击"保存"按钮:
    //1. 发送Ajax新增员工的请求
    //2. 关闭模态框
    //3. 收到返回数据后, 跳转至末页
    $("#add_emp_save_btn").click(function () {
        //保存前再校验一遍
        if (!validateAddForm()) {
            return false
        }
        //发送Ajax请求, 新增员工
        $.ajax({
            type: "POST",
            url: "${APP_PATH}/emps",
            data: $("#add_emp_form").serialize(),
            dataType: "json",
            success: function (result) {
                if (result.errorCode.value === "00000") {
                    //关闭模态框
                    $("#add_emp_modal").modal("hide")
                    //跳转至最后一页
                    queryUrl = "${APP_PATH}/emps";
                    toPage(0x7fffffff, rows)
                } else { //添加失败, 显示错误消息
                    if (result.dataMap.empName) { //带有empName这个错误
                        showValidateMsg("#add_emp_name_input", "error", result.dataMap.empName);
                    }
                    if (result.dataMap.email) { //带有email这个错误
                        showValidateMsg("#add_emp_email_input", "error", result.dataMap.email);
                    }
                }
            }
        })
    })


    //显示错误警告框, 6秒后自动消失
    // function showErrorAlert(msgs) {
    //     //显示错误消息
    //     $.each(msgs, function () {
    //         $("#alert_div strong").append(this + "  ")
    //         $("#alert_div").removeClass("hide")
    //     })
    //     //滚动到页面顶部
    //     document.documentElement.scrollTop = 0
    //     //6秒后自动消失
    //     window.setTimeout(function () {
    //         $("#alert_div").addClass("hide")
    //         $("#alert_div strong").empty()
    //     }, 6000)
    // }
</script>

<%-- 修改员工 --%>
<script type="text/javascript">

    //点击"编辑"按钮, 弹出"修改员工"模态框
    //因为编辑按钮是未来创建的, 所以需要委托给#emp_table
    $("#emp_table").on("click", ".edit_btn", function () {
        //重置表单(内容+样式)
        resetForm("#update_emp_form")
        //将编辑按钮上的员工id传递到更新按钮上
        $("#emp_update_btn").attr("emp_id", $(this).attr("emp_id"))
        //查询所有部门信息显示在模态框上
        getDepts("#update_emp_dept_select")
        //查询该员工信息并显示在模态框上
        getEmp($(this).attr("emp_id"), "#update_emp_form")
        //展示模态框
        $("#update_emp_modal").modal()
        return false //阻止事件继续冒泡
    })

    //Ajax查询该员工信息并显示在模态框上
    function getEmp(empId, selector) { //员工id, 表单选择器
        $.ajax({
            type: "GET",
            url: "${APP_PATH}/emps/" + empId,
            dataType: "json",
            success: function (result) {
                //将员工数据显示到"修改员工"的模态框上
                var $form = $(selector)
                $form.find(".form-control-static").text(result.dataMap.emp.empName)
                console.log($form.find(":text[name=email]"))
                $form.find(":input[name=email]").val(result.dataMap.emp.email)
                $form.find(":radio[name=gender]").val([result.dataMap.emp.gender])
                $form.find("select[name=dId]").val([result.dataMap.emp.dId])
            }
        })
    }

    //校验【更新表单】
    function validateUpdateForm() {
        var empEmail = $("#update_emp_email_input").val()
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/ //匹配电子邮箱
        if (regEmail.test(empEmail)) { //邮箱格式正确
            showValidateMsg("#update_emp_email_input", "success", "")
            return true
        } else { //邮箱格式错误
            showValidateMsg("#update_emp_email_input", "error", "邮箱格式错误")
            return false
        }
    }

    //内容一改变就进行校验
    $("#update_emp_email_input").change(function () {
        validateUpdateForm()
    })

    //点击更新, Ajax更新员工信息
    $("#emp_update_btn").click(function () {
        //校验【更新表单】
        if (!validateUpdateForm()) {
            return false
        }
        //Ajax更新员工信息
        $.ajax({
            type: "POST",
            url: "${APP_PATH}/emps/" + $(this).attr("emp_id"),
            data: $("#update_emp_form").serialize() + "&_method=PUT",
            dataType: "json",
            success: function (result) {
                if (result.errorCode.value == "00000") { //更新成功
                    //关闭模态框
                    $("#update_emp_modal").modal("hide")
                    //重新请求当前页码, 获得更新后的员工信息
                    toPage(pageNum, rows)
                } else {
                    if (result.dataMap.email) { //带有email这个错误
                        showValidateMsg("#update_emp_email_input", "error", result.dataMap.email);
                    }
                }
            }
        })
    })
</script>

<%-- 删除员工 --%>
<script type="text/javascript">

    //点击删除按钮, 弹出员工删除确认框, 确认后发送员工删除请求
    $("#emp_table").on("click", ".delete_btn", function () {
        var empId = $(this).attr("emp_id")
        var empName = $(this).parents("tr").find("td:eq(2)").text()


        if (confirm("你确定要删除【" + empName + "】吗?")) {
            //Ajax发送员工删除请求
            $.ajax({
                type: "POST",
                url: "${APP_PATH}/emps/" + empId,
                data: "_method=DELETE",
                dataType: "json",
                success: function (result) {
                    if (result.errorCode.value == "00000") { //删除成功, 刷新页面
                        toPage(pageNum, rows)
                    } else { //删除失败, 显示错误信息
                        //懒得写了...
                    }
                }
            })
        }
    })


    //实现全选/全不选的复选框逻辑
    //为全选框绑定单击事件
    $("#check_all").click(function () {
        var flag = $(this).prop("checked") //这里必须用prop(), attr()只能获取显式指定的属性值
        $(".check_item").prop("checked", flag)
    })

    //为每个复选框绑定单击事件
    $("#emp_table").on("click", ".check_item", function () {
        //获取当前的选中个数
        var checkCount = $(".check_item:checked").length
        //如果选中个数和复选框总个数相等, 就把全选框勾上, 否则划掉
        var flag = checkCount == $(".check_item").length;
        if (flag) {
            $("#check_all").prop("checked", true)
        } else {
            $("#check_all").prop("checked", false)
        }
    })

    //点击删除, 发送Ajax批量删除请求
    $("#delete_all_check").click(function () {
        //如果没有一个选中的, 则直接返回
        if ($(".check_item:checked").length == 0) {
            alert("请勾选要删除的条目!")
            return false
        }

        var empNames = "";
        var ids = ""
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ", " //拼接要删除的员工姓名
            ids += $(this).parents("tr").find("td:eq(1)").text() + "-" //拼接要删除的员工id
        })
        empNames = empNames.substring(0, empNames.length - 2) //去掉最后一个", "
        ids = ids.substring(0, ids.length - 1) //去掉最后一个"-"
        //弹出确认框
        if (confirm("你确定要删除【" + empNames + "】吗？")) {
            //发送Ajax批量删除请求
            $.ajax({
                type: "POST",
                url: "${APP_PATH}/emps/" + ids,
                data: "_method=DELETE",
                dataType: "json",
                success: function (result) {
                    if (result.errorCode.value == "00000") { //删除成功, Ajax刷新页面
                        toPage(pageNum, rows)
                    } else { //删除失败, 显示错误信息

                    }
                }
            })
        }
    })


</script>

<%-- 条件查询 --%>
<script type="text/javascript">
    //点击下拉列表时, 修改表单隐藏域的value值
    $("#search_form .dropdown-menu a").click(function () {
        var text = $(this).text()
        var name = $(this).attr("name")
        $("#type_btn").html(text + ' <span class="caret"></span>')
        $("#search_form input[name=type]").val(name)
    })

    //点击"搜索", 发送Ajax查询请求
    $("#search_form").submit(function () {
        queryUrl = "${APP_PATH}/emps?" + $(this).serialize()
        toPage(1, rows)
        return false
    })
</script>

<%-- 检查是否有重复id属性 --%>
<script type="text/javascript">
    window.onload = function () {
        var tags = document.getElementsByTagName("*");
        var count = tags.length;
        var time;
        var ret = {}
        var id;
        var time = new Date();
        for (var i = 0; i < count; i++) {
            id = tags[i].id;
            if (id) {
                if (ret[id]) {
                    alert(id + "\\n用时：" + (new Date() - time) + "秒");
                    return;
                } else {
                    ret[id] = true;
                }
            }
        }
        // alert("未找到相同ID");
    }
</script>
</body>
</html>
