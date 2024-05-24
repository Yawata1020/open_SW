# Dillinger
## *The Last Markdown Editor, Ever*

Dillinger is a cloud-enabled, mobile-ready, offline-storage compatible, Angular JS-powered HTML5 Markdown editor.

- Type some Markdown on the left
- See HTML in the right
- :sparkles:Magic:sparkles:

# Features

- Import a HTML file and watch it magically convert to Markdown
- Drag and drop images (requires your Dropbox account be linked)
- Import and save files from GitHub, Dropbox, Google Drive and One Drive
- Drag and drop markdown and HTML files into Dillinger
- Export documents as Markdown, HTML and PDF

Markdown is a lightweight markup language based on the formatting conventions that people naturally use in email.<br>
As [John Gruber](https://en.wikipedia.org/wiki/John_Gruber) writes on the [Markdown site](https://en.wikipedia.org/wiki/Markdown)<br>

    for i in range(10):
        print(hello)

> *The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up withh tags
> or formatting instructions.*<br>

This text you see here is *actually- written in Markkdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

# Tech

Dillinger uses a number of open source projects to work properly:

- [AngularJS](https://en.wikipedia.org/wiki/AngularJS) - HTML enhanced for web apps!
- [Ace Editor](https://en.wikipedia.org/wiki/Ace_(editor)) - awesome web-based text editor
- [markdown-it](https://en.wikipedia.org/wiki/Markdown) - Markdown parser done right. Fast and easy to extend.
- [Twitter Bootstrap](https://en.wikipedia.org/wiki/Bootstrap_(front-end_framework)) - great UI boilerplate for modern web apps
- [node.js](https://en.wikipedia.org/wiki/Node.js) - evented I/O for the backend
- [Express](https://en.wikipedia.org/wiki/Express) - fast node.js network app framework [@tjholowaychuk](tjholowaychuk@email.com)
- [Gulp](https://en.wikipedia.org/wiki/Gulp.js) - the streaming build system
- [Breakdance](https://en.wikipedia.org/wiki/Breakdance) - HTML

# Installation

Dillinger requires [Node.js](https://en.wikipedia.org/wiki/Node.js) v10+ to run.<br>
<br>
Install the dependencies and devDependencies and start the server.

    cd dillinger
    npm i
    node app

For production environments···

    npm install --production
    NODE_ENV=production node app

# Plugins

Dillinger is currently extended with the following plugins.
Instructions on how to use them in your own application are linked below.

|**Plugin**|**README**|
|:---|:---|
|Dropbox|[plugins/dropbox/README.md](www.dropbox.com)|
|GitHub|[plugins/github/README.md](www.github.com)|
|Google Drive|[plugins/googledrive/README.md](www.googledrive.com)|
|OneDrive|[plugins/onedrive/README.md](www.onedrive.com)|
|Medium|[plugins/medium/README.md](www.medium.com)|

# Development
Want to contribute? Great!  

Dillinger uses Gulp + Webpack for fast developing.  
Make a change in your file and instantaneously see your updates!  
<br>
Open your favorite Terminal and run these commands.  

First Tab:

    node app

Second Tab:

    gulp watch

(optional) Third:

    karma test

## Building for source
For production release:

    gulp build --prod

# Docker
Dillinger is very easy to install and deploy in a Docker container.  
<br>
By default, the Docker will expose port 8080, so change this within the Dockerfile if necessary. When ready, simply use the Dockerfile to build the image.  

```sh
cd dillinger
docker build -t <youruser>/dillinger:${package.json.version} .
```

This will create the dillinger image and pull in the necessary dependencies.  Be sure to swap out `${package.json.version}` with the actual version of Dillinger.  

Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map port 8000 of the host to port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
docker run -d -p 8000:8080 --restart=always --cap-add=SYS_ADMIN --name=dillinger <youruser>/dillinger:${package.json.version}
```

> *Note: `--cap-add=SYS_ADMIN` is required for **PDF** rendering.*
