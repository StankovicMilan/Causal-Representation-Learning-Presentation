# Seminar slides: Zhang et al. (2023), "Identifiability Guarantees for Causal Disentanglement from Soft Interventions"

Beamer deck for the ETH Student Seminar in Statistics (Representation Learning), presented on 30.11.2026 by
Milan Stankovic (method and application part) and Eugenio Laguna (theory part).

## Build

- `make`: builds `main.pdf` (latexmk + pdflatex).
- `make notes`: builds `main-notes.pdf`, with the speaker notes on a second screen to the right.
- `make clean`: removes the build files.

Always rebuild after an edit and check that the build succeeds. A build is fine when `main.log` has no `!` errors and no
large `Overfull \hbox` warnings. When you change layout, render the affected pages and look at them, e.g.
`pdftoppm -r 80 -png -f N -l N main.pdf /tmp/p`. Don't commit PDFs (they are gitignored).

## Layout

| File | Content |
|---|---|
| `main.tex` | document class, title, authors, date, and the order of the slide files |
| `beamerthemeeth.sty` | ETH theme: title page (photo + blue box), footer (logo, seminar name, date, page number), colours |
| `preamble.tex` | packages, notation macros, layout helpers, TikZ styles |
| `slides/01_motivation.tex` | slides 2–4: i.i.d. vs multi-domain, hard vs soft interventions, CRISPRa |
| `slides/02_theory.tex` | slides 5–17: setup, CD-equivalence, Assumptions 1–3, Lemma 1, Theorems 1–3, comparison, blueprint |
| `slides/03_vae.tex` | slides 18–27: discrepancy-based VAE (causal layer, ELBO, interventions, counterfactuals, MMD, loss) |
| `slides/04_application.tex` | slides 28–30: Perturb-seq data and results |
| `figures/` | PNG figures, ETH logo (`eth_logo.pdf`), title photo |

Slides 3–4 and 18–30 have speaker notes in `\note{...}` at the end of the frame. Keep them in sync when the content
of a slide changes.

## Style rules

- Very concise: short bullet fragments, as few full sentences as possible. The speaker says the rest.
- Prefer pictures and equations over text. Use the `Intuition:` line (`\lbl{Intuition:} ...`) for the one key idea.
- Frame titles are sentence-like and plain (no bold); theorem-style statements use
  `\begin{statement}{Theorem 1} ... \end{statement}` (bold label, italic body).
- Separate blocks with `\sep` (the thin full-width rule), not with blocks/boxes.
- Label/value rows use `\row{Label}{text}` (optional label width: `\row[3.6cm]{Long label}{text}`).
- Colours: only `ethblue` (#215CAF) as accent, `ethorange` and `ethlightblue` for highlights in diagrams.
- Small DAGs are drawn in TikZ with the `var` / `smallvar` / `edge` / `cut` styles from `preamble.tex`.

## Notation (macros in `preamble.tex`)

Always use the macros, never retype the symbols:

- `\cD` dataset 𝒟, `\cG` DAG 𝒢, `\hG` estimated DAG, `\cN` Gaussian, `\cH` RKHS, `\cL` loss, `\TS` transitive closure 𝒯𝒮
- `\PP` ℙ, `\EE` 𝔼, `\R` ℝ
- `\hU`, `\hI` (hat U, hat I), `\hZ`, `\Xcf`, `\Ucf` (wide hats for virtual counterfactuals)
- `\pa`, `\ch`, `\de`, `\rank`, `\poly`, `\GL`, `\diag`, `\MMD`, `\KL` (operators)
- `\indep`, `\nindep` (conditional independence), `\simCD`, `\otimesbar`, `\suppo` (interior of support), `\Ath` (A_θ)

## Content facts (from the paper, keep consistent)

- Linear SCM in the VAE: U = (I − A_θ)^{-1} Z, A_θ strictly triangular, L1 sparsity λ = 0.1.
- Intervention encoder: softmax target with temperature t = 1 for the first half, then annealed to 100.
- Loss: ELBO (β on the KL) − α·Σ MMD − λ‖A_θ‖₁; β and α warmed up from 0 to 1.
- Perturb-seq (Norman et al. 2019): 8,907 control cells, 99,590 perturbed cells, 105 genes, K = 217 datasets
  (105 single + 112 double), 5,000 HVGs, p = 105; R² ≈ 0.99/0.95 (single) and 0.98/0.88 (double);
  gene-program DAG with p = 7 recovers DUSP9 → MAPK1, DUSP9 → ETS2.
