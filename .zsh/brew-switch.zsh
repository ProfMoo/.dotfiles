#!/bin/zsh

# a script to install a specific version of a formula from homebrew-core
# USAGE: brew-switch <formula> <version>
function brew-switch {
  local _formula=$1
  local _version=$2

  # fail for missing arguments
  if [[ -z "$_formula" || -z "$_version" ]]; then
    echo "USAGE: brew-switch <formula> <version>"
    return 1
  fi

  # ensure 'gh' is installed
  if [[ -z "$(command -v gh)" ]]; then
    echo ">>> ERROR: 'gh' must be installed to run this script"
    return 1
  fi

  # find the newest commit for the given formula and version
  # NOTE: we get the URL, rather than the SHA, because sometimes the commit belongs to an older repo
  local _commit_url=$(
    gh search commits \
      --owner "Homebrew" \
      --repo "homebrew-core" \
      --limit 1 \
      --sort "committer-date" \
      --order "desc" \
      --json "url" \
      --jq ".[0].url" \
      "\"${_formula}\" \"${_version}\""
  )

  # fail if no commit was found
  if [[ -z "$_commit_url" ]]; then
    echo "ERROR: No commit found for ${_formula}@${_version}"
    return 1
  else
    echo "INFO: Found commit ${_commit_url} for ${_formula}@${_version}"
  fi

  # get the 'raw.githubusercontent.com' URL from the commit URL
  local _raw_url_base=$(
    echo "$_commit_url" |
    sed -E 's|github.com/([^/]+)/([^/]+)/commit/(.*)|raw.githubusercontent.com/\1/\2/\3|'
  )

  local _formula_path="/tmp/${_formula}.rb"

  # download the formula file from the commit
  echo ""
  local _repo_path="Formula/${_formula:0:1}/${_formula}.rb"
  local _raw_url="${_raw_url_base}/${_repo_path}"
  echo "INFO: Downloading ${_raw_url}"
  if ! curl -fL "$_raw_url" -o "$_formula_path"; then
    echo "WARNING: Download failed, trying OLD formula path"
    echo ""
    _repo_path="Formula/${_formula}.rb"
    _raw_url="${_raw_url_base}/${_repo_path}"
    echo "INFO: Downloading ${_raw_url}"
    if ! curl -fL "$_raw_url" -o "$_formula_path"; then
      echo "WARNING: Download failed, trying ANCIENT formula path"
      echo ""
      _repo_path="/Library/Formula/${_formula}.rb"
      _raw_url="${_raw_url_base}/${_repo_path}"
      echo "INFO: Downloading ${_raw_url}"
      if ! curl -fL "$_raw_url" -o "$_formula_path"; then
        echo "ERROR: Failed to download ${_formula} from ${_raw_url}"
        return 1
      fi
    fi
  fi

  # if the formula is already installed, uninstall it
  if brew ls --versions "$_formula" >/dev/null; then
    echo ""
    echo "WARNING: '$_formula' already installed, do you want to uninstall it? [y/N]"
    local _reply=$(bash -c "read -n 1 -r && echo \$REPLY")
    echo ""
    if [[ $_reply =~ ^[Yy]$ ]]; then
      echo "INFO: Uninstalling '$_formula'"
      brew unpin "$_formula"
      if ! brew uninstall "$_formula"; then
        echo "ERROR: Failed to uninstall '$_formula'"
        return 1
      fi
    else
      echo "ERROR: '$_formula' is already installed, aborting"
      return 1
    fi
  fi

  # install the downloaded formula
  echo "INFO: Installing ${_formula}@${_version} from local file: $_formula_path"
  brew install --formula "$_formula_path"
  brew pin "$_formula"
}
