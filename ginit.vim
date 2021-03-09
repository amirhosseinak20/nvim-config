if(exists('g:GuiLoaded'))
    
  GuiFont! FiraCode\ Nerd\ Font:h11
  GuiPopupmenu 0
  GuiTabline 0
  GuiRenderLigatures 1 

endif

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'FiraCode Nerd Font 11')
endif
