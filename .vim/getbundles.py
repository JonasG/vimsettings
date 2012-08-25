import os
from os import chdir, mkdir, getcwd
from os.path import exists
from subprocess import call
from shutil import rmtree, copytree

BUNDLE_PATH='bundle'

def cleanup():
    if exists(BUNDLE_PATH):
        rmtree(BUNDLE_PATH)
    mkdir(BUNDLE_PATH)


def get_git_bundles():
    git_bundles = [
        "git://github.com/ervandew/supertab.git",
        "git://github.com/vim-scripts/hexman.vim.git",
        "git://github.com/hrp/EnhancedCommentify.git",
        "git://github.com/msanders/snipmate.vim.git",
        "git://github.com/fs111/pydoc.vim.git",
        # "git://github.com/vim-scripts/VimClojure.git",
        # "git://github.com/kien/rainbow_parentheses.vim.git"
        "git://repo.or.cz/vcscommand.git",
        "git://github.com/nvie/vim-flake8.git"
    ]

    olddir = getcwd()
    chdir(BUNDLE_PATH)

    for bundle in git_bundles:
        call(['git', 'clone', bundle])

    chdir(olddir)


def get_hg_bundles():
    # Get dependency
    call(['hg', 'clone', 'https://bitbucket.org/ns9tks/vim-l9',
          os.path.join(BUNDLE_PATH, 'l9')])

    call(['hg', 'clone', 'https://bitbucket.org/ns9tks/vim-fuzzyfinder',
          os.path.join(BUNDLE_PATH, 'fuzzyfinder')])

    vimclojure_temp_path = os.path.join(BUNDLE_PATH, 'vimclojure-temp')
    call(['hg', 'clone', 'https://bitbucket.org/kotarak/vimclojure',
          vimclojure_temp_path])

    vimclojure_path = os.path.join(BUNDLE_PATH, 'vimclojure')
    # There is a vim subdirectory in vimclojur repo that we actually want.
    copytree(os.path.join(vimclojure_temp_path, 'vim'), vimclojure_path)
    rmtree(vimclojure_temp_path)

if __name__ == '__main__':
    cleanup()
    get_git_bundles()
    get_hg_bundles()
