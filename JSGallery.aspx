<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="JSGallery.aspx.cs" Inherits="ProjectNew.JSGallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #container {
            position: relative;
            width: 500px;
            height: 500px;
        }

        #movingImage {
            position: absolute;
            width: 300px;
            height: 200px;
        }
    </style>
    <script>
        function moveImage()
        {
            var container = document.getElementById('container');
            var image = document.getElementById('movingImage');
            var containerWidth = container.clientWidth;
            var containerHeight = container.clientHeight;
            var randomX = Math.floor(Math.random() * 824);
            var randomY = Math.floor(Math.random() * 537);
            image.style.left = randomX + 'px';
            image.style.top = randomY + 'px';
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <button onclick="moveImage(); return false;">Move Image</button>
    <div id="container">
        <img id="movingImage" src="Images/img1.jpg" alt="Moving Image">
    </div>

</asp:Content>
