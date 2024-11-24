# Martin-t's blog

Source for my website/blog using Zola.

## Dev notes

Enable extra checks before every commit: `git config core.hooksPath git-hooks`. It gets checked on CI anyway, this just catches issues faster.

Use `zola check` to check internal and external links in md files (templates are not checked) because `zola serve` doesn't do this.

~~Use the `@` syntax for internal links, otherwise they're not checked (`@` even checks anchors).~~ Zola links are weird, seems `@` is relative but it's also possible to have relative links like `/../projects`.

Creating `.markdownlint.jsonc` to allow inline HTML caused it to start reporting line length warnings too fsr. Maybe there is some implicit default that only apples when the file doesn't exist?

Use `<br><br>` for paragraphs in sidenotes.
Sometimes a blank line works (inside lists) but other times it causes the second paragraph to appear in normal text,
possibly because markdown doesn't understand zola shortcodes.

Testing on other devices:

- Use `zola serve --drafts --interface 0.0.0.0`
- Open ports on the firewall - e.g. `sudo ufw allow from 192.168.18.10` or `sudo ufw allow 1111/tcp`, then `sudo ufw reload`.

LATER: A list of recently upadated posts: <https://www.getzola.org/documentation/content/section/#update-date>

LATER: Table of contents / TOC? <https://www.getzola.org/documentation/content/table-of-contents/>

LATER: Light vs dark theme syntax highlighting: <https://www.getzola.org/documentation/content/syntax-highlighting/#inline-vs-classed-highlighting>

LATER: Tags? Taxonomies? <https://www.getzola.org/documentation/content/taxonomies/>

LATER: Run `zola check` on CI, make sure there are no warnings like `Warning: Orphan page found: /other/test/`

LATER: Comments <https://giscus.app/> (e.g. <https://teadrinkingprogrammer.github.io/tranquil-demo/blog/markdown/#1>)

## License

Code samples are dual-licensed under [Apache 2.0](LICENSE-APACHE-2.0.txt) or [MIT](LICENSE-MIT.txt) - you can use them pretty much freely.

The code of the website itself (mostly HTML/CSS/JS) is licensed under [AGPL 3.0](LICENSE-AGPL-3.0.txt) - you can use it for your own website but you have to share any modifications.

The text content is all rights reserved - i.e. don't republish my articles and claim they're yours.
