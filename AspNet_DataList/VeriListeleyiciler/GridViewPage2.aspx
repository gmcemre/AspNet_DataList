<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GridViewPage2.aspx.cs" Inherits="AspNet_DataList.VeriListeleyiciler.GridViewPage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="ProductID">
        <Columns>
            <asp:TemplateField HeaderText="ProductName">
                <ItemTemplate>
                    <%#Eval("ProductName") %> 
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Eval("ProductName") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UnitPrice">
                <ItemTemplate>
                    <%# Eval("UnitPrice") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Eval("UnitPrice") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UnitsInStock">
                <ItemTemplate>
                    <%# Eval("UnitsInStock") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Eval("UnitsInStock") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton Text="Düzenle" runat="server" CommandName="Edit" />
                    <asp:LinkButton Text="Sil" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ProductID") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton Text="Güncelle" runat="server" CommandName="Update" CommandArgument='<%# Eval("ProductID") %>' />
                    <asp:LinkButton Text="İptal" runat="server" CommandName="Cancel" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
