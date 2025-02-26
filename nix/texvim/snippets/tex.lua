local function in_math()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

normal_snippets = {
    s("beg", fmt([[
        \begin{<>}
            <>
        \end{<>}
    ]], {i(1), i(0), rep(1)}, {delimiters='<>'})),
    s("enum", fmt([[
        \begin{enumerate}
            <>
        \end{enumerate}
    ]], {i(0)}, {delimiters='<>'})),
    s("ulist", fmt([[
        \begin{itemize}
            <>
        \end{itemize}
    ]], {i(0)}, {delimiters='<>'})),
    s("mk", { t("$ "), i(1), t(" $ "), i(0) }),
    s("dm", fmt([[
        $$
        <>
        $$
    ]], {i(0)}, {delimiters='<>'})),
    s("sec", {t("\\section{"), i(0), t({ "}", "" })}),
    s("blank", t("\\rule{1cm}{0.01cm}")),
    s("it", { t("\\textit{"), i(1), t("} "), i(0) }),
    s("bf", { t("\\textbf{"), i(1), t("} "), i(0) }),
    s("ul", { t("\\underline{"), i(1), t("} "), i(0) }),
    s("vec", { t("\\vv{\\bm{"), i(1), t("}} "), i(0) }, { condition = in_math }),
}

auto_snippets = {
    s({ trig = "//", wordTrig = false }, {t("\\dfrac{"), i(1), t("}{"), i(2), t("} "), i(0)}, { condition = in_math }),
    s({ trig = "sr", wordTrig = false }, t("^{2} "), { condition = in_math }),
    s({ trig = "cb", wordTrig = false }, t("^{3} "), { condition = in_math }),
    s({ trig = "rd", wordTrig = false }, { t("^{"), i(1), t("} "), i(0) }, { condition = in_math }),
    s({ trig = "_", wordTrig = false }, { t("_{"), i(1), t("} "), i(0) }, { condition = in_math }),
    s({ trig = "ee" }, { t("e^{"), i(0), t("} ") }, { condition = in_math }),
    s({ trig = "sq", wordTrig = false }, { t("\\sqrt{"), i(1), t("}" ), i(0) }, { condition = in_math }),
    s({ trig = "sin", wordTrig = false }, t("\\sin "), { condition = in_math }),
    s({ trig = "cos", wordTrig = false }, t("\\cos "), { condition = in_math }),
    s({ trig = "tan", wordTrig = false }, t("\\tan "), { condition = in_math }),
    s({ trig = "csc", wordTrig = false }, t("\\csc "), { condition = in_math }),
    s({ trig = "sec", wordTrig = false }, t("\\sec "), { condition = in_math }),
    s({ trig = "cot", wordTrig = false }, t("\\cot "), { condition = in_math }),
    -- Greek letters
    s({ trig = "@a", wordTrig = false }, t("\\alpha "), { condition = in_math }),
    s({ trig = "@b", wordTrig = false }, t("\\beta "), { condition = in_math }),
    s({ trig = "@g", wordTrig = false }, t("\\gamma "), { condition = in_math }),
    s({ trig = "@G", wordTrig = false }, t("\\Gamma "), { condition = in_math }),
    s({ trig = "@d", wordTrig = false }, t("\\delta "), { condition = in_math }),
    s({ trig = "@D", wordTrig = false }, t("\\Delta "), { condition = in_math }),
    s({ trig = "@e", wordTrig = false }, t("\\epsilon "), { condition = in_math }),
    s({ trig = ":e", wordTrig = false }, t("\\varepsilon "), { condition = in_math }),
    s({ trig = "@z", wordTrig = false }, t("\\zeta "), { condition = in_math }),
    s({ trig = "@t", wordTrig = false }, t("\\theta "), { condition = in_math }),
    s({ trig = "@T", wordTrig = false }, t("\\Theta "), { condition = in_math }),
    s({ trig = "@k", wordTrig = false }, t("\\kappa "), { condition = in_math }),
    s({ trig = "@l", wordTrig = false }, t("\\lambda "), { condition = in_math }),
    s({ trig = "@L", wordTrig = false }, t("\\Lambda "), { condition = in_math }),
    s({ trig = "@s", wordTrig = false }, t("\\sigma "), { condition = in_math }),
    s({ trig = "@S", wordTrig = false }, t("\\Sigma "), { condition = in_math }),
    s({ trig = "@o", wordTrig = false }, t("\\omega "), { condition = in_math }),
    s({ trig = "ome", wordTrig = false }, t("\\omega "), { condition = in_math }),
    -- Additional mappings from the table
    s({ trig = "eta", wordTrig = false }, t("\\eta "), { condition = in_math }),
    s({ trig = "mu", wordTrig = false }, t("\\mu "), { condition = in_math }),
    s({ trig = "nu", wordTrig = false }, t("\\nu "), { condition = in_math }),
    s({ trig = "xi", wordTrig = false }, t("\\xi "), { condition = in_math }),
    s({ trig = "Xi", wordTrig = false }, t("\\Xi "), { condition = in_math }),
    s({ trig = "pi", wordTrig = false }, t("\\pi "), { condition = in_math }),
    s({ trig = "Pi", wordTrig = false }, t("\\Pi "), { condition = in_math }),
    s({ trig = "rho", wordTrig = false }, t("\\rho "), { condition = in_math }),
    s({ trig = "tau", wordTrig = false }, t("\\tau "), { condition = in_math }),
    s({ trig = "phi", wordTrig = false }, t("\\phi "), { condition = in_math }),
    s({ trig = "Phi", wordTrig = false }, t("\\Phi "), { condition = in_math }),
    s({ trig = "chi", wordTrig = false }, t("\\chi "), { condition = in_math }),
    s({ trig = "psi", wordTrig = false }, t("\\psi "), { condition = in_math }),
    s({ trig = "Psi", wordTrig = false }, t("\\Psi "), { condition = in_math }),
    s({ trig="((\\d+)|(\\d*)(\\\\)?([A-Za-z]+)((\\^|_)(\\{\\d+\\}|\\d))*)\\/", name='fraction', dscr='auto fraction 1', trigEngine="ecma"},
    fmta([[
            \frac{<>}{<>} <>
        ]],
        { f(function (_, snip)
            return snip.captures[1]
        end), i(1), i(0) }
    ),
    { condition = in_math, show_condition = in_math }),
}

return normal_snippets, auto_snippets
