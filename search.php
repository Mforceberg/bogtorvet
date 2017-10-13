<?php
//Page header
$siteTitle = 'Søg';
$siteName = 'Udforsk bøger på Bogtorvet';
$siteDescription = 'Udfyld venligst søgeformularen.';

# Including header.php file 
include('includes/header.php');
?>  
<div class="bodystyling">  
   <img src="images/bookicon.png" alt="Bog ikon" class="logo">
    
    <!-- dropdown to pick a searchtype -->
    <form action="results.php" method="post">
      <label for="searchtype">Vælg søgetype</label>
      <select name="searchtype"  class="form-control">
        <option value="forfatternavn">Forfatter
        <option value="titel">Bog
        <option value="sprog">Sprog
        <option value="udgivelsesaar">Udgivelses år  
      </select>
      <br/>
     
        <!-- form where the user can enter what they search for -->
      <div class="form-group">
        <label for="searchterm">Indtast søgeord:</label>
        <input type="text" name="searchterm" class="form-control" id="search" placeholder="Søg her...">
      </div>

      <input type="submit" name="submit" class="btn btn-success btn-lg btn-block" value="Søg">
    </form><!-- FORM END-->
</div>
<?php
# Including footer.php file
include('includes/footer.php');

?>
