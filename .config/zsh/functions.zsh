# ~/.config/zsh/functions.zsh

# Atualiza o sistema
updt() {
  sudo pacman -Syu "$@"
}

# Reinicia direto na BIOS/UEFI
rebootuefi() {
  systemctl reboot --firmware-setup
}

# Soma a memória (PSS) dos processos que casam com o nome
memof() {
  if (( $# == 0 )); then
    echo "Uso: memof <nome>"
    return 1
  fi

  local -a pids
  pids=($(pgrep -if -- "$1"))
  if (( ${#pids} == 0 )); then
    echo "Nenhum processo encontrado"
    return 1
  fi

  local pid kb f
  local -i total=0
  for pid in $pids; do
    f=/proc/$pid/smaps_rollup
    [[ -r $f ]] || continue
    kb=$(awk '/^Pss:/ {print $2}' "$f")
    [[ -n $kb ]] || continue
    (( total += kb ))
  done

  printf "%.2f MB\n" $(( total / 1024.0 ))
}

# Autocomplete do memof: processos usando mais de ~10 MB de RSS
_memof() {
  local -a procs
  procs=(${(f)"$(ps -eo rss=,comm= | sort -rn | awk '$1>10000{print $2}' | sort -u)"})
  compadd -a procs
}
compdef _memof memof

# Define a palavra (argumento ou seleção primária) e mostra em notificação
define() {
  emulate -L zsh
  setopt extendedglob

  local word=$1 lang query def encoded

  [[ -z $word ]] && word=$(wl-paste --primary --no-newline 2>/dev/null)

  # minúsculas e remove espaços nas pontas
  word=${${(L)word}##[[:space:]]#}
  word=${word%%[[:space:]]#}

  if [[ -z $word ]]; then
    notify-send -t 3000 Dicionário "Nenhum texto selecionado."
    return 1
  fi

  encoded=$(jq -rn --arg w "$word" '$w | @uri')

  for lang in en pt-BR; do
    query=$(curl -s "https://api.dictionaryapi.dev/api/v2/entries/$lang/$encoded")
    def=$(print -r -- "$query" | jq -r 'if type == "array" then .[0].meanings[] | "\(.partOfSpeech): \(.definitions[0].definition)" else empty end' 2>/dev/null)

    if [[ -n $def ]]; then
      notify-send -t 10000 "$word ($lang)" "$def"
      return 0
    fi
  done

  notify-send -t 3000 Dicionário "Não encontrei: $word"
}

# superfile: ao sair, dá cd para a última pasta visitada
spf() {
  local spf_last_dir

  case "$(uname -s)" in
    Linux)  spf_last_dir="$HOME/.local/state/superfile/lastdir" ;;
    Darwin) spf_last_dir="$HOME/Library/Application Support/superfile/lastdir" ;;
  esac

  command spf "$@"

  if [[ -f $spf_last_dir ]]; then
    source "$spf_last_dir"
    rm -f -- "$spf_last_dir" >/dev/null
  fi
}
