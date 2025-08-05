<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Lavnon.aspx.cs" Inherits="ProjectNew.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .content {
            max-width: 800px;
            padding: 20px;
            text-align: center;
        }
        .content h1 {
            color: darkgreen;
            font-size: 36px;
            margin-bottom: 20px;
        }
        .content h3 {
            font-size: 18px;
            line-height: 1.6;
            color: #333;
        }
        .content img {
            margin-top: 20px;
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="content">
            <h1>The Power of Sustainability</h1>
            <h3>
                Welcome to our platform dedicated to sustainability, where every action counts towards a greener future. Here, we believe that sustainability isn't just a trend—it's a vital commitment to preserving our planet for generations to come. Through innovation, education, and collective action, we're shaping a world where environmental stewardship is woven into the fabric of daily life. Join us on this journey as we celebrate progress, foster collaboration, and inspire meaningful change. Together, let's cultivate a thriving ecosystem where harmony between humanity and nature is not only achievable but our collective responsibility.
            </h3>
            <img src="Images/img5.jpg" alt="PARPAR" />
        </div>
    </div>
</asp:Content>
