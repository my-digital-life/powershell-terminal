# commit everything that changed in the repository, use:

```powershell
git add .
```

## Then:

```powershell
git commit -m "needed a change"
```

## Then:

```powershell
git push
```

## another way

```powershell
cd "$HOME\powershell-terminal"
 
git add .
 
git commit -m "Update profiles and documentation"
 
git push
```
# A few useful variations:

## See what will be committed

```powershell
git status
```

## bCommit all tracked files without git add

```powershell
git commit -am "Update existing files"
```

### Note: this does not include brand-new files.

## Add only Markdown files

```powershell

git add *.md
```

## Add all Markdown files recursively

```powershell
git add "*.md"
```

## one type of workflow

```powershell
cd "$HOME\powershell-terminal"
 
git status
 
git add .
 
git commit -m "Update profiles and documentation"
 
git push
```