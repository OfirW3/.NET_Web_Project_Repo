<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TikTakToe.aspx.cs" Inherits="ProjectNew.TikTakToe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .game-container {
            display: flex; /* Makes the container a flex container */
            flex-direction: column; /* Arranges items in a column (vertically) */
            align-items: center; /* Centers items horizontally within the container */
            margin-top: 20px; /* Adds margin at the top to position the game container below the navigation bar */
        }

        table {
            border-collapse: collapse; /* Removes the space between table cells */
        }

        td {
            border: 2px solid #333; /* Sets the border of the table cells */
            height: 100px; /* Sets the height of each table cell */
            width: 100px; /* Sets the width of each table cell */
            text-align: center; /* Centers the text horizontally within each cell */
            vertical-align: middle; /* Centers the text vertically within each cell */
            font-size: 2em; /* Sets a large font size for the text in each cell */
            cursor: pointer; /* Changes the cursor to a pointer when hovering over a cell */
        }

        #lblMessage {
            text-align: center; /* Centers the text horizontally within the label */
            font-size: 1.5em; /* Sets a larger font size for the message text */
            margin-top: 20px; /* Adds a margin above the label to create space between the table and the label */
            font-family: 'Comic Sans MS', cursive, sans-serif; /* Sets a prettier font for the message */
            color: darkred; /* Sets the text color to dark red */
        }
    </style>
    <script>
        var count = 0;
        var gameOverX;
        var gameOverO;
        function tikTakToe(clicked_id) {
            let winningCombinations = [
                [1, 2, 3], [4, 5, 6], [7, 8, 9],
                [1, 4, 7], [2, 5, 8], [3, 6, 9],
                [1, 5, 9], [3, 5, 7]
            ];
            let board = boardArray();
            for (var i = 0; i < board.length; i++) {
                if (document.getElementById(clicked_id).innerText != "") {
                    return;
                }
            }
            if (count % 2 == 0 && !gameOverO && !gameOverX) {
                document.getElementById(clicked_id).innerText = "X";
            }
            else if (!gameOverO && !gameOverX) {
                document.getElementById(clicked_id).innerText = "O";
            }
            count++;
            board = boardArray();
            gameOverX = false;

            for (var i = 0; i < winningCombinations.length; i++) {
                let comb = winningCombinations[i];
                gameOverX = true;
                for (var j = 0; j < comb.length; j++) {
                    let combofcomb = comb[j]
                    if (board[combofcomb - 1] != "X") {
                        gameOverX = false;
                        break;
                    }
                }
                if (gameOverX) {
                    document.getElementById('<%= lblMessage.ClientID %>').innerText = "Game Over! - X wins!";
                    setTimeout(resetGame, 3000);
                    return;
                }
            }
            gameOverO = false;

            for (var i = 0; i < winningCombinations.length; i++) {
                let comb = winningCombinations[i];
                gameOverO = true;
                for (var j = 0; j < comb.length; j++) {
                    let combofcomb = comb[j]
                    if (board[combofcomb - 1] != "O") {
                        gameOverO = false;
                        break;
                    }
                }
                if (gameOverO) {
                    document.getElementById('<%= lblMessage.ClientID %>').innerText = "Game Over! - O wins!";
                    setTimeout(resetGame, 3000);
                    return;
                }
            }
            let draw = true;
            for (var i = 0; i < board.length; i++) {
                if (board[i] == "") {
                    draw = false;
                    break;
                }
            }
            if (draw) {
                document.getElementById('<%= lblMessage.ClientID %>').innerText = "Game Over! - Draw!";
                setTimeout(resetGame, 3000);
            }

        }
        function boardArray() {
            let cells = document.querySelectorAll("td"); // Creates a NodeList with every <td> element in the page
            let board = [];
            for (var i = 0; i < cells.length; i++) {
                board.push(cells[i].innerText)
            }
            return board;
        }
        function resetGame() {
            let cells = document.querySelectorAll("td"); // Creates a NodeList with every <td> element in the page
            for (var i = 0; i < cells.length; i++) {
                cells[i].innerText = ""
            }
            document.getElementById('<%= lblMessage.ClientID %>').innerText = "";
            count = 0;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="game-container">
        <h1>Tic Tac Toe Game</h1>
        <table>
            <tr>
                <td id="1" onclick="tikTakToe(this.id)"></td>
                <td id="2" onclick="tikTakToe(this.id)"></td>
                <td id="3" onclick="tikTakToe(this.id)"></td>
            </tr>
            <tr>
                <td id="4" onclick="tikTakToe(this.id)"></td>
                <td id="5" onclick="tikTakToe(this.id)"></td>
                <td id="6" onclick="tikTakToe(this.id)"></td>
            </tr>
            <tr>
                <td id="7" onclick="tikTakToe(this.id)"></td>
                <td id="8" onclick="tikTakToe(this.id)"></td>
                <td id="9" onclick="tikTakToe(this.id)"></td>
            </tr>
        </table>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
