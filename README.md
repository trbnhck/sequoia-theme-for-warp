[![Sequoia Theme Header](https://raw.githubusercontent.com/Sequoia-Theme/assets/main/githubHeader.png)](https://github.com/Sequoia-Theme)

# Sequoia for Warp

Sequoia theme ported to [Warp](https://warp.dev) 💻

## Installation Instructions

### Automatic Setup (Recommended)

1. Run the following command from the terminal[^1]
```sh
zsh <(curl -s https://raw.githubusercontent.com/trbnhck/sequoia-theme-for-warp/main/install.sh)
```
2. Open Warp
3. Navigate to `Settings` > `Appearance`
4. Click on `Current Theme` and then search for `Sequoia` and either choose between `Moonlight` or `Monochrome`
5. Enjoy! 💫

### Manual

1. Create the Warp config directory
```
mkdir -p $HOME/.warp/themes/
```
2. Download the contents of the `themes` folder.
```bash
curl https://github.com/trbnhck/sequoia-theme-for-warp/blob/main/themes/sequoia_moonlight.yaml -o sequoia_moonlight.yaml
curl https://github.com/trbnhck/sequoia-theme-for-warp/blob/main/themes/sequoia_monochrome.yaml -o sequoia_monochrome.yam
```
3. Move the files into the Warp config directory
```
mv sequoia_moonlight.yaml $HOME/.warp/themes/
mv sequoia_monochrome.yaml $HOME/.warp/themes/
```
4. Open Warp
5. Navigate to `Settings` > `Appearance`
6. Click on `Current Theme` and then search for `Sequoia` and either choose between `Moonlight` or `Monochrome`
7. Enjoy! 💫

## Available Options

<p float="center">
  <div>
    <h3>Moonlight</h3>
    <img src="https://github.com/trbnhck/sequoia-theme-for-warp/blob/main/preview/sequoia_moonlight.png?raw=true" width="500" alt="Moonlight" />
  </div>
  <div>
    <h3>Monochrome</h3>
    <img src="https://raw.githubusercontent.com/trbnhck/sequoia-theme-for-warp/main/preview/sequoia_monochrome.png?raw=true" width="500" alt="Monochrome" /> 
  </div>
</p>

<hr />

Sequoia Theme created by [Micheal Andreuzza](https://github.com/michael-andreuzza) and ported by Mike.

[^1]: The command gets the content of the `install.sh` script and then executes it. Take a look at the [source of the script](https://github.com/trbnhck/sequoia-theme-for-warp/blob/main/install.sh)
