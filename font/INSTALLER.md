# Font Installer

1.  Navigate to [nerd-font](https://www.nerdfonts.com/font-downloads) and choose a font of
    your liking

    > [!IMPORTANT] fonts preview
    > You can preview any fonts in [programming-fonts](https://www.programmingfonts.org)

2.  Once you have selected a font, make sure it is downloadable at [nerd-fonts-releases](https://github.com/ryanoasis/nerd-fonts/releases)

3.  Add `your new font` to the `font_list` by doing **_one_** of the following:

    ```bash
    cd "${DOTFILES}" && vim font/font_list
    ```

    ```bash
    echo "myFontName" >> "${DOTFILES}/font/font_list"
    ```
