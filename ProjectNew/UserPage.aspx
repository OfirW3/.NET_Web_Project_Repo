<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="ProjectNew.UserPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Set default styles for the body */
        body {
            margin: 0;
            padding: 0;
        }

        /* Style the main container for registration */
        .update-details-container {
            max-width: 600px; /* Limit the width of the container */
            margin: 50px auto; /* Center the container horizontally */
            padding: 20px; /* Add padding inside the container */
            background-color: #fff; /* Set background color to white */
            border-radius: 8px; /* Round the corners of the container */
        }

            /* Style the table within the container */
            .update-details-container table {
                width: 100%; /* Make the table fill the container width */
            }

            /* Style the table cells */
            .update-details-container td {
                padding: 10px; /* Add padding inside the cells */
            }

            /* Style the labels */
            .update-details-container label {
                display: block; /* Display labels as blocks */
                margin-bottom: 5px; /* Add margin at the bottom */
                font-weight: bold; /* Make labels bold */
            }

            /* Style input fields and dropdown */
            .update-details-container input[type="text"],
            .update-details-container input[type="password"],
            .update-details-container select {
                width: calc(100% - 22px); /* Make inputs fill the available width */
                padding: 10px; /* Add padding */
                margin-top: 5px; /* Add margin at the top */
                border: 1px solid #ccc; /* Add a border */
                border-radius: 4px; /* Round the corners */
            }

            /* Style the update button */
            .update-details-container button {
                width: 100%; /* Make the button fill the container width */
                padding: 10px; /* Add padding */
                background-color: #4CAF50; /* Set background color */
                color: #fff; /* Set text color to white */
                border: none; /* Remove border */
                border-radius: 4px; /* Round the corners */
                cursor: pointer; /* Add pointer cursor */
                font-size: 16px; /* Set font size */
            }

                /* Style button hover state */
                .update-details-container button:hover {
                    background-color: #45a049; /* Darken background color on hover */
                }

            /* Style the delete button */
            .update-details-container #BtnUserDelete {
                width: 100%; /* Make the button fill the container width */
                padding: 10px; /* Add padding */
                background-color: #d9534f; /* Set background color */
                color: #fff; /* Set text color to white */
                border: none; /* Remove border */
                border-radius: 4px; /* Round the corners */
                cursor: pointer; /* Add pointer cursor */
                font-size: 16px; /* Set font size */
                margin-top: 10px; /* Add margin at the top */
            }

                /* Style delete button hover state */
                .update-details-container #BtnUserDelete:hover {
                    background-color: #c9302c; /* Darken background color on hover */
                }

            /* Style the message text */
            .update-details-container .message {
                text-align: center; /* Center the text */
                margin-top: 10px; /* Add margin at the top */
                color: #d9534f; /* Set text color to red */
            }
    </style>
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

            if (emailcheck != ".com" || counter !=1  || Forbidden(email, spcial)) {
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
    <div class="update-details-container">
        <h1>Update Details</h1>
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
                    <asp:DropDownList ID="DdlYear" runat="server" Font-Size="Medium"></asp:DropDownList>
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
                <td colspan="2">
                    <asp:Button ID="BtnUserUpdate" runat="server" Text="Update Details" OnClick="BtnUserUpdate_Click" OnClientClick="return check()" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" OnClick="BtnCancel_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="BtnUserDelete" runat="server" Text="Delete Account" OnClick="BtnDelete_Click" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="message"></asp:Label>
    </div>
</asp:Content>
