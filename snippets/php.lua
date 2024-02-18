local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local extras = require("luasnip.extras")
local l = extras.lambda
local fmt = require('luasnip.extras.fmt').fmt

-- The className function retrieves LSP filename without extension
-- in order to inject it as the class name following PHP convention.
local className = function ()
    return sn(nil, { l(l.TM_FILENAME_BASE, {}) })
end

ls.add_snippets(
    'php',
    {
        s('pubf', fmt('public function {}({}): {}\n{{\n    {}\n}}', { i(1), i(2), i(3, 'void'), i(4) })),
        s('prif', fmt('private function {}({}): {}\n{{\n    {}\n}}', { i(1), i(2), i(3, 'void'), i(4) })),
        s('prof', fmt('protected function {}({}): {}\n{{\n    {}\n}}', { i(1), i(2), i(3, 'void'), i(4) })),

        -- Static methods
        s('pubsf', fmt('public static function {}({}): {}\n{{\n    {}\n}}', { i(1), i(2), i(3, 'self'), i(4) })),

        -- Templates
        s('class', fmt('<?php\n\nnamespace {}\n\n{}class {}\n{{\n    {}\n}}\n', { i(1), i(2), d(3, className), i(4) })),
        s('interface', fmt('<?php\n\nnamespace {}\n\ninterface {}\n{{\n    {}\n}}\n', { i(1), d(2, className), i(3) })),

        -- Tests
        s('test', fmt('/** @test */\npublic function it_can_{}(): void\n{{\n    {}\n}}', { i(1), i(2) })),
    }
)
