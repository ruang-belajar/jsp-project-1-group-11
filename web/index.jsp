<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project Group 11 Pertemuan 14</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                margin: 0;
                padding: 0;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                background: linear-gradient(135deg, #6e0dd0, #00e0ff);
                color: white;
                animation: fadeIn 2s ease;
            }
            h1 {
                font-size: 3rem;
                margin-bottom: 1rem;
                text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
                animation: bounce 1.5s infinite alternate;
            }
            a {
                font-size: 1.5rem;
                color: #ffe600;
                text-decoration: none;
                background-color: rgba(0,0,0,0.3);
                padding: 10px 20px;
                border-radius: 15px;
                transition: transform 0.3s, background-color 0.3s;
            }
            a:hover {
                transform: scale(1.1);
                background-color: rgba(0,0,0,0.6);
            }
            img {
                max-width: 90%;
                height: auto;
                margin-top: 2rem;
                border-radius: 25px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.3);
                transition: transform 0.5s;
            }
            img:hover {
                transform: rotate(5deg) scale(1.05);
            }
            @keyframes fadeIn {
                from {opacity: 0;}
                to {opacity: 1;}
            }
            @keyframes bounce {
                0% {transform: translateY(0);}
                100% {transform: translateY(-10px);}
            }
        </style>
    </head>
    <body>
        <h1>Group Project 11</h1>
        <a href="bima.messageboard.jsp">Bima Wiryadi Praja</a>
        <img src="icon.webp" alt="Icon Project" />
    </body>
</html>
