function define
    set word $argv[1]
    test -z "$word"; and set word (wl-paste --primary --no-newline 2>/dev/null)
    set word (string trim -- $word | string lower)

    if test -z "$word"
        notify-send -t 3000 Dicionário "Nenhum texto selecionado."
        return
    end

    set encoded (string escape --style=url -- $word)

    for lang in en pt-BR
        set query (curl -s "https://api.dictionaryapi.dev/api/v2/entries/$lang/$encoded")
        set def "$(echo $query | jq -r 'if type == "array" then .[0].meanings[] | "\(.partOfSpeech): \(.definitions[0].definition)" else empty end')"

        if test -n "$def"
            notify-send -t 10000 "$word ($lang)" "$def"
            return
        end
    end

    notify-send -t 3000 Dicionário "Não encontrei: $word"
end
