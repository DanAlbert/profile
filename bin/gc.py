#!/usr/bin/env python
import subprocess
import sys

if __name__ == '__main__':
    DEFAULT_USER = 'DanAlbert'

    if len(sys.argv) != 2:
        sys.exit('usage: gc [GITHUB_USER/]REPOSITORY_NAME')

    user = DEFAULT_USER
    repo = sys.argv[1]

    if '/' in repo:
        try:
            user, repo = repo.split('/')
        except:
            sys.exit('usage: gc [GITHUB_USER/]REPOSITORY_NAME')

    url = 'git@github.com:%s/%s.git' % (user, repo)
    subprocess.call(['git', 'clone', url])
