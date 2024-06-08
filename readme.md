# ZJU CS Undergraduate Thesis Template 浙大CS本科论文模板

## 介绍

本项目为浙江大学计算机学院文献综述及开题报告、毕业论文的LaTeX模板。

* 精准复刻学院docx模板
* 自动管理目录、参考文献（gbt7714格式）、图表的标号
* 支持windows,linux,mac

## 使用方法

图形、外文原文的pdf位于`figure`文件夹中。
参考文献的BibLaTeX文件位于`common/references.bib`。

你需要编写`thesis.tex`以及`src`目录下的文件。

本模板为你提供了一些方便的命令：（此处感谢https://github.com/TheNetAdmin/zjuthesis/tree/master 提供的参考）

| 命令 | 说明 |
| --- | --- |
| `\fangsong, \songti, \heiti, \kaishu, \xingkai` | 设置不同的中文字体格式 |
| `\yihao, \xiaoyi, \erhao, \sanhao, \xiaosan, \sihao, \xiaosi,` | 设置不同的字号 |
| `\sectionnoname{section name}` | 无编号的小节（出现在目录中，有页码，无编号） |
| `\sectionnopage{section name}` | 无页码的小节（出现在目录中，无页码，无编号） |
| `\sectiontoconly{section name}` | 在目录中添加一个小节条目，无编号 |
| `\sectiontoconlynopage{section name}` | 在目录中添加一个小小节条目，无编号，无页码 |

### 全局配置

在`thesis.tex`的`\documentclass[]{zesis}`部分填写个人信息以及编译选项：

```tex
\documentclass[
    student     = 学生姓名,
    studentid   = 3200100000,
    college     = 计算机科学与技术学院,
    thtitle     = 你的毕业论文题目,
    submitdate  = 2024/5/20,
    instructor  = 导师姓名,
    grade       = 2020,
    major       = 计算机科学与技术,
    blind       = true,
    phase       = final,
    print       = true
]{zesis}
```

| 选项 | 值 | 说明 |
| --- | --- | --- |
| student |  | 你的姓名 |
| studentid |  | 你的学号 |
| college |  | 你的学院 |
| thtitle |  | 你的毕业论文题目 |
| submitdate |  | 交作业日期 |
| instructor |  | 指导老师的姓名 |
| grade |  | 你的年级 |
| major |  | 你的专业 |
| blind | true,false | 是否提交盲审。若为true，文中所有个人信息将会被空白替代。 |
| phase | pre,final,all | 论文阶段。<br/>pre：开题报告<br/>final：毕业论文<br/>all：开题报告和毕业论文 |
| print | true,false | 是否打印版。<br/>若为true，根据<br>《浙江大学本科生毕业论文（设计）编写规则》，文章中会包含：<br/>《浙江大学本科生毕业论文（设计）任务书》、<br/>《浙江大学本科生毕业论文（设计）考核表》、<br/>指导教师对文献综述和开题报告具体要求、 <br/>《浙江大学本科生文献综述和开题报告考核表》，<br/>并设置特定页面为单面打印。|




### 文献综述和开题报告

| 文件名 | 说明 |
| --- | --- |
| src/pre/original.tex | 外文原文 |
| src/pre/summary.tex | 文献综述 |
| src/pre/report.tex | 开题报告 |
| src/pre/translate.tex | 外文翻译 |

### 毕业论文

| 文件名 | 说明 |
| --- | --- |    
| src/final/abstract_zh.tex | 中文摘要 |
| src/final/abstract_en.tex | 英文摘要 |
| src/final/ack.tex | 致谢 |
| src/final/body.tex | 正文 |
| src/final/job.tex | 任务书 |

### 开发

模板提供的页面位于`lib`文件夹中。如果你需要修改模板本身以及模板提供的页面，可以参考：

| 文件名 | 说明 |
| --- | --- |
| zesis.cls | 论文模板类 |
| lib/final/cover.tex | 毕业论文封面|
| lib/final/eval.tex | 毕业论文考核表 |
| lib/final/promise.tex | 毕业论文承诺书 |
| lib/final/job.tex | 毕业论文任务书 |
| lib/final/main.tex | 毕业论文主体 |
| lib/pre/cover.tex | 开题报告封面 |
| lib/pre/eval.tex | 开题报告考核表 |
| lib/pre/requirements.tex | 开题报告要求页 |