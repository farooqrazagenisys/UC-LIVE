<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="UC_LIVE.ForgotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
 
<!-- Website Title --> 
<title>UC Live - Claims Management System</title>

<!-- Meta data for SEO -->
<meta name="description" content="">
<meta name="keywords" content="">

<!-- Template stylesheet -->
<link href="RESOURCES/Template Files/css/blue/screen.css" rel="stylesheet" type="text/css" media="all">
<link href="RESOURCES/Template Files/css/blue/datepicker.css" rel="stylesheet" type="text/css" media="all">
<link href="RESOURCES/Template Files/js/visualize/visualize.css" rel="stylesheet" type="text/css" media="all">
<link href="RESOURCES/Template Files/js/jwysiwyg/jquery.wysiwyg.css" rel="stylesheet" type="text/css" media="all">
<link href="jRESOURCES/Template Files/s/fancybox/jquery.fancybox-1.3.0.css" rel="stylesheet" type="text/css" media="all">

<!--[if IE]>
	<link href="css/ie.css" rel="stylesheet" type="text/css" media="all">
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
<![endif]-->

<!-- Jquery and plugins -->
<script type="text/javascript" src="RESOURCES/Template Files/js/jquery.js"></script>
<script type="text/javascript" src="RESOURCES/Template Files/js/jquery-ui.js"></script>
<script type="text/javascript" src="RESOURCES/Template Files/js/jquery.img.preload.js"></script>
<script type="text/javascript" src="RESOURCES/Template Files/js/hint.js"></script>
<script type="text/javascript" src="RESOURCES/Template Files/js/visualize/jquery.visualize.js"></script>
<script type="text/javascript" src="RESOURCES/Template Files/js/jwysiwyg/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="RESOURCES/Template Files/js/fancybox/jquery.fancybox-1.3.0.js"></script>
<script type="text/javascript" charset="utf-8">
    $(function() {
        // find all the input elements with title attributes
        $('input[title!=""]').hint();
        $('#login_info').click(function() {
            $(this).fadeOut('fast');
        });
    });
</script>
<style>

.LoginClass
{
    padding-top:20px;
    
    }
</style>


</head>
<body class="login">
    <form id="form1" runat="server">
    
	<!-- Begin login window -->
	<div id="login_wrapper">
	
	
	
		<br class="clear"/>
			<div id="login_top_window">
			<img src="RESOURCES/Template Files/images/blue/top_login_window.png" border="0" alt="top window" />
		</div>
		
		<!-- Begin content -->
		<div id="login_body_window">
		<img src="images/UCLIVE_LOGO.png" alt="logo" style="text-align:center; margin-left:90px;" width="150"/>
      <div style="text-align:center"><a href="systemLogin.aspx">Login</a></div>
           
			<div class="inner">
								
			
	<asp:PasswordRecovery ID="PasswordRecover" runat="server"></asp:PasswordRecovery>
	
	
	
								
			</div>
		</div>
		
	
		
		<!-- End content -->
		
		<div id="login_footer_window">
			<img src="RESOURCES/Template Files/images/blue/footer_login_window.png" alt="footer window"/>
		</div>
		<div id="login_reflect">
			<img src="RESOURCES/Template Files/images/blue/reflect.png" alt="window reflect"/>
		</div>
	</div>

	
	<!-- End login window -->
    </form>
</body>
</html>
