<%-- 
    Document   : Home
    Created on : 22-Nov-2022, 6:02:47 pm
    Author     : NandKishor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
      <meta charset="utf-8">
      <title>Popup Login Form Design | CodingNepal</title>
      <link rel="stylesheet" href="Style.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    </head>
    <script>
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
</script>
        <body>
         <br>
         <div class="employeetext">
             <p>Employee Details</P>   
         </div>
         <br>
    <center>
         <div class="border">
            <br>
            <div class="search">
            <from action="index.jsp" method="GET">
                <input type="text" id="Search" name="Search"  placeholder="Search here..">
            
            </from>
            </div>
              <br>
              <br>
           <table width="100%" border="1">
               <%
              Connection conn = null;
             Statement st = null;
             ResultSet rs = null;

              %>
           <tr>
                <td width="10%">Eid</td>
                <td>EName</td>
                <td>DOJ</td>
                <td>YOE</td>
                <td>Designation</td>
            </tr>
       
        <%
      try{
             
             conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/intershala","root","Nk@123");
             st=conn.createStatement();
              String data;

            String query = request.getParameter("Search");
            if(query != null ){
           
            data=" select * from employeelist where eid ='"+ query +"' or ename like '"+ query +"' or date like '" +query +"' or year like '"+ query +"' or designation like '"+ query +"'";
            }else{
               data=" select * from employeelist";
            }
          
             //data=" select * from columeemployee";
             rs=st.executeQuery(data);
             while(rs.next())
             {
             %>
             <tr>
                 <td><%= rs.getString(1)%></td>
                 <td><%= rs.getString(2)%></td>
                 <td><%= rs.getString(3)%></td>
                 <td><%= rs.getString(4)%></td>
                 <td><%= rs.getString(5)%></td>
                 <!-- comment --><!-- = mince print out -->
             </tr>
             
             <%
            }
             
            }catch(Exception ex){
            
            }
          
            %>
           
             </table>
                </div>
    </center>
         <input type="checkbox" id="show">
         <label for="show" class="show-btn">ADD</label>
         <div class="container">
            
            <div class="text">
                ADD EMPLOYEE
            </div>
          <form action="employee" method="Post">
               <div class="data">
                  <label>EMPLOYEE ID</label>
                  <input type="text" id="eid" name="eid">
               </div>
                <div class="data">
                  <label>Employee Name</label>
                  <input type="text" id="ename" name="ename" >
               </div>
               <div class="data">
                  <label>Year of Experience</label>
                  <input type="text" id="year" name="year" >
               </div>
                <div class="data">
                  <label>Designation</label>
                  <input type="text" id="designation" name="designation" >
                </div>
               </tr>
                    <tr>
                    <button class="cancelbutton"  type="reset" >Cancel</button>
                    <button class="submitbutton"  type="submit" >Submit</button>
                    </tr>
            </form>
         </div>
  </body>
</html>
