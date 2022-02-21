{%- if cookiecutter.use_rever == 'y' %}
$PROJECT = {{ cookiecutter.project_slug }}
$ACTIVITIES = [
              'version_bump',  # Changes the version number in various source files (setup.py, __init__.py, etc)
              'changelog',  # Uses files in the news folder to create a changelog for release
              'tag',  # Creates a tag for the new version number
              'push_tag',  # Pushes the tag up to the $TAG_REMOTE
              'ghrelease'  # Creates a Github release entry for the new tag
               ]
$VERSION_BUMP_PATTERNS = [  # These note where/how to find the version numbers
                         ('setup.py', r'version\s*=.*,', 'version="$VERSION",'),
                         ('__init__.py', r'__version__\s*=.*', '__version__ = "$VERSION"'),
                         ]
$CHANGELOG_FILENAME = 'CHANGELOG.rst'  # Filename for the changelog
$CHANGELOG_TEMPLATE = 'TEMPLATE.rst'  # Filename for the news template
$PUSH_TAG_REMOTE = 'git@github.com:{{ cookiecutter.github_org }}/{{ cookiecutter.project_slug }}.git'  # Repo to push tags to

$GITHUB_ORG = '{{ cookiecutter.github_org }}'  # Github org for Github releases
$GITHUB_REPO = '{{ cookiecutter.project_slug }}'  # Github repo for Github releases
{%- endif %}