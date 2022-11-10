<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Public List</title>

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
                margin-top: 15%;
                margin-bottom: 15%;
                margin-left: 5%;
                margin-right: 5%;
                padding: 5%;
                border-radius: 5px;
                font-size: 20px;
            }
            table{
                border-collapse: collapse;
            }
            #notFigures a:hover{
                background-color: #fca404;
            }

            button{
                margin: 2%;
                background-color: black;
                color: white;
                border-radius: 20px;
                padding: 2%;
            }

            button:hover{
                background-color: white;
                color: black;            
            }
        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${empty listaFiguras}">
                <a href="http://localhost:8080"><button style="background-color: white;" type="button" onClick="goHome()"><img alt="Go Home" src="https://www.svgrepo.com/show/14443/home.svg" width="30" height="30"></button></a>
                <p id="notFigures" >De momento ningun usuario ha creado imagenes</p>
            </c:when>
            <c:otherwise>
                <a href="http://localhost:8080"><button style="background-color: white;" type="button" onClick="goHome()"><img alt="Go Home" src="https://www.svgrepo.com/show/14443/home.svg" width="30" height="30"></button></a>
                <h1> ${name}, esta es la lista con todas las imagenes creadas por ti y otros usuarios de la plataforma </h1>
                <table>
                    <tr>
                        <th>Titulo de la figura</th>
                        <th>Color de la figura</th>
                        <th>Forma de la figura</th>
                        <th>Propietario</th>
                        <th>Opciones</th>
                    </tr>
                    <c:forEach items="${listaFiguras}" var="figure">
                        <tr>
                            <td>Titulo: <c:out value="${figure.title}"/></td>
                            <td>Color: <c:out value="${figure.color}"/></td>
                            <td>Foma: <c:out value="${figure.form}"/></td>
                            <td>Propietario: <c:out value="${figure.propietari.name}"/></td>
                            <td id="buttons"><button id="seeFigure" onClick="redirect()">Visualiza tu imagen</button><button id="seeFigure" onClick="redirect()">Eliminar Imagen</button></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>

        </c:choose>
    </body>
</html>