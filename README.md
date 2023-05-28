# Python Project Assistant (PPA)

Setting up a new Python project typically involves multiple steps: 
  creating a new directory, 
  setting up a virtual environment, 
  installing necessary packages, and 
  more. 
Each of these steps can be prone to errors, 
  especially for beginners or even experienced developers who might forget certain steps or configurations.

That's where PPA comes in. 
PPA is a utility script for managing Python projects. 
It automates these common setup tasks, allowing you to focus on what truly matters: your code. 

With PPA, 
  you can easily create new projects, 
  activate your development environment, 
  run tests, 
  generate coverage reports, and 
  manage your project's dependencies. 
By doing so, 
  it streamlines the development process, 
  making it more efficient and less error-prone.


## Table of Contents

- [PPA: Python Project Assistant](#ppa-python-project-assistant)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Commands](#commands)
    - [Example](#example)
  - [Contributing](#contributing)
  - [License](#license)

## Installation

```sh
source <( curl -s https://raw.githubusercontent.com/NawaMan/PythonProjectAssistant/main/install.sh )
```

## Usage

To use PPA, simply call the script followed by one of the commands and its arguments:

```sh
ppa <command> [arguments]
```

## Commands

```
[v]ersion                                      Returns the version of the application.
[c]reate      <project-name> [python-version]  Creates a new project.
[a]ctivate                                     Activates the current project.
[t]est        [test-name]                      Runs tests.
[c]o[v]erage  [test-name]                      Runs tests and generates coverage report. FORMAT=report format (html, xml, lcov).
[i]nstall     [packages]                       Installs packages.
[u]ninstall   [packages]                       Uninstalls packages.
```

### Example

To create a new project named "my_project" with Python 3.8, you would run:

```sh
ppa create my_project 3.8
```

This will create a new directory named "my_project", set up a virtual environment with Python 3.8, and install some default packages (`pytest`, `pylint`, `coverage`, `pytest-cov`).

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

MIT
