# Alfred Workflow for Atom Projects

Currently very rough!

![screenshot](doc/Screenshot.png)

### What it does

- Looks for projects defined in `~/.atom/projects.cson`
- Lists them by title/path
- Selecting an entry just `atom $path`'s it

### Usage/setup

- Install the `.alfredworkflow` file from the [releases](https://github.com/JustinAiken/alfred-atom-projects/releases) page
- You might have to:
  - `cd` to the workflow directory
  - `bundle install`
  - If ^^ fails, then `gem install bundler` (or `sudo gem install bundler` if required)
