<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WordGame.aspx.cs" Inherits="ProjectNew.WordGame" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Word Guessing Game</title>
    <style>
        /* General body styling specific to the word game page */
        body {
            font-family: Arial, sans-serif;
        }
        /* Styling for the main game container */
        #gameContainer {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            margin: 20px auto;
        }
        /* Styling for the main header */
        h1 {
            font-size: 36px;
            color: #4CAF50;
            text-align: center;
            margin-bottom: 20px;
        }
        /* Styling for the word display */
        #word {
            font-size: 32px;
            letter-spacing: 5px;
            margin-bottom: 20px;
            font-weight: bold;
        }
        /* Styling for the label. Targets the label named guessInput. Without such specificity, a general label selector would apply the styles to all labels */
        label[for="guessInput"] {
            color: #D32F2F; /* Red color */
            font-size: 18px;
            font-weight: bold;
            margin-right: 10px;
        }
        /* Styling for the text input */
        input[type="text"] {
            font-size: 18px;
            padding: 5px;
            width: 60px;
            text-align: center;
            margin-bottom: 20px;
        }
        /* Styling for the button */
        input[type="button"] {
            font-size: 18px;
            padding: 10px 20px; /* Size of the button and spacing from the input container */
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
        }
            /* Hover effect for the button */
            input[type="button"]:hover {
                background-color: #45a049; /* When hovering the button - cool color */
            }
        /* Class to hide elements */
        .hidden {
            display: none;
        }
        /* Styling for the hangman images */
        .hangman-images img {
            max-width: 100px;
            margin: 5px;
        }
    </style>
    <script>
        // List of words for the game
        const words = ['renewable', 'energy', 'recycle', 'solar', 'environment', 'carbon', 'planet', 'ecology', 'green', 'renew', 'earth', 'reduce', 'reuse', 'eco', 'forest', 'ocean', 'climate'];
        let secretWord = '';
        let guessedWord = '';
        let wrongCount = 0;
        var usedLetters = []
        // Function to hide all hangman images
        function hideAllHangmanImages() {
            for (let i = 1; i <= 7; i++) {
                document.getElementById(i.toString()).classList.add('hidden');
            }
        }

        // Function to initialize the game
        function initializeGame() {
            let randomIndex = Math.floor(Math.random() * words.length);
            secretWord = words[randomIndex];
            guessedWord = '_'.repeat(secretWord.length);
            document.getElementById('word').innerText = guessedWord;
            wrongCount = 0;
            hideAllHangmanImages();
            document.getElementById('<%= lblMessage.ClientID %>').innerText = ""; //When restarting the game refreshing the label
            document.getElementById('<%= WrongLetters.ClientID %>').classList.add('hidden');
            document.getElementById('<%= WrongLetters.ClientID %>').innerText = "Wrong letters: ";
            for (var i = 0; i < usedLetters.length; i++) {
                usedLetters[i] = ""
            }
        }

        // Function to check the user's guess
        function checkGuess() {
            let guess = document.getElementById('guessInput').value.toLowerCase();
            document.getElementById('guessInput').value = '';

            // A Regular Exp which checks if the guess is a letter
            if (guess.length !== 1 || !/[a-z]/.test(guess)) {
                alert('Please enter a single letter.');
                return;
            }

            let newGuessedWord = '';
            let correctGuess = false;
            //Makes the new word if wrong, keeps the word the same if correct makes the word with the correct letter in the correct place
            for (let i = 0; i < secretWord.length; i++) {
                if (secretWord[i] === guess) {
                    newGuessedWord += guess;
                    correctGuess = true;
                } else {
                    newGuessedWord += guessedWord[i]; // Makes the secret word status the same
                }
            }

            if (!correctGuess) {
                let IsGuessedWrong = false;
                for (var i = 0; i < usedLetters.length; i++) {
                    if (usedLetters[i] == guess) {
                        IsGuessedWrong = true;
                        alert('You have already guessed that letter.')
                        return;
                    }
                }
                usedLetters.push(guess);
                document.getElementById('<%= WrongLetters.ClientID %>').innerText += " " + guess + " , ";

                wrongCount++;
                if (wrongCount <= 7) {
                    hideAllHangmanImages();
                    document.getElementById(wrongCount.toString()).classList.remove('hidden');
                    document.getElementById('<%= WrongLetters.ClientID %>').classList.remove('hidden');
                }
                if (wrongCount == 7) {
                    document.getElementById('<%= lblMessage.ClientID %>').innerText = "Game Over! The word was: " + secretWord;
                    setTimeout(initializeGame, 3000); // Restart the game after 3 seconds
                    return;
                }

            }
            else {
                guessedWord = newGuessedWord;
                document.getElementById('word').innerText = guessedWord;

                if (guessedWord === secretWord) {
                    document.getElementById('<%= lblMessage.ClientID %>').innerText = "Congratulations! You guessed the word: " + secretWord;
                    setTimeout(initializeGame, 3000); // Restart the game after 3 seconds
                }
            }
        }

        // Initialize the game when the page loads
        window.onload = initializeGame;
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Main game container -->
    <div id="gameContainer">
        <h1>Hangman Game</h1>
        <!-- Display for the current state of the guessed word -->
        <div id="word"></div>
        <div>
            <!-- Input for the user's letter guess -->
            <label for="guessInput">Enter a letter:</label>
            <input type="text" id="guessInput" maxlength="1" />
            <!-- Button to submit the guess -->
            <input type="button" id="btnGuess" onclick="checkGuess()" value="Guess" />
        </div>
        <!-- Container for the hangman images -->
        <div class="hangman-images">
            <img src="Images/h1.png" alt="hangman1" id="1" class="hidden" />
            <img src="Images/h2.png" alt="hangman2" id="2" class="hidden" />
            <img src="Images/h3.png" alt="hangman3" id="3" class="hidden" />
            <img src="Images/h4.png" alt="hangman4" id="4" class="hidden" />
            <img src="Images/h5.png" alt="hangman5" id="5" class="hidden" />
            <img src="Images/h6.png" alt="hangman6" id="6" class="hidden" />
            <img src="Images/h7.png" alt="hangman7" id="7" class="hidden" />
        </div>
        <!-- Label to display messages -->
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <asp:Label ID="WrongLetters" runat="server" Text="Wrong letters: " CssClass="hidden"></asp:Label>
    </div>

</asp:Content>
