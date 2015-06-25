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

