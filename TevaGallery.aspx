<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TevaGallery.aspx.cs" Inherits="ProjectNew.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gallery {
            margin-top: 50px;
            text-align: center;
        }
        .gallery h1 {
            color: #2ecc71;
            font-size: 36px;
            margin-bottom: 20px;
        }
        .gallery img {
            border: 5px double black;
            width: 300px;
            height: 200px;
            margin: 10px;
            border-radius: 10px;
            transition: transform 0.3s ease-in-out;
        }
        .gallery img:hover {
            transform: scale(1.05);
        }
        .gallery table {
            margin: 0 auto;
        }
        .gallery td {
            padding: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gallery">
        <h1>Nature Gallery</h1>
        <table>
            <tr>
                <td><img src="Images/img1.jpg" alt="תמונה" /></td>
                <td><img src="Images/img2.jpg" alt="תמונה" /></td>
                <td><img src="Images/img3.jpg" alt="תמונה" /></td>
            </tr>
            <tr>
                <td><img src="Images/img4.jpg" alt="תמונה" /></td>
                <td><img src="Images/img5.jpg" alt="תמונה" /></td>
                <td><img src="Images/img6.jpg" alt="תמונה" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
