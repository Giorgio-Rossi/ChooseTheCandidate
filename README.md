<h1>📈 ChooseTheCandidate</h1>
<p></p>
<h2>📦 Technologies</h2>
<ul>
<li><code>Java</code></li>
<li><code>JPS, JSP, Servlet</code></li>
<li><code>Apache tomcat</code></li>
<li><code>Java EE</code></li>
<li><code>SQL Server</code></li>
<li><code>Pattern DAO</code></li>
<li><code>Database design</code></li>
<li><code>Bootstrap</code></li>
</ul>
<h2>🎯 The goal</h2>
<p>The goal of the project was to develop a web application based on a given requirement: to create a database and a web app that allows users to register and apply for job positions. Users can also take tests and receive scores. The web app includes an admin page where administrators can create, open, close, and modify job positions, as well as create technical tests specific to each open position. Once an admin closes a position, the web app displays the candidate with the highest score.</p>
<h2>👩🏽‍🍳 The process</h2>
<p>The development process began with <b>designing the database</b>, where we identified the essential tables and defined the relationships between them. We carefully planned the entities and their associations to ensure a scalable and well-structured foundation for managing the data.

Next, we moved on to defining the project structure. This involved creating the necessary entities, developing classes, and setting up the controllers and corresponding JSP. To enhance the user experience, we utilized <b>Bootstrap</b> for styling and creating responsive, user-friendly interfaces.

Finally, we implemented an <b>authentication</b> and authorization system by adding <b>filters</b> to manage access based on <b>user</b> and <b>admin</b> roles. This allowed us to differentiate access rights: admins could manage job positions and quizzes, while regular users could apply for positions and complete the associated tests.

</p>
<h2>📂 Project structure</h2>
<ol>
  <li><b>Entity:</b> Represents a table in the database</li>
  <li><b>DAO (Data Access Object):</b>b> Class with methods to access the database, using JPA + EntityManager</li>
  <li><b>Class:</b> Contains business logic</li>
  <li><b>Servlet (JSP):</b> Handles HTTP requests and returns responses</li>
</ol>
<h3>📂 Database structure:</h3>
  <ul>
    <li><code>Utente:</code> Stores user details, including personal information, contact data, role, and credentials.</li>
    <li><code>Regione:</code> Stores regions, helping to group cities under specific geographical areas.</li>
    <li><code>Città:</code> Stores cities and links them to regions, organizing locations for users and job positions.</li>
    <li><code>Istruzione:</code> Stores users' educational history, degrees, institutions, and evaluation scores.</li>
    <li><code>Esperienza:</code> Stores users' work experience, including job roles, companies, and employment dates.</li>
    <li><code>Quiz:</code> Stores quizzes related to job positions, including descriptions and the number of questions.</li>
    <li><code>Domanda:</code> Stores questions for quizzes, including the question text and associated score.</li>
    <li><code>QuizDomanda</code> Links quizzes to their respective questions.</li>
    <li><code>RisposteDomanda</code> Stores answer options for quiz questions, including the correct answer.</li>
    <li><code>UtenteQuiz</code> Stores quiz results for users, including their scores and the date of completion.</li>
    <li><code>Skill</code> Stores skills related to quizzes, categorized as either soft or hard skills.</li>
    <li><code>UserSkills</code> Links users to their skills, indicating if they are verified.</li>
    <li><code>Posizione</code> Stores job positions, including the role, location, and status (open or closed).</li>
    <li><code>CandidaturaUser</code> Links users to the job positions they apply for, along with the application date.</li>
  </ul>


<h2>🚦 Running the Project</h2>
<p>To run the project in your local environment, follow these steps:</p>
<ol>
  
### 1. Clone the repository on your local machine:
```sh
git clone <repository-url>
cd ChooseTheCandidate
```
### 2. Build the prjoject:
```sh
mvn clean install
```
### 3. Clone the file .war into tomcat webapps folder:
```sh
cp target/PW2-1.0-SNAPSHOT.war /path/to/tomcat/webapps/
```
### 4. Start the tomcat:
```
/path/to/tomcat/bin/startup.sh
```
</ol>
