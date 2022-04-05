<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GridViewPage.aspx.cs" Inherits="AspNet_DataList.VeriListeleyiciler.GridViewPage" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="ProductID">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Ürün Adı" />
            <asp:BoundField DataField="UnitPrice" HeaderText="Fiyat" />
            <asp:BoundField DataField="UnitsInStock" HeaderText="Stok" />
            <asp:CheckBoxField DataField="Discontinued" HeaderText="Tükendi" />
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
</asp:Content>
