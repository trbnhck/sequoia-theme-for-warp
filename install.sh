#!/usr/bin/env bash
# ---------------------------------------------------------------------------- #
#                                    Colors                                    #
# ---------------------------------------------------------------------------- #
BOLD_RED="\033[1;31m"
BOLD_GREEN="\033[1;32m"
NC="\033[0m"
DIM="\033[2m"
DARK_GRAY="\033[1;30m"
BOLD_MAGENTA="\033[1;35m"
BOLD_ORANGE="\033[1;33m"
BOLD_BLUE="\033[1;34m"
ITALIC="\033[3m"
GRAY="\033[2;37m"
WHITE="\033[1;37m"
# ---------------------------------------------------------------------------- #
#                                  End Colors                                  #
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
#                                   Variables                                  #
# ---------------------------------------------------------------------------- #
WARP_CONFIG_DIR="$HOME/.warp"
WARP_THEME_DIR="$WARP_CONFIG_DIR/themes"
# ---------------------------------------------------------------------------- #
#                                 End Variables                                #
# ---------------------------------------------------------------------------- #

# ---------------------------------------------------------------------------- #
#                                    Script                                    #
# ---------------------------------------------------------------------------- #
echo -e "
${WHITE}# ---------------------------------------------------------------------------- #
#                                                                              #
#                                 ${BOLD_MAGENTA}Sequoia Theme${WHITE}                                #
#                                                                              #
#          ${NC}${GRAY}${ITALIC}Theme by @Mike_Andreuzza | Installation script by @trbnhck${NC}${WHITE}          #
# ---------------------------------------------------------------------------- #${NC}"

# Check if theme files exists and set variable accordingly
if [ -f "$WARP_THEME_DIR/sequoia_moonlight.yaml" ]; then
		MOONLIGHT_INSTALLED=true
fi
if [ -f "$WARP_THEME_DIR/sequoia_monochrome.yaml" ]; then
		MONOCHROME_INSTALLED=true
fi

echo -e "\n${GRAY}Which options do you want to install?\n"

# Output different options depending on if theme is installed or not
if [ "$MOONLIGHT_INSTALLED" = true ]; then
	echo -e "${BOLD_GREEN}1. Sequoia Moonlight (Installed)"
else
	echo -e "${WHITE}1. Sequoia Moonlight (Not installed)"
fi
if [ "$MONOCHROME_INSTALLED" = true ]; then
	echo -e "${BOLD_GREEN}2. Sequoia Monochrome (Installed)"
else
	echo -e "${WHITE}2. Sequoia Monochrome (Not installed)"
fi
if [ "$MOONLIGHT_INSTALLED" = true ] && [ "$MONOCHROME_INSTALLED" = true ]; then
	echo -e "${BOLD_GREEN}3. Both (Installed)"
else
	echo -e "${WHITE}3. Both (Not installed)"
fi

# Prompt for installation option
echo -n -e "${WHITE}> ${NC}"

read installation_option

echo ""

# Check if user input is valid
if [ "$installation_option" != "1" ] && [ "$installation_option" != "2" ] && [ "$installation_option" != "3" ]; then
	echo -e "The option ${BOLD_RED}$installation_option${NC} is not valid.\n"
	exit 1
fi

# Check if config directory exists, create if not
if [ ! -d "$HOME/.warp/themes" ]; then
		echo -e "${BOLD_RED}ERROR:${NC} The Warp config directory was not found at ${BOLD_RED}${WARP_THEME_DIR}${NC}."
		echo -e -n "Do you want to create it? ${DIM}(${NC}${BOLD_GREEN}Y${NC}${DIM}/n)${NC} "
		readcreate_warp_config_dir
		if [ "$create_warp_config_dir" = "n" ]; then
			echo -e "\nThe installation was aborted.\n"
			exit 1
		fi
	
		mkdir -p "$WARP_THEME_DIR"
		echo -e "\n${BOLD_GREEN}SUCCESS:${NC} The config directory was created at ${BOLD_GREEN}${WARP_THEME_DIR}${NC}.\n"
fi

# Functions to install themes
function install_moonlight(){
	if [ "$MOONLIGHT_INSTALLED" = true ]; then
		echo -e "${BOLD_ORANGE}WARNING:${NC} The theme ${BOLD_MAGENTA}Sequoia Moonlight${NC} is already installed."
		echo -e -n "	 Do you want to replace it? ${DIM}(${NC}${BOLD_GREEN}Y${NC}${DIM}/n)${NC} "
		read replace_moonlight
		if [ "$replace_moonlight" = "n" ]; then
			echo -e "\nThe installation was aborted.\n"
			exit 1
		fi
		echo ""

		echo -e "${BOLD_BLUE}INFO:${NC} 	 Deleting ${BOLD_ORANGE}$WARP_THEME_DIR/sequoia_moonlight.yaml${NC}..."
		rm "$WARP_THEME_DIR/sequoia_moonlight.yaml"
		echo -e "${BOLD_GREEN}SUCCESS:${NC} Deleted ${BOLD_ORANGE}$WARP_THEME_DIR/sequoia_moonlight.yaml${NC}."
		

		echo ""
	fi

	echo -e "${BOLD_BLUE}INFO:${NC} 	 Downloading theme..."
	curl -s -o "${WARP_THEME_DIR}/sequoia_moonlight.yaml" "https://raw.githubusercontent.com/trbnhck/sequoia-theme-for-warp/main/themes/sequoia_moonlight.yaml" 
	echo -e "${BOLD_GREEN}SUCCESS:${NC} Theme successfully installed at ${BOLD_GREEN}$WARP_THEME_DIR/sequoia_moonlight.yaml${NC}."

	echo ""
}

function install_monochrome(){
	if [ "$MONOCHROME_INSTALLED" = true ]; then
		echo -e "${BOLD_ORANGE}WARNING:${NC} The theme ${BOLD_MAGENTA}Sequoia Monochrome${NC} is already installed."
		echo -e -n "	 Do you want to replace it? ${DIM}(${NC}${BOLD_GREEN}Y${NC}${DIM}/n)${NC} "
		read replace_monochrome
		if [ "$replace_monochrome" = "n" ]; then
			echo -e "\nThe installation was aborted.\n"
			exit 1
		fi
		echo ""

		echo -e "${BOLD_BLUE}INFO:${NC} 	 Deleting ${BOLD_ORANGE}$WARP_THEME_DIR/sequoia_monochrome.yaml${NC}..."
		rm "$WARP_THEME_DIR/sequoia_moonlight.yaml"
		echo -e "${BOLD_GREEN}SUCCESS:${NC} Deleted ${BOLD_ORANGE}$WARP_THEME_DIR/sequoia_monochrome.yaml${NC}."
		

		echo ""
	fi
	echo -e "${BOLD_BLUE}INFO:${NC} 	 Downloading theme..."
	curl -s -o "${WARP_THEME_DIR}/sequoia_monochrome.yaml" "https://raw.githubusercontent.com/trbnhck/sequoia-theme-for-warp/main/themes/sequoia_monochrome.yaml" 
	echo -e "${BOLD_GREEN}SUCCESS:${NC} Theme successfully installed at ${BOLD_GREEN}$WARP_THEME_DIR/sequoia_monochrome.yaml${NC}."

	echo ""
}

function install_both(){
	install_moonlight
	
	install_monochrome
	
	echo -e "${BOLD_GREEN}SUCCESS:${NC} Both themes were successfully installed."
}

# Call functions according to user input
if [ "$installation_option" = "1" ]; then
	install_moonlight
fi
if [ "$installation_option" = "2" ]; then
	install_monochrome
fi
if [ "$installation_option" = "3" ]; then
	install_both
fi
