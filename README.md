# CV

This CV is written in LaTeX. `A_main.tex` is the document to compile; it loads
the local `_docstyle.sty` package and the section files (`B_*.tex`, `C_*.tex`,
and so on).

## Requirements

- A [LaTeX distribution](https://www.latex-project.org/get/) with **`latexmk`**
  and **`pdflatex`**. TeX Live or MiKTeX works on Windows, MacTeX on macOS, and
  TeX Live on Linux. A full installation includes the packages used by
  `_docstyle.sty`, such as French `babel`, `sourcesans`, TikZ, and
  `fontawesome5`.
- [Visual Studio Code](https://code.visualstudio.com/download) with the
  [LaTeX Workshop extension](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
  (`James-Yu.latex-workshop`) for editing and automatic builds.

Check that LaTeX is available from your terminal:

```sh
latexmk -v
pdflatex --version
```

If either command is unavailable, finish installing the distribution and
reopen your terminal or VS Code. If a build reports a missing `.sty` file,
install that package with your distribution's package manager.

## Build the PDF

Open the repository folder in VS Code and open `A_main.tex`. The checked-in
`.vscode/settings.json` configures LaTeX Workshop to run `latexmk` when you
save. The result is `build/A_main.pdf`.

To build from a terminal in the repository root instead, run:

```sh
latexmk -pdf -interaction=nonstopmode -file-line-error -synctex=1 -outdir=build A_main.tex
```

## Edit the CV

Edit the header and the `\input{...}` list in `A_main.tex`. Each section file
starts with `\cvsection{...}` and contains entries for that section. To show a
section, add its `\input{filename}` line in `A_main.tex` (omit the `.tex`
extension). For example, these existing files are currently excluded:

```tex
\input{H_formations_academiques_notables}
\input{J_competences}
```

The commented examples at the end of `A_main.tex` use older filenames; replace
them with the lines above if you want those sections. Keep `_docstyle.sty`
alongside `A_main.tex` so LaTeX can find it.

### Common entry examples

Commands with parameters take their arguments in order inside braces. Every
listed argument is required; use `{}` when an argument has no content. The last
argument of many entry commands can contain a normal `itemize` list:

```tex
\cvsection{Expériences professionnelles}

\cvexperience{2024}{Développeur}{Entreprise}{Montréal}
  {Conception de logiciels}
  {\begin{itemize}
     \item Automatisation des tests
     \item Documentation du projet
   \end{itemize}}

\cvsection{Prix et bourses}

\cvscholarship{2026}{Bourse de maîtrise}{20 000\$}
  {Université de Sherbrooke}{Sherbrooke}
  {\begin{itemize}
     \item Excellence du dossier académique
   \end{itemize}}
```

Use `\\` for a line break inside a date, for example
`{2026-2027 \\ (12 mois)}`. Escape LaTeX special characters in text, such as
`\$`, `\%`, and `\_`. Existing entries in
`G_experiences_professionnelles.tex` and `D_prix_et_bourses.tex` provide longer
examples, including `\vspace{-12pt}` before lists to tighten their spacing.

### `_docstyle.sty` command reference

The names below are in the exact order expected by each command. The
`\cvexpacad` row follows the implementation in `_docstyle.sty` (its nearby
source comment labels some arguments differently).

| Command | Arguments in order | Purpose |
| --- | --- | --- |
| `\cvheader` | name, role, email, phone, address, GitHub username, LinkedIn username | Contact header; use usernames rather than full profile URLs. |
| `\cvsection` | title | Section heading. |
| `\cveducation` | dates, institution, place, degree, program, grade | Academic degree. |
| `\cvgrant` | date, grant name, amount, institution, place, team, description | Research funding. |
| `\cvscholarship` | date, scholarship name, amount, institution, place, description | Scholarship or prize with an amount. |
| `\cvdistinction` | date, distinction, institution, place, description | Distinction without an amount column. |
| `\cvexperience` | dates, role, organization, place, summary, achievements | Professional experience. |
| `\cvexpacad` | dates, role, course code, course name, institution, place, summary, achievements | Academic or teaching experience. |
| `\cvformation` | date, course or training, grade, description, institution, place | Notable course or training. |
| `\cvpublication` | date, title, type, authors, venue, place or pages, contribution | Scientific publication or presentation. |
| `\cvskillheader` | none | Heading for the skills table. |
| `\cvskill` | level (0–5), category, description, tools or platforms | Skill row; level controls the five-block rating. |

For skills, place `\cvskillheader` before the first `\cvskill`. The style also
provides `\cvskillbar{level}`, `\cvskillseparator`, `\cvbullet`, and
`\cvemptybullet` for the rating bar, row separator, and filled or empty list
bullets. See `J_competences.tex` for their usual layout.
