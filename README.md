# XVI32 2.55 Patch

### XVI32: The Roots

XVI32 is a freeware hex editor running under Windows, developed by Christian Maas.  
The latest version of XVI32 is 2.55:  
http://www.chmaas.handshake.de/delphi/freeware/xvi32/xvi32.htm  

XVI32 is a portable application. It is well-designed, small, and fast. Here are some of its unique features:
- XVIscript (built-in script interpreter)
- Character conversions (table-based)
- Wildcard support (Joker character) during searching
- Block operations (copy, overwrite, move, delete)


### This Patch: Intention and Goal

XVI32 is a reliable program that has stood the test of time.  
However, time marches on, and some features have become outdated. For example, the old HLP help file format is no longer supported by modern versions of Windows, so a CHM help file should be used instead.  
  
Additionally, XVI32's behavior can be improved in a few small ways. For instance, we can eliminate window flickering on start-up, restrict the "Accessing network" status message to remote files only, and prompt the user to save an unnamed XVIscript instead of throwing a "Cannot create file" error.  

These are tiny rough edges that just need a bit of care to work as originally intended. So I treat this patch as a clean-up correction rather than a "hack."  
  
I wrote an email to Christian describing this patch and asking whether he would like to host it on XVI32's official page. Here is his answer:  
> Please understand that I won't update my old software.
> And I can't provide a patched version on my website, either.

After some thought, I replied:  
> Then I'll just make the patch available on GitHub - that way, others can find it if they're interested.

So... here we are!

### This Patch: Technical Details

This patch relies on three main components:
- The XVI32 2.55 code decompiled using IDR ([Interactive Delphi Reconstructor](https://github.com/crypto2011/IDR))
- `XVI32-0.exe`, the corresponding official version 2.55 executable
- The patch script `patch_htmlhelp.py` generated with the help of an AI agent  
  
Although this patch originally started as a fix to redirect all "Help" and "?" buttons to the CHM file instead of HLP, the Python script kept its original name, `patch_htmlhelp.py`.  

I added further improvements later. See `patch_htmlhelp_info.txt` for a full breakdown of all applied changes.  

An AI agent "patch" skill was also created later. With this skill, you can simply write a prompt like:
> /patch Let's fix the ... behavior in the ... window

...and the AI agent will take care of the rest. As simple as that.

You can find the complete XVI32 archive, including the patched binary, under the **Releases** section.
