# how to use github pages

- if you want a **simple url: ** **<u>name.github.io</u>**   then the name of the repo must match the the following simple structure:

  1. where `name` is the name of the organization in your github account
  2. repo name in the organization `name` must be `name.github.io`

- set the repo to be public (I think you can publish private also but I haven't read up on how the security and visibility is controlled for the private sites)

- set the github pages setting for the repo `name.github.io` to publish and what branch (usually master)

- there is no need to create a release or anything, github may take a few mins but will look for the following files as the  `index.html` of the static website:

  - `index.html`
  - `index.md`
  - `README.md`
  - `readme.md`

  

  

- there are other tweaks you can use for documenting public repos but for my purposes it is mostly just this!

## using curl

you can use curl to download a file and pipe directly to execute, e.g. `filename.bash` downloaded and executed by bash

```bash
# -L opt makes curl try http and https so you can avoid adding https:// prefix to url
curl -L name.github.io/filename.bash                | bash
curl -L name.github.io/pathname/filename.bash       | bash

```



## references

[github pages docs ](https://pages.github.com/)

[github tutorial](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site)

## 