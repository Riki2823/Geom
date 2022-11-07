<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Main Menu</title>

        <style>
            * {
              margin: 0;
              padding: 0;
              box-sizing: border-box;
            }
            body{
                background-color: black;
                color: white;
            }

            h1{
                margin: 5%;
                padding: 2%;
                background-color: white;
                color: black;
                border-radius: 5px;
            }

            #mainSection{
                margin: 5%;
                padding: 2%;
                background-color: white;
                color: black;
                text-align: center;
                border-radius: 5px;

            }
            p{
                margin-top: 5%;
                background-color: black;
                padding:2%;
                color: white;
                border-radius: 5px;
            }
        </style>
    </head>
    <body>
        <h1>Bienvenido a la plataforma de creación y almacenamiento de figuras</h1>

        <section id="mainSection">
            <form method="post" action="/home">
                <label for="username">Introduce tu nombre!!</label>
                <br>
                <br>
                <input type="text" name="username" id="username"/>
                <br>
                <br>
                <input type="submit" value="Entrar!!">
            </form>

            <c:if test="${not empty stateUN}">
                <p>${stateUN}</p>
            </c:if>
        </section>
    </body>
</html>
