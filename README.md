cloudshell_lcd
==============

This is my take on the cloudshell_lcd script found at https://github.com/mdrjr/cloudshell_lcd/.

It is tailored for Arch Linux, but should probably run under any sufficiently modern distribution that uses systemd.

* Requires: curl, bc, con2fbmap (available at https://aur.archlinux.org/packages/con2fbmap)
* Optional: nfs-utils, samba, netatalk

### Setup
You should examine the `cloudshell` script and modify the variables for `NETIF`, `SATA`, `REFRESH`, `EXT_IP_REFRESH`, and `TEMPERATURE_FORMAT` to meet your requirements.

You should also modify the `Environment=CLOUDSHELL_CONSOLE=` line in `cloudshell.service` if you wish to use a different virtual console for the display.  It defaults to console 9 since most people do not have anything running on this by default and it can still be switched to/from with a keyboard.

### Usage
To install, type `sudo make install` and then enable the script with `sudo systemctl enable cloudshell` and `sudo systemctl start cloudshell` if you do not with to restart at this time.

To uninstall, type `sudo make uninstall`.  The service, if enabled, will be disabled automatically (ignore the error if you have already done this or never enabled it).

### Reasons for Modifications (skip this if you don't care)
This is a heavily rewritten version because I found that the original script didn't quite meet my needs.

It started with a lack of color when started as a service.  I tracked this to `tput` requiring a tty for its shell, which led to a solution from http://stackoverflow.com/a/20401674.

I also occasionally use the ODROID-XU4 with an attached HDMI monitor and wanted to make sure that the correct framebuffer was used, which led to `con2fbmap`, and even without an external monitor I wanted to be able to attach a keyboard and switch back to a virtual console with a login prompt, which is why the `chvt` is only executed once, outside the loop... if you do toggle another console, you will have to remember to toggle back (ALT-F9 by default).

I've also added support for displaying Netatalk connections and code to detect if NFS, Samba, or Netatalk are installed.

If you invoke the `cloudshell` command from a login shell, it will just output once to your terminal... this was done to aid in testing.

Some other formatting changes were made to suit my tastes... you are free to agree or disagree and change it to suit yours.

### License
The original code does not appear to have been released with a license, so I am releasing my version under the MIT License.  If you believe that I have missed something or that I am not authorized to do so, please inform me so that the appropriate changes can be made.

> The MIT License (MIT)
>
> Copyright (c) 2017 Aaron Magill
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> THE SOFTWARE.
