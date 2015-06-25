LESSONS LEARNT
==============

1. Should I fork from Anita's github repo or not?
NOT!!!! - Forking is for making a copy of Anita's github repo in my github repo
and I can make changes to my github repo without affecting or making any changes to Anita's github.
We want to follow the other workflow for the repo which is where Anita and I both work on the 
same github repo.

2. git branch -a  (shows all branches)

3. We created the branches on github
and then in our local repo we simply did
git checkout <mybranch>
to start working on mybranch

4. I made changes to layout.erb and app.rb and then git add and git commit as usual in local repo.
Then I pushed my feature_set1 to github:
git push origin feature_set1

5. For Anita to get my newly updated files from feature_set1 she did:
git checkout feature_set1
git pull origin feature_set1

 Now Anita checked out her branch feature_set2
git checkout feature_set2

 Then to bring in my changes made in feature_set1 to her feature_set2 she did:
git merge feature_set1

6. CSS layout 
- To organize the css file the approach adopted is to have styling for base html tags listed first,
then class level styling listed next 
and identifier level styling listed last.
Of course, the styling applied at run-time is in order of specificity.

7. follow up 
how to auto-close an issue
We will use "Fixed #1" or whatever issue number in the commit comment to auto-close the issue in github.

testing again - "Fixes #1" did not auto-close the issue in github
is the keyword "fixes" case-sensitive?

Note that the auto-close of the issue will occur when the branch is merged back into master.

8. Anita found the changes she made to feature_set2 in feature_set1. We are not sure how that happened as she has been working in feature_set2 branch.
To recover feature_set1 to a good enough point, we did:
git checkout feature_set1
git stash
feature_set1 was then back to good core skeleton set of files
Anita then did a git pull command to get remote feature_set1 down to local repo feature_set1
In hindsight, she should have done a git fetch for feature_set1 to avoid any fetch & auto merge on feature_set1.
(The fetch and auto merge (i.e. git pull) would have incorporated any changes she (mistakenly) made to feature_set1and would have kept that in her local repo.
- Lesson: use git pull the first time you pull a branch
but use git fetch for every other time you bring changes down to local repo from github
so that any merges are reported and left to the developer to decide whether to accept or decline the merge
Refer to good article on this at ( http://longair.net/blog/2009/04/16/git-fetch-and-merge/ )
"a git pull does both the fetch and merge without giving you a chance to review the merges & accept or decline them."

