<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registraiton.aspx.cs" Inherits="WebApplicationDB.Registraiton" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function check() {
            const spcial = ["#", "%", "!", "*", "^", ")", "(", "&", "$", "+", "=", "-", "_", "`", "~", "{", "}", "[", "]", "|"];
            var username = document.getElementById('<%=TxtUsername.ClientID%>')
            if (username.value == null || username.value == "") {
                document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter username!";
                return false;
            }

            if (username.value.length < 4 || username.value.length > 16) {
                document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Username must be at least 4 charecters and maximum 16";
                return false;
            }
            var password = document.getElementById('<%=TxtPassword.ClientID%>')
            if (password.value == null || password.value == "") {
                document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter password!";
                return false;
            }

            if (password.value.length < 4 || password.value.length > 16) {
                document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "password must be at least 4 charecters and maximum 16";
                return false;
            }
            var email = document.getElementById('<%=TxtEmail.ClientID%>')
            if (email.value == null || email.value == "") {
                document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter email!";
                return false;
            }
            var counter = 0;
            var specialC = 0;
            for (var i = 0; i < email.value.length; i++) {
                if (email.value[i] == '@') {
                    counter++;
                }
                for (var j = 0; j < spcial.length; j++) {
                    if (email.value[i] == spcial[j]) {
                        specialC++;
                    }
                }
            }
            var emailcheck = "";
            for (var i = email.value.length - 4; i < email.value.length; i++) {
                emailcheck += email.value[i];
            }

            if (emailcheck != ".com" || counter != 1 || specialC != 0) {
                document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Email is not valid";
                return false;
            }
            var FirstName = "";
            FirstName = document.getElementById('<%=TxtFirstName.ClientID%>')
            if (FirstName.value == null || FirstName.value == "") {
                document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Please enter first name!";
                return false;
            }
            specialC = 0;
            for (var i = 0; i < FirstName.value.length; i++) {
                for (var j = 0; j < spcial.length; j++) {
                    if (FirstName.value[i] == spcial[j]) {
                        specialC++;
                    }
                }
            }
            if (specialC != 0) {
                document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Invalid first name!";
                return false;
            }
            for (var i = 0; i < FirstName.value.length; i++) {
                if (FirstName.value[i] >= 1 && FirstName.value[i] <= 9) {
                    document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Invalid first name!";
                    return false;
                }
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
            specialC = 0;
            for (var i = 0; i < lastName.value.length; i++) {
                for (var j = 0; j < spcial.length; j++) {
                    if (lastName.value[i] == spcial[j]) {
                        specialC++;
                    }
                }
                if (lastName.value[i] >= 1 && lastName.value[i] <= 9) {
                    document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Invalid last name!";
                    return false;
                }
                if (specialC != 0) {
                    document.getElementById('<%= lblMessage.ClientID%>').innerHTML = "Invalid last name!";
                    return false;
                }
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Registration </h1>
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
                <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="BtnRegister_Click" OnClientClick="return check()" />
            </td>
        </tr>

    </table>
    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

</asp:Content>
