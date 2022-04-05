<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DataListCategoryPage.aspx.cs" Inherits="AspNet_DataList.DataListCategoryPage" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DataList ID="dtlCategories" runat="server" OnCancelCommand="dtlCategories_CancelCommand" OnDeleteCommand="dtlCategories_DeleteCommand" OnEditCommand="dtlCategories_EditCommand" OnUpdateCommand="dtlCategories_UpdateCommand">
        <HeaderTemplate>
            <table border="1">
                <thead>
                    <tr>
                        <th>Kategori Adı</th>
                        <th>Tanımı</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("CategoryName") %></td>
                <td><%# Eval("Description") %></td>
                <td>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("CategoryID") %>'>Sil</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Edit">Düzenle</asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr>
                <td>
                    <asp:TextBox ID="adi" runat="server" Text='<%# Eval("CategoryName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="desc" runat="server" Text='<%# Eval("Description") %>' />
                </td>
                <td>
                    <asp:LinkButton Text="Güncelle" runat="server" CommandName="Update" CommandArgument='<%# Eval("CategoryID") %>' />
                </td>
                <td>
                    <asp:LinkButton Text="İptal" runat="server" CommandName="Cancel" />
                </td>
            </tr>
        </EditItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:DataList>
</asp:Content>
