#!/bin/sh

DIST_DIRECTORY="dist"
CURRENT_COMMIT=`git rev-parse HEAD`
ORIGIN_URL=`git config --get remote.origin.url`
GITHUB_REPO_URL="github.com/GabLeRoux/to-pull-or-not-to-pull.git"

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  mkdir $DIST_DIRECTORY/
  cp .gitignore $DIST_DIRECTORY/
  git checkout -B gh-pages
  git rm -rf .
  cp -r $DIST_DIRECTORY/* .
  cp $DIST_DIRECTORY/.gitignore .
  git add -A .
  git commit --message "gh-pages deployment with Travis build: ${TRAVIS_BUILD_NUMBER} commit: ${CURRENT_COMMIT}"
}

upload_files() {
  git remote add origin-pages https://${GH_TOKEN}@${GITHUB_REPO_URL} > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages gh-pages
}

setup_git
commit_website_files
upload_files
