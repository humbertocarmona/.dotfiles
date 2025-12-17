function pyproj
    # Require at least project name and description
    if test (count $argv) -lt 2
        echo "This script creates a Python project structure in the current dir"
        echo "usage: pyproj project_name \"project description\""
        return
    end

    set -l name $argv[1]
    set -l desc $argv[2]

    # Create package dir and __init__.py
    mkdir -p $name
    touch $name/__init__.py

    # ------------------------------------------------------------------
    # Write .envrc (no heredoc in fish -> use begin ... end > file)
    # ------------------------------------------------------------------
    # begin
    #     echo 'set VENV_DIR ".venv"'
    #     echo
    #     echo 'if not test -d $VENV_DIR'
    #     echo '    # IMPORTANT: correct command is "python -m venv .venv"'
    #     echo '    python -m venv $VENV_DIR'
    #     echo
    #     echo '    # Upgrade pip (optional but recommended)'
    #     echo '    $VENV_DIR/bin/pip install --upgrade pip'
    #     echo
    #     echo '    # Install your package in editable mode'
    #     echo '    $VENV_DIR/bin/pip install -e .'
    #     echo end
    #     echo
    #     echo '# Tell direnv to use this virtualenv'
    #     echo 'set -gx VIRTUAL_ENV (pwd)/$VENV_DIR'
    #     echo 'fish_add_path $VIRTUAL_ENV/bin'
    # end >.envrc
    # .envrc for direnv (BASH syntax!)
    begin
        echo 'export VENV_DIR=".venv"'
        echo
        echo 'if [ ! -d "$VENV_DIR" ]; then'
        echo '  python -m venv "$VENV_DIR"'
        echo '  "$VENV_DIR/bin/pip" install --upgrade pip'
        echo '  "$VENV_DIR/bin/pip" install -e .'
        echo fi
        echo
        echo 'export VIRTUAL_ENV="$PWD/$VENV_DIR"'
        echo 'PATH_add "$VIRTUAL_ENV/bin"'
    end >.envrc

    # ------------------------------------------------------------------
    # Write pyproject.toml (expand $name and $desc)
    # ------------------------------------------------------------------
    begin
        printf '%s\n' "[build-system]"
        printf '%s\n' "requires = [\"setuptools>=61.0\"]"
        printf '%s\n' "build-backend = \"setuptools.build_meta\""
        printf '%s\n' ""
        printf '%s\n' "[project]"
        printf '%s\n' "name = \"$name\""
        printf '%s\n' "version = \"0.1.0\""
        printf '%s\n' "description = \"$desc\""
        printf '%s\n' "readme = \"README.md\""
        printf '%s\n' "requires-python = \">=3.10\""
        printf '%s\n' "authors = ["
        printf '%s\n' "    { name = \"Carmona\", email = \"carmona@fisica.ufc.br\" },"
        printf '%s\n' "]"
        printf '%s\n' "dependencies = ["
        printf '%s\n' "    \"numpy\","
        printf '%s\n' "    \"matplotlib\","
        printf '%s\n' "    \"pandas\","
        printf '%s\n' "    \"jupyter\","
        printf '%s\n' "    \"jupyterlab\","
        printf '%s\n' "    \"seaborn\","
        printf '%s\n' "]"
        printf '%s\n' ""
        printf '%s\n' "[tool.setuptools.packages.find]"
        printf '%s\n' "where = [\".\"]"
        printf '%s\n' "include = [\"$name*\"]"
        printf '%s\n' ""
        printf '%s\n' "[tool.ruff]"
        printf '%s\n' "line-length = 120"
        printf '%s\n' ""
        printf '%s\n' "[tool.ruff.lint]"
        printf '%s\n' "# Skip unused variable rules (\`F841\`)."
        printf '%s\n' "ignore = [\"F841\"]"
    end >pyproject.toml

    # ------------------------------------------------------------------
    # setup.py
    # ------------------------------------------------------------------
    begin
        printf '%s\n' "from setuptools import setup"
        printf '%s\n' "setup()"
    end >setup.py
end
