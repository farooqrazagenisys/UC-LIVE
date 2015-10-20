<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="systemlogin.aspx.cs" Inherits="UC_LIVE.systemlogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
 
<!-- Website Title --> 
   <title>UC Live - Claims Manager Pro</title>


<!-- Template stylesheet -->
<link href="RESOURCES/TemplateFiles/css/blue/screen.css" rel="stylesheet" type="text/css"  />
<link href="RESOURCES/TemplateFiles/css/blue/datepicker.css" rel="stylesheet" type="text/css" />
<link href="RESOURCES/TemplateFiles/js/visualize/visualize.css" rel="stylesheet" type="text/css" />
<link href="RESOURCES/TemplateFiles/js/jwysiwyg/jquery.wysiwyg.css" rel="stylesheet" type="text/css"  />
<link href="RESOURCES/TemplateFiles/js/fancybox/jquery.fancybox-1.3.0.css" rel="stylesheet" type="text/css" />

<!--[if IE]>
	<link href="css/ie.css" rel="stylesheet" type="text/css" media="all">
	<meta http-equiv="X-UA-Compatible" content="IE=7" />
<![endif]-->

<!-- Jquery and plugins -->
<script type="text/javascript" src="RESOURCES/TemplateFiles/js/jquery.js"></script>
<script type="text/javascript" src="RESOURCES/TemplateFiles/js/jquery-ui.js"></script>
<script type="text/javascript" src="RESOURCES/TemplateFiles/js/jquery.img.preload.js"></script>
<script type="text/javascript" src="RESOURCES/TemplateFiles/js/hint.js"></script>
<script type="text/javascript" src="RESOURCES/TemplateFiles/js/visualize/jquery.visualize.js"></script>
<script type="text/javascript" src="RESOURCES/TemplateFiles/js/jwysiwyg/jquery.wysiwyg.js"></script>
<script type="text/javascript" src="RESOURCES/TemplateFiles/js/fancybox/jquery.fancybox-1.3.0.js"></script>

    
<%--<script type="text/javascript" charset="utf-8">
    $(function() {
        // find all the input elements with title attributes
        $('input[title!=""]').hint();
        $('#login_info').click(function() {
            $(this).fadeOut('fast');
        });
    });
</script>--%>

<style type="text/css">
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
			<img src="RESOURCES/TemplateFiles/images/blue/top_login_window.png" border="0" alt="top window" />
		</div>
		
		<!-- Begin content -->
		<div id="login_body_window">
		<img src="images/UCLIVE_LOGO.png" alt="logo" style="text-align:center; margin-left:55px;"/>
		<br />
			<div class="inner">
								
			
	<asp:Login ID="Login1" runat="server" TitleText="" TextBoxStyle-Font-Bold="false" 
                    Width="250" Height="85"  UserNameLabelText="Username:&nbsp;&nbsp;&nbsp;" 
                    PasswordLabelText="Password:&nbsp;&nbsp;&nbsp;"  TitleTextStyle-Height="5" 
                    CssClass="LoginClass" TextBoxStyle-Width="130" CheckBoxStyle-Height="5"  
                    PasswordRecoveryText="Forgot Password" 
                    PasswordRecoveryUrl="ForgotPassword.aspx" 
                    FailureText="" > 
		
<CheckBoxStyle Height="5px"></CheckBoxStyle>

<TextBoxStyle Font-Bold="False" Width="130px"></TextBoxStyle>

<TitleTextStyle Height="10px"></TitleTextStyle>
		
	</asp:Login>
	
	
	
								
			</div>
		</div>
		
	
		
		<!-- End content -->
		
		<div id="login_footer_window">
			<img src="RESOURCES/TemplateFiles/images/blue/footer_login_window.png" alt="footer window"/>
		</div>
		<div id="login_reflect">
			<img src="RESOURCES/TemplateFiles/images/blue/reflect.png" alt="window reflect"/>
		</div>
	</div>

	
	<!-- End login window -->
    </form>
</body>
</html>
