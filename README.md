# QuickCube - SugarCube Project Generator
A simple SugarCube "new project generator"

## How to run
```
quickcube your project name
```
This will create a `your_project_name` folder with folders and files that will compile with `tweego` and have `:: StoryData`, `:: StoryTitle` and `:: Start` passages set.

## What the generator makes
- create folders
    - project_dir
        - src
        - dist
            - assets
        - .vscode
- create basic files
    - tasks.json
    - config.js
    - start.tw
    - assets.txt