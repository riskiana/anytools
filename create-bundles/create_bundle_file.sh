#!/bin/bash

# Array of directories containing your repositories
REPO_DIRS=("core" "apps" "datawarehouse" "operations" "runtime" "service" "test")  # Add/remove directories as needed

# Create main bundles directory
mkdir -p bundles

# Process each directory
for dir in "${REPO_DIRS[@]}"; do
    # Check if source directory exists
    if [ ! -d "$dir" ]; then
        echo "Warning: Directory $dir does not exist - skipping"
        continue
    fi

    echo "=== Processing $dir repositories ==="

    # Create corresponding bundles subdirectory
    mkdir -p "bundles/$dir"

    # Process each repository
    for repo in "$dir"/*; do
        if [ -d "$repo/.git" ]; then
            repo_name=$(basename "$repo")
            bundle_path="$PWD/bundles/$dir/$repo_name.bundle"
            
            echo "Creating: $bundle_path"
            
            # Create the bundle with progress output
            if git -C "$repo" bundle create "$bundle_path" HEAD master 2>&1 | while read -r line; do
                echo "  $line"
            done; then
                echo "✓ Successfully created $bundle_path"
                echo "  Bundle size: $(du -h "$bundle_path" | cut -f1)"
            else
                echo "✗ Failed to create bundle for $dir/$repo_name"
                # Remove partially created bundle if exists
                [ -f "$bundle_path" ] && rm "$bundle_path"
            fi
            echo
        fi
    done
done

echo "=== Bundle creation complete ==="
echo "All bundles saved in: $PWD/bundles/"
echo "Directory structure:"
tree -h bundles