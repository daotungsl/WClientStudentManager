<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Đào Tùng
  Date: 15/05/2018
  Time: 8:30 SA
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
  <head>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="../css/Article-Clean.css">
    <link rel="stylesheet" href="../css/Article-List.css">
    <link rel="stylesheet" href="../css/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="../css/styles.css">
  </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
          <a class="navbar-brand" href="#">Hidden brand</a>
          <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
              <li class="nav-item active">
                  <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="/register">Register</a>
              </li>
              <li class="nav-item">
                  <a class="nav-link" href="/login">Login</a>
              </li>
          </ul>
          <form class="form-inline my-2 my-lg-0">
              <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
      </div>
  </nav>

  <script src="../bootstrap/js/jquery.min.js"></script>
  <script src="../bootstrap/css/popper.min.js"></script>
  <script src="../bootstrap/css/bootstrap.min.js"></script>
  <c:import url="${content}" var="jspcontent"/>
  ${jspcontent}

  <%
      List<Student> l = new ArrayList<>();
      l.add(new Student("Hoang", "1"));
      l.add(new Student("Tung", "2"));
      request.setAttribute("list", l);
  %>
  <c:forEach var="s" items="${list}" >
      <div class="text-danger">${s.name}  ${s.roll}</div>
  </c:forEach>

  </body>


</html>
