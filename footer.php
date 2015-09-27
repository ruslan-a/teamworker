<div class="footer">
  <?php if (isset($_SESSION['id'])) {
    echo'<a href="login.php?action=logout">Log Out</a>'; 
  } ?>
</div>