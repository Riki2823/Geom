<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Figure: ${figureName}</title>
        <style>
             #title{
                background-color: black;
                color: white;
                margin: 5%;
                padding: 2%;
                text-align: center;
                border-radius: 5px;
            }

            #navBar{
                display: flex;
                justify-content: space-around;
                background-color: black;
                padding: 2%;
                margin: 15%;
                margin-top:5%;
                margin-bottom: 5%;
                border-radius: 5px;
            }
            #navBar a{
                text-decoration:none;
                color: white;
            }
            canvas{
                margin: 5%;
            }
            #message{
                margin: 5%;
                padding: 2%;
                background-color: black;
                color: white;
                border-radius: 5px;
            }
        </style>

    </head>
    <body>
        <h1 id="title">Bienvenio a la visualizacion de la figura ${figureName}</h1>
        <nav id="navBar">
            <a href="/userList">Ir a mi lista de figuras</a>
            <a href="/generalList">Ir a la lista general de figuras</a>
        </nav>
        <br>
        <br>
        <p id="message"></p>
        <canvas id="myCanvas" width="1024" height="768" style="border:2px solid #000000;"></canvas>

    </body>

    <script>
        let myCanvas = document.getElementById('myCanvas');
        let ctx = myCanvas.getContext('2d');
        let rect = myCanvas.getBoundingClientRect();

        let formValue = "${type}" ;
        let x = Number("${cordX}");
        let y = Number("${cordY}") ;
        let r = "${size}" ;
        let theColor = "${color}" ;

        switch (formValue){ 
            case 'CIRCLE':
                ctx.beginPath();
                ctx.arc(x, y, r, 0, 2 * Math.PI);
                ctx.lineWidth = 3;
                ctx.stroke();
                ctx.fillStyle = theColor;
                ctx.fill();
                ctx.closePath();    
                break;
            case 'SQUARE':
                ctx.beginPath();
                ctx.rect(x-r, y-r, r*2, r*2);
                ctx.lineWidth = 3;
                ctx.stroke();
                ctx.fillStyle = theColor;
                ctx.fill();
                ctx.closePath();
                break;
            case 'TRIANGLE':
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
            case 'PENTAGON':
                    makePentagon();
                break;
            case 'STAR7':                        
                    makeStar();
                break;
            default:
                console.log('Form not suported');
        }   
          
    </script>
</html>