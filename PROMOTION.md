# SpecX CLI 推广文案

---

## Twitter/X

### 帖子 1 - 发布宣布

🚀 SpecX CLI - Prompt to Spec in One Command

把随意的 prompt 编译成结构化 AI 规范

✨ 功能:
- 一键编译 prompt → SpecX
- 唯一 hash 验证
- 中英文支持
- 开发者友好 CLI

GitHub: github.com/BTCNAI/specx-cli

#AI #PromptEngineering #OpenSource #CLI

---

### 帖子 2 - 使用案例

你的 prompt 还在靠复制粘贴管理？

SpecX CLI 让 prompt 变成可版本化、可验证的 spec:

```bash
specx compile prompt.txt -o spec.md
```

每个 spec 都有唯一 hash，团队协作用起来！

github.com/BTCNAI/specx-cli

---

### 帖子 3 - CI/CD 集成

在 CI 里验证 prompt spec:

```yaml
- name: Validate Specs
  run: |
    specx compile prompts/*.txt --hash-only
```

Prompt 变更自动检测，防止意外修改。

github.com/BTCNAI/specx-cli

---

## Reddit

### r/MachineLearning

**Title:** SpecX CLI - Compile Prompts into Structured AI Specs

**Content:**

Hey r/MachineLearning!

I built **SpecX CLI** - a tool that compiles prompts into structured SpecX format with unique hash verification.

**Problem:** Prompts are unstructured, hard to version, and impossible to verify. When your team has hundreds of prompts, things get messy fast.

**Solution:** SpecX - a standardized format that turns any prompt into a verifiable spec with a unique hash.

**Quick Start:**
```bash
# Install
curl -L -o specx-macos https://github.com/BTCNAI/specx-cli/releases/download/v0.1.3/specx-macos
chmod +x specx-macos
sudo mv specx-macos /usr/local/bin/specx

# Usage
export SPECX_API_KEY=your_key
specx compile prompt.txt -o spec.md
```

**Features:**
- 🔧 One-command compile
- 🔐 Unique hash for each spec
- 🌐 Auto-detect Chinese/English
- 📦 CLI-first design

**GitHub:** https://github.com/BTCNAI/specx-cli

**Use Cases:**
1. Prompt version control
2. Team standardization
3. CI/CD validation

Would love your feedback! 🙏

---

### r/LocalLLaMA

**Title:** SpecX CLI - Standardize Your LLM Prompts

**Content:**

Hey r/LocalLLaMA!

Built a tool for managing prompts in a structured way.

**SpecX CLI** compiles prompts into standardized specs with hash verification.

Perfect for:
- Version controlling prompts
- Sharing reproducible prompt specs
- CI/CD validation for prompt changes

```bash
specx compile my-prompt.txt -o spec.md
```

Each spec gets a unique hash - great for tracking changes.

**GitHub:** https://github.com/BTCNAI/specx-cli

Tech Stack: Swift (macOS binary)

Let me know what you think!

---

### r/devops

**Title:** SpecX CLI - CI/CD for AI Prompts

**Content:**

Hey r/devops!

Built a tool for treating prompts like code.

**SpecX CLI** compiles prompts into structured specs with hash verification.

**CI/CD Integration:**
```yaml
- name: Validate Prompts
  run: |
    for prompt in prompts/*.txt; do
      specx compile "$prompt" --hash-only
    done
```

Detects prompt changes automatically, prevents accidental modifications.

**GitHub:** https://github.com/BTCNAI/specx-cli

Use case: AI teams who need to version and validate prompts like regular code.

---

## 知乎

### 问题：有哪些好用的 AI 开发工具推荐？

**回答：**

分享一个开源项目：**SpecX CLI**

**问题背景：**

做 AI 开发时，prompt 管理是个大问题：
- prompt 分散在各处，难以版本控制
- 无法验证 prompt 是否被修改
- 团队协作时没有统一标准

**解决方案：**

SpecX CLI - 把 prompt 编译成结构化 spec 的命令行工具。

**使用方式：**

```bash
# 安装
curl -L -o specx-macos https://github.com/BTCNAI/specx-cli/releases/download/v0.1.3/specx-macos
chmod +x specx-macos
sudo mv specx-macos /usr/local/bin/specx

# 编译 prompt
export SPECX_API_KEY=your_key
specx compile prompt.txt -o spec.md
```

**核心功能：**
- 一键编译 prompt → SpecX 格式
- 每个 spec 有唯一 hash，可追溯可验证
- 自动识别中英文
- CLI 设计，易于集成到 CI/CD

**使用场景：**
1. Prompt 版本控制
2. 团队标准化
3. CI/CD 自动验证

**GitHub：** https://github.com/BTCNAI/specx-cli

**技术栈：** Swift (macOS)

欢迎提 issue 和 PR！

---

## 掘金

**标题：** 我做了个 Prompt 编译器，让 AI 提示词可以版本控制

**内容：**

（使用上面的知乎回答，添加架构图和使用案例）

---

## LinkedIn

**Title:** Announcing SpecX CLI - Prompt to Spec in One Command

**Content:**

Excited to share **SpecX CLI** - an open-source tool for compiling prompts into structured AI specs.

**Problem:** Prompts are unstructured, hard to version, and impossible to verify.

**Solution:** SpecX format with unique hash verification.

**Key Features:**
- One-command compile
- Hash-based verification
- Multi-language support (zh/en)
- CLI-first design

**Perfect for:**
- AI Engineering teams
- Prompt Engineers
- MLOps pipelines

**Quick Start:**
```bash
specx compile prompt.txt -o spec.md
```

**GitHub:** https://github.com/BTCNAI/specx-cli

#AI #MachineLearning #PromptEngineering #OpenSource #DevTools #MLOps

---

## Product Hunt

**Title:** SpecX CLI - Compile Prompts into Structured AI Specs

**Tagline:** Prompt to Spec in One Command

**Description:**

SpecX CLI is a command-line tool that compiles prompts into structured SpecX format with unique hash verification.

**Problem:** Prompts are unstructured, hard to version, and impossible to verify.

**Solution:** A standardized format that turns any prompt into a verifiable spec.

**Features:**
- 🔧 One-command compile
- 🔐 Unique hash verification
- 🌐 Auto-detect Chinese/English
- 📦 Developer-friendly CLI

**Use Cases:**
1. Prompt version control
2. Team standardization
3. CI/CD validation

**Tech Stack:** Swift

**GitHub:** https://github.com/BTCNAI/specx-cli

---

## Email Template

**Subject:** SpecX CLI - Prompt to Spec Compiler

**Content:**

Hi,

I just launched **SpecX CLI** - a tool for compiling prompts into structured AI specs.

**Problem:** Prompts are unstructured, hard to version, and impossible to verify.

**Solution:** SpecX format with unique hash verification.

**Quick Start:**
```bash
specx compile prompt.txt -o spec.md
```

**GitHub:** https://github.com/BTCNAI/specx-cli

**Use Cases:**
- Prompt version control
- Team standardization
- CI/CD validation

Would love your feedback!

Best,
@btcnai

---

## 推广时间表

| 日期 | 渠道 | 内容 |
|------|------|------|
| Day 1 | Twitter/X | 发布宣布 |
| Day 1 | Reddit r/MachineLearning | 发帖 |
| Day 1 | Reddit r/LocalLLaMA | 发帖 |
| Day 2 | Reddit r/devops | 发帖 |
| Day 2 | 知乎 | 回答问题 |
| Day 3 | 掘金 | 技术文章 |
| Day 4 | LinkedIn | 专业帖子 |
| Day 5 | Product Hunt | 发布 |
| Day 7 | 总结 | 进展更新 |

---

## 目标

**短期 (1 个月):** 50 ⭐
**中期 (3 个月):** 200 ⭐
**长期 (6 个月):** 500 ⭐

---

**当前 Star 数：** 1 ⭐
