# **CI for Ragnarok build**
---

## **Information**
---
This file will explain the workflow to generate versionned ragnarok images for our use case.
  
Acutally we are using the "Git tag" functionnality in order to be able to generate our images in a semver way.

## **Automation**
---
### **Github actions**
Our CI is based on Github actions, and will use the "docker/build-push-action" to be able to use our Dockerfiles to build every images.
  
Once this is done, it will update the "img-docker-compose.yml" file to be able to just clone/pull the repository and then start/update the deployments.
  
If we want to add another image build, we just have to copy/paster a job and change the required informations.
  
### **Git tags** 
In order to be able to generate our images with a proper tag, we are using the "git tags" functionnality.
  
Documentation that explain it a little bit : https://www.atlassian.com/fr/git/tutorials/inspecting-a-repository/git-tag
  
It was the simpliest idea, as with a proper github module in the marketplace it will allow us to define a semver tag based on the git tag !
  
As we have to follow the semver format, we have to create tag with this format :
  
vX.X.X
  
Here is the process with an example :
```
I'm a very good developer ! And I just finish to push my wonderful commits to my repository !

What's the next step ? As for the moment our CI don't start :(

You know what ? We forgot to create a tag in Git !
$ git tag
-> Nothing here 

Let's create a specific tag for our version
$ git tag -a v1.0.0 -m "feat: deploy v1.0.0"

We can now see it 
$ git tag
v1.0.0

Last step ? PUSH IT BABY
$ git push origin v1.0.0
Enumerating objects: 1, done.
Counting objects: 100% (1/1), done.
Writing objects: 100% (1/1), 171 bytes | 171.00 KiB/s, done.
Total 1 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/florentortiz/mido-wippa.git
 * [new tag]         v1.0.0 -> v1.0.0

-> Now our CI start, YOUHOU !
```
  
Once we will have multiple tag, we will have each time to check what is the latest version of the tag. And then, make the according version change based on our code modification (little fix, major upgrade, etc..)