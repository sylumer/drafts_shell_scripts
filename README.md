# Repository: drafts_shell_scripts

# Description
This repository provides some shell scripts for use with the [Drafts app](https://getdrafts.com) by [@agiletortoise](https://github.com/agiletortoise) on macOS.  They allow you to interact with Drafts in some useful ways via the command line.

# Table of Contents

- [Description](#description)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
- [Usage](#usage)
	- [Script: `appendtodraft.sh`](#script-appendtodraftsh)
	- [Script: `opendraft.sh`](#script-opendraftsh)
	- [Script: `prependtodraft.sh`](#script-aprependtodraftsh)
	- [Script: `rundraftsaction.sh`](#script-rundraftsactionsh)
	- [Script: `todraft.sh`](#script-todraftsh)
	- [Script: `todraftflagged.sh`](#script-todraftflaggedsh)
- [Additional Information](#additional-information)
	- [Aliases](#aliases)
	- [Combined Use Examples](#combined-use-examples)
- [Credits](#credits)
- [License](#license)
- [Legal Disclaimer](#legal-disclaimer)

# Installation
Available scripts:

- `appendtodraft.sh`
- `opendraft.sh`
- `prependtodraft.sh`
- `rundraftsaction.sh`
- `todraft.sh`
- `todraftflagged.sh`

To use the scripts, simply download and copy them to your Mac and set the excutable bit for the scripts using `chmod`.

All script files can be found in the `src` folder of this repository.

# Usage

## Script: `appendtodraft.sh`
**Description:**
This script accepts content on `STDIN` and a single argument of the UUID of an existing draft. It appends the content to the end of the draft specified by the UUID.

**Input/Output:**

| Type   | I/O    | Data                           |
|:------:|:------:|:-------------------------------|
| Input  | args   | UUID of the draft to append to |
| Input  | STDIN  | Content to append to the draft |
| Output | STDOUT | - None -                       |

**Examples:**
Append the content "*lorem ipsum*" to a draft with UUID `B91949F4-F976-4838-AA41-3ECFD752EDC9`.

```sh
echo lorem ipsum | ./appendtodraft.sh B91949F4-F976-4838-AA41-3ECFD752EDC9
```

## Script: `opendraft.sh`
**Description:**
This script accepts a draft UUID on `STDIN`, and will open the draft with the matching UUID in drafts.

**Input/Output:**

| Type   | I/O    | Data       |
|:------:|:------:|:-----------|
| Input  | args   | - None -   |
| Input  | STDIN  | Draft UUID |
| Output | STDOUT | - None -   |

**Examples:**
Open a draft with UUID `B91949F4-F976-4838-AA41-3ECFD752EDC9`.

```sh
echo B91949F4-F976-4838-AA41-3ECFD752EDC9 | ./opendraft.sh
```

## Script: `prependtodraft.sh`
**Description:**
This script accepts content on `STDIN` and a single argument of the UUID of an existing draft. It prepends the content to the start of the draft specified by the UUID.

**Input/Output:**

| Type   | I/O    | Data                            |
|:------:|:------:|:--------------------------------|
| Input  | args   | UUID of the draft to prepend to |
| Input  | STDIN  | Content to prepend to the draft |
| Output | STDOUT | - None -                        |

**Examples:**
Prepend the content "*lorem ipsum*" to a draft with UUID `B91949F4-F976-4838-AA41-3ECFD752EDC9`.

```sh
echo lorem ipsum | ./prependtodraft.sh B91949F4-F976-4838-AA41-3ECFD752EDC9
```

## Script: `rundraftsaction.sh`
**Description:**
This script accepts optional text content on `STDIN` and a single argument of the (unique) name of an existing draft action. It runs the specified action, and if any optional text has been specified, this will be used as content for a temporary draft to run the action against.

**Input/Output:**

| Type   | I/O    | Data                                                   |
|:------:|:------:|:-------------------------------------------------------|
| Input  | args   | Name of the Drafts action to run                       |
| Input  | STDIN  | Text to set as draft content to run the action against |
| Output | STDOUT | - None -                                               |

**Examples:**
Run the Drafts action `Action-foo`.

```sh
./rundraftsaction.sh 'Action-foo'
```

Run the Drafts action `Action-bar` against the text "*lorem ipsum*".

```sh
echo lorem ipsum | ./rundraftsaction.sh 'Action-bar'
```

## Script: `todraft.sh`
**Description:**
This script accepts content on `STDIN`, and tags as arguments. It creates a draft with matching content and tags in Drafts.

**Input/Output:**

| Type   | I/O    | Data                        |
|:------:|:------:|:----------------------------|
| Input  | args   | Tags to add to new draft    |
| Input  | STDIN  | Content for new draft       |
| Output | STDOUT | UUID of newly created draft |

**Examples:**
Create a draft with content "*lorem ipsum*".

```sh
echo lorem ipsum | ./todraft.sh
```

Create a draft with content "*lorem ipsum*" and tags `foo` and `bar`.

```sh
echo lorem ipsum | ./todraft.sh foo bar
```


## Script: `todraftflagged.sh`
**Description:**
This script accepts content on `STDIN`, and tags as arguments. It creates a draft with matching content and tags in Drafts, that is also marked as flagged.

**Input/Output:**

| Type   | I/O    | Data                        |
|:------:|:------:|:----------------------------|
| Input  | args   | Tags to add to new draft    |
| Input  | STDIN  | Content for new draft       |
| Output | STDOUT | UUID of newly created draft |

**Examples:**
Create a flagged draft with content "*lorem ipsum*".

```sh
echo lorem ipsum | ./todraftflagged.sh
```

Create a flagged draft with content "*lorem ipsum*" and tags `foo` and `bar`.

```sh
echo lorem ipsum | ./todraftflagged.sh foo bar
```

# Additional Information

## Aliases
To make these scripts more convenient to work with, I recommend [creating aliases](https://flaviocopes.com/how-to-set-alias-shell/) in your environment.

Here are the ones I use, with my Drafts scripts being held in a `scripts` folder in my home directory.

| Alias   | Script               | Conifguration Command                          |
|:-------:|:---------------------|------------------------------------------------|
| `a2d`   | `appendtodraft.sh`   | `alias opd '$HOME/scripts/appendtodraft.sh'`   |
| `opd`   | `opendraft.sh`       | `alias opd '$HOME/scripts/opendraft.sh'`       |
| `p2d`   | `prependtodraft.sh`  | `alias opd '$HOME/scripts/prependtodraft.sh'`  |
| `rda`   | `rundraftsaction.sh` | `alias opd '$HOME/scripts/rundraftsaction.sh'` |
| `2d`    | `todraft.sh`         | `alias 2d '$HOME/scripts/todraft.sh'`          |
| `2df`   | `todraftflagged.sh`  | `alias 2df '$HOME/scripts/todraftflagged.sh'`  |


## Combined Use Examples
The following examples utilise the aliases above to aid clarity, and provide examples of how you can use multiple scripts together.


Create a new draft containing a list of all files (including hidden files) in the current directory and then open the draft in the app.
```
ls -a | 2d listing | opd
```

# Credits
**Author:** Stephen Millard (*@sylumer*), [thoughtasylum.com](https://thoughtasylum.com)

# License
These scripts are **Coffeeware**.  You are free to make use of the scripts as long as you like and as much as you like. You owe us nothing.

But, if you do want to give a little, all development is fuelled by coffee, and you can make a donation to the author's coffee fund.

<a href="https://www.buymeacoffee.com/sylumer" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-yellow.png" alt="Donate A Coffee" height="41" width="174"></a>

Please also take the time to read the legal disclaimer below.

# Legal Disclaimer

These scripts are shared publicly to help others and to contribute back to the wider Drafts community. You may use, and copy these scripts and distribute them with your own projects. For any non-personal sharing or distribution, you are required to provide a reference to this reporistory.  This is simply to enable the recipient to keep up to date with any updates that we may make to the original included content.

Any modifications or derivative works based on any proportion of these scripts, must carry a notice stating that you changed the scripts and should note the date and nature of any such change. Please explicitly acknowledge this repository as the original source of the scripts.

All scripts are expressly provided "AS IS." WE MAKE NO WARRANTY OF ANY KIND, EXPRESS, IMPLIED, IN FACT OR ARISING BY OPERATION OF LAW, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, NON-INFRINGEMENT AND DATA ACCURACY. WE NEITHER REPRESENTS NOR WARRANT THAT THE OPERATION OF THE CODE WILL BE UNINTERRUPTED OR ERROR-FREE, OR THAT ANY DEFECTS WILL BE CORRECTED. NIST DOES NOT WARRANT OR MAKE ANY REPRESENTATIONS REGARDING THE USE OF THE SOFTWARE OR THE RESULTS THEREOF, INCLUDING BUT NOT LIMITED TO THE CORRECTNESS, ACCURACY, RELIABILITY, OR USEFULNESS OF THE CODE.

You are solely responsible for determining the appropriateness of using the scripts and you assume all risks associated with its use, including but not limited to the risks and costs of errors, compliance with applicable laws, damage to or loss of data, programs or equipment, and the unavailability or interruption of operation. This scripts are not intended to be used in any situation where a failure could cause risk of injury or damage to property.

*Basically, we use these scripts ourselves, we're sharing it publicly so others may benefit, please don't pass the effort put into this off as your own, and while we guarantee nothing regarding use, we really hope that you find it useful in working with the Drafts app, and remember to always keep good backups just in case.*