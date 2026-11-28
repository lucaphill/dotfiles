<!-- PROFILE PICTURE -->
<p align="center">
  <img width="15%" src="https://github.com/lucaphill.png" style="border-radius: 12px;"/>
</p>

<!-- NAME PROYECT -->
<p align="center">
  <b>~ configuration files ~</b>
</p>

<!-- STATISTCS -->
<div align="center"> 
   
   ![GitHub last commit (by committer)](https://img.shields.io/github/last-commit/lucaphill/dotfiles?style=for-the-badge&labelColor=%23252733&color=%23cba6f7)
   ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/lucaphill/dotfiles?style=for-the-badge&labelColor=%23252733&color=%23a6e3a1)
   ![GitHub Repo stars](https://img.shields.io/github/stars/lucaphill/dotfiles?style=for-the-badge&labelColor=%23252733&color=%23f5c2e7)
</div>

> [!Important]
> Minhas dotfiles estão sendo gerenciadas com o [GNU stow](https://www.gnu.org/software/stow/)

<!-- RICES -->
| <center><a href="">Niri</a><center>                                                              |
| ------------------------------------------------------------------------------------------------------------------  |
|<img width="1365" height="768" alt="screenshot_20261127_151339-region" src="https://github.com/user-attachments/assets/c4acd94c-c55b-4b3d-936f-88e9b0c54e7e" />                         |
|<img width="1365" height="767" alt="screenshot_20261127_155959-region" src="https://github.com/user-attachments/assets/721988b7-59ab-40c0-816e-20981854189e" />                         |
|<img width="1365" height="767" alt="screenshot_20261127_155738-region" src="https://github.com/user-attachments/assets/aabaef30-9091-4ba7-80db-d2f997b96673" />                         |



> [!Note]
> Provavelmente algumas coisas não vão funcionar de cara por vc precisar mudar os caminhos dos arquivos, também não vem nada visual do noctalia configurado por padrão
>
> Se for usar o stow para gerenciar seus arquivos, quando for editar algo, edite em `dotfiles` e não na sua `.config`. Se não souber como mexer nele, [indico esse vídeo](https://youtu.be/y6XCebnB9gs?si=RepS9maknOtyPqCF)
>
> Sempre que criar um **arquivo novo**, rode `stow .` na pasta dotfiles (lembre de fazer backup antes)

## Dependências (caso for usar alguma dessas coisas)
```bash
# Se quiser importar mais fácil a configuração, use o stow
sudo pacman -S stow
# fastfetch - baixe o pokemon colorscripts pelo yay ou pelo repositório deles
yay -S pokemon-colorscripts-git
# terminal - isso é completamente opicional, mas no meu caso estou usando o ghostty
sudo pacman -S ghostty
# Super File - para usar ele, além de baixar ele vamos precisar de uns extras para rodar as coisas, em ordem: visualizador de pdf e pacotes dele e visualizador basico de imagens
sudo pacman -S superfile zathura zathura-pdf-mupd imv 
# Para o euporie (jupyter notebook no terminal)
sudo pacman -S uv # para gerenciar instalações python
uv tool install euporie
```

## Instalação
Primeiramente, instale o [CachyOS](https://cachyos.org/), com o niri!

Após a instalação certifique-se que tem o git instalado e logado em uma conta
```bash
# clone o repositório
git clone git@github.com:lucaphill/dotfiles.git

mkdir dotfiles # cria uma pasta nova no seu sistema
# depois disso, entre no diretório criado, copie os arquivos do clone do github e rode o stown
cd dotfiles
# Se não quiser montar um repositório do git para sua contif (não recomendo), apague os arquivos do `.config` que tão duplicados e no mesmo terminal que já tava na pasta rode
stown . 

# Recomendado, criar um repositório seu com esses arquivos na pasta e depois rodar isso
stow --adopt . # cria os links mesmo que alguns tirem os arquivos do repositório
git restore . # restaura os arquivos do repositório, com isso atualizando nos links também
```

> ### Configurações especificas
> No meu caso, o cpufreq é o único jeito de mudar o modo de energia,então tem um atalho para isso.
>
> Para ele funcionar vc precisa desativar a necessidade de senha para o cpufreq
>```bash
>echo "$USER ALL=(ALL) NOPASSWD: /usr/bin/cpupower" | sudo tee /etc/sudoers.d/cpupower
>sudo chmod 440 /etc/sudoers.d/cpupower
>```
>
> #### Usando o foot como terminal
>
>Para usar ele, precisaremos mexer em algumas coisas para o tema funcionar nele
>1. Rode `bash` no terminal
>2. Cole o seguinte comando para gerar um arquivo de mudança de cores
>```bash
>#!/usr/bin/env bash
>T=~/.config/noctalia/templates/terminal-sequences
>mkdir -p ~/.config/noctalia/templates
>names=(black red green yellow blue magenta cyan white)
>{
>  printf '\033]10;{{colors.terminal_foreground.default.hex}}\007'
>  printf '\033]11;{{colors.terminal_background.default.hex}}\007'
>  for i in {0..7}; do
>    printf '\033]4;%d;{{colors.terminal_normal_%s.default.hex}}\007' "$i" "${names[$i]}"
>    printf '\033]4;%d;{{colors.terminal_bright_%s.default.hex}}\007' "$((i+8))" "${names[$i]}"
>  done
>  printf '\033]19;{{colors.terminal_selection_fg.default.hex}}\007'
>  printf '\033]17;{{colors.terminal_selection_bg.default.hex}}\007'
>  printf '\033]12;{{colors.terminal_cursor.default.hex}}\007'
>} > "$T"
>```
>3. confira se o arquivo foi gerado com:
>`cat -v ~/.config/noctalia/templates/terminal-sequences`
>4. Avise o noctalia que agora tem um arquivo novo para atualizar
>```toml
># ~/.config/noctalia/config.toml
>[theme.templates.user.terminal-sequences]
>input_path = '~/.config/noctalia/templates/terminal-sequences'
>output_path = '~/.cache/terminal-sequences'
>post_hook = 'tee /dev/pts/[0-9]* < ~/.cache/terminal-sequences > /dev/null'
>```
>### Se quiser desativar
>```bash
># remova o bloco do passo 2
>rm ~/.config/noctalia/templates/terminal-sequences ~/.cache/terminal-sequences
># tire oq colocamos na config do noctalia no passo 4
>```
>
