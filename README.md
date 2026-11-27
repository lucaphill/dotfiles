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
   
   ![GitHub last commit (by committer)](https://img.shields.io/github/last-commit/osmarmora05/.dotfiles?style=for-the-badge&labelColor=%23252733&color=%23cba6f7)
   ![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/osmarmora05/.dotfiles?style=for-the-badge&labelColor=%23252733&color=%23a6e3a1)
   ![GitHub Repo stars](https://img.shields.io/github/stars/osmarmora05/.dotfiles?style=for-the-badge&labelColor=%23252733&color=%23f5c2e7)
   ![GitHub issues](https://img.shields.io/github/issues/osmarmora05/.dotfiles?style=for-the-badge&labelColor=%23252733&color=%2399d1db)

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
> Se for usar o stow para gerenciar seus arquivos, quando for editar algo, edite em `dotfiles` e não na sua `.config`.
>
> Sempre que criar um **arquivo novo**, rode `stow .` na pasta dotfiles (lembre de fazer backup antes)

## Dependências (caso for usar alguma dessas coisas)
```bash
# Se quiser importar mais fácil a configuração, use o stow
sudo pacman -S stown
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
mkdir dotfiles # cria uma pasta nova no seu sistema
cd dotfiles # entra nela
git clone git@github.com:lucaphill/dotfiles.git
# depois disso, entre no diretório criado e rode o stown
cd dotfiles
stow . 
# se falar que tem algo duplicado, rode
stown --adopt . 
# basicamente um merge com prioridade para as suas configs de home/.config

# quando tiver importando para o seu sistema, depois de clonar já dentro da pasta use
stow --adopt . # cria os links mesmo que alguns tirem os arquivos do repositório
git restore . # restaura os arquivos do repositório, com isso atualizando nos links também
```
