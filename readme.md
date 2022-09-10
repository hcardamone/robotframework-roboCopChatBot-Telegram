# Welcome to Robot Framework-Selenium-roboCopChatBot

Robot Framework-Selenium-roboCopChatBot is an study about automated testing framework developed using [Robot Framework](https://robotframework.org/) with [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)

## Writer in BDD Automation

To this project was used the Behavior-Driven Development (BDD) method to improve my skills also
my studies.

## About

The purpose is applying some studies to Automation, using [Robot Framework](https://robotframework.org/) libraries, [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) and my [roboCop Telegram-Bot](https://github.com/hcardamone/robotframework-roboCopChatBot-Telegram) project.
This is a starting guide meant to set the environment ready to run tests and to validate that **all automation developers have the same environment**, making easier to get information on website by selenium, extract this information, input on .json created and sent a telegram notification by [roboCop Telegram-Bot](https://github.com/hcardamone/robotframework-roboCopChatBot-Telegram).

## Requirements and tools

- ## Git SCM

  - Windows: Get last git [here](https://git-scm.com/download/win). Git Bash is recommended to work from Windows with almost the same features as Git on Linux.

- ## Python 3.10 or higher

  - Windows: get last Python installer [here](https://www.python.org/downloads/)

- ## Firefox Browser (geckdriver)

  - Download the firefox webdriver [geckodriver](https://github.com/mozilla/geckodriver/releases) to launch Firefox inside a sandbox. Is an implementation of WebDriver, and WebDriver can be used for widely different purposes. How you invoke geckodriver largely depends on your use case.

- ## Robotidy (Optional)

  - Download the latest release [here](https://github.com/MarketSquare/robotframework-tidy) - library  optional, Robotidy is a tool for autoformatting Robot Framework code.

- ## True Path (Optional)

  - This extension was installed on Chrome to get the xpath element. TruePath generates the relative XPath, script and analyzes code on click.

- ## Robocop (Optional)

  - Robocop is a tool that performs static code analysis of [Robot Framework](https://github.com/robotframework/robotframework) code.
    It uses official [Robot Framework parsing API](https://robot-framework.readthedocs.io/en/stable/) to parse files and run number of checks, looking for potential errors or violations to code quality standards.

## Setup Guide

## Python Virtual Environment

> **Hint**: On Git Bash you can find where Python is located run `which python` or `which python3`. Then you can set your path accordingly the correct Python version.

1. After cloning the project repository, then create the Python Virtual Environment `env` (can be the name you want)

   ```python
   cd ~/robotframework-selenium-roboCopChatBot-automation
   $ python -m venv env
   ```

> **Hint**: `py -m pip install --user virtualenv` To install the python virtual environment

1. Add path setting to activate script

   ```python
   echo -e "\n# Sets PYTHONPATH var within virtualenv\nexport PYTHONPATH=$(pwd)" >> ./env/Scripts/activate
   ```

1. Activate the Virtual Environment, then you should see the **(env)** prefix in your bash prompt.

   ```python
   user@host: ~/robotframework-selenium-roboCopChatBot-automation (branch)
   $ source ./env/Scripts/activate 
   (env)

> **Hint**: To exit `virtualenv` just type `deactivate`. To close Git Bash window type `exit`.

## Firefox Browser (geckdriver) setup

  [geckodriver](https://firefox-source-docs.mozilla.org/testing/geckodriver/Usage.html#selenium) on Window systems you can change the system path by right-clicking My Computer and choosing Properties. In the dialogue that appears, navigate Advanced → Environmental Variables → Path.
  Or in the Windows console window:

```python
    set PATH=%PATH%;C:\bin\geckodriver
```

## Robotidy library (Optional)

   This library will be installed on `requirements.txt`.

## True Path Extension (Optional)

1. Search this extension on your store browser, in this case was used on Google `Chrome`. Check on the [link](#useful-links)

## Robocop library (Optional)

   This library will be installed on `requirements.txt`.

## SAP Test Automation dependencies

- ### Install Python packages: run this command after cloning the repo

  ```python
  (env) $ pip install -r requirements.txt
  ```

> **Hint** You can run this command on the Python virtual Environment.

## Visual Studio Code Plugins

VS Code is the recommended IDE, although barely anyone can be used.
These are suggested VS Code plugins that best fit this automation project:

- [Git Lens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) - great plugin to know instant Git blame info.
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python) - a must have for all Python developers.
- [Robot Code](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode) - this is a very stronger robot framework extension. PS: The [Robot Framework Intellisense](https://marketplace.visualstudio.com/items?itemName=TomiTurtiainen.rf-intellisense) extension has been deprecated.
- [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) - YAML plugin supported by Red Hat, so no further comments.
- [XML Tools](https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml) - Plugin with many useful commands to work with XML files.
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) - Optional but great extension to give a nice touch on file icons.
- [JSON Pretty Printer](https://marketplace.visualstudio.com/items?itemName=euskadi31.json-pretty-printer) - Optional but great extension to give a nice .json indentation.
- [Path Intellisense](https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense) - Optional but great extension to give autocomplete filenames.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker#:~:text=Open%20up%20VS%20Code%20and,and%20reload%20window%20to%20enable.) - Optional but a great extension to check that works well with code and documentation.

## Running a Test Suite

1. First make a copy of file telegram_variables_template.py to your home user folder and remove the -template suffix.

2. File telegram_variables has all initial variables to run RF and you have to change to fit your machine settings as needed, since it won't be committed anyway as each automation developer can have different settings:

    - `HOST_GET_UPDATES` = `"https://api.telegram.org/bot{token}/getMe"`
        A simple method for testing your bot's auth token. There's a… bot for that. Just talk to BotFather and follow a few simple steps. Once you've created a bot and received your authentication token, head down to the Bot API manual to see what you can teach your bot to do.

    - `HOST_SEND_MESSAGE` = `"https://api.telegram.org/bot{token}/sendMessage"`
        Use this method to send text messages. On success, the sent Message is returned.
    - `CHAT_ID` = `"YOURCHATID"`
        Take the `{YOURCHATID}` value, it should be around 9 numbers. _**IMPORTANT**_: It's a _**security best practice**_ to **NEVER** commit **HOST_GET_UPDATES**, **HOST_SEND_MESSAGE** and **CHAT_ID** in code repositories.
3. File `payload_template.json` contain the `BODY PARAMS`. `chat_id` is the _Unique_ _identifier_ for the target chat or username of the target channel (in the format `@channelusername`). `text` to text of the _message_ to be sent. `parse_mode` Send **Markdown** or **HTML**, if you want Telegram apps to show **bold**, _italic_, fixed-width text or inline URLs in your bot's message. Optional `disable_web_page_preview` a boolean PARAM disables link previews for links in this message. `disable_notification` boolean sends the message silently. iOS users will not receive a notification, Android users will receive a notification with no sound. Other apps coming soon. `reply_to_message_id` if the message is a reply, ID of the original message. `reply_markup` additional interface options. A JSON-serialized object for a custom reply keyboard, instructions to hide keyboard or to force a reply from the user.
4. To run the `demo` test tag from demo.robot suite on another Git Bash / terminal window, activate the Python Virtual Environment as stated before and use this command:

- **Running test suite**

   ```python
   (env) 
   $ robot --variablefile ./resources/python-telegram-bot/telegram-variables/telegram_variables.py --loglevel DEBUG --outputdir results ./tests/demo.robot
   ```

- **Running/Commands Robotidy**

    ```python
   (env)
   $ robotidy --configure AlignKeywordsSection:alignment_type=auto resources/
   $ robotidy -c SmartSortKeywords:enabled=True resources/tests/demo.robot
   $ robotidy --configure SmartSortKeywords:enabled=True resources/
   ```

- **Running/Commands Robocop**

    ```python
   (env)
   $ robocop --list
   $ robocop --list-c too-many-calls-in-keyword
   $ robocop -c 0503:max_calls:15 resources/
   $ robocop file.robot resources/etc test.robot 
   $ robocop --reports timestamp,all
   $ robocop --reports timestamp,all resources/
   $ robocop --reports all,sarif
   ```

## Useful Links

- [Robot Framework User Guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [robotframework-roboCopChatBot-Telegram](https://github.com/hcardamone/robotframework-roboCopChatBot-Telegram)
- [Git Tutorial](https://testautomationu.applitools.com/git-tutorial/)
- [Geckdriver (Mozilla Firefox)](https://firefox-source-docs.mozilla.org/testing/geckodriver/Usage.html#selenium)
- [True Path Extension](https://chrome.google.com/webstore/detail/truepath/mgjhkhhbkkldiihlajcnlfchfcmhipmn)
- [Robotidy 3.2](https://robotidy.readthedocs.io/en/stable/#)
- [Robocop 2.3.0](https://robocop.readthedocs.io/en/stable/)

<!-- **Hint**: Markdown preview
`Ctrl+Shift+V` >
