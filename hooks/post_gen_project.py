#!/usr/bin/env python
from pathlib import Path

PROJECT_DIRECTORY = Path.cwd()


def remove_file(filepath: str):
    path = PROJECT_DIRECTORY.joinpath(filepath)
    path.unlink(missing_ok=True)

if __name__ == '__main__':

    if '{{ cookiecutter.use_pre_commit }}' != 'y':
        remove_file('.pre-commit-config.yaml')

    if 'Not open source' == '{{ cookiecutter.open_source_license }}':
        remove_file('LICENSE')

    if '{{ cookiecutter.use_rever }}' != 'y':
        remove_file('rever.xsh')

    if '{{ cookiecutter.push_to_repo }}' == 'y':
        import subprocess

        bashCommand = "\
chmod 755 * ; \
git init ; \
git checkout -b main ; \
git add . ; \
git commit -m 'Initial skeleton.' ; \
git remote add origin git@github.com:{{ cookiecutter.github_org }}/{{ cookiecutter.project_slug }}.git ; \
git push -u origin main ; \
"
        subprocess.run(bashCommand, shell=True, check=True, cwd=str(PROJECT_DIRECTORY))
