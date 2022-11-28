
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.logging.*;
import java.util.Date;
import java.lang.String;

@WebServlet("/employee")

public class employee extends HttpServlet{
     int i;
     public Connection con = null;
     public PreparedStatement pst =null;
      public Statement st = null;
     public  int row;
     public ResultSet rs = null;
    @Override
    public void doPost(HttpServletRequest req,HttpServletResponse rsp)throws IOException,ServletException
    {
         
        rsp.setContentType("text/html");
        PrintWriter out = rsp.getWriter();

        Date d=new Date();
        java.sql.Date date=new java.sql.Date(d.getTime());
        
     
        try{
            i++; //external
            //String rollno = request.getParameter("rollno");
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/intershala","root","Nk@123");
            String eid=req.getParameter("eid");
            String ename=req.getParameter("ename");
            //String DOJ=req.getParameter("date");
            String year=req.getParameter("year");
            String designation=req.getParameter("designation");
            
            
            pst=con.prepareStatement("insert into employeelist(eid,ename,date,year,Designation)values(?,?,?,?,?)");
            
             pst.setString(1,eid);
             pst.setString(2,ename);
             pst.setDate(3,date);
             pst.setString(4,year);
             pst.setString(5,designation);
             pst.executeUpdate();
             
             //external add start 
             pst = con.prepareStatement("select * from employeelist");
           
            rs = pst.executeQuery();
            
                RequestDispatcher rd=req.getRequestDispatcher("index.jsp"); //external call to index.html home page
                 rd.include(req, rsp);//external
               }
            catch (ClassNotFoundException ex) {
          
    
             Logger.getLogger(employee.class.getName()).log(Level.SEVERE,null,ex);

       
        //external code add end
              
            } catch (SQLException ex) {
           out.println("<font color='red'> Not Enter null value and not enter duplicate value </font>");
        }
            
    }   
    
    public void destory()
    {
        i = 0;
    }
   
}


