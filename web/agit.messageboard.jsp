<%@page import="java.util.ArrayList"%>
<%@page import="jspproject1.Messager"%>
<%@page import="jspproject1.Message"%>
<%
    // Ganti tujuan menjadi "Agit"
    Messager messager = new Messager("Agit");

    // Simpan pesan jika ada input POST
    if(request.getParameter("pengirim") != null && request.getParameter("pesan") != null) {
        String pengirim = request.getParameter("pengirim");
        String pesan = request.getParameter("pesan");
        messager.addMessage(pengirim, pesan);
    }

    // Ambil daftar pesan
    ArrayList<Message> list = messager.getList();

    request.setAttribute("list", list);

    // Forward ke view
   RequestDispatcher dispatcher = request.getRequestDispatcher("agit.messageboard.view.jsp");
    dispatcher.forward(request, response);
%>