<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectNew.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title> Login Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Login Page</h1>
    <table>
        <tr>
            <td>
                <asp:Label ID="LblUsername" runat="server" Text="Username"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="TxtUsername" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>
                <asp:Label ID="LblPassword" runat="server" Text="Password"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="TxtPassword" runat="server" type="password"> </asp:TextBox>

            </td>
        </tr>
        <tr>
            <td><asp:Button ID="BtnLogin" runat="server" Text="Login"  OnClick="BtnLogin_Click"/> </td>
        </tr>
</table>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    
                    


</asp:Content>
