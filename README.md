# dotfiles

Configurações montadas para usar o niri + noctalia, se não estiver usando algum desses algumas coisas serão diferentes

## Nota
Se seu sistema não estiver em português, mude o nome da pasta Imagens para ficar igual a sua
- Na pasta Imagens/coisas importantes: estão arquivos para usar em widgets do noctalia, como não podemos apagar/mover eles é bom ter um lugar fixo

## Dependências
```bash
# fastfetch - baixe o pokemon colorscripts pelo yay ou pelo repositório deles
yay -S pokemon-colorscripts-git
# Para o euporie (jupyter notebook no terminal)
sudo pacman -S uv # para gerenciar instalações python
uv tool install euporie
```

## Instalação
Primeiro se certifique que tem o git instalado e logado em uma conta
```bash
# clone o repositório
git clone git@github.com:lucaphill/dotfiles.git
# instale o stow
sudo pacman -S stown
# depois disso, entre no diretório criado e rode o stown
cd dotfiles
stow . 
# se falar que tem algo duplicado, rode
stown --adopt . 
# basicamente um merge com prioridade para as suas configs de home/.config
```



> [!quote]- Foot
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