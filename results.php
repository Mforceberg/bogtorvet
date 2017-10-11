<?php
//Page header
$siteTitle = 'Søge resultater';
$siteName = 'Udforsk bøger på Bogtorvet';
$siteDescription = 'Her er hvad du søgte på!';

# Get contents from header.php
include('includes/header.php');
?> 

<h1>Search Result(s)</h1>
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


  

$query = "
SELECT forfatter.forfatternavn, forfatter.land, bog.titel, bog.pris, bog.sprog, bog.forlag, bog.tilstand, bog.bind, bog.indbinding, bog.sider, bog.udgivelsesaar, bog.boghandel 
FROM forfatter 
INNER JOIN forfatterbog ON forfatter.forfatterid = forfatterbog.forfatterid INNER JOIN bog ON forfatterbog.bogid = bog.bogid WHERE ".$searchtype." like '%".$searchterm."%'";


  


	
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
                <p>Number of matches:<?php echo $num_results ?></p>

			    <table class="table table-striped">
			    <thead>
                    <tr>
                        <th>Forfatter</th>
			            <th>Titel</th>
			            <th>Sprog</th>
                        <th>Udgivelses år</th>
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
			      
			      echo    '</tr>';
			      
			  }
			  ?> <!-- For Loop ending -->
                </tbody>
			    </table>
			    <button class="btn btn-primary btn-lg btn-block" onclick="goBack()">Go Back</button>
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

