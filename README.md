<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#orgb175ff7">1. Initial setup</a></li>
<li><a href="#org6f6df80">2. Kostafey's keybindings</a>
<ul>
<li><a href="#org67810ec">2.1. Humane emacs</a>
<ul>
<li><a href="#org7c1b823">2.1.1. Exit/hide emacs</a></li>
<li><a href="#org6dd8efb">2.1.2. Select Copy Paste</a></li>
<li><a href="#orgcf36654">2.1.3. Undo/redo</a></li>
<li><a href="#orgb231519">2.1.4. Delete/insert char</a></li>
<li><a href="#orgff671f4">2.1.5. Save/revert</a></li>
</ul>
</li>
<li><a href="#org6fc37e6">2.2. Basic point movements &amp; change buffer's position</a></li>
<li><a href="#org2d86f7f">2.3. Point hyper-jumps</a>
<ul>
<li><a href="#org6d54c0f">2.3.1. Bookmarks</a></li>
<li><a href="#orge2fb892">2.3.2. Search &amp; replace</a></li>
<li><a href="#orgd6d62cb">2.3.3. Intellectual point jumps</a></li>
</ul>
</li>
<li><a href="#orgf859019">2.4. Frames</a></li>
<li><a href="#org2afef5d">2.5. Command executions</a></li>
<li><a href="#org14140d3">2.6. Text transformations</a>
<ul>
<li><a href="#org7a98f45">2.6.1. Basic text transformations</a></li>
<li><a href="#org45f5f7b">2.6.2. Rectangle operations</a></li>
<li><a href="#org330fe7f">2.6.3. Upcase/downcase</a></li>
<li><a href="#orgced281f">2.6.4. Region &amp; misc operations</a></li>
<li><a href="#org36c86cd">2.6.5. ASCII graphic &amp; formatting notes</a></li>
<li><a href="#org71578a8">2.6.6. Paredit customization</a></li>
</ul>
</li>
<li><a href="#org289d87f">2.7. IDE</a>
<ul>
<li><a href="#org429233c">2.7.1. Speedbar</a></li>
<li><a href="#org26eaaf4">2.7.2. Common prog mode keys</a></li>
<li><a href="#orga937f47">2.7.3. Java</a></li>
<li><a href="#org373970a">2.7.4. Lisp</a></li>
<li><a href="#orgebf3c66">2.7.5. Clojure</a></li>
<li><a href="#orga3d90cc">2.7.6. Lua</a></li>
<li><a href="#orgb831702">2.7.7. Scala</a></li>
<li><a href="#org7418292">2.7.8. Tcl</a></li>
<li><a href="#org17e3762">2.7.9. Golang</a></li>
<li><a href="#org893709f">2.7.10. reStructuredText</a></li>
<li><a href="#org8e242dc">2.7.11. Version control</a>
<ul>
<li><a href="#orgba5ea68">2.7.11.1. Magit &amp; ahg</a></li>
<li><a href="#org9ffcb79">2.7.11.2. git-gutter</a></li>
</ul>
</li>
</ul>
</li>
<li><a href="#org0544dac">2.8. Mouse</a></li>
<li><a href="#org6434a3a">2.9. Menu</a>
<ul>
<li><a href="#orgd952080">2.9.1. header<sub>name</sub></a></li>
</ul>
</li>
<li><a href="#orgff7f3bd">2.10. Org-mode</a>
<ul>
<li><a href="#orgefa6999">2.10.1. Time schedule</a></li>
</ul>
</li>
<li><a href="#orgf6fce32">2.11. Emacs OS</a>
<ul>
<li><a href="#orgd1a0f16">2.11.1. elfeed</a></li>
<li><a href="#orgaafa07a">2.11.2. stock-ticker</a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>
</div>


<a id="orgb175ff7"></a>

# Initial setup

Add to .emacs:

(load-file "~/.emacs.d/init.el")


<a id="org6f6df80"></a>

# Kostafey's keybindings


<a id="org67810ec"></a>

## Humane emacs


<a id="org7c1b823"></a>

### Exit/hide emacs

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">M-z</td>
<td class="org-left">iconify-or-deiconify-frame</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">M-&lt;f4&gt;</td>
<td class="org-left">save-buffers-kill-terminal</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org6dd8efb"></a>

### Select Copy Paste

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-S-v</td>
<td class="org-left">cua-paste-pop</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-M-v</td>
<td class="org-left">(cua-paste-pop -1)</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-M-c</td>
<td class="org-left">lambda</td>
<td class="org-left">Append selected text to temp buffer</td>
</tr>


<tr>
<td class="org-left">C-e</td>
<td class="org-left">cua-exchange-point-and-mark</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-S-e</td>
<td class="org-left">(cua-exchange-point-and-mark 1)</td>
<td class="org-left">Exchange and select</td>
</tr>


<tr>
<td class="org-left">C-a</td>
<td class="org-left">mark-whole-buffer</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">M-s</td>
<td class="org-left">set-mark-command</td>
<td class="org-left">(As old C-SPC)</td>
</tr>
</tbody>
</table>


<a id="orgcf36654"></a>

### Undo/redo

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-z</td>
<td class="org-left">undo</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-S-z</td>
<td class="org-left">redo</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-'</td>
<td class="org-left">repeat</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="orgb231519"></a>

### Delete/insert char

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-b</td>
<td class="org-left">backward-delete-char</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-d</td>
<td class="org-left">delete-char</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-q</td>
<td class="org-left">quoted-insert</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="orgff671f4"></a>

### Save/revert

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-s</td>
<td class="org-left">save-buffer</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-x r</td>
<td class="org-left">revert-buffer</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-x RET r</td>
<td class="org-left">revert-buffer-with-coding-system</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org6fc37e6"></a>

## Basic point movements & change buffer's position

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-&lt;right&gt;</td>
<td class="org-left">step-forward-word</td>
<td class="org-left">Like odinary editors, moves</td>
</tr>


<tr>
<td class="org-left">C-&lt;left&gt;</td>
<td class="org-left">step-backward-word</td>
<td class="org-left">forward word/backward word.</td>
</tr>


<tr>
<td class="org-left">C-M-&lt;down&gt;</td>
<td class="org-left">forward-sentence</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-M-&lt;up&gt;</td>
<td class="org-left">backward-sentence</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org2d86f7f"></a>

## Point hyper-jumps


<a id="org6d54c0f"></a>

### Bookmarks

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-b</td>
<td class="org-left">bookmark-set</td>
</tr>


<tr>
<td class="org-left">M-b</td>
<td class="org-left">bookmark-jump</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-x x</td>
<td class="org-left">goto-last-change</td>
</tr>


<tr>
<td class="org-left">C-c left</td>
<td class="org-left">winner-undo</td>
</tr>


<tr>
<td class="org-left">C-c right</td>
<td class="org-left">winner-redo</td>
</tr>
</tbody>
</table>


<a id="orge2fb892"></a>

### Search & replace

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-f</td>
<td class="org-left">isearch-forward</td>
</tr>


<tr>
<td class="org-left">C-r</td>
<td class="org-left">isearch-backward</td>
</tr>


<tr>
<td class="org-left">M-e</td>
<td class="org-left">isearch-edit-string</td>
</tr>


<tr>
<td class="org-left">C-S-f</td>
<td class="org-left">flx-isearch-forward</td>
</tr>


<tr>
<td class="org-left">C-S-r</td>
<td class="org-left">flx-isearch-backward</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">M-r</td>
<td class="org-left">replace-string</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-M-f</td>
<td class="org-left">ag</td>
</tr>


<tr>
<td class="org-left">C-c C-f</td>
<td class="org-left">ack-file</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">control F3</td>
<td class="org-left">highlight-symbol-at-point</td>
</tr>


<tr>
<td class="org-left">F3</td>
<td class="org-left">highlight-symbol-next</td>
</tr>


<tr>
<td class="org-left">shift F3</td>
<td class="org-left">highlight-symbol-prev</td>
</tr>


<tr>
<td class="org-left">meta F3</td>
<td class="org-left">highlight-symbol-remove-all</td>
</tr>


<tr>
<td class="org-left">C-M-<up></td>
<td class="org-left">highlight-symbol-prev</td>
</tr>


<tr>
<td class="org-left">C-M-<down></td>
<td class="org-left">highlight-symbol-next</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">M-a</td>
<td class="org-left">ace-jump-mode</td>
</tr>
</tbody>
</table>


<a id="orgd6d62cb"></a>

### Intellectual point jumps

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">sgml-pretty-print</td>
<td class="org-left">Format selected xml.</td>
</tr>


<tr>
<td class="org-left">C-n</td>
<td class="org-left">sgml-skip-tag-forward</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-b</td>
<td class="org-left">sgml-skip-tag-backward</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-M-d</td>
<td class="org-left">hop-at-point</td>
<td class="org-left">Jump to elisp definition</td>
</tr>
</tbody>
</table>


<a id="orgf859019"></a>

## Frames

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">s-tab</td>
<td class="org-left">other-frame</td>
</tr>
</tbody>
</table>


<a id="org2afef5d"></a>

## Command executions

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">M-x</td>
<td class="org-left">smex</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">M-X</td>
<td class="org-left">smex-major-mode-commands</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-c C-c M-x</td>
<td class="org-left">execute-extended-command</td>
<td class="org-left">This is your old M-x</td>
</tr>
</tbody>
</table>


<a id="org14140d3"></a>

## Text transformations


<a id="org7a98f45"></a>

### Basic text transformations

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-n</td>
<td class="org-left">newline</td>
</tr>


<tr>
<td class="org-left">C-o</td>
<td class="org-left">open-line</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">M-t</td>
<td class="org-left">transpose-words</td>
</tr>


<tr>
<td class="org-left">M-y</td>
<td class="org-left">transpose-words -1</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-j</td>
<td class="org-left">join-next-line-space-n</td>
</tr>


<tr>
<td class="org-left">C-c j</td>
<td class="org-left">join-next-line-n</td>
</tr>


<tr>
<td class="org-left">C-c C-j</td>
<td class="org-left">join-next-line-semicolon-n</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-c c</td>
<td class="org-left">center-line</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-M-k</td>
<td class="org-left">kill-whole-line</td>
</tr>


<tr>
<td class="org-left">C-k</td>
<td class="org-left">kill-line</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-S-c</td>
<td class="org-left">copy-line</td>
</tr>


<tr>
<td class="org-left">C-S-l</td>
<td class="org-left">mark-line</td>
</tr>


<tr>
<td class="org-left">C-c u</td>
<td class="org-left">copy-url</td>
</tr>


<tr>
<td class="org-left">C-c d</td>
<td class="org-left">duplicate-line</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-c C-l</td>
<td class="org-left">toggle-truncate-lines</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-c q</td>
<td class="org-left">unfill-paragraph</td>
</tr>
</tbody>
</table>


<a id="org45f5f7b"></a>

### Rectangle operations

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-M-a n</td>
<td class="org-left">rectangle-number-lines</td>
</tr>


<tr>
<td class="org-left">C-M-a v</td>
<td class="org-left">string-insert-rectangle</td>
</tr>


<tr>
<td class="org-left">C-M-a c</td>
<td class="org-left">copy-rectangle-to-clipboard</td>
</tr>


<tr>
<td class="org-left">C-M-a r</td>
<td class="org-left">yank-rectangle</td>
</tr>


<tr>
<td class="org-left">M-u</td>
<td class="org-left">cua-upcase-rectangle</td>
</tr>
</tbody>
</table>


<a id="org330fe7f"></a>

### Upcase/downcase

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-S-<up></td>
<td class="org-left">toggle-letter-case</td>
</tr>
</tbody>
</table>


<a id="orgced281f"></a>

### Region & misc operations

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-M-a :</td>
<td class="org-left">align-by-column</td>
</tr>


<tr>
<td class="org-left">C-M-a '</td>
<td class="org-left">align-by-quote</td>
</tr>


<tr>
<td class="org-left">align-regexp</td>
<td class="org-left">align-regexp</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-;</td>
<td class="org-left">comment-or-uncomment-this</td>
</tr>


<tr>
<td class="org-left">C-/</td>
<td class="org-left">comment-or-uncomment-this</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-\`</td>
<td class="org-left">u:en/ru-recode-region</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-M-R</td>
<td class="org-left">replace-regexp</td>
</tr>


<tr>
<td class="org-left">M-R</td>
<td class="org-left">query-replace</td>
</tr>


<tr>
<td class="org-left">C-M-a k</td>
<td class="org-left">keep-lines</td>
</tr>


<tr>
<td class="org-left">C-M-a f</td>
<td class="org-left">flush-lines</td>
</tr>
</tbody>
</table>


<a id="org36c86cd"></a>

### ASCII graphic & formatting notes

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">markdown-insert-header-setext-1</td>
<td class="org-left">Add double underline to text</td>
</tr>


<tr>
<td class="org-left">markdown-insert-header-setext-2</td>
<td class="org-left">Add underline to text</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">comment-box</td>
<td class="org-left">Comment region, putting it inside a box</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">picture-draw-rectangle</td>
<td class="org-left">Draw rectangle around rectangle-mark</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">selection</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">table-insert</td>
<td class="org-left">Table creation & manipulation</td>
</tr>


<tr>
<td class="org-left">table-recognize</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">table-unrecognize</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">\*table&#x2013;cell-center-paragraph</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">center-line</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">center-region</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org71578a8"></a>

### Paredit customization

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">M-S-(</td>
<td class="org-left">paredit-wrap-round</td>
<td class="org-left">(foo  #bar baz)</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#x2014;></td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">(foo (#bar) baz)</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">M-S-s</td>
<td class="org-left">paredit-splice-sexp</td>
<td class="org-left">(foo (bar# baz) quux)</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#x2014;></td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">(foo bar# baz quux)</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-S-)</td>
<td class="org-left">paredit-forward-slurp-sexp</td>
<td class="org-left">(foo (bar #baz) quux zot)</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#x2014;></td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">(foo (bar #baz quux) zot)</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-S-}</td>
<td class="org-left">paredit-forward-barf-sexp</td>
<td class="org-left">(foo (bar #baz quux) zot)</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#x2014;></td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">(foo (bar #baz) quux zot)</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-S-(</td>
<td class="org-left">paredit-backward-slurp-sexp</td>
<td class="org-left">(foo bar (baz# quux) zot)</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#x2014;></td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">(foo (bar baz# quux) zot)</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">C-S-{</td>
<td class="org-left">paredit-backward-barf-sexp</td>
<td class="org-left">(foo (bar baz #quux) zot)</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#x2014;></td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">(foo bar (baz #quux) zot)</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">ESC <up></td>
<td class="org-left">paredit-splice-sexp-killing-backward</td>
<td class="org-left">(foo (bar #(sqrt n)))</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#x2013;></td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">(foo #(sqrt n))</td>
</tr>
</tbody>

<tbody>
<tr>
<td class="org-left">M-s-<right></td>
<td class="org-left">transpose-sexps</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">M-s-<left></td>
<td class="org-left">(transpose-sexps -1)</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org289d87f"></a>

## IDE

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">s-s</td>
<td class="org-left">sr-speedbar-toggle</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-x B</td>
<td class="org-left">semantic-mrub-switch-tag</td>
<td class="org-left">Backward after semantic-ia-fast-jump</td>
</tr>
</tbody>
</table>


<a id="org429233c"></a>

### Speedbar


<a id="org26eaaf4"></a>

### Common prog mode keys

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">M-S-<left></td>
<td class="org-left">hop-backward</td>
<td class="org-left">Hop backward if M-<left> is uncertain</td>
</tr>


<tr>
<td class="org-left">M-S-<right></td>
<td class="org-left">hop-forward</td>
<td class="org-left">Hop forward if M-<right> is uncertain</td>
</tr>
</tbody>
</table>


<a id="orga937f47"></a>

### Java


<a id="org373970a"></a>

### Lisp

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-c C-k</td>
<td class="org-left">slime-compile-and-load-file</td>
</tr>


<tr>
<td class="org-left">C-c h</td>
<td class="org-left">slime-hyperspec-lookup</td>
</tr>
</tbody>
</table>


<a id="orgebf3c66"></a>

### Clojure


<a id="orga3d90cc"></a>

### Lua

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-c C-l</td>
<td class="org-left">lua-send-buffer</td>
</tr>


<tr>
<td class="org-left">C-c C-f</td>
<td class="org-left">lua-search-documentation</td>
</tr>


<tr>
<td class="org-left">C-c C-c</td>
<td class="org-left">lua-send-current-line</td>
</tr>


<tr>
<td class="org-left">M-e</td>
<td class="org-left">lua-send-region</td>
</tr>
</tbody>
</table>


<a id="orgb831702"></a>

### Scala

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-n j</td>
<td class="org-left">ensime</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-c C-v s</td>
<td class="org-left">ensime-sbt-switch</td>
<td class="org-left">Switch to the sbt shell</td>
</tr>


<tr>
<td class="org-left">C-c C-v z</td>
<td class="org-left">ensime-inf-switch</td>
<td class="org-left">Start/switch to scala REPL</td>
</tr>


<tr>
<td class="org-left">C-n c</td>
<td class="org-left">ensime-inf-switch</td>
<td class="org-left">Start/switch to scala REPL</td>
</tr>


<tr>
<td class="org-left">C-c C-v e</td>
<td class="org-left">ensime-print-errors-at-point</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-M-/</td>
<td class="org-left">ensime-print-errors-at-point</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-c C-v t</td>
<td class="org-left">ensime-type-at-point</td>
<td class="org-left">Echo the type at point to the minibuffer</td>
</tr>


<tr>
<td class="org-left">M-=</td>
<td class="org-left">ensime-type-at-point</td>
<td class="org-left">Echo the type at point to the minibuffer</td>
</tr>


<tr>
<td class="org-left">C-c C-v b</td>
<td class="org-left">ensime-inf-eval-buffer</td>
<td class="org-left">Send whole buffer to Scala interpreter</td>
</tr>


<tr>
<td class="org-left">C-n e b</td>
<td class="org-left">k/ensime-eval-buffer</td>
<td class="org-left">Send whole buffer to Scala interpreter</td>
</tr>


<tr>
<td class="org-left">C-c C-r</td>
<td class="org-left">ensime-inf-eval-region</td>
<td class="org-left">Send current region to Scala interpreter</td>
</tr>


<tr>
<td class="org-left">M-e</td>
<td class="org-left">ensime-inf-eval-region</td>
<td class="org-left">Send current region to Scala interpreter</td>
</tr>


<tr>
<td class="org-left">C-x C-e</td>
<td class="org-left">k/ensime-eval-last-scala-expr</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-n q</td>
<td class="org-left">k/ensime-quit</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org7418292"></a>

### Tcl

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-c C-t</td>
<td class="org-left">inferior-tcl</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-c C-f</td>
<td class="org-left">tcl-load-file</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-c C-v</td>
<td class="org-left">tcl-eval-defun</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">C-c C-x</td>
<td class="org-left">tcl-eval-region</td>
<td class="org-left">&#xa0;</td>
</tr>


<tr>
<td class="org-left">M-e</td>
<td class="org-left">tcl-eval-region</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="org17e3762"></a>

### Golang


<a id="org893709f"></a>

### reStructuredText


<a id="org8e242dc"></a>

### Version control


<a id="orgba5ea68"></a>

#### Magit & ahg

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-w</td>
<td class="org-left">prh:kill-current-buffer</td>
<td class="org-left">kill current buffer</td>
</tr>


<tr>
<td class="org-left">M-w</td>
<td class="org-left">get-vc-status</td>
<td class="org-left"><b>prog-mode</b>: git or hg status</td>
</tr>


<tr>
<td class="org-left">M-w</td>
<td class="org-left">diffview-current</td>
<td class="org-left"><b>magit-mode</b>: two-window</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">(side-by-side) comparsion</td>
</tr>


<tr>
<td class="org-left">S-M-w</td>
<td class="org-left">magit-copy-buffer-revision</td>
<td class="org-left">get buffer revision</td>
</tr>
</tbody>
</table>


<a id="org9ffcb79"></a>

#### git-gutter

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-M-g &lt;down&gt;</td>
<td class="org-left">git-gutter:next-hunk</td>
</tr>


<tr>
<td class="org-left">C-M-g &lt;down&gt;</td>
<td class="org-left">git-gutter:previous-hunk</td>
</tr>


<tr>
<td class="org-left">C-M-g p</td>
<td class="org-left">git-gutter:popup-hunk</td>
</tr>
</tbody>
</table>


<a id="org0544dac"></a>

## Mouse


<a id="org6434a3a"></a>

## Menu


<a id="orgd952080"></a>

### header<sub>name</sub>

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">M-\`</td>
<td class="org-left">tmm-menubar</td>
<td class="org-left">Text menu</td>
</tr>
</tbody>
</table>


<a id="orgff7f3bd"></a>

## Org-mode


<a id="orgefa6999"></a>

### Time schedule

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Key</th>
<th scope="col" class="org-left">Command</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">C-c C-t</td>
<td class="org-left">org-todo</td>
<td class="org-left">Change the TODO state of an item</td>
</tr>


<tr>
<td class="org-left">C-c C-x C-i</td>
<td class="org-left">org-clock-in</td>
<td class="org-left">Start the clock on the current item</td>
</tr>


<tr>
<td class="org-left">C-c C-x C-o</td>
<td class="org-left">org-clock-out</td>
<td class="org-left">Stop the currently running clock</td>
</tr>


<tr>
<td class="org-left">C-c C-x C-r</td>
<td class="org-left">org-clock-report</td>
<td class="org-left">Create a table containing a report</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
<td class="org-left">about clocked time</td>
</tr>
</tbody>
</table>


<a id="orgf6fce32"></a>

## Emacs OS


<a id="orgd1a0f16"></a>

### elfeed


<a id="orgaafa07a"></a>

### stock-ticker

