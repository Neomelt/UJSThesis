#!/usr/bin/env python3
"""Small, dependency-free count for the chapter source files."""
from pathlib import Path
import re

files = sorted(Path("chapters").glob("*.tex"))
text = "\n".join(p.read_text(encoding="utf-8") for p in files)
text = re.sub(r"%.*", "", text)
text = re.sub(r"\\[A-Za-z@]+(?:\s*\[[^]]*\])?(?:\s*\{[^}]*\})?", " ", text)
chinese = len(re.findall(r"[\u3400-\u9fff]", text))
english = len(re.findall(r"\b[A-Za-z]+(?:'[A-Za-z]+)?\b", text))
print(f"Chinese characters: {chinese}")
print(f"English words: {english}")
