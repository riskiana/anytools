# Git Repository Bundler

This script automates the creation of Git bundle files for multiple repositories organized in specific directories. It processes each repository, creates a bundle, and saves it in a structured directory.

## Script Overview

The script is located at `create-bundles/create_bundle_file.sh`. It performs the following tasks:

1. Creates a `bundles` directory to store the generated bundle files.
2. Iterates through a predefined list of directories (`REPO_DIRS`).
3. For each directory, it checks for repositories containing a `.git` folder.
4. Creates a Git bundle file for each repository and saves it in the corresponding subdirectory under `bundles`.

## Usage

### Prerequisites

- Ensure you have Git installed on your system.
- The directories listed in the `REPO_DIRS` array must exist and contain Git repositories.

### Steps to Run

1. Clone this repository or copy the script to your desired location.
2. Navigate to the `create-bundles` directory:
   ```bash
   cd create-bundles
3. make the script executable
chmod +x create_bundle_file.sh
4. Run the script:
./create_bundle_file.sh
Output
- The script creates a bundles directory in the current working directory.
- Inside bundles, subdirectories are created for each directory in REPO_DIRS.
- Each Git repository is bundled into a .bundle file and saved in the corresponding subdirectory.

Example Directory Structure
After running the script, the bundles directory might look like this:

bundles/
├── core/
│   ├── repo1.bundle
│   └── repo2.bundle
├── apps/
│   ├── repo3.bundle
│   └── repo4.bundle
...

Notes
If a directory in REPO_DIRS does not exist, the script will skip it and display a warning.
If a repository fails to bundle, the script will display an error message and remove any partially created bundle file.
The script outputs the size of each successfully created bundle.

Customization
You can modify the REPO_DIRS array in the script to include or exclude directories as needed:
REPO_DIRS=("core" "apps" "datawarehouse" "operations" "runtime" "service" "test")