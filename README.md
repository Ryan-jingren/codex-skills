# 我的 Codex 技能备份

备份日期：2026-10-12。此仓库按所有者要求公开。

## 已备份的技能

- codex-ppt：学术 PPT 工作流、风格模板及生成脚本。
- origin-publication-figure：Origin 科研绘图规范。
- research-paper-writing：学术写作规范、章节参考及示例。
- visio-image-rebuilder：Visio 可编辑图形重建流程及辅助脚本。

完整目录保存在 codex-skills-backup.zip 内，包含 91 个技能文件，以及安装脚本、中文恢复说明和 SHA-256 校验清单。

## 新电脑一键恢复（Windows）

1. 在 GitHub 点击 Code → Download ZIP，完整解压下载的仓库。
2. 双击 restore.cmd。
3. 脚本会解压技能备份包，校验全部技能文件，然后安装到当前用户的 .codex/skills；设置了 CODEX_HOME 时使用该目录下的 skills。
4. 安装前会备份已有同名技能。完成后重启 Codex。

也可以运行：

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\restore.ps1
```

如果客户端使用其他技能目录，可运行 restore.ps1 -Destination 指定路径。
ExecutionPolicy Bypass 只用于本次 PowerShell 进程，不修改系统保存的执行策略。

在新电脑可以向 Codex 发送：

> 从 https://github.com/Ryan-jingren/codex-skills 下载我的技能备份，检查后运行 restore.ps1，验证四个技能已安装，并报告缺少的外部依赖。

## 需要另行配置

Origin/OriginPro、Microsoft Visio、originlab/visio MCP 服务、PPT 的 Python 依赖及图片生成服务，需要在新电脑配置。本仓库不会自动安装这些软件。

备份不包含密码、API 密钥、聊天记录、客户端插件缓存或系统设置。登录同一 Codex 账号不会自动下载仓库。

这是一次备份快照；本机技能后续修改后，需要重新上传新的备份包。
