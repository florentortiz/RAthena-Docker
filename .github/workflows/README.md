# **CI for Ragnarok build**
---

## **Information**
---
This file will explain the workflow to generate versionned ragnarok images for our use case.
  
Acutally we are using a release branch each time we want to deploy a new version in order to be able to generate our images in a semver way.

## **Automation**
---
### **Requirements**
We have to follow a strict way of managing new version, with the use of "release/vX.X.X" format for our version branch to be able to generate images correctly.
  
By doing so, we are using a more "proper" way instead of having to define a specific tag directly on the main branch.
  
### **Github actions**
Our CI is based on Github actions, with the use of multiple pre-defined actions :*
- "actions/checkout" to clone our repository as we need the Dockerfile in it
- "docker/metadata-action" to be able to define the docker tags with our input
- "docker/login-action" to authenticate with the Docker hub registry
- "docker/build-push-action" to be able to use our Dockerfiles to build every images
- "mathieudutour/github-tag-action" to create a git tag in our repository with the new version
- "ncipollo/release-action" to create a release based on the git tag created
  
The actual process look like this :
- Check if the version provide from the source branch is in a semver format
- Build every docker images needed  
-> If we want to add another image build, we just have to copy/paster a job and change the required informations.
- Once this is done, it will update the "docker-compose.yml" file to be able to just clone/pull the repository and then start/update the deployments.
- After this we are using a final job to create a specific git tag and release, to be able to make a specific step in our git history for the new version.
  
### **Release branch** 
In order to be able to generate our images with a proper tag in a semver mode, we are using release branch with the following format : "release/vX.X.X"
  
Documentation that explain it a little bit : https://nvie.com/posts/a-successful-git-branching-model/  
-> / ! \ Be carreful as we are using only a small part of this and maybe not in a good way, feel free to reach us to provide us tips or standard !
  
It was our better idea at the moment, as we are actually modifying automatically a file in our repository when a new version is pushed (docker-compose.yml) so the git tag and release are created after this.  
-> In the future we may add a K8S platform and manage this with a proper IaC repository to deploy directly on it with specific tools like ArgoCD or Flux.
  
Once again as a reminder, we have to follow the semver format so we have to create our release branch with this format :
  
release/vX.X.X
  
Here is the process with an example :
```
I'm a very good developer ! And I want to deploy a new version of the application !

What I have to do ? Create a new release branch !
$ git checkout -b release/v1.0.1 main

Now I just finish to push my wonderful commits to my new branch !
$ git commit -m "feat: new version v1.0.1"

What's the next step ? As for the moment our CI don't start :(

You know what ? We have to create a PR now !
-> Actions have to be done in the Github UI for this

Somebody have validated my PR and merge it in main !
-> Now our CI start, YOUHOU !!!
```