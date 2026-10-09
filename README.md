# farfarfun Homebrew Tap

farfarfun 的 Homebrew tap，当前提供用于本机开发与服务管理的 `fundeploy`。

## 安装

```bash
brew tap farfarfun/tap
brew install fundeploy
```

也可以直接安装：

```bash
brew install farfarfun/tap/fundeploy
```

## 最小示例

安装后查看服务状态：

```bash
fundeploy service status
```

升级或卸载由 Homebrew 管理：

```bash
brew upgrade fundeploy
brew uninstall fundeploy
```

公式定义见 [`Formula/fundeploy.rb`](Formula/fundeploy.rb)，项目源码见
[`farfarfun/fundeploy`](https://github.com/farfarfun/fundeploy)。

---

## 关于 farfarfun

[farfarfun](https://github.com/farfarfun) 是一个专注于实用工具库的开源组织，
涵盖云存储、数据处理、AI、多媒体与开发工具链等方向。

- 🏠 组织主页：<https://github.com/farfarfun>
- 📧 联系：farfarfun@qq.com

本项目基于 [MIT](LICENSE) 协议开源。
