# IntelliJ Setup & Config

### Plugins to install:
 * Eclipse code formatter
 * Lombok
 * Sonar Lint
 * Codota
 * Maven Helper
 * Key Promoter X

### Be Aware: 
Intellij did not set the working directory path correctly for 2 modules inside a project. This led to the app not finding files (e.g. ../content/whitelabel/de/index).
The fix was to edit the run config -> Set the working directory again for each module.

### General Setup 
 * `File -> Manage IDE Settings -> Import Settings -> select allIntellijSettings.zip`

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


#### Change Keyboard Shortcuts:
 * `Preferences -> keymap -> code - reformat code -> ALT+F`

#### Autoformat with Macro:
 1. Edit -> Macros -> start recording macro -> ALT+F -> edit -> macros -> stop recording -> give it a name
 2. Preferences -> Keymap -> Macros -> name of the macro -> click and add to keyboard shortcut

#### Multiple Maven Projects in the same workspace:
 * at the right side of the window there is a "maven" column -> + icon -> select pom.xml

#### Code style:
 * Font: consolas
 * Size: 15
 * Line Spacing: 1.05

#### System Font:
 * `Preferences -> Appearance -> Appearance -> use custom font -> Gujarati Sangam MN 12`
 * `Preferences -> Editor -> Color scheme -> console font -> Consolas 13`

#### Enable Lombok:
 * `Preferences -> Build... -> Compiler -> Enable annotation processing`
 * `Preferences -> Plugins -> install lombok plugin -> restart`

#### Version control file status color: 
 * `Settings/Preferences -> Version Control -> File Status Colors`

#### Hide Files
 * `Preferences -> Editor -> File Types -> *.iml;*.idea;`
