# IntelliJ Setup & Config

### Plugins to install
 * Eclipse code formatter
 * Lombok
 * Sonar Lint
 * Codota
 * Maven Helper
 * Key Promoter X
 * Consolas and Consolas bold Font

### Be Aware
Intellij did not set the working directory path correctly for 2 modules inside a project. This led to the app not finding files (e.g. ../content/whitelabel/de/index).
The fix was to edit the run config -> Set the working directory again for each module.
 * Set the spring profiles for each project

### Intellij Cannot resolve symbol on import
 * File -> Invalidate Caches/Restart
 * https://stackoverflow.com/questions/26952078/intellij-cannot-resolve-symbol-on-import

### Import Settings
 * `File -> Manage IDE Settings -> Import Settings -> select intellijSettings.zip`
 * Run Configurations also need to be exported separately if needed

Check the following points again:

 1. `File -> Project Structure -> Project` Check SDK Language-Level
 2. `File -> Project Structure -> Facet` Check if modules are automatically recognized as Spring-Modules, if not add them manually
 3. `File -> Settings -> Editor -> File Encoding UTF-8` set as Global Encoding setting, (also for .propeties Files)
 4. `File -> Settings -> Editor`
    * Code Style Line separator -> Unix and OS X.
    * Deselect `Detect and use existing file indents for editing`
 5. cog wheel symbol at the top right corner of project preview -> always select opened file

If the config should be extracted from an Eclipse preferences file (Eclipse code formatter is needed):

Code Style: 
 * `IntelliJ IDEA -> Preferences -> Eclipse Code Formatter -> Eclipse Formatter Config -> Browse -> xyzConfig.xml`
 * Select the wanted profile under `Java formatter profile`

Import Order:
 * `IntelliJ IDEA -> Preferences -> Eclipse Code Formatter -> Import order -> Browse -> xyz.importorder`


#### Change Keyboard Shortcuts
 * `Preferences -> keymap -> code - reformat code -> ALT+F`

#### Autoformat with Macro
 1. Edit -> Macros -> start recording macro -> ALT+F -> edit -> macros -> stop recording -> give it a name
 2. Preferences -> Keymap -> Macros -> name of the macro -> click and add to keyboard shortcut

#### Multiple Maven Projects in the same workspace
 * at the right side of the window there is a "maven" column -> + icon -> select pom.xml

#### Code style
 * Font: consolas
 * Size: 14
 * Line Spacing: 1.05

#### System Font
 * `Preferences -> Appearance -> Appearance -> use custom font -> Gujarati Sangam MN 12`
 * `Preferences -> Editor -> Color scheme -> console font -> Consolas 13`

#### Enable Lombok
 * `Preferences -> Build... -> Compiler -> Enable annotation processing`
 * `Preferences -> Plugins -> install lombok plugin -> restart`

#### Version control file status color
 * `Settings/Preferences -> Version Control -> File Status Colors`

#### Hide Files
 * `Preferences -> Editor -> File Types -> *.iml;*.idea;`

#### Create workspace with multiple maven projects in it
* IntelliJ welcome screen -> create new project -> empty project
* File -> Project Structure -> Modules -> import module -> select pom.xml

#### IntelliJ Terminology
Project -> Workspace
Module -> Project or Submodule inside a 'Project'

#### Import folder into workspace with multiple maven projects in it
 1. IntelliJ welcome screen -> open or import -> select folder
 2. File -> Project Structure -> Project
      * Check Project Name
      * Check Project SDK
      * Check Project Language Level

Keep the root folder as a parent 'IntelliJ-Module' with mutliple projects under it as 'submodules':
 * File -> Project Structure -> Modules
   * right click on the 'root' module -> add -> import module -> select pom.xml file for each project
   * Add every project inside the root folder as a module

If the root folder should be hidden/removed from the workspace:
 * File -> Project Structure -> Modules
   * Remove the root folder from modules
   * Add every project inside the root folder as a module

## Hot Reload Spring Boot
 1. add devtools dependency
 2. Setting -> Build -> Compiler -> check Make project automatically.
 3. shift+cmd+a -> registry... -> compiler.automake.allow.when.app.running

 "update resources" vs "update classes and resource" for a spring module:
 If the second option is selected, on reload spring will not be able to find certain beans!

## TODO
 
 * Log font size and line wrapping
 * Some settings are not migrated over when creating a new project? Why?
 * Disable Tooltip for only HTML -> Probably it can only be turned off completely.
 * Import order not working?
 * Open last closed file with SHIFT + CMD + T
 * Move between tabs with CMD + arrow keys
 * Upload settings to github, can export + push to github be automated?
 * HTML formatting, attributes 2 tabs without spaces to align them
 * Take a look at hot reload, trigger it only with a shortcut? Fix the low activation time
      - Disabled `Compiler -> Build project automatically`
      - Now a hot reload happens only when I build the project manually, with `CMD + b`
 * It still builds automatically when an error is presen??
 * APPLICATION FAILED TO START, on hot reload
 * a little space between method definition line and the first line?
 * Annotations is separate lines
 * After method refactoring don't put @NotNull annotation