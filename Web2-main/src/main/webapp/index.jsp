<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="Web programming second lab" name="description">
    <title>Web programming - lab 2</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body onload="drawCanvas()">

<script src="canvas_handler.js"></script>
<script src="validator.js"></script>


<header>
    <h1> Веб-программирование, Лабораторная работа №2. Вариант № 10236 </h1>
    <h2>Фридкин Даниил Р3210</h2>
</header>


<br>
<br>


<div>
    <div style="width:100%; height:1px; clear:both;"></div>
    <div style="width: 40%; float: left; margin-left: 2%;">
        <jsp:include page="all_table.jsp"/>
    </div>
    <div style="float: left; margin-left: 2%;">
        <canvas id="canvas"></canvas>
    </div>
    <div style="float: left; margin-left: 5%;">

        <p id="enter-text">Enter values:</p>
        <div class="vars_table">
            <form id="form" method="get" action="controllerServlet">
                <p class="variable">
                    X=

                    <label for="X_field"></label>
                    <input id="X_field" type="text" name="X_field" placeholder="Enter in (-3 ... 3)"
                           autocomplete="off" maxlength="11">
                </p>
                <p class="variable">Y=
                    <select id="Y_field" name="Y_field">
                        <option value="-5" selected>-5</option>
                        <option value="-4">-4</option>
                        <option value="-3">-3</option>
                        <option value="-2">-2</option>
                        <option value="-1">-1</option>
                        <option value="0">0</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </p>

                <p>R=
                    <input type="radio" id="r1" name="R_field" value="1" >
                    <label for="r1">1</label>
                    <input type="radio" id="r2" name="R_field" value="2">
                    <label for="r2">2</label>

                    <input type="radio" id="r3" name="R_field" value="3">
                    <label for="r3">3</label>

                    <input type="radio" id="r4" name="R_field" value="4">
                    <label for="r4">4</label>

                    <input type="radio" id="r5" name="R_field" value="5">
                    <label for="r5">5</label>
                </p>
                <p hidden id="err_msg" style="color: white;">Something went wrong!</p>
                <p>
                    <button id="button" type="submit" style=" height: 38px; width: 150px; color: black; font-size: 120%;">Submit</button>
                </p>
            </form>
        </div>
    </div>
    <div style="width:100%; height:1px; clear:both;"></div>
</div>

</body>
</html>
