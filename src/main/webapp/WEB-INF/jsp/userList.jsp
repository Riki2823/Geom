<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Private List</title>

        <style>
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
                margin-rigth: 5%;
                padding: 5%;
                border-radius: 5px;
                font-size: 20px;
            }

            #notFigures a{
                padding: 2%;
                background-color: white;
                color: black;
                border-radius: 5px;
                margin-rigth: 2%;
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
            <c:when test="${empty userFigures}">
                <p id="notFigures" >De momento no tienes figuras, vuelve a <a href="/figures">la pagina de creacion de figuras</a></p>
            </c:when>
            <c:otherwise>
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
                            <td id="buttons"><button id="seeFigure" onClick="redirect()">Visualiza tu imagen</button><button id="seeFigure" onClick="redirect()">Eliminar Imagen</button></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </body>
</html>