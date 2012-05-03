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
        # "git://github.com/fholgado/minibufexpl.vim.git",
        "git://github.com/hrp/EnhancedCommentify.git",
        "git://github.com/msanders/snipmate.vim.git",
        "git://github.com/fs111/pydoc.vim.git",
        # "git://github.com/vim-scripts/VimClojure.git",
        # "git://github.com/kien/rainbow_parentheses.vim.git"
        "git://repo.or.cz/vcscommand.git"
    ]

    olddir = getcwd()
    chdir(BUNDLE_PATH)

    for bundle in git_bundles:
        call(['git', 'clone', bundle])

    chdir(olddir)

def get_vimwiki():
    call(['hg', 'clone', 'https://code.google.com/p/vimwiki/'])

    copytree('vimwiki/src', os.path.join(BUNDLE_PATH, 'vimwiki'))

    rmtree('vimwiki')


if __name__ == '__main__':
    cleanup()
    get_git_bundles()
    get_vimwiki()
