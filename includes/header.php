<!DOCTYPE html>
<html lang="en">
<head>
  <title><?php echo $siteTitle; ?></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap Style -->
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- Optional Bootstrap theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <!-- jQuery CSS  -->
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <!--My Stylesheet -->
  <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
   <script>
    function goBack() {
    window.history.back();
    }
  </script>

</head>
<body>
	<div class="jumbotron" id="header">
		<div class="container">
            <div class="container">
  			<h1 id="sitetitleid"><?php echo $siteName ?></h1>
  			<p id="sitedescriptionid"><?php echo $siteDescription ?></p>
            </div>
		</div>
	</div>

	<div class="container">
  