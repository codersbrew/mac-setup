# mac-setup  prompt

Act as an expert macOS developer and shell scripting specialist. Your task is to generate a comprehensive zsh script named macos_setup.sh that automates the setup of a complete development environment on a fresh installation of macOS.
The script must be robust, idempotent (rerunnable without causing errors), and provide clear feedback to the user as it executes.
Script Requirements & Logic:

Shebang: Start the script with #!/bin/zsh.
Error Handling: Use set -e at the beginning to ensure the script exits immediately if any command fails.
User Feedback: Use echo statements with clear, descriptive text before each major step (e.g., "Installing Homebrew...", "Configuring Git...").
Checks: Before installing anything, check if it's already installed to avoid redundant operations.
Execution Steps:
Step 1: Install Xcode Command Line Tools

Check for the presence of the Xcode Command Line Tools.
If not installed, prompt the user to begin the installation and wait for it to complete. Use xcode-select --install.
Step 2: Install Homebrew

Check if Homebrew is installed by verifying the brew command exists.
If not, install it using the official installation command from the Homebrew website.
After installation, ensure the Homebrew path is correctly added to the .zshrc file.
Step 3: Install Core CLI Tools & Runtimes with Homebrew

Use brew install to install the following packages:
git
the_silver_searcher (the package for ag)
node (this will install Node.js and npm)
nvm (Node Version Manager)
openjdk (for the latest stable Java runtime)
gh (the official GitHub CLI)
Step 4: Install GUI Applications with Homebrew Cask

Use brew install --cask to install the following applications:
visual-studio-code
intellij-idea-ultimate (the paid Ultimate edition)
Step 5: Set Up the Zsh Environment with Oh My Zsh

Check if ~/.oh-my-zsh exists.
If not, install Oh My Zsh.
Set the Zsh theme in the ~/.zshrc file to agnoster, as it provides excellent Git status integration. Use sed or a similar command to replace the default theme line.
Step 6: Configure Git

Use git config --global to set the following configuration values precisely:
user.name "XXXXXX"
user.email "XXXXX"
alias.st status
alias.ci commit
alias.br branch
alias.co checkout
credential.helper cache
Step 7: Finalize

At the end of the script, print a success message summarizing what was installed and configured.
Advise the user to restart their terminal session or run source ~/.zshrc to apply all changes.
Please provide the complete, commented, and ready-to-use macos_setup.sh script.
Key Improvements:
Logical Structure: The prompt now provides a clear, step-by-step sequence, ensuring dependencies like Xcode Tools and Homebrew are handled first.
Robustness & Best Practices: I've added instructions for error handling (set -e), idempotency (checking before installing), and user feedback (echo), which will result in a much more professional and reliable script.
Specificity & Clarity: The prompt specifies exact package names (the_silver_searcher, intellij-idea-ultimate) and a concrete Zsh theme (agnoster) known for its Git integration. It also explicitly includes the GitHub CLI (gh) as a modern standard.
Techniques Applied:
Role Assignment: "expert macOS developer and shell scripting specialist"
Chain-of-Thought: The numbered steps guide the AI through a logical process.
Constraint-based Generation: The "Script Requirements & Logic" section defines the rules for the generated code.
