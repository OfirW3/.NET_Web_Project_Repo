<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="ProjectNew.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
    
    <tr>
        <td>
            <asp:Label ID="LblPassword" runat="server" Text="Password"></asp:Label>

        </td>
        <td>
            <asp:TextBox ID="TxtPassword" runat="server" type="password"></asp:TextBox>

        </td>
    </tr>

    <tr>
        <td>
            <asp:Label ID="LblFirstName" runat="server" Text="First Name"></asp:Label>
        </td>

        <td>
            <asp:TextBox ID="TxtFirstName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="LblLastName" runat="server" Text="Last Name"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TxtLastName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="LblEmail" runat="server" Text="Email"></asp:Label>

        </td>
        <td>
            <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
        </td>
    </tr>

   <tr>
    <td>
        <asp:Label ID="LblYearBirth" runat="server" Text="Year Of Birth"></asp:Label>
    </td>

    <td>
        <asp:DropDownList ID="DdlYear" runat="server" Font-Size="Medium">
        </asp:DropDownList>
    </td>
</tr>
    <tr>
        <td>
            <asp:Label ID="LblAddress" runat="server" Text="Address"></asp:Label>
        </td>
   
        <td>
            <asp:TextBox ID="TxtAddress" runat="server"></asp:TextBox>

        </td>

    </tr>
    <tr>
    <td>
        <asp:Button ID="BtnUserUpdate" runat="server" Text="Update Details"  OnClick="BtnUserUpdate_Click"/> 
    </td>
    
     <td> &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp; <asp:Button ID="BtnCancel" runat="server" Text="Cancel"  OnClick="BtnCancel_Click"/> </td>
        </tr>
        <tr>
<td>
    

    &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp;  &emsp; <asp:Button ID="BtnUserDelete" runat="server" Text="Delete Account"  OnClick="BtnDelete_Click"/> 
</td>
</tr>
 
</table>
</asp:Content>
