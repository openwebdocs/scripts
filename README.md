# scripts

bash files to improve productivity

_addRemoteOrigin.sh_ adds a remote origin for directories you may have forked
* all variables should be updated. 
* this is likely only useful one time

_upstreamAllRepos.sh_ updates all your repos with the upstream latest version
* list of repos should be updated. 
* based on main branch being main or master. Needs updating as main branches are updated
* useful to do daily

_createDIRwithMD.sh_ enables you to select a directory, then create folders & index.md files
* can only do one directory at a time
* can do unlimited folders/files within that directory, one at a time (doing multiple is an easy fix, but I didn't think of it 'til now)
* adds a best guess at a title and a slug within the web/ directory, and tags based on the path and "needs content"
* adds generic headings. Edit to your liking
