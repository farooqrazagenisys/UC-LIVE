<%@ Control Inherits="Telerik.QuickStart.Footer" %>
<%@ Register TagPrefix="telerik" TagName="CodeViewer" Src="~/Common/CodeViewer.ascx" %>

<asp:Panel ID="infoChartPanel" runat="server" Visible="false" CssClass="infoPanel infoChart">
    <div class="infoInner">
        <div class="title">Did you know that you can add Telerik Silverlight Charts to your ASP.NET applications?</div>
        <ul>
			<li><a target="_blank" href="http://demos.telerik.com/aspnet-ajax/chart/examples/silverlight/defaultcs.aspx">See an integration demo</a></li>
			<li><a target="_blank" href="http://demos.telerik.com/silverlight/#Chart/FirstLook">See Silverlight chart demos</a></li>
        </ul>
        <p style="text-align:right"><a target="_blank" href="http://www.telerik.com/products/silverlight.aspx"><img src="../../../../Common/styles09/infoChartLogo.gif" alt="RadControls for Silverlight" /></a></p>
    </div>
</asp:Panel>

<h2 class="qsfSubtitle" id="codeTitle">Example Source Code &amp; Description</h2>

<div id="codeContainer">
<telerik:CodeViewer runat="server" id="codeViewer" />
</div> <!-- codeContainer -->

</div> <!-- innerArea -->
	
</div> <!-- demoArea -->

<div class="qsfFooter">
<div>
	<img src="~/Common/Img/certAspNet.gif" id="aspCompatibleImage" alt="Compatible with ASP.NET 2.0, 3.5" width="107" height="31" runat="server" />
	<img src="~/Common/Img/certAjax.gif" id="ajaxImage" alt="AJAX enabled" width="111" height="31" runat="server" />
	<asp:PlaceHolder ID="xhtmlLogo" runat="server"></asp:PlaceHolder>
	<img src="~/Common/Img/certVS.gif" id="optimizedForVSImage" alt="Optimized for Visual Studio 2005, 2008" width="230" height="32" runat="server" />
</div>
	Copyright 2002-<%= System.DateTime.Now.Year %> &copy; Telerik. All right reserved  &nbsp;|&nbsp; 
	<address>Telerik Inc., 460 Totten Pond Rd, Suite 640, Waltham, MA 02451</address>
	<p>
		<a href="http://www.telerik.com/">www.telerik.com</a>  &nbsp;|&nbsp;  <a href="http://www.telerik.com/home/terms-of-use.aspx">
			Terms of Use</a>  &nbsp;|&nbsp;  <a href="http://www.telerik.com/corporate/contact-us.aspx">
				Contact Us</a></p>
</div>

</td> <!-- qsfRight -->
</tr>
</table>

<asp:PlaceHolder runat="server" ID="AnalyticsPlaceholder">
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-111455-1']);
        _gaq.push(['_setDomainName', '.telerik.com']);
		_gaq.push(['_trackPageview']);

		(function() {
		    var ga = document.createElement('script');
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 
			    'http://www') + '.google-analytics.com/ga.js';
		    ga.setAttribute('async', 'true');
		    document.documentElement.firstChild.appendChild(ga);
		})();
	</script>
</asp:PlaceHolder>

<asp:PlaceHolder runat="server" ID="CdnAccessCdnDetectionScriptPlaceHolder" Visible="false">
    <script type="text/javascript">
        var canAccessCdn = false;
    </script>

    <script type="text/javascript" src="http://aspnet-scripts.telerikstatic.com/beacon.js"></script>

    <script type="text/javascript">
        (function () {
            function createCookie(name, value, days) {
                if (days) {
                    var date = new Date();

                    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));

                    var expires = "; expires=" + date.toGMTString();
                }
                else var expires = "";

                document.cookie = name + "=" + value + expires + "; path=/";
            }

            function readCookie(name) {
                var nameEq = name + "=";
                var cookies = document.cookie.split(';');

                for (var i = 0; i < cookies.length; i++) {
                    var cookie = cookies[i];

                    while (cookie.charAt(0) == ' ')
                        cookie = cookie.substring(1, cookie.length);

                    if (cookie.indexOf(nameEq) == 0)
                        return cookie.substring(nameEq.length, cookie.length);
                }

                return null;
            }

            var refreshPage = readCookie("canAccessCdn") === "true" && !canAccessCdn;

            createCookie("canAccessCdn", canAccessCdn, 1);

            if (refreshPage)
                window.location = window.location;
        })();
    </script>
</asp:PlaceHolder>
