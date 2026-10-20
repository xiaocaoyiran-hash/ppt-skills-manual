# PPT Skills 图鉴 · 使用说明书（运营使用版）

一份讲「怎么用图鉴这个网页」的 HTML 说明书，配套已上线的图鉴站点。

## 这是什么

- 对象：https://kb-qa-agent-92848.app.workbuddy.host/ （PPT Skills 图鉴 · 运营使用版）
- 内容：227 个外部 AI 幻灯片 skill 的挑选方法 —— 不是 skill 商店，是一个决策工具。
- 形态：单文件 `index.html`，纯静态，零依赖，可直接打开或部署。

## 本地预览

```bash
cd F:/work/ppt-skills-manual
python -m http.server 8098 --bind 127.0.0.1
# 打开 http://127.0.0.1:8098/
```

## 设计说明

- **品牌体系**：研选家 2026 品牌规范 —— 标准色 `#11af8e`，辅助色 `#fcd058` / `#8fd3f5`；light-first，浅色页配普通 logo，深色场景配反白 logo（本说明书为浅色，统一使用普通 logo）。
- **图表**：用 smart-charts 抽取的 ECharts 内核（`assets/charts/echarts.min.js`），两张图分别呈现「路线分布」与「能力覆盖」，数值全部来自 `F:/work/ppt-skills-atlas/data/skills.json` 实测：路线 html 83 / pptx 79 / hybrid 25 / framework 12 / image 11 / suite 9 / templates 8；能力中支持 →PPTX 17、演讲者模式 4、自定义模板 7、数据图表 10、图示 16、动效 17。
- **排版语言**：参考 html-exhibition / beautiful-html-templates / html-ppt / ppt-director 等技能的设计约定（左对齐标题、分区卡片、等宽标签、留白优先），用 CSS 本地复刻，不调用其运行时。
- **Canva**：本想用 Canva 可画生成封面主视觉，但本月 AI 额度已耗尽（生成接口返回额度用尽），故改为用品牌 CSS 复刻其扁平 editorial 风格封面。后续额度恢复后可在 Canva 内按本说明书封面文案重做并导出。

## 数据准确性

- 与图鉴站点同源（many-ppt-skills 登记册，2026-09-04 刷新）；本说明书中的所有计数、层级、许可、能力数字均与 `data/skills.json` 逐项核对一致。
- 数据来源：many-ppt-skills 登记册（CC BY 4.0），页面保留来源链接以满足署名义务。

## 文件结构

```
ppt-skills-manual/
├── index.html            说明书（唯一入口，相对路径）
├── assets/
│   ├── brand/            logo.png（普通）+ logo-reverse.png（反白）
│   ├── charts/           echarts.min.js
│   └── img/              两张真实风格样图（editorial / swiss 版式示意）
└── README.md
```

## 发布 / 同步

通过 WorkBuddy 站点发布，得到可分享链接；改完说一句「同步线上」即覆盖更新，链接不变。
