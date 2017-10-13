<?php
//Page header
$siteTitle = 'Søge resultater';
$siteName = 'Udforsk bøger på Bogtorvet';
$siteDescription = 'Her er hvad du søgte på!';

# Get contents from header.php
include('includes/header.php');
?> 
<img src="images/bookicon.png" alt="Bog ikon" class="logo">
<h1>Søge Resultater</h1>
<?php
  # Get the values searchtype and searchterm from previous page and create short variables
  $searchtype=$_POST['searchtype'];
  $searchterm=trim($_POST['searchterm']);

  # check and 
  if (!$searchtype || !$searchterm) {
     echo '<div class="alert alert-danger"><strong>Error occured when searching. Please write something in the searchterm field!</strong></div>';
     echo '<button class="btn btn-primary btn-lg btn-block" onclick="goBack()">Go Back</button>';
     exit;
  }

  if (!get_magic_quotes_gpc()){
    $searchtype = addslashes($searchtype);
    $searchterm = addslashes($searchterm);
  }

  include('includes/connectdb.php');

  if (mysqli_connect_errno()) {
     echo 'Error: There was an database connection error!';
     exit;
  }

#first inner join when searchterm is forfatternavn
if ($searchtype == 'forfatternavn')
{
    $query = "
SELECT forfatter.forfatternavn, forfatter.land, bog.titel, bog.pris, bog.sprog, bog.forlag, bog.tilstand, bog.bind, bog.indbinding, bog.sider, bog.udgivelsesaar, bog.boghandel 
FROM forfatter 
INNER JOIN forfatterbog ON forfatter.forfatterid = forfatterbog.forfatterid INNER JOIN bog ON forfatterbog.bogid = bog.bogid WHERE ".$searchtype." like '".$searchterm."%'";
}

# inner join for all other searchterms
else
{
$query = "
SELECT forfatter.forfatternavn, forfatter.land, bog.titel, bog.pris, bog.sprog, bog.forlag, bog.tilstand, bog.bind, bog.indbinding, bog.sider, bog.udgivelsesaar, bog.boghandel 
FROM forfatter 
INNER JOIN forfatterbog ON forfatter.forfatterid = forfatterbog.forfatterid INNER JOIN bog ON forfatterbog.bogid = bog.bogid WHERE ".$searchtype." like '%".$searchterm."%'"; 
}


  


	
     if(!$result = mysqli_query($con, $query)) { 	
    	die('There was an error running the query: ' . $con->error);
    	exit;
	} 
	else 
	{

	    $result = mysqli_query($con, $query);	  
        $num_results = mysqli_num_rows($result);
	  
    ?>
		<div class='container'>
            <div class='row'>
                <p>Antal bøger fundet:<?php echo $num_results ?></p>

			    <table class="table table-striped">
			    <thead>
                    <tr>
                        <th>Forfatter</th>
			            <th>Titel</th>
			            <th>Sprog</th>
                        <th>Udgivelses år</th>
                        <th>Pris</th>
                        <th>Antal Sider</th>
                        <th>Indbinding</th>
                        <th>Forlag</th>
                        <th>Forhandler</th>
                        <th>Tilstand</th>
			        </tr>
			    </thead>
			    <tbody>
              <!-- Begining for Loop -->
			  <?php for ($i=0; $i <$num_results; $i++) {
			     $row = $result->fetch_assoc();     
			      echo    '<tr>';
			      echo      '<td>'. htmlspecialchars(stripslashes($row['forfatternavn'])) .'</td>';
			      echo      '<td>'. stripslashes($row['titel']) .'</td>';
			      echo      '<td>'. stripslashes($row['sprog']) .'</td>';
			      echo      '<td>'. stripslashes($row['udgivelsesaar']) .'</td>';
                  echo      '<td>'. stripslashes($row['pris']).' DKK' .'</td>';
                  echo      '<td>'. stripslashes($row['sider']) .'</td>';
                  echo      '<td>'. stripslashes($row['indbinding']) .'</td>';
                  echo      '<td>'. stripslashes($row['forlag']) .'</td>';
                  echo      '<td>'. stripslashes($row['boghandel']) .'</td>';
                  echo      '<td>'. stripslashes($row['tilstand']) .'</td>';
			      
			      echo    '</tr>';
			      
			  }
			  ?> <!-- For Loop ending -->
                </tbody>
			    </table>
			    <button class="btn btn-primary btn-lg btn-block" onclick="goBack()">Gå Tilbage</button>
			</div>
		</div><!-- CONTAINER END-->
	
<?php  
    # Freeing up MySQL ressources
    mysqli_free_result($result);

  	}
  	
    # Closing database connection
  	mysqli_close($con);

	
# Including footer.php file
include('includes/footer.php'); 
?>

