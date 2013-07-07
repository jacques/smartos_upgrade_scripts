# SmartOS Upgrade Scripts

These scripts are run from the SmartOS Global Zone.  Please note that I have not tested this on SmartDataCenter,
just the vanilla SmartOS releases.

## 20130515

Fixes the following issues:
 * OS-2175 have mdata:fetch write out new /etc/resolv.conf if required data is in metadata.
 * OS-2194 allow resolvers to be an empty array and in that case, write resolv.conf with no 'nameserver' lines.

   If using Chef it goes into maintenance as it cannot collect the cookbooks to regenerate.  Seemed better to run
   a upgrade script via the Global Zone to fix this.  The commit that breaks this is: 
   https://github.com/joyent/smartos-live/commit/419670606aed7e7f7f9bc0ac78708b2b3bfe88b8

## 20130613

Workaround for ntp in maintenance:
 * OS-2135 /etc/rtc_config contains evil

   If using chef in the Global Zone you can just hook in a recipe for ntp and check on the status before executing
   ntpdate and then clearing the service in maintenance.

# License

```
Copyright (c) 2013 Jacques Marneweck. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE
```
