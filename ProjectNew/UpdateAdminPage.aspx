<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateAdminPage.aspx.cs" Inherits="ProjectNew.UpdateAdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function check() {
            const numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
            const spcial = ["#", "%", "!", "*", "^", ")", "(", "&", "$", "+", "=", "-", "_", "`", "~", "{", "}", "[", "]", "|"];
            var password = document.getElementById('<%=TxtPassword.ClientID%>')
        if (password.value == null || password.value == "") {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter password!";
            return false;
        }

        if (password.value.length < 4 || password.value.length > 16) {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Password must be at least 4 characters and maximum 16";
            return false;
        }
        var email = document.getElementById('<%=TxtEmail.ClientID%>')
        if (email.value == null || email.value == "") {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter email!";
            return false;
        }
        var counter = 0;
        for (var i = 0; i < email.value.length; i++) {
            if (email.value[i] == '@') {
                counter++;
            }
        }
        var emailcheck = "";
        for (var i = email.value.length - 4; i < email.value.length; i++) {
            emailcheck += email.value[i];
        }

        if (emailcheck != ".com" || counter != 1 || Forbidden(email, spcial)) {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Email is not valid";
            return false;
        }
        var FirstName = document.getElementById('<%=TxtFirstName.ClientID%>')
        if (FirstName.value == null || FirstName.value == "") {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter first name!";
            return false;
        }
        if (Forbidden(FirstName, numbers) || Forbidden(FirstName, spcial)) {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Invalid first name!";
            return false;
        }
        var address = document.getElementById('<%=TxtAddress.ClientID%>');
        if (address.value == null || address.value == "") {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter an address!"
            return false;
        }
        var lastName = document.getElementById('<%=TxtLastName.ClientID%>');
        if (lastName.value == null || lastName.value == "") {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter a last name!"
            return false;
        }

        if (Forbidden(lastName, numbers) || Forbidden(lastName, spcial)) {
            document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Invalid last name!";
                return false;
            }

            return true;
        }
        function Forbidden(input, forbidden) {
            for (var i = 0; i < input.value.length; i++) {
                for (var j = 0; j < forbidden.length; j++) {
                    if (input.value[i] == forbidden[j]) {
                        return true;
                    }
                }
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>

        <tr>
            <td>
                <asp:Label ID="LblPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox>
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
                <asp:Button ID="BtnUserUpdate" runat="server" Text="Update Details" OnClick="BtnUserUpdate_Click" OnClientClick="return check()"/>
            </td>
            <td>
                <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" />
            </td>
            <td>
                <asp:Button ID="BtnDelete" runat="server" Text="Delete" OnClick="BtnDelete_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessage" runat="server" Text="" CssClass="message"></asp:Label>
            </td>
        </tr>

    </table>
</asp:Content>
