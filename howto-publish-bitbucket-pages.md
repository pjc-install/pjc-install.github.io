# Publishing a Website on Bitbucket Cloud

[source](https://support.atlassian.com/bitbucket-cloud/docs/publishing-a-website-on-bitbucket-cloud/)

> NOTE: 15 min cache may make this slow to dev with
>
> basically the same as github pages

You can use Bitbucket to host a static website, which would be accessed at <workspaceid>.bitbucket.io. ([What's a workspace?](https://confluence.atlassian.com/bitbucket/workspaces-966686552.html))

A static website contains coded HTML pages with fixed content. Websites hosted in this way will have the bitbucket.io domain in their URL. For example, if the *workspace ID* for a repository was tutorials, you would set the *Repository name* to tutorials.bitbucket.io.

## Set up a static website hosted on Bitbucket Cloud

To publish a static website on Bitbucket Cloud, you combine your [workspace ID](https://confluence.atlassian.com/bitbucket/change-a-workspace-id-966686598.html) with the bitbucket.io domain suffix as your repository name. Your workspace ID must be acceptable by DNS standards. Each workspace can have only one site hosted on bitbucket.io. 

**To set up a static website hosted on bitbucket.io:**

1. From within Bitbucket, create a repository, and have the **Repository name** use the scheme <workspaceID>.bitbucket.io.

2. Clone the repository to your local system.

3. Create a file called index.html in the repository root directory, in *lowercase letters*. Uppercase and special characters are not permitted.

   Why lowercase?                                      

   Filenames are case sensitive; Bitbucket treats index.html and Index.html as different file names.

4. Create a file named index.html in your repository, add some content, commit the change, then push the change to Bitbucket.

5. Navigate to the https://workspace_ID.bitbucket.io site. Bitbucket displays the HTML in the site's index.html. 

   For example...                                      

   For a workspace with the ID tutorials you would navigate to https://tutorials.bitbucket.io.

## Functionality and limitations of this feature

Static websites on Bitbucket support the following functionality:

- Embedding images and other media. 
- Inclusion of JavaScript in your HTML pages.
- Blog comments by embedding [Disqus](http://disqus.com/) in your site.

This turns a repository into a static web server that uses the repository's root as the web root. This leads to some limitations:

- For information on Bitbucket Cloud repository and file size limits, see [*What kind of limits do you have on repository/file size?*](https://confluence.atlassian.com/bitbucket/what-kind-of-limits-do-you-have-on-repository-file-size-273877699.html)
- HTTPS is required for bitbucket.io, for your security.
- The system does not issue cookies. 
- Server-side scripts or code are not supported. For example, PHP is not available.
- Each page will be cached for 15 minutes. So your changes might not be visible immediately.
- Uppercase characters and special characters are not permitted.
- Cannot use special characters: underscores are not allowed in DNS hostnames.

Finally, we inject a rum.js script into each Bitbucket website. This script captures internal web analytics and statistics.

## Host multiple files under a single website

You may have multiple files that you want to host from the same Bitbucket websites, you can do this by placing each file in a repository subdirectory. In this example, you would want to organize things like this:

- https://workspace_ID.bitbucket.io/subdirl

- https://workspace_ID.bitbucket.io/subdir2
- https://workspace_ID.bitbucket.io/subdir3

Each subdirectory would act as a self-contained website with its own index.html.

Bitbucket is forgiving with regard to trailing slashes: a request to https://workspace_ID.bitbucket.io/projectX/ will result in projectX/index.html being served (if such a file exists), regardless of whether the trailing slash is included in the URL.

While you can use subdirectories to manage different files, each static site will generate from the main branch of the repository. You can name your default main branch. Bitbucket only generates content from the selected main branch.

## Public and private repositories and static websites

The static website you create with this feature is just like any other website on the Internet — anyone with the URL can visit and view your static website. The underlying Bitbucket repository can be a public or a private repository. This means if your Bitbucket repository is private, users can still visit and view the static website. The same is true if the underlying repository is public.