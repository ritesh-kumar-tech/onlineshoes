<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>OnlineShoes | Home</title>
    <link href="meera.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="top">
        <%-- <div id="logo">
        <asp:Image ID="Image1" runat="server" Height=80px Width=324px 
            ImageUrl=   "~/images/hlogo.png" />
        </div>--%>
        <table class="header-grid">
            <tr>
                <td class="brand-cell">
       <h1>OnlineShoes</h1>
                </td>
                <td>
&nbsp;<table class="search-grid">
                        <tr>
                            <td>
                                 <asp:TextBox ID="txtsearch" runat="server" Width="300px" BorderColor="#272727" 
                                    BorderStyle="Solid" BorderWidth="1px" Height="25px"></asp:TextBox>
                            </td>
                            <td>
                                   <asp:Button ID="Button2" runat="server" Text="Search" onclick="Button2_Click" 
                                       Width="78px" CssClass="btn" CausesValidation="False" Height="30px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
       </div> <div id="menu">
        <%-- <a href="Home.aspx" class="mnu1" >HOME 
   </a> <a href="PRODUCT.aspx" class="mnu1" >PRODUCT</a> 
   <a href="Feedback.aspx" class="mnu1">FeedBack</a>
   <a href="Registration.aspx" class="mnu1">Sign Up
   </a>   
   <a href="Login.aspx" class="mnu1">Login</a> 
   <a href="Contact us.aspx" class="mnu1">Contact Us</a> 
   <div id="slogn">
 <marquee BEHAVIOR=ALTERNATE scrollamount="2" style="width: 650px; color:#F13D6D; font-size: 16px;"> Online Shopping Website.... </marquee>
 </div>--%>
        <table class="nav-grid">
            <tr>
                <td>
                    <asp:Button ID="Button3" runat="server" Text="HOME" CssClass="btnmenu" 
                        CausesValidation="False" PostBackUrl="~/Home.aspx" />
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" Text="SIGN UP" CssClass="btnmenu" 
                        CausesValidation="False" PostBackUrl="~/Registration.aspx" />
                </td>
              <%--  <td>
                    <asp:Button ID="Button5" runat="server" Text="LOGIN" CssClass="btnmenu" 
                        CausesValidation="False" PostBackUrl="~/Login.aspx" />
                </td>--%>
                <td>
                    <asp:Button ID="Button6" runat="server" Text="PRODUCT" CssClass="btnmenu" 
                        CausesValidation="False" PostBackUrl="~/PRODUCT.aspx" />
                </td>
                <td>
                    <asp:Button ID="Button7" runat="server" Text="FEEDBACK" CssClass="btnmenu" 
                        CausesValidation="False" PostBackUrl="~/Feedback.aspx" />
                </td>
                <td>
                    <asp:Button ID="Button8" runat="server" Text="ADMIN Login" CssClass="btnmenu" 
                        CausesValidation="False" PostBackUrl="~/admin/login.aspx" />
                </td>
            </tr>
        </table>
 </div>
 

 
    <div class="hero">
        <div class="hero-text">
            <h2>Step into a curated collection</h2>
            <p>Premium comfort, bold silhouettes, and everyday essentials. Discover styles for every stride.</p>
            <div class="hero-actions">
                <asp:Button ID="Button10" runat="server" Text="Shop New Arrivals" CssClass="btn" PostBackUrl="~/PRODUCT.aspx" CausesValidation="False" />
                <asp:Button ID="Button11" runat="server" Text="Create Account" CssClass="btn btn-ghost" PostBackUrl="~/Registration.aspx" CausesValidation="False" />
            </div>
        </div>
        <div class="hero-badge">
            <span class="badge-title">Exclusive Picks</span>
            <span class="badge-text">Limited styles added weekly</span>
        </div>
    </div>
    <div id="second">
        <%--<div id="login">
        <table class="tbl">
            <tr>
                <td colspan="2" class="tblhead">
                    Login Area</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblerror" runat="server" Font-Bold="False" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    UserName :</td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td class="lbl">
                    Password :</td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="left">
                   
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="left">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx" 
                        style="color: #006600">New User ??</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="left">
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/FPassword.aspx" 
                        style="color: #006600">Forgot Password !!</asp:HyperLink>
                </td>
            </tr>
        </table>
        </div>--%>
      
        <div class="simple-banner">
            <img src="img/i1.jpg" alt="Premium shoes collection" />
        </div>
      <div id="login" runat="server">
          <table class="login-grid">
              <tr>
                  <td width="45%">
                      <table class="style3">
                          <tr>
                              <td>
                                  &nbsp;</td>
                              <td>
                                  &nbsp;</td>
                              <td>
                                   &nbsp;</td>
                          </tr>
                      </table>
                  </td>
                  <td>
                      <table class="login-fields">
                          <tr>
                              <td class="login-label">
                                  Email :</td>
                              <td>
                                 <asp:TextBox ID="txtuname" runat="server" CssClass="txt"></asp:TextBox></td>
                              <td class="login-label">
                                  Password :</td>
                              <td>
                                 <asp:TextBox ID="txtupass" runat="server" CssClass="txt" TextMode="Password"></asp:TextBox></td>
                              <td>
                                   <asp:Button ID="btnlogin" runat="server" CssClass="btn" Text="Login" 
                        onclick="btnlogin_Click" CausesValidation="False" />
                                   <asp:Label ID="lbll" runat="server" ForeColor="White"></asp:Label>
                              </td>
                          </tr>
                      </table>
                  </td>
              </tr>
          </table>
        </div>
        <div id="welcome" runat="server" class="welcome-card">
            <div class="welcome-text">
                <asp:Label ID="lblWelcome" runat="server"></asp:Label>
                <span class="welcome-sub">Your cart and order history are one click away.</span>
            </div>
            <div class="welcome-actions">
                <asp:Button ID="Button12" runat="server" Text="Go to My Account" CssClass="btn" PostBackUrl="~/User/MyAccount.aspx" CausesValidation="False" />
                <asp:Button ID="Button13" runat="server" Text="View Cart" CssClass="btn btn-ghost" PostBackUrl="~/User/MyCart.aspx" CausesValidation="False" />
            </div>
        </div>
   

    <div id="main">
    <div id="cate">
        <table class="tbl">
            <tr>
                <td class="tblhead">
                    CATEGORY</td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" 
                        Width="100%" CellPadding="4" ForeColor="#272727" GridLines="None" onrowcommand="GridView1_RowCommand" 
                        onselectedindexchanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                           
                                <asp:TemplateField>
                                <ItemTemplate >
                                <asp:LinkButton runat="server" Text='<%#Eval("Cname") %>' CssClass="cgrid" ForeColor="#272727" ID="lnkcate" CommandName="cate" CommandArgument='<%#Eval("Cname") %>'></asp:LinkButton>
                                </ItemTemplate>
                                </asp:TemplateField>

                        </Columns>
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#272727" 
                            HorizontalAlign="Center" />
                        <RowStyle BorderColor="White" BorderStyle="None" BorderWidth="0px" 
                            Font-Size="Medium" Height="30px" 
                            HorizontalAlign="Center" BackColor="#FFFBD6" ForeColor="#272727" />
                        <SelectedRowStyle BackColor="#FFCC66" ForeColor="#272727" Font-Bold="True" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
        </table>
        </div><div id="item">

            <%--<asp:DataList ID="DataList1" runat="server" RepeatColumns="4" 
                RepeatDirection="Horizontal" Width="100%" 
                onitemcommand="DataList1_ItemCommand" 
                onselectedindexchanged="DataList1_SelectedIndexChanged" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderWidth="1px" 
                CellPadding="3" BorderStyle="None" CellSpacing="2" GridLines="Both">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle CssClass="igrid" BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    <table class="tbl" >
                        <tr>
                            <td style="text-align: center">
                                <asp:Image ID="Image2" runat="server"  CssClass="img" ImageUrl='<%#Eval("image") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Name :
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("iname") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Price :
                                <asp:Label ID="Label2" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("iid") %>'>View..</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" ForeColor="White" Font-Bold="True" />
            </asp:DataList>--%>
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" 
                RepeatDirection="Horizontal" onitemcommand="DataList1_ItemCommand1">
                <ItemTemplate>
                    <div class="product-card">
                        <div class="product-title">
                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("iname") %>'></asp:Label>
                        </div>
                        <div class="product-media">
                            <asp:Image ID="Image4" runat="server" CssClass="product-img" ImageUrl='<%#Eval("image") %>' />
                        </div>
                        <div class="product-meta">
                            <span class="product-price">
                                Price:
                                <asp:Label ID="lblprice" runat="server" Text='<%#Eval("price") %>'></asp:Label>
                            </span>
                            <asp:Button ID="Button9" runat="server" CssClass="btn btn-sm" CommandArgument='<%#Eval("iid") %>' 
                                Text="View" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div> </div>
     <div id="foot">All Rights Reserved @E Commerce Website 2022</div>
    </form>
  
</body>
</html>
