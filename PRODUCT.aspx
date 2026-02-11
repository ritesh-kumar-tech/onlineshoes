<%@ Page Title="" Language="C#" MasterPageFile="~/USER.master" AutoEventWireup="true" CodeFile="PRODUCT.aspx.cs" Inherits="PRODUCT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="tbl" width="97%">
        <tr>
            <td class="tblhead">
                PRODUCT</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
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
            </td>
        </tr>
    </table>
</asp:Content>

