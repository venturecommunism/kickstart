### Install script

To install you could use the [install script](https://raw.github.com/venturecommunism/kickstart/master/kickstart.sh) using Wget:

    wget -qO- https://raw.github.com/venturecommunism/kickstart/master/kickstart.sh | /bin/bash

or cURL:

    curl https://raw.github.com/venturecommunism/kickstart/master/kickstart.sh | /bin/bash

### Dev notes 

Trackpad was disabled for me.

xinput list showed trackpad was id=12

xinput --enable 12

worked.
