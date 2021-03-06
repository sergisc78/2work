<%@ page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
      
    <head>
        <!-- Requerits per Bootstrap -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous" />

        <!-- Bootstrap JS + jQuery -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <!-- Tipografia-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat&display=swap" rel="stylesheet">

        <!-- Estils afegits -->
        <spring:url value="/resources/css/estils.css" var="estilsCSS" />
        <link href="${estilsCSS}" rel="stylesheet" />

        <title>2Work</title>
    </head>

    <body>

        <!--- Barra de navegació -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">

            <%@include  file='/resources/html/linkLogo.html' %>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHomeToggler" aria-controls="navbarHomeToggler" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarHomeToggler">
                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                        <c:forEach items="${opcions}" var="map">
                                    <li class="nav-item">
                                          <a class="nav-link" href="<spring:url value='${map.url}${map.usuari}'/>">${map.paraula}</a>
                                    </li>
                        </c:forEach>
                    
                </ul>
            </div>  

      </nav>
            
      <sec:authorize access="isAuthenticated()">
            <%@include  file='/resources/html/barra-usuari.html' %>
      </sec:authorize>
            
      <c:if test="${not empty feedback}">
            <%@include  file='/resources/html/feedback.html' %> 
      </c:if>
            
        <section class="barra-ubicacio">
              <div class="container">
                  <p>${ubicacio}</p>
              </div>
        </section>
                    
        <section class="container" id="ofertes">
               
              <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
                  <c:forEach items="${ofertes}" var="oferta">
                  <div class="col">      
                        <div class="card">
                             <div class="card-header">
                                   <h6 class="card-title"> ${oferta.titolOferta}<span class="badge badge-warning">NOVA</span></h6>
                            </div>
                            <div class="card-body">
                                  <p class="card-text">${oferta.descripcio}</p>
                                  <a class="btn btn-primary wobble" href="<spring:url value='/oferta/${oferta.codiOferta}' />" >
                                          Veure
                                          <svg class="text-light" width="15" height="20" viewBox="3 0 15 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" clip-rule="evenodd"/> 
                                          </svg>
                                  </a>
                            </div>
                      </div>
                  </div>
                </c:forEach>
              </div>
              
        </section>



        <%@include  file='/resources/html/footer.html' %>
        
    </body>
</html>