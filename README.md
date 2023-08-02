# QuickCube - SugarCube Project Generator
A simple SugarCube "new project generator"

## How to run
```
quickcube your project name
```
This will create a `your_project_name` folder with folders and files that will compile with `tweego` and have `:: StoryData`, `:: StoryTitle` and `:: Start` passages set.

## What the generator makes
- create folders
    - project_name_dir - snakecase of whatever you name your project
        - src - the source folder
        - dist - the folder you'll share when you want others to run your project
            - assets - images and other assets
        - .vscode - tasks for QoL
- create basic files
    - tasks.json - compile and run (needs `tweego` and cli `live-server`)
    - config.js - Turns off auto `<br>`s
    - start.tw - adds `:: StoryData`, `:: StoryTitle` and `:: Start`
    - assets.txt - some tips on what you would put in `/assets`