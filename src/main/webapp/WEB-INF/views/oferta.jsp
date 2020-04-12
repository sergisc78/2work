<%@ page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>
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

        <title>Detall de l'oferta</title>
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
                              <a class="nav-link" href="<spring:url value='${map.url}'/>">${map.paraula}</a>
                        </li>
                        
                        </c:forEach>
                    
                </ul>
            </div>  

        </nav>
                    
        <section class="barra-ubicacio">
              <div class="container">
                  <p>${ubicacio}</p>
              </div>
        </section>
                    
        <section class="container" id="oferta">
              <div class="card">
                    
                    <div class="card-header">
                          <h1>${oferta.titolOferta}<h1>
                    </div>
                    
                    <div class="card-body container">
                          
                          <h4>Estat</h4>
                          <p>${oferta.estat}</p>
                          
                          <h4>Descripció</h4>
                          <p>${oferta.descripcio}</p>
                          
                          <div class="row row-cols-1 row-cols-md-2 row-cols-lg-2">
                                
                                <div class="col">
                                    <c:if test="${ not propietari}">
                                          <!--- NOMÉS PELS NO PROPIETARIS/CREADORS DE L'OFERTA --->
                                          <h4>Empresa</h4>
                                          <p>${oferta.nifEmpresa}</p>
                                          <h4>Localitat</h4>
                                          <p>${oferta.ciutat}</p>
                                    </c:if>
                                    <h4>Tipus de contracte</h4>
                                    <p>${oferta.tipusContracte}</p>
                                    <h4>Horari</h4>
                                    <p>${oferta.horari}</p>
                                    <h4>Remuneració anual</h4>
                                    
                                    <p><fmt:formatNumber groupingUsed = "false" value="${oferta.sou}"/> €</p>
                                </div>
                                
                                <div class="col">
                                      <h4>Formació requerida</h4>
                                      <p>${oferta.formacio}</p>
                                      <h4>Habilitats addicionals requerides</h4>
                                      <p>
                                            <c:forEach items="${oferta.habilitats}" var="map" varStatus="loop">
                                                  ${map.nomHab}
                                                  <c:if test="${!loop.last}">, </c:if>
                                            </c:forEach>
                                      </p>
                                </div>
                                
                          </div>
                          
                    </div>
                          
                  <!--- LLISTAT DE CANDIDATURES NOMÉS PEL PROPIETARI/CREADOR DE L'OFERTA --->
                  <c:if test="${propietari}">
                  <div class="card-footer">
                        <h4>Candidatures</h4>
                        <ul class="list-group-flush" id="llistat-candidatures">
                              
                              <form:form id="formulariCandidatures" modelAttribute="Candidatures" method="post" action="desaEstatCandidatura">
                                    
                                    <c:forEach items="${Candidatures.llista}" var="candidatura" varStatus="loop">
                                          <li class="list-group-item d-flex justify-content-between align-items-center">   
                                                <a href="<spring:url value='/candidat?codi="1"'/>" class="flex-grow-1"><p>Candidat random número ${loop.index}</p></a>
                                                <form:select path="llista[${loop.index}].estat">
                                                      <form:options items="${estatsPossiblesCandidatura}" />
                                                </form:select>
                                          </li>
                                    </c:forEach>
                                                                              
                              </form:form>
                              
                        </ul>
                  </div>
                  </c:if>
                    
            </div>
              
            <!--- NOMÉS PEL PROPIETARI/CREADOR DE L'OFERTA --->
            <c:if test="${propietari}">
            <p>
                  <input form="formulariCandidatures" class="text-center btn btn-primary" type="submit"  role="button" value="Desar els canvis" />
            </p>
            </c:if>
                 
            <!--- NOMÉS PELS NO PROPIETARIS/CREADORS DE L'OFERTA --->
            <c:if test="${not propietari}">
                  
                  <p>
                  <c:choose>
                        <c:when test="${not empty referer}">
                              <a href="<spring:url value='${referer}'/>" class="text-center btn btn-primary" role="button">Tornar</a>
                        </c:when> 
                        <c:otherwise>
                              <a href="<spring:url value='/inscripcioOferta/oferta=1;candidat=1'/>" class="text-center btn btn-primary" role="button">Inscriure'm a l'oferta</a>
                              <a href="#" class="text-center btn btn-warning" role="button">Denunciar l'oferta</a>
                        </c:otherwise> 
                  </c:choose>
                 </p>
            
            </c:if>
              
        </section>


        <%@include  file='/resources/html/footer.html' %>
        
    </body>
</html>