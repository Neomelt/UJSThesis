# UJSThesis

江苏大学本科毕业设计（论文）LaTeX 模板，按 [`docs/reference/jiangsu-university-format-2026.doc`](docs/reference/jiangsu-university-format-2026.doc) 整理。项目借鉴了 [konichan-7/TongjiThesis](https://github.com/konichan-7/TongjiThesis) 的模块化组织方式和构建体验，但 `style/ujsthesis.cls` 是面向江苏大学要求的独立实现，不复制同济大学格式。

## 快速开始

安装 TeX Live（推荐 2026 或更新版本）以及 XeLaTeX、Biber、GNU Make 后，在项目根目录运行：

```bash
make
```

输出文件为 `main.pdf`。清理中间文件使用 `make clean`，连同 PDF 一起清理使用 `make cleanall`。也可以运行 `make ENGINE=lualatex` 使用 LuaLaTeX。

## 在 Overleaf 上使用

项目可以直接导入 Overleaf：在本仓库页面选择 `Code -> Download ZIP`，在 Overleaf 新建项目时选择 `Upload Project` 上传 ZIP。导入后把 `main.tex` 设为主文档，把编译器设为 `XeLaTeX`，再点击 `Recompile`。根目录中的 `latexmkrc` 会让 Overleaf 使用 XeLaTeX 和 Biber，目录、交叉引用和参考文献会在需要时自动重复编译。

如果 Overleaf 项目默认使用了 `pdfLaTeX`，需要在 `Menu -> Settings -> Compiler` 中改为 `XeLaTeX`；本模板的中文字体和 `fontspec` 配置不支持 `pdfLaTeX`。模板默认使用 TeX Live 提供的 Fandol 字体，因此不需要上传 Windows 字体文件。导入完成后可以先保留示例内容编译一次，再逐步替换元数据、章节和参考文献。

## 写作顺序

1. 在 `main.tex` 中填写题目、学院、专业班级、学号、导师、日期、摘要和关键词。
2. 在 `chapters/` 中替换示例章节；正文每章使用 `\chapter`，二级和三级标题使用 `\section` 与 `\subsection`。
3. 在 `bib/references.bib` 中维护文献，并在正文使用 `\cite{key}`。文后参考文献由 Biber 按引用顺序生成。
4. 按学校要求补充图、表、公式、实验数据和附录。提交前检查 PDF 的封面、页眉、页码、目录、参考文献和打印样张。

## 格式范围

模板实现了 2026 版通用模板中可由 LaTeX 稳定表达的主要规则：A4 页面、中文/英文摘要、原创性声明、目录、章节层级、字体字号、1.5 倍近似行距、页眉、罗马数字前置页码、阿拉伯数字正文页码、GB/T 7714-2015 数字型参考文献、致谢和附录。

封面使用了从随项目提供的 Word 模板中直接解析出的江苏大学校徽和“江苏大学”毛笔字 PNG，并为学院、专业、学生和导师字段保留了模板中的横线。摘要首行缩进、目录标题字间距、页码字体、页眉横线以及参考文献—致谢—附录的顺序也按模板说明处理。图片来源和替换方式见 [`figures/README.md`](figures/README.md)，参考文档的用途说明见 [`docs/reference/README.md`](docs/reference/README.md)。

学校或学院后续发布的细则优先于本仓库默认值。模板没有替代学院任务书、评阅表、封面盖章和装订要求；这些材料应按学院流程另行准备。

附件中的示例说明参考文献通常不少于 15 篇、外文文献不少于 2 篇。本仓库的演示工程只放了少量用于验证 Biber 的示例条目，因此它不是一篇满足送审数量要求的真实论文；提交前需要用自己的文献替换并按学院细则核对数量和外文比例。

## 字体说明

模板默认使用随 TeX Live 提供的 FandolSong/FandolHei，便于 Linux、Overleaf 等环境构建。英文和数字默认使用 TeX Gyre Termes，作为 Times New Roman 的跨平台替代。若学院要求像素级复刻某台 Windows 电脑上的字体，应在目标机器安装对应字体后重新检查分页。

## 许可与来源

本项目的类文件为本项目独立编写，参考了所附江苏大学格式模板的公开排版约束。项目结构和构建入口参考了 [TongjiThesis](https://github.com/konichan-7/TongjiThesis)，其上游项目使用 LPPL-1.3c；本项目没有复制其类文件。示例文献仅用于验证构建，不构成论文内容或文献建议。
