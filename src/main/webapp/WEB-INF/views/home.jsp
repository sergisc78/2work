<%@ page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> -->
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
            

            <title>2Work - ${ubicacio}</title>
      </head>

      <body>

            <!--- Barra de navegació -->
            <nav class="navbar navbar-expand-lg navbar-dark">

                  <%@include  file='/resources/html/linkLogo.html' %>

                  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHomeToggler" aria-controls="navbarHomeToggler" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                  </button>

                  <%@include  file='/resources/html/opcions_nav.html' %>

            </nav>
             
             <sec:authorize access="isAuthenticated()">
                   <%@include  file='/resources/html/barra-usuari.html' %>
             </sec:authorize>
                  
            <c:if test="${not empty feedback}">
                  <%@include  file='/resources/html/feedback.html' %> 
            </c:if>
                              
            <section>
                  <div class="jumbotron">
                        <div class="container ">
                              <h1>La teva web de cerca de feina </h1>
                        </div>
            </section> 

            <section id="cta">

                  <div class="row">
                        <div class="col-md">
                              <h3 class="text-center">Estàs buscant feina o vols millorar o canviar la que tens?</h3>
                              <p class="text-center">
                                    <a href=" <spring:url value= "/altaCandidat" />" class="text-center btn btn-primary wobble" role="button">Dona't d'alta
                                          <svg class="text-light" width="15" height="20" viewBox="3 0 15 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" clip-rule="evenodd"/></svg>
                                    </a>
                              </p>
                        </div>
                  </div>
                  
                  <div class="row">
                        <div class="col-md">
                              <h3 class="text-center">Ets empresari i busques treballadors?</h3>
                              <p class="text-center">
                                    <a href="<spring:url value= "/altaEmpresa" />" class="text-center btn btn-primary wobble" role="button">Dona't d'alta
                                          <svg class="text-light" width="15" height="20" viewBox="3 0 15 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" clip-rule="evenodd"/></svg>
                                    </a>
                              </p>
                        </div>
                  </div>

      </section>

      <section class="container" id="motius">
            <h3 class="text-center blau">Per què 2Work?</h3>

            <div class="row">

                  <div class="col-lg-6">
                        <div class="media">
                              <img src="<spring:url value='/resources/svg/cor.svg'/>" class="mr-3" alt="bullet">
                        <div class="media-body" style="text-align: justify">
                              <h5 class="mt-0 mb-1">No discriminem</h5>
                              Evitem que dades com l'edat i el sexe del candidat siguin visibles per l'empresa, de manera que la seva decisió no estigui condicionada, almenys en primera instància, per característiques que van més enllà de la vàlua acadèmica i professional.
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="media">
                        <img src="<spring:url value='/resources/svg/somriure.svg'/>" class="mr-3" alt="bullet">
                        <div class="media-body" style="text-align: justify">
                            <h5 class="mt-0 mb-1">Treballem per uns sous justos</h5>
                            Si una oferta no compleix els nostres requisits mínims pel que fa a la remuneració serà despublicada per l'administrador de la plataforma. Serem estrictes en aquest sentit i defensarem des de la nostra posició els drets dels treballadors.
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="col-lg-6">
                    <div class="media">
                        <img src="<spring:url value='/resources/svg/euro_ok.svg'/>" class="mr-3" alt="bullet">
                        <div class="media-body"  style="text-align: justify">
                            <h5 class="mt-0 mb-1">Preu just per un servei just</h5>
                            Garantim a l'empresa un nombre limitat de perfils rebuts. De la mateixa manera que aquests estaran seleccionats, per la plataforma però també pels candidats que s'hi han inscrit, assegurem a l'empresa preus justos per donar d'alta les seves ofertes.
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="media">
                        <img src="<spring:url value='/resources/svg/lupa_ok.svg'/>" class="mr-3" alt="bullet">
                        <div class="media-body"  style="text-align: justify">
                            <h5 class="mt-0 mb-1">Trobes allò que busques</h5>
                            Les ofertes que publiquem estan generades prenent un sector o ocupació com a referència. El nostre algorisme relaciona les característiques de les ofertes amb els perfils professionals i de formació dels candidats que cerquen un nou lloc de feina.
                        </div>
                    </div>
                </div>

            </div>

        </section>

        <%@include  file='/resources/html/footer.html' %>
        
        <!-- INICI Avís galetes -->
        <div class="alert text-center avisgaletes" role="alert">
            <b>T'agraden les galetes?</b> Utilitzem galetes per assegurar-nos que tens la millor experiència a la nostra web. <a href="https://cookiesandyou.com/" target="_blank">Més informació</a>
            <button type="button" class="btn btn-primary btn-sm acceptagaletes">D'acord</button>
        </div>
        
        <!-- JS / Query afegit (galetes ) -->
        <script type="text/javascript" src="<spring:url value="/resources/js/galetes.js"/>"></script>
        
    </body>

</html>