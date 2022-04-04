<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DataListPage.aspx.cs" Inherits="AspNet_DataList.DataListPage" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataList ID="dtlProducts" runat="server" OnDeleteCommand="dtlProducts_DeleteCommand" OnEditCommand="dtlProducts_EditCommand" OnCancelCommand="dtlProducts_CancelCommand" OnUpdateCommand="dtlProducts_UpdateCommand">
        <HeaderTemplate>
            <table border="1">
                <thead>
                    <tr>
                        <th>Ürün Adı</th>
                        <th>Birim Fiyatı</th>
                        <th>Stok</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("ProductName") %></td>
                <td><%# Eval("UnitPrice") %></td>
                <td><%# Eval("UnitsInStock") %></td>
                <td>
                    <asp:LinkButton ID="LinkButton1" CommandName="Edit" runat="server">Düzenle
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton2" CommandName="Delete" CommandArgument='<%# Eval("ProductID") %>' runat="server">Sil
                    </asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox ID="txtProductName" Text='<%# Eval("ProductName") %>' runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtFiyat" Text='<%# Eval("UnitPrice") %>' runat="server" />
                </td>
                <td>
                    <asp:TextBox ID="txtStok" Text='<%# Eval("UnitsInStock") %>' runat="server" />
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton3" CommandName="Update" runat="server" CommandArgument='<%# Eval("ProductID") %>'>Güncelle</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton4" CommandName="Cancel" runat="server">İptal</asp:LinkButton>
                </td>
            </tr>
        </EditItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:DataList>
</asp:Content>
