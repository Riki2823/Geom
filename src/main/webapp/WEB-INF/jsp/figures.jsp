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
            <canvas id="myCanvas" width="1024" height="768" style="border:2px solid #000000;"></canvas>
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
                <label for="colors">Elige el color de relleno: </label>
                <select id="colors" name="colors">
                  <option value="black">Negro</option>
                  <option value="green">Verde</option>
                  <option value="red">Rojo</option>
                  <option value="blue">Azul</option>
                  <option value="yellow">Amarillo</option>
                  <option value="grey">Gris</option>
                </select>
                <br>
                <br>
                <label for="size">Tamaño: </label>
                <input type="range" min="0" max="500" value="20" name="size" id="size"/>
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
            let myCanvas = document.getElementById('myCanvas');
            let ctx = myCanvas.getContext('2d');


            let form = document.getElementById("forms");
            let formValue =  form.value;
            form.onchange = function(){setForm()};

            let color = document.getElementById("colors");
            let colorValue = color.value;
            color.onchange = function(){setColor()};

            let theColor= "#000000";

            function setColor(){
                colorValue = color.value;
                console.log(colorValue);
                theColor = setTheColor();
                console.log(theColor);
            }

            function setForm(){
                formValue = form.value;
                console.log(formValue);
            }

            function setTheColor(){
                switch(colorValue){
                    case 'black':
                        return "#000000";
                        break;
                    case 'green':
                        return "#00ff00";
                        break;
                    case 'red':
                        return "#ff0000";
                        break;
                    case 'blue':
                        return "#0000ff";
                        break;
                    case 'yellow':
                        return "#ffff00";
                        break;
                    case 'grey':
                        return "#7f7f7f";
                        break;
                    default:
                        console.log("The color is not regiser");
                }
            }

            console.log(formValue);
            myCanvas.addEventListener("click", (event) => {
            let rect = myCanvas.getBoundingClientRect();
            let x = event.clientX - rect.left;
            let y = event.clientY - rect.top;
            ctx.clearRect (0, 0, 1024, 768);
            let r = document.getElementById("size").value;
                switch (formValue){

                    case 'circle':
                        ctx.beginPath();
                        ctx.arc(x, y, r, 0, 2 * Math.PI);
                        ctx.lineWidth = 3;
                        ctx.stroke();
                        ctx.fillStyle = theColor;
                        ctx.fill();
                        ctx.closePath();
                    
                        break;
                    case 'square':
                        ctx.beginPath();
                        ctx.rect(x-r, y-r, r*2, r*2);
                        ctx.lineWidth = 3;
                        ctx.stroke();
                        ctx.fillStyle = theColor;
                        ctx.fill();
                        ctx.closePath();
                        break;
                    case 'triangle':
                        let altura = Math.sqrt(Math.pow(r, 2) - Math.pow((r/2), 2));
                        
                        ctx.beginPath();
                        ctx.moveTo(x, y  - (altura/2));
                        ctx.lineTo(x + (r/2), y + (altura/2));
                        ctx.lineTo(x - (r/2), y + (altura/2));
                        ctx.lineTo(x, y  - (altura/2));
                        ctx.lineWidth = 3;
                        ctx.stroke();
                        ctx.fillStyle = theColor;
                        ctx.fill();
                        
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

            });
                
            function mainFunction(){
                let x = Number(document.getElementById("cordX").value);
                let y = Number(document.getElementById("cordY").value);
                let r = document.getElementById("size").value;
                ctx.clearRect (0, 0, 1024, 768);

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
            

                function makeCircle(){
                    ctx.beginPath ();
    
                    ctx.beginPath();
                    ctx.arc(x,y,r, 0, 2 * Math.PI, false);
                    ctx.lineWidth = 3;
                    ctx.stroke();
                    ctx.fillStyle = theColor;
                    ctx.fill();
                    ctx.closePath();
                }
    
                function makeSquare(){
                    ctx.beginPath();
    
                    ctx.beginPath();
                    ctx.rect(x-r, y-r, r*2, r*2);
                    ctx.lineWidth = 3;
                    ctx.stroke();
                    ctx.fillStyle = theColor;
                    ctx.fill();
                    ctx.closePath();
    
                }
                function makeTriangle(){

                    let altura = Math.sqrt(Math.pow(r, 2) - Math.pow((r/2), 2));
                    
                    ctx.beginPath();
                    ctx.moveTo(x, y  - (altura/2));
                    ctx.lineTo(x + (r/2), y + (altura/2));
                    ctx.lineTo(x - (r/2), y + (altura/2));
                    ctx.lineTo(x, y  - (altura/2));
                    ctx.lineWidth = 3;
                    ctx.stroke();
                    ctx.fillStyle = theColor;
                    ctx.fill();
                    ctx.closePath();

                
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