<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Group Project 11</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* ======== Root & Variables ======== */
    :root {
      --clr-bg-start: #1a1a2e;
      --clr-bg-end:   #16213e;
      --clr-card-start: #0f3460;
      --clr-card-end:   #53354a;
      --clr-accent:    #e94560;
      --clr-white:     #ffffff;
      --clr-light:     #f5f5f5;
      --transition:    0.4s;
    }

    /* ======== Global ======== */
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, var(--clr-bg-start), var(--clr-bg-end));
      color: var(--clr-white);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }
    a { text-decoration: none; }

    /* ======== Title ======== */
    h1 {
      font-size: 4rem;
      margin-bottom: 2rem;
      background: linear-gradient(90deg, var(--clr-accent), var(--clr-light));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      animation: glow 2s ease-in-out infinite alternate;
    }

    @keyframes glow {
      from { text-shadow: 0 0 10px var(--clr-accent); }
      to { text-shadow: 0 0 20px var(--clr-light); }
    }

    /* ======== Icon ======== */
    .icon {
      width: 400px;
      height: 400px;
      margin-bottom: 2rem;
      animation: pulse 3s ease-in-out infinite;
    }
    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.1); }
      100% { transform: scale(1); }
    }

    /* ======== Card Grid ======== */
    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 2rem;
      width: 80%;
      max-width: 1000px;
      margin-bottom: 2rem;
    }
    .card-link {
      background: linear-gradient(145deg, var(--clr-card-start), var(--clr-card-end));
      padding: 1.8rem 1rem;
      border-radius: 20px;
      box-shadow: 6px 6px 16px rgba(0,0,0,0.4), -6px -6px 16px rgba(255,255,255,0.1);
      text-align: center;
      transition: transform var(--transition), box-shadow var(--transition);
      color: var(--clr-white);
    }
    .card-link:hover {
      transform: translateY(-8px) scale(1.03);
      box-shadow: 8px 8px 20px rgba(0,0,0,0.6), -8px -8px 20px rgba(255,255,255,0.15);
    }
    .card-link .title {
      font-size: 1.5rem;
      margin-bottom: 0.8rem;
      font-weight: 700;
    }
    .card-link .subtitle {
      font-size: 1rem;
      opacity: 0.8;
    }

    /* ======== Footer ======== */
    footer {
      position: absolute;
      bottom: 1rem;
      font-size: 0.85rem;
      opacity: 0.6;
    }
  </style>
</head>
<body>
  <h1>Group 11 Project</h1>
  <img src="icon.png" alt="GROUP11 Icon" class="icon" />

  <div class="grid">
    <a href="bima.messageboard.jsp" class="card-link">
      <div class="title">Bima Wiryadi Praja</div>
      <div class="subtitle">22110020</div>
    </a>
    <a href="agit.messageboard.jsp" class="card-link">
      <div class="title">Agit Rahadian</div>
      <div class="subtitle">22110006</div>
    </a>
    <a href="angga.messageboard.jsp" class="card-link">
      <div class="title">Angga Winata</div>
      <div class="subtitle">22110010</div>
    </a>
    <a href="nuron.messageboard.jsp" class="card-link">
      <div class="title">Nuron Fadillah</div>
      <div class="subtitle">22110059</div>
    </a>
  </div>

  <footer>&copy; 2025 Group 11 - All Rights Reserved</footer>
</body>
</html>
