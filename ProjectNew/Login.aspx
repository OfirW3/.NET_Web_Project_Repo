<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectNew.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Set default styles for the body */
        body {
            margin: 0;
            padding: 0;
        }

        /* Style the main container for login */
        .login-container {
            max-width: 600px; /* Limit the width of the container */
            margin: 50px auto; /* Center the container horizontally */
            padding: 20px; /* Add padding inside the container */
            background-color: #fff; /* Set background color to white */
            border-radius: 8px; /* Round the corners of the container */
        }

            /* Style the heading within the container */
            .login-container h1 {
                text-align: center; /* Center the text */
                color: #333; /* Set text color to dark gray */
            }

            /* Style the table within the container */
            .login-container table {
                width: 100%; /* Make the table fill the container width */
            }

            /* Style the table cells */
            .login-container td {
                padding: 10px; /* Add padding inside the cells */
            }

            /* Style the labels */
            .login-container label {
                display: block; /* Display labels as blocks */
                margin-bottom: 5px; /* Add margin at the bottom */
                font-weight: bold; /* Make labels bold */
            }

            /* Style input fields */
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: calc(100% - 22px); /* Make inputs fill the available width */
                padding: 10px; /* Add padding */
                margin-top: 5px; /* Add margin at the top */
                border: 1px solid #ccc; /* Add a border */
                border-radius: 4px; /* Round the corners */
            }

            /* Style the login button */
            .login-container button {
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
                .login-container button:hover {
                    background-color: #45a049; /* Darken background color on hover */
                }

            /* Style the message text */
            .login-container .message {
                text-align: center; /* Center the text */
                margin-top: 10px; /* Add margin at the top */
                color: #d9534f; /* Set text color to red */
            }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h1>Login</h1>
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
                    <asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="BtnLogin" runat="server" Text="Login"  OnClick="BtnLogin_Click"  OnClientClick="WrongAtt()"/>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="message"></asp:Label>
    </div>
</asp:Content>
