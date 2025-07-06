# Jay Looney's Resume

This is the source repository where I store a version of my resume as code.

## Versioning

Rather than semver I've decided to go with a time based versioning system as the information is time sensitive.
v<Y>.<M>.<revision>
e.x. v2018.2.0 = The First Revision in February 2018

## Build

```shell
#nix run github:zenware/resume
nix build  # Just build the thing.
```

```shell
latexmk -lualatex -pdf document.tex  # Build a copy of the PDF
latexmk -pvc document.tex -f         # Automatically Recompile while Editing
```


```shell
latexmk -output-directory="./demo-out" -lualatex -pdf jakesresume.tex
latexmk -output-directory="./demo-out" -lualatex -pdf resume.tex
latexmk -output-directory="./demo-out" -lualatex -pdf resume-minimal.tex


```

## Progression

I started writing this in TeX /w LaTeX extensions in 2015 and since have
graduated to writing it in JSONResume and finally FRESH. LaTeX being a
typesetting language is the most capable of the three but requires the most
knowledge and tooling to use.

JSONResume by comparison is a dramatically simplified setup of a JSON blob
with relevant resume sections. FRESH is meant to be a standard schema for
supporting Resume data and has a format available in JSON and YAML

I've used and experienced all three for a while and am trending towards FRESH
because it's the most convenient to configure automated builds for.

2025-06-27 I'm switching back to LaTeX--it turns out it's the most stable
option and suffers the least from bit rot.


## Resources

- [Official NixOS Wiki for TexLive](nixos-wiki)
- [NixPkgs user guide for the new Tex Live interface in nixpkgs >= 23.11](nixpkgs-manual)
- https://flyx.org/nix-flakes-latex/
- https://github.com/Leixb/latex-template
- [Medium Article](medium-article) written by [@kersten.kriegbaum](kersten-kriegbaum)

[medium-article]: https://medium.com/digitalfrontiers/a-reproducible-latex-setup-on-macos-with-nix-flakes-direnv-tex-live-76333c8b8d20
[kersten-kriegbaum]: https://medium.com/@kersten.kriegbaum
[nixos-wiki]: https://wiki.nixos.org/wiki/TexLive
[nixpkgs-manual]:  https://nixos.org/manual/nixpkgs/stable/#sec-language-texlive-user-guide-experimental
