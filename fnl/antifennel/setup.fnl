(module antifennel.setup
  {autoload {nvim aniseed.nvim
             a aniseed.core
             eval aniseed.eval
             env aniseed.env
             antifennel antifennel}})

(defn autocmd_keymap [ft group key call desc]
  (vim.api.nvim_create_autocmd
    [:FileType]
    {:pattern [ft] :group group
     :callback
     #(vim.api.nvim_buf_set_keymap
        0 :n key ""
        {:callback call :desc desc :noremap true :silent true})}))

(defn init []
  (when (= 1 (nvim.fn.has "nvim-0.7"))
    (nvim.create_user_command
      :AniseedAntifennelBuffer
      antifennel.lua_antifennel
      {})

    (nvim.create_user_command
      :AniseedAntiluaBuffer
      antifennel.fnl_antilua
      {})

    ;; install keymaps
    ;;   - C-c C-l for fennel buffer
    ;;   - C-c C-f for lua    buffer
    (let [grp (vim.api.nvim_create_augroup :aniseed_setting {:clear true})]
      (autocmd_keymap :lua    grp :<c-c><c-f> antifnl.lua_antifennel "Antifennel...")
      (autocmd_keymap :fennel grp :<c-c><c-l> antifnl.fnl_antilua    "Compiled lua source..."))
    ))

