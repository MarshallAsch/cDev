
# C Development

This docker container contains a bunch of the C development tools needed to build a program.
On MacOS 10.14.6 `valgrind` and `gdb` do not work, so I have made this useful docker image where
you can debug a C program from a directory on the host machine.

This container is based on Debian and contains:

- gcc
- gdb
- make
- valgrind
- git


## Building

To build the container run

```bash
$  docker build -t cdev .
```

## Usage



```bash
$ docker pull marshallasch/cdev
$ docker run -v <path to dir on host>:/root/myCode -it marshallasch/cdev /bin/bash
```


Where the `<path to dir on host>` is the directory that contains the code that you wish to test.
The folder will be mounted at `/root/myCode`. *NOTE: that any changes made to the files in the docker container
will also be on the host machine.*



## Alias function

Here is a useful little bash function to save time when writing out the long command. You can put this in your `~/.bash_profile`
file.


```
function cDev() {

    PASSED=$1

    echo ""

    if [[ !  -d $PASSED ]]; then
        echo "$PASSED  must be a directory"
        return 1
    fi

    docker pull marshallasch/cdev

    if [[ $? -ne 0 ]]; then
        echo "Docker not running.... starting...."
        open /Applications/Docker.app
        sleep 5
        docker pull marshallasch/cdev
    fi

    echo "starting c dev environment"

    docker run -v "$PASSED:/root/code" -it marshallasch/cdev /bin/bash
}
```

