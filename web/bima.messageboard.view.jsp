<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Message Board - Bima</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding: 20px;
            background: linear-gradient(120deg, #89f7fe 0%, #66a6ff 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        .container {
            max-width: 700px;
            background: white;
            padding: 30px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            animation: fadeInUp 0.8s ease forwards;
        }
        h1 {
            font-weight: 700;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
            text-shadow: 1px 1px 3px rgba(102,166,255,0.5);
        }
        .message-box {
            margin-bottom: 1rem;
            padding: 1rem 1.5rem;
            background: #f0f8ff;
            border-left: 5px solid #66a6ff;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(102,166,255,0.3);
            transition: transform 0.3s ease;
        }
        .message-box:hover {
            transform: scale(1.02);
            box-shadow: 0 4px 12px rgba(102,166,255,0.5);
        }
        strong {
            color: #0b3d91;
            font-size: 1.1rem;
        }
        form h3 {
            margin-top: 50px;
            color: #0b3d91;
            font-weight: 600;
            letter-spacing: 0.05em;
            border-bottom: 2px solid #66a6ff;
            padding-bottom: 8px;
            margin-bottom: 25px;
        }
        input.form-control, textarea.form-control {
            border: 2px solid #66a6ff;
            border-radius: 12px;
            padding: 12px 15px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        input.form-control:focus, textarea.form-control:focus {
            border-color: #0b3d91;
            box-shadow: 0 0 8px #66a6ff;
            outline: none;
        }
        button.btn-primary {
            background: #0b3d91;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: 700;
            font-size: 1.1rem;
            transition: background 0.3s ease;
            box-shadow: 0 5px 15px rgba(11, 61, 145, 0.4);
        }
        button.btn-primary:hover {
            background: #264d9e;
            box-shadow: 0 7px 20px rgba(38, 77, 158, 0.7);
        }
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(30px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Message Board - Bima</h1>

        <c:forEach items="${list}" var="row">
            <div class="message-box">
                <strong>${row.pengirim}</strong>: ${row.pesan}
            </div>
        </c:forEach>

        <h3>Kirim Pesan</h3>
        <form method="post" action="bima.messageboard.jsp" class="mt-3">
            <div class="mb-3">
                <input name="pengirim" class="form-control" placeholder="Pengirim" required>
            </div>
            <div class="mb-3">
                <textarea name="pesan" class="form-control" placeholder="Pesan" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Kirim</button>
        </form>
    </div>
</body>
</html>
