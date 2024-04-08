# Check if the gh copilot extension is installed and load aliases accordingly
if gh extension list | grep -q 'github/gh-copilot'; then
	copilot_shell_suggest() {
		gh copilot suggest -t shell "$@"
	}
	alias '??'='copilot_shell_suggest'

	# Function to handle Git command suggestions
	copilot_git_suggest() {
		gh copilot suggest -t git "$@"
	}
	alias 'git?'='copilot_git_suggest'

	# Function to handle GitHub CLI command suggestions
	copilot_gh_suggest() {
		gh copilot suggest -t gh "$@"
	}
	alias 'gh?'='copilot_gh_suggest'
fi
