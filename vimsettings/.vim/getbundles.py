import os
from os import chdir, mkdir, getcwd
from os.path import exists
from subprocess import call
from shutil import rmtree, copytree
import shutil

BUNDLE_PATH='bundle'

def cleanup():
    if exists(BUNDLE_PATH):
        rmtree(BUNDLE_PATH)
    mkdir(BUNDLE_PATH)


def get_git_bundles():
    git_bundles = [
        "git://github.com/vim-scripts/hexman.vim.git",
        "git://github.com/hrp/EnhancedCommentify.git",
        "git://github.com/msanders/snipmate.vim.git",
        "git://github.com/fs111/pydoc.vim.git",
        "git://repo.or.cz/vcscommand.git",
        "git://github.com/nvie/vim-flake8.git",
        "git://github.com/kien/ctrlp.vim.git",
        "https://github.com/tpope/vim-surround.git",
        "https://github.com/tpope/vim-repeat.git",
        "https://github.com/vim-scripts/fitnesse.vim.git",
        "https://github.com/vim-scripts/JSON.vim.git",
        "https://github.com/sjl/gundo.vim.git",
        "https://github.com/jnwhiteh/vim-golang.git",
        "https://github.com/altercation/vim-colors-solarized.git"
    ]

    olddir = getcwd()
    chdir(BUNDLE_PATH)

    for bundle in git_bundles:
        call(['git', 'clone', bundle])

    chdir(olddir)


def get_hg_bundles():
    call(['hg', 'clone', 'https://bitbucket.org/ns9tks/vim-l9',
          os.path.join(BUNDLE_PATH, 'l9')])

    vimclojure_temp_path = os.path.join(BUNDLE_PATH, 'vimclojure-temp')
    call(['hg', 'clone', 'https://bitbucket.org/kotarak/vimclojure',
        vimclojure_temp_path])

    vimclojure_path = os.path.join(BUNDLE_PATH, 'vimclojure')
    # There is a vim subdirectory in vimclojur repo that we actually want.
    copytree(os.path.join(vimclojure_temp_path, 'vim'), vimclojure_path)
    rmtree(vimclojure_temp_path)

    vimwiki_temp_path = os.path.join(BUNDLE_PATH, 'vimwiki-temp')
    call(['hg', 'clone', 'https://code.google.com/p/vimwiki/', vimwiki_temp_path])
    vimwiki_path = os.path.join(BUNDLE_PATH, 'vimwiki')
    copytree(os.path.join(vimwiki_temp_path, 'src'), vimwiki_path)
    rmtree(vimwiki_temp_path)

def add_helpfiles():
    mkdir(os.path.join(BUNDLE_PATH, 'helpfiles'))
    doc_dir = os.path.join(BUNDLE_PATH, 'helpfiles', 'doc')
    mkdir(doc_dir)
    shutil.copy('../cheatsheet.txt', doc_dir)

if __name__ == '__main__':
    cleanup()
    get_git_bundles()
    get_hg_bundles()
    add_helpfiles()
