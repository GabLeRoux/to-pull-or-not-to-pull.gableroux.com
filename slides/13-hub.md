## hub 🤘

```bash
# installation (macos)
brew install hub

# usage
hub clone GabLeRoux/to-pull-or-not-to-pull # no need for git@github:...
hub fork # creates a fork on your github account!

echo "hi from $USER" >> guestbook.md
git add guestbook.md
hub commit -m "Signing this book :v:"

hub push # we need to push to our own repo before creating a pull-request
hub pull-request # hub magic command
```
