<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ProjectNew.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Admin Page</h1>
    <table>
        <tr>
            <td>
                <asp:DropDownList ID="DDlFilter" runat="server"></asp:DropDownList></td>
            <td>
                <asp:TextBox ID="TxtFilter" runat="server"></asp:TextBox></td>
            <td>
                <asp:Button ID="BtnFilter" runat="server" Text="Filter" OnClick="BtnFilter_Click" /></td>
            <td>
                <asp:Button ID="BtnSort" runat="server" Text="Sort" OnClick="DDlSort_SelectedIndexChanged" /></td>
        </tr>
        <tr>
            <asp:Label runat="server" ID="lblMsg" />
            <asp:DropDownList ID="DDlUserUpdate" runat="server"></asp:DropDownList>
            <asp:Button ID="BtnUpdate" runat="server" Text="For Update Or Delete Chosen User" OnClick="Btn_Update" />
        </tr>
        <tr>
            <asp:Label ID="LblShowUsers" runat="server" Text="ShowUsers"> </asp:Label>
        </tr>
    </table>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

</asp:Content>
