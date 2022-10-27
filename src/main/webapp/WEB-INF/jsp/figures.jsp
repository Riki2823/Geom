<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Main Menu</title>
        <style>
            #form{
               margin-top: 5%;
               padding: 2%;
               background-color: black;
               border-radius: 10px;
               color: white;
            }
        </style>
    </head>
    <body>
        <h1>Buenas ${name}!!! Bienvenido a la plataforma de creación y almacenamiento de figuras</h1>
        <a href="/myList">Ir a mi lista de figuras</a>
        <a href="/generalList">Ir a mi lista de figuras</a>
        <br>
        <br>
        <form method="post" action="/figures">
            <canvas id="myCanvas" width="800" height="600" style="border:2px solid #000000;"></canvas>
            <br>
            <div id="form">
                <label for="cordX">Cordenadas: </label>
                <input type="number" name="cordX" id="cordX" placeholder="X">
                <input type="number" name="cordY" id="cordY" placeholder="Y">
                <br>
                <br>
                <label for="forms">Elige la forma a dibujar: </label>
                <select id="forms" name="forms">
                  <option value="circle">Circulo</option>
                  <option value="square">Cuadrado</option>
                  <option value="triangle">Triangulo</option>
                  <option value="pentagon">Pentagono</option>
                  <option value="star7">Estrella de 7 puntas</option>
                </select>
                <br>
                <br>
                <label for="size">Tamaño: </label>
                <input type="range" min="0" max="100" value="15" name="size" id="size"/>
                <br>
                <br>
                <label for="figureName">Nombre de la figura: </label>
                <input type="text" id="figureName" placeholder="Introduce el nombre de tu figura: " name="figureName" id?"figureName">
                <br>
                <br>
                <input type="submit" name="save" value="Guardar figura">
                <input type="button" name="draw" onclick="mainFunction()" value="Preview">
            </div>
        </form>
        <script>
            function mainFunction(){
                let myCanvas = document.getElementById('myCanvas').getContext('2d');
                let form = document.getElementById("forms");
                let formValue =  form.value
                form.onchange = function(){setForm()};
                console.log(formValue);

                switch (formValue){
                    case 'circle':
                        makeCircle();
                        break;
                    case 'square':
                         makeSquare();
                         break;
                    case 'triangle':
                        makeTriangle();
                        break;
                    case 'pentagon':
                        makePentagon();
                        break;
                    case 'star7':
                        makeStar();
                        break;
                    default:
                        console.log('Form not suported');
                }
                function setForm(){
                    formValue = form.value;
                    console.log(formValue);
                }
                function makeCircle(){
                    console.log('You r on circle');
                }

                function makeSquare(){
                    console.log('You r on Square');
                }
                function makeTriangle(){
                    console.log('You r on triangle');
                }
                function makePentagon(){
                    console.log('You r on Pentagon');
                }
                function makeStar(){
                    console.log('You r on Star');
                }
            }
        </script>
    </body>
</html>