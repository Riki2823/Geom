<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Menu</title>
</head>
<body>


        <h1>Bienvenido a la plataforma de creación y almacenamiento de figuras</h1>

            <form method="post" action="/home">
                <label for="username">Introduce tu nombre!!</label>
                <br>
                <br>
                <input type="text" name="username" id="username"/>
                <br>
                <br>
                <input type="submit" value="Entrar!!">
            </form>

            <p>${stateUN}</p>

</body>
</html>
