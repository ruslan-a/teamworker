<html>
<head>
  <title>Search - Teamworker</title>
</head>
<body>
  <form id="searchForm" action="doSearch.php" method="POST">
    <label for="skillField">Skill Keyword</label><br>
    <input type="text" id="skillField" name="searchTerm" placeholder="skill" />
    <br><br>
    <label for="fieldSelect">Field of Expertise</label><br>
    <select name="field" id="fieldSelect">
      <option value="web">Web Development</option>
      <option value="code">Programming</option>
      <option value="leader">Project Leadership</option>
      <option value="business">Business</option>
    </select>
    <br><br>
    <input type="submit" />
  </form>
</body>
</html>