<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Lavnon.aspx.cs" Inherits="ProjectNew.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .content {
            background: #ffffff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            text-align: center;
        }

            .content h1 {
                color: #228B22; /* Forest Green for heading */
                font-size: 36px;
                margin-bottom: 20px;
            }

            .content h3 {
                font-size: 18px;
                line-height: 1.6;
                color: #556B2F; /* Dark Olive Green for subheading */
            }

            .content img {
                margin-top: 20px;
                border-radius: 10px;
                max-width: 100%;
                height: auto;
            }

        @media (max-width: 600px) {
            .content h1 {
                font-size: 28px;
            }

            .content h3 {
                font-size: 16px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="content">
            <h1>Ofir's Sustainability Website!!</h1>
            <h3>Welcome to my platform dedicated to sustainability, where every action counts towards a greener future. Here, I believe that sustainability isn't just a trend—it's a vital commitment to preserving our planet for generations to come. Through innovation, education, and collective action, I am shaping a world where environmental stewardship is woven into the fabric of daily life. Join me on this journey as I celebrate progress, foster collaboration, and inspire meaningful change. Together, let's cultivate a thriving ecosystem where harmony between humanity and nature is not only achievable but our collective responsibility.
            </h3>
            <img src="Images/Earth.jpg" alt="Earth" />
        </div>
    </div>
</asp:Content>
