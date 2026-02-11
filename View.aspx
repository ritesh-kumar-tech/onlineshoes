<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function img(i) {

            var imgg = document.getElementById('<%=Image3.ClientID%>');
            imgg.src = i.src;
        
        }
    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="detail-card">
     <tr>
            <td class="tblhead" colspan="2">
                PRODUCT DETAIL</td>
        </tr>
     <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="detail-media">
                <asp:Image ID="Image3" runat="server" Height="282px" Width="285px" 
                    CssClass="vimg" />
            </td>
            <td valign="top" rowspan="2" class="detail-meta">
                <span class="detail-label">Item Name:</span>
                <span class="detail-value">
                <asp:Label ID="lblname" runat="server"></asp:Label>
                </span>
                <br />
                <br />
                <span class="detail-label">Item Price:</span>
                <span class="detail-value">
                <asp:Label ID="lblprice" runat="server"></asp:Label>
                </span>
                <br />
                <br />
                <span class="detail-label">Item Quantity:</span>
                <span class="detail-value">
                <asp:Label ID="lblqnt" runat="server"></asp:Label>
                </span>
                <br />
                <br />
                <span class="detail-label">Item Size:</span>
                <span class="detail-value">
                <asp:Label ID="lblqnt0" runat="server"></asp:Label>
                </span>
                <br />
                <br />
                <br />
                <br />
                <span class="detail-label">Detail:</span>
                <asp:Label ID="lbldetil" runat="server" CssClass="detail-text"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="Button3" runat="server" CssClass="btn" onclick="Button3_Click" 
                    Text="Add to Cart" Width="140px" Height="35px" />
                <br />
                <asp:Label ID="lblError" runat="server" ForeColor="#b02a2a"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="detail-media">
                <table class="detail-thumbs">
                    <tr>
                        <td>
                            <asp:Image ID="Image4" runat="server" Height="80px" Width="70px"  
                                onmouseover="img(this)" CssClass="vimg"/>
                        </td>
                        <td>
                            <asp:Image ID="Image5" runat="server" Height="80px" Width="70px" 
                                onmouseover="img(this)" CssClass="vimg" />
                        </td>
                        <td>
                            <asp:Image ID="Image6" runat="server" Height="80px" Width="70px" 
                                onmouseover="img(this)" CssClass="vimg"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style5" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

