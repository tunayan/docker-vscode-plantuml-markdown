<pre><code>
$ docker run -d --rm 
              -e "DISPLAY=$DISPLAY" \
              --device /dev/dri \
              -v /tmp/.X11-unix:/tmp/.X11-unix \
              -v ${PWD}:/home/code/project  \
              --name vscode tunayan/vscode-markdown-plantuml
</code></pre>
