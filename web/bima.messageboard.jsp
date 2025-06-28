<%@page import="java.util.ArrayList"%>
<%@page import="jspproject1.Messager"%>
<%@page import="jspproject1.Message"%>
<%
    // Ganti parameter tujuan jadi "Bima" sesuai instruksi
    Messager messager = new Messager("Bima");

    // Simpan pesan jika ada kiriman POST
    if(request.getParameter("pengirim") != null && request.getParameter("pesan") != null) {
        String pengirim = request.getParameter("pengirim");
        String pesan = request.getParameter("pesan");
        messager.addMessage(pengirim, pesan);
    }

    // Ambil daftar pesan untuk ditampilkan
    ArrayList<Message> list = messager.getList();

    request.setAttribute("list", list);

    // Forward ke halaman view
    RequestDispatcher dispatcher = request.getRequestDispatcher("bima.messageboard.view.jsp");
    dispatcher.forward(request, response);
%>
