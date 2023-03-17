set -eu

readonly NEW_NAME=$1
readonly OLD_NAME=${2:-boilerplate}

error_message() {
    printf "\033[0;31mrename error: %s\033[0m" "$1"
}

success_message() {
    printf "\033[;32mrename: %s\033[0m" "$1"
}

cleanup() {
    # Revert dir rename.
    if [ -d "$NEW_NAME" ]; then
        mv "$NEW_NAME/" "$OLD_NAME/"
    fi

    # Revert pyproject.toml update.
    if [ -f pyproject.toml.bak ]; then
        mv pyproject.toml.bak pyproject.toml
    fi

    # Revert docs/conf.py and docs/*.rst updates.
    if [ -f docs/conf.py.bak ]; then
        mv docs/conf.py.bak docs/conf.py
    fi
    if find docs/ -name "*.rst.bak" -exec sh -c 'mv "$0" "${0%.bak}"' {} \; | grep -q .; then
        find docs/ -name "*.rst.bak" -exec sh -c 'mv "$0" "${0%.bak}"' {} \;
    fi
}

# Check non-empty.
if [ -z "$NEW_NAME" ]; then
    error_message "New package name must contain at least one character."
    exit 1
fi

# Check does not contain non-alphanum or non-underscore characters.
if [[ $NEW_NAME =~ [^[:alnum:]_] ]]; then
    error_message "The new package name must only contain alphanumeric characters and the underscore."
    exit 1
fi

if [[ $NEW_NAME =~ ^[0-9] ]]; then
    error_message "The new package name must not begin with a number."
    exit 1
fi

trap cleanup ERR

# Rename dir.
mv "$OLD_NAME/" "$NEW_NAME/" || { error_message "Failed to rename directory '$OLD_NAME'."; exit 1; }

# Update pyproject.toml.
sed -i.bak "s/[[:<:]]$OLD_NAME[[:>:]]/$NEW_NAME/Ig" pyproject.toml || { error_message "Failed to update pyproject.toml."; exit 1; }
# Update docs/conf.py and docs/*.rst.
sed -i.bak "s/[[:<:]]$OLD_NAME[[:>:]]/$NEW_NAME/Ig" docs/conf.py || { error_message "Failed to update docs/conf.py."; exit 1; }
sed -i..bak "s/[[:<:]]$OLD_NAME[[:>:]]/$NEW_NAME/Ig" docs/*.rst || { error_message "Failed to update docs/*.rst."; exit 1; }
rm -f pyproject.toml.bak docs/*.bak
rm -rf "$OLD_NAME/"

success_message "Rename successful."

trap - ERR
