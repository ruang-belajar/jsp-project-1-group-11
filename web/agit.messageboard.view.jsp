<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Message Board - Agit Rahadian</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* ========== Variables ========== */
    :root {
      --clr-bg-light: #f0f3f5;
      --clr-bg-dark:  #1e1e2f;
      --clr-primary:  #ff6b6b;
      --clr-secondary:#feca57;
      --clr-white:    #ffffff;
      --clr-dark:     #2f3542;
      --clr-light-text: #444;
      --clr-dark-text:  #ddd;
      --transition-time: 0.3s;
    }
    [data-theme="dark"] {
      --clr-bg: var(--clr-bg-dark);
      --clr-text: var(--clr-dark-text);
    }
    [data-theme="light"] {
      --clr-bg: var(--clr-bg-light);
      --clr-text: var(--clr-light-text);
    }

    /* ========== Global ========== */
    * { margin:0; padding:0; box-sizing:border-box; }
    body {
      font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background:var(--clr-bg);
      color:var(--clr-text);
      display:flex; flex-direction:column;
      height:100vh; overflow:hidden;
      transition: background var(--transition-time), color var(--transition-time);
    }
    a { text-decoration:none; color:inherit; }

    /* ========== Header ========== */
    header {
      position:sticky; top:0;
      background: var(--clr-primary);
      color: var(--clr-white);
      padding:1rem;
      display:flex; align-items:center; justify-content:center;
      z-index:10;
      box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }
    header h1 { font-size:2rem; }
    .theme-toggle {
      position:absolute; right:1rem;
      background:transparent; border:none;
      font-size:1.25rem; cursor:pointer;
      color:var(--clr-white);
      transition: transform var(--transition-time);
    }
    .theme-toggle:hover { transform: scale(1.2); }

    /* ========== Back Button ========== */
    .btn-back {
      position:absolute; top:1.25rem; left:1.25rem;
      background: var(--clr-secondary);
      color: var(--clr-white);
      border:none; border-radius:5px;
      padding:0.5rem 1rem;
      font-size:0.9rem;
      display:flex; align-items:center; justify-content:center;
      box-shadow:0 2px 6px rgba(0,0,0,0.2);
      transition: background var(--transition-time), transform var(--transition-time);
      z-index:11;
    }
    .btn-back:hover { background: var(--clr-primary); transform: translateY(-2px); }

    /* ========== Main Container ========== */
    .board {
      flex:1; display:flex; flex-direction:column;
      margin:1rem;
      background:rgba(255,255,255,0.1);
      backdrop-filter:blur(10px);
      border-radius:20px;
      overflow:hidden;
      box-shadow: 0 8px 24px rgba(0,0,0,0.1);
    }

    /* ========== Chat List ========== */
    .messages {
      flex:1; overflow-y:auto; padding:2rem;
      scroll-behavior:smooth;
    }
    .messages::-webkit-scrollbar { width:8px; }
    .messages::-webkit-scrollbar-thumb { background:rgba(0,0,0,0.2); border-radius:4px; }

    .msg {
      max-width:75%; margin-bottom:1.5rem;
      position:relative; padding:0.75rem 1rem;
      border-radius:15px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      transition: transform var(--transition-time), box-shadow var(--transition-time);
    }
    .msg:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
    .msg.user {
      margin-left:auto; background:var(--clr-primary); color:var(--clr-white);
      border-bottom-right-radius:2px;
    }
    .msg.other {
      margin-right:auto; background:var(--clr-white); color:var(--clr-dark);
      border-bottom-left-radius:2px;
    }
    .msg .sender { font-weight:600; margin-bottom:0.25rem; }
    .msg .time {
      position:absolute; bottom:-1.25rem; right:0.75rem;
      font-size:0.75rem; opacity:0.6;
    }

    /* ========== Form Footer ========== */
    footer {
      padding:1rem; background:var(--clr-bg);
      display:flex; align-items:center; gap:1rem;
      border-top:1px solid rgba(0,0,0,0.1);
    }
    .form-control {
      border:none; outline:none;
      background:var(--clr-white);
      color:var(--clr-dark);
      flex:1;
      padding:0.75rem 1rem;
      border-radius:30px;
      box-shadow: inset 2px 2px 6px rgba(255,255,255,0.7), inset -2px -2px 6px rgba(0,0,0,0.1);
      font-weight:600;
      transition: background var(--transition-time), box-shadow var(--transition-time);
    }
    .form-control::placeholder { color: rgba(0,0,0,0.4); font-style:italic; }
    .form-control:focus { background: var(--clr-bg-light); box-shadow: 0 0 8px rgba(255,107,107,0.4); }
    .btn-send {
      background: var(--clr-primary);
      border:none; border-radius:50%;
      width:3rem; height:3rem;
      display:flex; align-items:center; justify-content:center;
      font-size:1.25rem; color:var(--clr-white);
      cursor:pointer; transition: transform var(--transition-time), background var(--transition-time);
    }
    .btn-send:hover { background: var(--clr-secondary); transform: scale(1.1); }
  </style>
</head>
<body data-theme="light">

  <header>
    <h1>💬 Agit Rahadian Message Board</h1>
    <button class="theme-toggle" id="toggleTheme" title="Toggle Dark/Light">🌙</button>
  </header>

  <a href="index.jsp" class="btn-back" title="Kembali">← KEMBALI</a>

  <div class="board">
    <div class="messages" id="msgList">
      <c:if test="${empty list}">
        <p class="text-center opacity-50 mt-3">Belum ada pesan. Jadilah yang pertama!</p>
      </c:if>
      <c:forEach items="${list}" var="row">
        <div class="msg other">
          <div class="sender">${row.pengirim}</div>
          <div class="text">${row.pesan}</div>
          <div class="time"><%= new SimpleDateFormat("HH:mm").format(new Date()) %></div>
        </div>
      </c:forEach>
    </div>
    <footer>
      <form method="post" action="agit.messageboard.jsp" class="d-flex w-100 gap-2">
        <input name="pengirim" type="text" class="form-control" placeholder="Masukkan Nama Anda" required>
        <input name="pesan"    type="text" class="form-control" placeholder="Tulis Pesan Anda..." required>
        <button class="btn-send" type="submit">➡️</button>
      </form>
    </footer>
  </div>

  <script>
    const btnTheme = document.getElementById('toggleTheme');
    btnTheme.onclick = () => {
      const theme = document.body.getAttribute('data-theme');
      const next  = theme === 'light' ? 'dark' : 'light';
      document.body.setAttribute('data-theme', next);
      btnTheme.textContent = next === 'light' ? '🌙' : '☀️';
    };
    const msgList = document.getElementById('msgList');
    msgList.scrollTop = msgList.scrollHeight;
  </script>
</body>
</html>
