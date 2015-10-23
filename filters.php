<body>
  <main class="filters">
    <?php include "header.inc"; ?>
    <div class="two">
      <h1>Find New Members</h1><br>
      <form id="searchForm" action="/?page=searchResults" method="POST">
        <label for="skillField">Skills</label><br>
        <span class="subtitle">Separate keywords with commas</span>
        <input type="text" id="skillField" name="searchTerm" placeholder="php, css, jquery" />
        <br><br>
        <label for="fieldSelect">Field of Expertise</label>
        <select name="field" id="fieldSelect">
          <option value="">Any</option>
          <option value="Web Development">Web Development</option>
          <option value="Programming">Programming</option>
          <option value="Project Leadership">Project Leadership</option>
          <option value="Business">Business</option>
        </select>
        <br><br>
        <label for="gpa">GPA</label>
        <select id="gpa" name="gpa">
          <option value="">Any</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
        </select>
        <br><br>
        <input type="submit" />
      </form>   
    </div>
    <?php include 'footer.php' ?>
  </main>
</body>
</html>