{ pkgs, ... }:

{
  languages.typst = {
    enable = true;
    fontPaths = [
      "${pkgs.atkinson-hyperlegible}/share/fonts/opentype"
    ];
  };

  packages = with pkgs; [
    git
    gh
    just
  ];

  scripts."build".exec = ''
    set -euo pipefail
    mkdir -p out
    DATE=$(date +%Y-%-m-%-d)
    typst compile resume.typ "out/JayLooneyResume_''${DATE}.pdf"
    cp "out/JayLooneyResume_''${DATE}.pdf" out/JayLooneyResume_latest.pdf
    echo "Built out/JayLooneyResume_''${DATE}.pdf"
  '';

  scripts."watch".exec = ''
    mkdir -p out
    typst watch resume.typ out/JayLooneyResume_latest.pdf
  '';

  scripts."release".exec = ''
    set -euo pipefail
    VERSION="v$(date +%Y.%-m.%-d)"
    if git tag | grep -q "^$VERSION$"; then
      echo "Tag $VERSION already exists -- bumping revision"
      REV=1
      while git tag | grep -q "^$VERSION.$REV$"; do
        REV=$((REV + 1))
      done
      VERSION="$VERSION.$REV"
    fi
    echo "Releasing $VERSION"
    DATE=$(date +%Y-%-m-%-d)
    typst compile resume.typ "out/JayLooneyResume_''${DATE}.pdf"
    git add -A
    git commit --allow-empty -m "release: $VERSION"
    git tag "$VERSION"
    git push origin "$VERSION"
    echo "Released $VERSION -> out/JayLooneyResume_''${DATE}.pdf"
  '';
}
