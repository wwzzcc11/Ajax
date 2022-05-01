<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/4/28
  Time: 10:23
  To change  this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
        <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
  <script>
    function a1() {
      $.post({
        url:"${pageContext.request.contextPath}/a1",
        data:{"msg":"hello,welcome to ajax,wzc"},
        success:function (data) {
          alert(data)
          console.log(data)
        }
      })
    }

    function a2() {
      $.post({
        url: "${pageContext.request.contextPath}/a2",
        data: {"name": "wzc", "gender": "female","age": 30, "phone": "130"},
        success: function (data) {
          console.log(data)
          console.log(data.name)
        }

      })
    }

    function a3() {
      $.post({
        url: "${pageContext.request.contextPath}/a3",
        data: {"name": "cbx", "gender": "male","age": 30, "phone": "139"},
        success: function (data) {
          alert(data)
          console.log(data)
          console.log(data.name)
        }

      })
    }

    function a4() {
      $.post({
        url: "${pageContext.request.contextPath}/a4",
        data: {"name": $("#name").val(), "gender": $("#gender").val(),"age": $("#age").val(), "phone": $("#phone").val()},
        success: function (data) {
          alert(data)
          console.log(data)
          console.log(data.name)
        }

      })
    }

    function a5() {
      $.post({
        url: "${pageContext.request.contextPath}/a5",
        success: function (data) {
          var html=""
          for (let i = 0; i < data.length; i++) {
            html+="<tr>"+
                    "<td>"+data[i].name+"</td>"+
                    "<td>"+data[i].gender+"</td>"+
                    "<td>"+data[i].age+"</td>"+
                    "<td>"+data[i].phone+"</td>"+
                    "</tr>"
          }
          $("#users").html(html)
        }

      })
    }

    function login() {
      $.ajax({
        url:"${pageContext.request.contextPath}/login",
        data:{"account":$("#account").val(),"password":$("#password").val()},
        type:"post",
        success:function (data) {
          var str =JSON.stringify(data)
          alert(data.msg)
        }
      })
    }
  </script>
  </head>
  <body>
  name:<input type="text" id="name"><br>
  gender:<input type="text" id="gender"><br>
  age:<input type="text" id="age"><br>
  phone:<input type="text" id="phone"><br>
  <input type="button" value="显示" onclick="a1()"><br>
  <input type="button" value="打印" onclick="a2()"><br>
  <input type="button" value="显示并打印" onclick="a3()"><br>
  <input type="button" value="提交" onclick="a4()"><br>
  <input type="button" value="显示用户" onclick="a5()"><br>

  <table>
    <tr>
      <td>姓名</td>
      <td>性别</td>
      <td>年龄</td>
      <td>电话</td>
    </tr>
    <tbody id="users">

    </tbody>
  </table>
  account:<input type="text" id="account"><br>
  password:<input type="text" id="password"><br>
  <input type="button" value="登录" onclick="login()"><br>
  </body>
</html>
