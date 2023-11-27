<!DOCTYPE html>
<%
String Uri = request.getRequestURI().toString();
%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<header>
		<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse "
			style="background-color: #0072BC">
			<div class="position-sticky">
				<div class="list-group list-group-flush mx-3 mt-5" style="gap: 3rem">
					<!-- INSERITO UN IF DENTRO AL CLASS PER ANDARE A SCRIVERE ACTIVE -->
					<a href="${pageContext.request.contextPath}/admin/gestioneposizioni.jsp"
						class="list-group-item list-group-item-action py-2 ripple

						<%
						 String Path = request.getContextPath() + "/admin/gestioneposizioni.jsp"; %>
						<%
						if (Uri.equals(Path)){ %>active<% }; %>">
						<i class="bi bi-gear-wide-connected"
						style="margin-right: 5px; font-size: 20px"></i><span>Gestione Posizioni</span>
					</a>

					<a href="${pageContext.request.contextPath}/admin/gestionequiz.jsp"
					   class="list-group-item list-group-item-action py-2 ripple

						<%
						 String Path3 = request.getContextPath() + "/admin/gestionequiz.jsp"; %>
						<%
						if (Uri.equals(Path3)){ %>active<% }; %>">
						<i class="bi bi-gear-wide-connected"
						   style="margin-right: 5px; font-size: 20px"></i><span>Gestione Quiz</span>
					</a>

					<a href="${pageContext.request.contextPath}/admin/gestioneSkills.jsp"
					   class="list-group-item list-group-item-action py-2 ripple

						<%
						 String Path4 = request.getContextPath() + "/admin/gestioneSkills.jsp"; %>
						<%
						if (Uri.equals(Path4)){ %>active<% }; %>">
						<i class="bi bi-gear-wide-connected"
						   style="margin-right: 5px; font-size: 20px"></i><span>Gestione Skills</span>
					</a>


					<!-- INSERIRE UN IF DENTRO AL CLASS PER ANDARE A SCRIVERE ACTIVE -->
					<a
						href="${pageContext.request.contextPath}/admin/candidature.jsp"
						class="list-group-item list-group-item-action py-2 ripple
						<%
						 String Path2 = request.getContextPath() + "/admin/candidature.jsp"; %>
						<%
						if (Uri.equals(Path2)){ %>active<% }; %>"><i
						class="bi bi-list-ol" style="margin-right: 5px; font-size: 20px"></i><span>Candidature</span></a>

					<!-- INSERITO UN IF DENTRO AL CLASS PER ANDARE A SCRIVERE ACTIVE -->
					 <a href="${pageContext.request.contextPath}/logout"
						class="list-group-item list-group-item-action py-2 ripple"><i
						class="bi bi-box-arrow-right"
						style="margin-right: 5px; font-size: 20px;"></i><span>Logout</span></a>
				</div>
			</div>
		</nav>
		<nav id="main-navbar"
			class="navbar navbar-expand-lg navbar-light bg-white fixed-top"
			style="background-color: white;">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
					aria-controls="sidebarMenu" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/admin/candidature.jsp"> <img
					src="${pageContext.request.contextPath}/img/logoPagina.png"
					height="50" alt="" loading="lazy" />
				</a> <span> <a
					href="${pageContext.request.contextPath}/admin/candidature.jsp"><h1>
							<span style="float: right; font-family: Comic Sans MS">JOBHUNTER
								&thinsp;</span>
						</h1></a>
				</span>
			</div>
		</nav>

	</header>

</body>
</html>






