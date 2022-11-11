<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Private List</title>

        <style>
            h1{
                margin: 5%;
            }
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                margin: 5%;
            }
    
            td, th {
                border: 5px solid black;
                text-align: left;
                padding: 8px;
                text-align: center;
            }
            a{
               text-decoration:none;
            }

            #notFigures{
                background-color: black;
                color: white;
                margin-top: 5%;
                margin-bottom: 5%;
                margin-left: 5%;
                margin-right: 5%;
                padding: 5%;
                border-radius: 5px;
                font-size: 20px;
            }

            #notFigures a{
                padding: 2%;
                background-color: white;
                color: black;
                border-radius: 5px;
                margin-right: 2%;
            }
            table{
                border-collapse: collapse;
            }
            #notFigures a:hover{
                background-color: #fca404;
            }

            input{
                all: unset;
                cursor: pointer;
            }
            .button{
                margin: 2%;
                background-color: black;
                color: white;
                border-radius: 20px;
                padding: 5%;
            }

            .button:hover{
                background-color: white;
                color: black;
                border: 2px solid black;

            }

            button{
                margin: 5%;
                background-color: black;
                color: white;
                border-radius: 20px;
                padding: 2%;
                margin-bottom: 2%;
            }

        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty userFigures}">
                <p id="notFigures" >De momento no tienes figuras, vuelve a <a href="/figures">la pagina de creacion de figuras</a></p>
            </c:when>
            <c:otherwise>
                <a href="http://localhost:8080"><button style="background-color: white;" type="button" onClick="goHome()"><img alt="Go Home" src="https://www.svgrepo.com/show/14443/home.svg" width="30" height="30"></button></a>
                <h1> ${name}, esta es tu lista personal de figuras, aqui podrás visualizar y eliminar las figuras creadas con anterioridad </h1>
                <table>
                    <tr>
                        <th>Titulo de la figura</th>
                        <th>Color de la figura</th>
                        <th>Forma de la figura</th>
                        <th>Opciones</th>
                    </tr>
                    <c:forEach items="${userFigures}" var="figure">
                        <tr>
                            <td>Titulo: <c:out value="${figure.title}"/></td>
                            <td>Color: <c:out value="${figure.color}"/></td>
                            <td>Foma: <c:out value="${figure.form}"/></td>
                            <td>
                            
                                <form class="button" action="/seeFigure" method="get">
                                    <input  type="submit" value="Ver Figura"></input>
                                    <input name="figureId" type="hidden" value="${figure.id}"></input>
                                </form>

                                <form class="button" action="/userList" method="post">
                                    <input type="submit" value="Eliminar Figura"></input>
                                    <input name="figureId" type="hidden" value="${figure.id}"></input>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>

        </c:choose>
    </body>
</html>