# Table of Contents

1.  [Web Mode And Rjsx Mode](#org2704bb3)


<a id="org2704bb3"></a>

# Web Mode And Rjsx Mode

I recently switched to emacs and instanly impressed by the extensiblity and on the other hand
overwhelmed by the options emacs has to offer. I mostly code in javscript and recently started
React js. Coming straight to the point emacs has a feature called mode for every type of file.
like org-mode, prog-mode, js-mode etc. So I have to choose between web mode and rjsx mode for
jsx file. Rjsx mode is not very good with js file as i experienced but one thing i like about
rjsx mode is the auto paring expansion which is different from emmet mode or web mode. So I wrote
a auto pairing like rjsx mode for web mode myself.


> I make this util to work with only web mode. I didn't find a way to map the key bindings for web mode.

<img src="./demo.gif"/>


Improvements:

1. Some way to indetify when to expand. Like not to expand in `if` else or `for` loops

