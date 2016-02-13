<%--
  Created by IntelliJ IDEA.
  User: AroraA
  Date: 12-02-2016
  Time: 09:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.MessagingException,javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>
<%@ page import="java.util.Properties" %>

<%
    String result;
    // Recipient's email ID needs to be mentioned.
    //  String to = "amrita.arora.1192@gmail.com";
    String to = "saurabhk1511@gmail.com";

    // Sender's email ID needs to be mentioned
    String from = "sample.id1192@gmail.com";

    // Assuming you are sending email from localhost
    String host = "smtp.gmail.com";
    String pass = "Amrita@12345";
    Properties properties = System.getProperties();

    // Setup mail server
    properties.setProperty("mail.smtp.host", host);
    properties.setProperty("mail.transport.protocol", "smtp");
    properties.setProperty("mail.smtp.starttls.enable", "true");

    properties.setProperty("mail.smtp.port", "587");
    properties.setProperty("mail.smtp.password", pass);
    properties.setProperty("mail.smtp.auth", "true");
    properties.put("mail.smtp.user", from);

    // Get the default Session object.
    Session mailSession = Session.getDefaultInstance(properties);

    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        // Set Subject: header field
        message.setSubject("This is the Subject Line!");
        // Now set the actual message
        message.setText("This is actual message");
        // Send message

        Transport transport = mailSession.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

        result = "Sent message successfully....";
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send message....";
        out.print(mex);
    }
%>
<html>
<head>
    <title>Send Email using JSP</title>
</head>
<body>
<div style="text-align: center;">
    <h1>Send Email using JSP</h1>
</div>
<p align="center">
    <%
        out.println("Result: " + result + "\n");
    %>
</p>
</body>

</html>