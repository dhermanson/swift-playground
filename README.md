# Swift Playground
This is just a play for me to learn Swift. I'm basically walking through the totorials on [Swift.org's website](https://www.swift.org/) and getting things up and running in Emacs.


## Emacs
Here are some packages I'm using:
- [swift-mode](https://github.com/swift-emacs/swift-mode)
- [eglot (built into Emacs in 29+)](https://github.com/joaotavora/eglot)

### Eglot - LSP
In order to get LSP integration working, I had to tell Eglot about the Swift language server. I did so via this:
```elisp
(add-to-list 'eglot-server-programs
             '(swift-mode . ("xcrun" "sourcekit-lsp")))

```
