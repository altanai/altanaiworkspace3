<%@include file="headerservice.jsp" %>


 <!----------------------------------------------------- main ---------------------------->
    <section id="main">

          <iframe src="http://<%=session.getAttribute("serverip")%>:8080/Geolocation/ViewServletTogether?user=<%=session.getAttribute("user")%>"  height="1000" width="1000"  frameborder="0" scrolling="no"></iframe>       
    
      </section>

  
 <!---------------------------------------------------------------------------> 

<%@include file="footerservice.jsp" %>