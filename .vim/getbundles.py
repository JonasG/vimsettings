from os import chdir, mkdir
from os.path import exists
from subprocess import call
from shutil import rmtree

bundles = [
    "git://github.com/ervandew/supertab.git",
    "git://github.com/vim-scripts/hexman.vim.git",
    "git://github.com/fholgado/minibufexpl.vim.git",
    "git://github.com/hrp/EnhancedCommentify.git",
    "git://github.com/msanders/snipmate.vim.git" 
]

BUNDLE_PATH='bundle'
if exists(BUNDLE_PATH):
    rmtree(BUNDLE_PATH)

mkdir(BUNDLE_PATH)

chdir(BUNDLE_PATH)

for bundle in bundles:
    call(['git', 'clone', bundle])
