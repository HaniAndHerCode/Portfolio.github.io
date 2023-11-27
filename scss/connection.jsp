<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Hani-Portfolio</title>
    <!-- ... (your existing head content) ... -->
</head>

<body>
    <!-- ... (your existing body content) ... -->

    <!-- Contact Start -->
    <div class="container-fluid bg-light overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">
                <div class="col-lg-6 contact-text py-5 wow fadeIn" data-wow-delay="0.5s">
                    <div class="p-lg-5 ps-lg-0">
                        <div class="section-title text-start">
                            <h1 class="display-5 mb-4">Contact Me</h1>
                        </div>
                        <p class="mb-4">If you'd like to know more about my educational journey or process, feel free to get in touch!</p>
                        <form action="index.jsp" method="post">
                            <!-- ... (your existing form content) ... -->

                            <div class="col-12">
                                <button class="btn btn-primary w-100 py-3" type="submit" onclick="<% insertData(request); %>">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- ... (your existing contact form content) ... -->
            </div>
        </div>
    </div>
    <!-- Contact End -->

    <!-- ... (your existing body content) ... -->

    <%!
        // Method to insert data into the database
        void insertData(HttpServletRequest request) {
            String url = "jdbc:mysql://localhost:3306//portfolio";
           
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(url);

                // Assuming you have a table named 'contacts' with columns 'name', 'email', 'subject', 'message'
                String query = "INSERT INTO contacts (name, email, subject, message) VALUES (255, 255, 255, "")";
                PreparedStatement preparedStatement = connection.prepareStatement(query);

                preparedStatement.setString(1, request.getParameter("Your_Name"));
                preparedStatement.setString(2, request.getParameter("Your_Email"));
                preparedStatement.setString(3, request.getParameter("subject"));
                preparedStatement.setString(4, request.getParameter("message"));

                preparedStatement.executeUpdate();

                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>

    <!-- ... (your existing scripts and footer) ... -->
</body>

</html>

