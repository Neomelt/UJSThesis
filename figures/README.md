# 封面图片

`jiangsu-university-emblem.png` 和 `jiangsu-university-calligraphy.png` 是从 [`docs/reference/jiangsu-university-format-2026.doc`](../docs/reference/jiangsu-university-format-2026.doc) 转换出的 DOCX 内部 `word/media` 直接解压得到的原始 PNG 资源，不是从页面截图裁剪的图片。文档类默认在封面使用这两个文件；如果学校发布了新的官方素材，可以在 `main.tex` 中用 `\ujsemblem{...}` 和 `\ujscalligraphy{...}` 替换路径。

这些图片属于学校模板配套资源，仓库保留它们是为了复现封面，不将学校标识的权利转授给第三方。正式发布或用于其他项目时，应遵守学校的标识使用要求。
