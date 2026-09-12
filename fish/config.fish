if status is-interactive
    # 1. تفعيل Starship و Zoxide للنوافذ التفاعلية فقط
    starship init fish | source
    zoxide init fish | source

    # 2. تطبيق ألوان Wallust
    if test -f ~/.cache/wallust/sequences
        cat ~/.cache/wallust/sequences
    end

    # 3. تشغيل Fastfetch عند فتح الترمينال
    fastfetch
end

# 4. الـ Aliases (بدون عجقة كوتس زيادة)
alias dlmp3="yt-dlp -x --audio-format mp3 --embed-metadata --embed-thumbnail -o \"$HOME/Music/%(title)s.%(ext)s\""
alias dlvid="yt-dlp --embed-metadata --embed-thumbnail -o \"$HOME/Videos/%(title)s.%(ext)s\""

# 5. دالة الكلمات TUI النظيفة
function lyrics
    set -l raw_dir "$HOME/.local/share/lrc-tools/lyrics/raw"
    set -l proc_dir "$HOME/.local/share/lrc-tools/lyrics/processed"

    mkdir -p $raw_dir $proc_dir

    lrc-fetch --audio-dir ~/Music --output-dir $raw_dir
    lrc-processor --lrc-dir $raw_dir --audio-dir ~/Music --output-dir $proc_dir --overwrite
    lrc-vis --lrc-dir $proc_dir
end
