# 🎨 Kenney UI-Pack Starter Kit for Godot

这是一个基于 **Kenney's UI Pack** 实现的 Godot 用户界面主题项目，采用了全程编程式的方式自定义样式，适用于构建统一且美观的 UI 系统。

---

## 🧰 如何集成到你的项目？

你可以轻松地将本 Starter Kit 应用于你现有的 Godot 项目：

1. 将本项目中的 `themes/` 文件夹复制到你的项目中
2. 在 Godot 的 **AssetLib** 中搜索并安装插件 **[ThemeGen](https://godotengine.org/asset-library/asset/ThemeGen)**
3. 打开 **Project > Project Settings > Plugins**，启用插件：`theme_gen_save_sync`
4. 设置项目默认主题：

```plaintext
gui/theme/custom = res://themes/main_theme.tres
```

---

## 🧱 支持的 UI 控件

> 当前示例主题采用蓝色为主色调，视觉统一、现代感强。

已支持以下常见 UI 控件（包含默认样式及交互状态）：

* [x] `Panel`
* [x] `PanelContainer`
* [x] `MarginContainer`
* [x] `Label`
* [x] `RichTextLabel`
* [x] `BoxContainer`
* [x] 输入类组件：

  * [x] `LineEdit`
  * [x] `TextEdit`
  * [x] `CodeEdit`
* [x] `Button`

  * [x] 主按钮 Primary（蓝色主题）
  * [ ] 次按钮 Secondary（可扩展）
  * [ ] 成功按钮 Success（可扩展）
  * [ ] 警告按钮 Warning（可扩展）
  * [ ] 危险按钮 Danger（可扩展）
* [x] `CheckBox` & `RadioButton`
* [x] `TabContainer`
* [x] `Tree`
* [x] `ItemList`
* [x] `ProgressBar`
* [x] `ScrollBar`

---

## 🙏 特别鸣谢

* 🎨 **Kenney's Assets** —— 免费、开放的高质量游戏 UI 素材： [https://kenney.nl](https://kenney.nl)
* 🧠 **Godot Engine 团队** —— 强大且自由的开源游戏引擎

---

## 🚀 本主题已应用于以下项目

* [🔍 GreyHack 存档查看器](https://github.com/Kingsmai/greyhack-save-viewer)

---

## 🧑‍💻 欢迎贡献项目展示！

如果你在自己的项目中使用了本主题，非常欢迎你在 [Issues](https://github.com/your-repo/issues) 中提交项目链接，我们将乐于将其收录在本页面中 📝✨

---

## 📜 License

本项目遵循 MIT 协议开源，使用的第三方资源（如 Kenney UI 资源）遵循其各自的开源许可。

---

让我们一起构建更美的 Godot 界面吧！🚀
