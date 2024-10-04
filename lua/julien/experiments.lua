function Hello()
    print("Hello, World!")
end

function P(value)
    print(vim.inspect(value))
    return value
end

local runPhpUnit = function()
    -- local bufnr = vim.api.nvim_create_buf(true, true)
    -- vim.api.nvim_open_term(bufnr, {})
    vim.cmd("vsplit | term php vendor/bin/phpunit %")
end

local runParatest = function()
    vim.cmd("vsplit | term php vendor/bin/paratest %")
end

local runPhpStan = function()
    vim.cmd("vsplit | term php vendor/bin/phpstan analyze %")
end

local php_test_methods_query = vim.treesitter.query.parse(
    "php",
    [[
(method_declaration
    (visibility_modifier)
    name: (name) @method_name)
    ]]
)

local get_tree_root = function(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "php", {})
    local tree = parser:parse()[1]

    return tree:root()
end

MyTreesitter = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    local tree_root = get_tree_root(bufnr)
    local changes = {}

    for id, node in php_test_methods_query:iter_captures(tree_root, bufnr, 0, -1) do
        local name = php_test_methods_query.captures[id]

        if "method_name" == name then
            
        end
        P(name)
    end
end

local phpDoc = function()
    local word
    local visual_mode = vim.fn.mode() == "v"

    if visual_mode == true then
        local previous_saved_value_on_register = vim.fn.getreg("v")
        -- yank current visual selection on register "v"
        vim.cmd([[noautocmd sil norm! "vy]])
        local selected_value_from_register = vim.fn.getreg("v")

        -- reset register "v" previous value (if any)
        vim.fn.setreg("v", previous_saved_value_on_register)

        word = selected_value_from_register
    else
        vim.ui.input({
            prompt = "PHP Documentation > "
        }, function (input)
            word = string.gsub(input, "-", "_")
        end)
    end

    local url = vim.uri_encode("https://php.net/" .. word)
    vim.ui.open(url)
end

TestSelect = function()
    vim.ui.select({'Option A', 'Option B', 'Option C'}, {
        prompt = "Pick one option:",
    }, function (choice)
        print(choice)
    end)
end

vim.keymap.set("n", "<leader>rp", runPhpUnit)
vim.keymap.set("n", "<leader>rpp", runParatest)
vim.keymap.set("n", "<leader>rps", runPhpStan)

vim.keymap.set({"n", "v"}, "<leader>pf", phpDoc)
