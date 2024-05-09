local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local i = ls.insert_node
local d = ls.dynamic_node
local c = ls.choice_node
local t = ls.text_node
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

        -- Magic methods
        s('__con', fmt('{} function __construct(\n    {}\n) {{\n{}}}', { c(1, { t('public'), t('private') }), i(2), i(3) })),
        s('__des', fmt('public function __destruct({})\n{{\n    {}\n}}', { i(1), i(2) })),
        s('__toString', fmt('public function __toString(): string\n{{\n    {}\n}}', { i(1) })),
        s('__invoke', fmt('public function __invoke({})\n{{\n    {}\n}}', { i(1), i(2) })),

        -- Static methods
        s('pubsf', fmt('public static function {}({}): {}\n{{\n    {}\n}}', { i(1), i(2), i(3, 'self'), i(4) })),

        -- Templates
        s('class', fmt('<?php\n\nnamespace {}\n\n{}class {}{}\n{{\n    {}\n}}\n', { i(1), i(2), d(3, className), i(4), i(5) })),
        s('interface', fmt('<?php\n\nnamespace {}\n\ninterface {}{}\n{{\n    {}\n}}\n', { i(1), d(2, className), i(3), i(4) })),
        s('trait', fmt('<?php\n\nnamespace {}\n\ntrait {}\n{{\n    {}\n}}\n', { i(1), d(2, className), i(3) })),
        s('enum', fmt('<?php\n\nnamespace {}\n\nenum {}{}\n{{\n    case {}\n}}\n', { i(1), d(2, className), c(3, { t(''), t(': string') }), i(4) })),

        -- Tests
        s('test', fmt('{}\npublic function it_can_{}(): void\n{{\n    {}\n}}', { c(1, { t('#[Test]'), t('/** @test */') }), i(2), i(3) })),
    }
)
