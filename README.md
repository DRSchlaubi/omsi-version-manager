# omsi-version-manager

The really popular Bus Simulator [OMSI 2](https://store.steampowered.com/app/252530/OMSI_2_Steam_Edition/) has one really big issue 
(actually it is riddled with a whole bunch of big issues, but I don't want to learn Delphi and try fixing this myself, so there is one big issue we can actually fix)

That big issue is "bloating" even though OMSI was designed to have 1st party modding Support, as the base game is actually the same as a mod, the game gets more buggy the more addons/mods you add. This includes longer startup times, londer load time and often addons even conflict which each other. This is partly poor optimization from the
game's developers but also poor optimization from mod/addon developers

A simple solution is to just install OMSI multiple times, but that takes a lot of storagem this project adds a few scripts allowing you to have multiple installs, sharing files between installs and switch between them easily

# Prerequisites
- Go to Steam -> OMSI 2 -> Properties -> Updates -> Select "Update only when starting"
- Uninstall OMSI 2 and make a clean reinstall with all DLCs you want in the base game (and maybe OmniNavigation)

# Install
- Download the [script](https://raw.githubusercontent.com/DRSchlaubi/omsi-version-manager/main/LICENSE) into your OMSI folder
- Rename your current OMSI installation to something like `OMSI 2 - base game`

# Create new copy (run this from the base game folder)
- Exist Staem
- Open and administrative Powershell in your OMSI folder
- Run `.\new-copy.ps1 'Omsi - France'` or simmilar depending on what installation you want to create
- Run `cd '..\Omsi - France'`
- Uninstall Omsi from steam (this won't actually do anything, apart from making steam re-validate files)
- Run `./activate.ps1`

# Start
- Exit steam
- Run activate.ps1 in the installation you want
- start omsi

Now you're OMSI installation is selected and you can install all the addons for the desired installation, in this case I installed [Grand Paris Moulon](https://store.steampowered.com/app/1475580/OMSI_2_Addon_Grand_ParisMoulon/) 
and [Saint Servan](https://store.steampowered.com/app/1475580/OMSI_2_Addon_Grand_ParisMoulon/) because those actually share a lot of content
