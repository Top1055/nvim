
local function rust_cmd(command)
    local filetype = vim.bo.filetype
    if filetype == "rust" then
        local extension = vim.fn.expand("%:e")
        if extension == "rs" then
            vim.cmd("!"..command)
        end
    end
end

vim.keymap.set("n", "<leader>c", function() rust_cmd('cargo check') end)
vim.keymap.set("n", "<leader>b", function() rust_cmd('cargo build') end)
