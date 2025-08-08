# .NET Web Project

## Overview
This is an ASP.NET Web Forms application developed using C#. It provides a basic multi-page interface for users and administrators, utilizing SQL for backend data storage.

## Project Structure
- `*.aspx` + `.cs` and `.designer.cs` files – Front-end pages (e.g., login, user/admin management, galleries)
- `Site1.Master` – Master page layout template
- `Web.config`, `Web.Debug.config`, `Web.Release.config` – Configuration for deployments
- `dbo.Table.sql` – SQL script for database schema setup
- `ProjectNew.sln`, `ProjectNew.csproj`, `packages.config` – Project and solution files
- Folders:
  - `Images/` – Visual assets for the application
  - `Properties/` – Assembly and project metadata

## Features
- User authentication (login/logout)
- Admin management functions (admin pages for CRUD operations)
- User pages for content browsing
- Galleries for displaying images and content (`JSGallery`, `TevaGallery`, `Lavnon`)
- Database initialization through `dbo.Table.sql`

## Prerequisites
- Visual Studio (2015+) or suitable IDE with ASP.NET support
- .NET Framework compatible with Web Forms
- A SQL Server instance to execute `dbo.Table.sql`

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/OfirW3/.NET_Web_Project_Repo.git
