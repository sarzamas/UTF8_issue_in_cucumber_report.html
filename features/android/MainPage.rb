class MainPage < Calabash::ABase
    def trait
    scroll_until_visible :text, LANG['settings'], :down
    "* tag:'settings'"
    end
end
