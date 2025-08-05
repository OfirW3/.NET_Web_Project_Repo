<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TevaGallery.aspx.cs" Inherits="ProjectNew.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Gallery container styling */
        .gallery {
            margin-top: 50px; /* Adds space at the top */
            text-align: center; /* Centers text horizontally */
            max-width: 1200px; /* Maximum width for the gallery */
            margin-left: auto; /* Centers the gallery horizontally */
            margin-right: auto; /* Centers the gallery horizontally */
        }

            /* Styling for the gallery title */
            .gallery h1 {
                color: #2ecc71; /* Green color for the title */
                font-size: 36px; /* Large font size */
                margin-bottom: 20px; /* Space below the title */
            }

        /* Gallery image container */
        .gallery-images {
            display: flex;
            flex-wrap: wrap; /* Allows wrapping of images to next line */
            justify-content: center; /* Center the images */
            gap: 10px; /* Space between images */
        }

        /* Styling for the images */
        .gallery img {
            border: 5px double black; /* Black double border around images */
            width: 100%; /* Makes the image take full width of its container */
            max-width: 300px; /* Maximum width for images */
            height: auto; /* Maintains aspect ratio */
            border-radius: 10px; /* Rounded corners */
            transition: transform 0.3s ease-in-out; /* Smooth transition effect */
        }

            /* Hover effect for images */
            .gallery img:hover {
                transform: scale(1.05); /* Smooth animation on hovering */
            }

        /* Responsive iframe container */
        .video-container {
            position: relative;
            width: 100%;
            padding-bottom: 56.25%; /* 16:9 aspect ratio */
            height: 0;
            margin-top: 20px; /* Space above the video */
        }

            .video-container iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gallery">
        <!-- Gallery title -->
        <h1>גלרית טבע</h1>

        <!-- Container for images -->
        <div class="gallery-images">
            <img src="Images/Recycle.jpg" alt="תמונה" />
            <img src="Images/Gallery2.jpg" alt="תמונה" />
            <img src="Images/Gallery3.jpg" alt="תמונה" />
            <img src="Images/Gallery4.jpg" alt="תמונה" />
            <img src="Images/Gallery5.jpg" alt="תמונה" />
            <img src="Images/Gallery6.jpg" alt="תמונה" />
        </div>

        <!-- Embedded YouTube video -->
        <div class="video-container">
            <iframe src="https://www.youtube.com/embed/2EZ50wxosDg" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>
</asp:Content>
