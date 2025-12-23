# 2026 Light Sheet Image Analysis Course - Workshop Repositories

This repository contains a setup script that automatically clones and configures all workshop repositories for the **2026 Light Sheet Image Analysis Course** at **Universidad Mayor, Chile**.

## Overview

This is a convenience repository designed to help students and instructors quickly populate a folder with all the necessary workshop materials and course repositories in one command.

## Prerequisites

Before running the setup script, ensure you have the following installed:

- **Pixi** - Package manager and environment manager
  - [Download/Install Pixi](https://pixi.sh/latest/)

  Install Pixi in PowerShell:
  ```powershell
  powershell -ExecutionPolicy Bypass -c "irm -useb https://pixi.sh/install.ps1 | iex"
  ```

- **Git** - Version control system
  - [Download Git](https://git-scm.com/download/win)
  
```powershell
pixi global install git
```

## Usage

### Clone this Repository

```powershell
git clone https://github.com/acorbat/2026_lsia_umayor.git
cd 2026_lsia_umayor
```

### Run the Setup Script

Open PowerShell and navigate to the repository folder. First, enable the execution policy for this session and then execute the setup script:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
.\setup-repos.ps1
```

The script will:
- Clone each repository into the current directory
- Run `pixi install` in each cloned repository
- Execute the pixi data download task (if configured)

### What Happens Next

Once the script completes:
- All repositories will be cloned in separate folders
- All project dependencies will be installed via pixi
- Data files will be downloaded automatically

## Requirements

- **Windows** - Script is written for PowerShell on Windows
- **Administrator access** - May be needed for some installations
- **Internet connection** - Required for cloning repositories and downloading dependencies

## Troubleshooting

If the script fails:

1. **"pixi not found"** - Ensure pixi is installed and accessible from PowerShell
2. **"git not found"** - Ensure git is installed and accessible from PowerShell
3. **Clone fails** - Check that repository URLs are correct and accessible
4. **Permission denied** - You may need to allow PowerShell script execution:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

## Support

For issues or questions about the course, contact the [course instructors at Universidad Mayor](https://bruvellu.github.io/light-sheet-image-analysis-workshop-2026/).

---

**Course:** Light Sheet Image Analysis  
**Institution:** Universidad Mayor, Chile  
**Year:** 2026
