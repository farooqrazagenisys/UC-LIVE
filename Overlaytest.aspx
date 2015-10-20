<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Overlaytest.aspx.cs" Inherits="UC_LIVE.Overlaytest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script language="javascript">

     function Print(strid) {
         var prtContent = document.getElementById(strid);
         var WinPrint = window.open('', '', 'left=0,top=0,width=900,height=600,toolbar=1,scrollbars=1,status=0');
         WinPrint.document.write(prtContent.innerHTML);
         WinPrint.document.close();
         WinPrint.focus();
         WinPrint.print();
         WinPrint.close();
   
     }
  </script>
    <script src="JQueryTools/jquery.tools.min.js" type="text/javascript"></script>
<script>


    $(function() {

        // if the function argument is given to overlay,
        // it is assumed to be the onBeforeLoad event listener
        $("a[rel]").overlay({

            mask: '#006699',
            effect: 'apple',

            onBeforeLoad: function() {

                // grab wrapper element inside content
                var wrap = this.getOverlay().find(".contentWrap");

                // load the page specified in the trigger
                wrap.load(this.getTrigger().attr("href"));
            }

        });
    });

</script>
<style type="text/css">
/* use a semi-transparent image for the overlay */
	#overlay {
		/*background-image:url(http://static.flowplayer.org/img/overlay/transparent.png); */
		color:#efefef;
		height:800px;
	background-color:#FFF;

		display:none;
		width:800px;
		padding:15px;
		text-align:left;
		border:5px solid #006699;
	
		opacity:0.8;

	}
	
	/* container for external content. uses vertical scrollbar, if needed */
	div.contentWrap {
		height:1000px;
		overflow-y:auto;
	}
	

</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- external page is given in the href attribute (as it should be) -->



<a href="PersonalInjuryForm.aspx?ClaimID=34" rel="#overlay" style="text-decoration:none">

	<!-- remember that you can use any element inside the trigger -->
	<button type="button">Show external page in overlay</button>	
</a>

<!-- another link. uses the same overlay -->
<a href="~/AddClaim.aspx" rel="#overlay" style="text-decoration:none">
	<button type="button">Show another page</button>
</a>


<!-- overlayed element -->
<div class="apple_overlay" id="overlay">

	<!-- the external content is loaded inside this tag -->
	<div class="contentWrap"></div>

</div>


</asp:Content>
