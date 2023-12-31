# Martin-t's blog

Source for my website/blog using Zola.

## Dev notes

Enable extra checks before every commit: `git config core.hooksPath git-hooks`. It gets checked on CI anyway, this just catches issues faster.

Use `zola check` to check internal and external links in md files (templates are not checked) because `zola serve` doesn't do this.

~~Use the `@` syntax for internal links, otherwise they're not checked (`@` even checks anchors).~~ Zola links are weird, seems `@` is relative but it's also possible to have relative links like `/../projects`.

Creating `.markdownlint.jsonc` to allow inline HTML caused it to start reporting line length warnings too fsr. Maybe there is some implicit default that only apples when the file doesn't exist?

Testing on other devices:

- Use `zola serve --drafts --interface 0.0.0.0`
- Open ports on the firewall - e.g. `sudo ufw allow from 192.168.18.10` or `sudo ufw allow 1111/tcp`, then `sudo ufw reload`.

TODOs:

```text
# If set to "true", a feed file will be generated for this section at the
# section's root path. This is independent of the site-wide variable of the same
# name. The section feed will only include posts from that respective feed, and
# not from any other sections, including sub-sections under that section.
generate_feed = false

<!-- more --> to create summary https://www.getzola.org/documentation/content/page/#summary
```

<https://www.getzola.org/documentation/content/section/#update-date>

<https://www.getzola.org/documentation/content/table-of-contents/>

Syntax highlighting in light vs dark mode: <https://www.getzola.org/documentation/content/syntax-highlighting/#inline-vs-classed-highlighting>

Taxonomies: <https://www.getzola.org/documentation/content/taxonomies/>

Run `zola check` on CI, make sure there are no warnings like `Warning: Orphan page found: /other/test/`

<https://giscus.app/>

This has a nice markdown showcase, even if it has bad footnotes: <https://teadrinkingprogrammer.github.io/tranquil-demo/blog/markdown/#1>
