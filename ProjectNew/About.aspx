<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ProjectNew.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .about-container {
            font-family: Arial, sans-serif;
            margin: 0 auto;
            padding: 20px;
            max-width: 800px;
            background-color: #f5f5f5;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center; /* Center align content */
        }
        .about-title {
            font-size: 2em;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        .about-content {
            font-size: 1.2em;
            line-height: 1.6;
            color: #333;
        }
        .about-highlight {
            font-weight: bold;
            color: #388E3C;
        }
        .about-image {
            display: block; /* Ensure image is centered */
            margin: 20px auto; /* Center the image */
            max-width: 100%; /* Make sure the image doesn't exceed container width */
            border-radius: 10px; /* Add rounded corners */
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-container">
        <h1 class="about-title">About Me</h1>
        <p class="about-content">
            Welcome to my website dedicated to <span class="about-highlight">Sustainability</span>. This platform was created with passion and dedication by me - <span class="about-highlight">Ofir Weit</span>.
        </p>
        <p class="about-content">
            I am currently in the tenth grade and I have a deep interest in computer science. Combining technical skills with a commitment to environmental sustainability, I had crafted this website to spread awareness and provide valuable information on sustainable practices.
        </p>
        <p class="about-content">
            My goal is to inspire and educate my visitors on the importance of sustainability, and how each individual can make a difference. Thank you for visiting, and I hope you find our content informative and motivating.
        </p>
        <img class="about-image" src="Images/AboutPic.jpeg" alt="Alternate Text" />
    </div>
</asp:Content>
