+++
title = "Basics for readable websites that most devs don't seem to understand"
+++

<!--
  Feel free to look how it's done, just keep in mind I normally avoid webdev like the plague
  and although I do somewhat enjoy doing everything here myself to learn how things work,
  everything here is based on potentially incomplete/incorrect understanding and copious amounts of Stack Overflowing.
-->

Here's a list of rules how I think websites should by "styled" for better readability. In my opinion these are all fairly obvious once you think about it and should be baseline requirements for text-heavy content. Unfortunately, however, for some reason most websites fail to meet them and that bothers me enough to write this mildly annoyed post.

With examples.

You'll immediately notice that while I am preaching, my own blog doesn't meet all of them (at the moment). That's because I couldn't find a single Zola theme which ~~looked at least barely acceptable~~ satisfied them. So I guess I am now learning enough HTML/CSS to do it myself ... or at least discover for myself why so few websites do things right, understand why it's literally impossible to put pixels on screen the way I want, and rekindle my hatred for webdev.

Note that everything here is my personal opinion but feel free to consider it fact and absolute truth. I have no formal education in design... but these days that should give me _more_ authority when it comes to readability and usability.

## Footnotes must appear on the side

Having to jump to the bottom breaks the flow of reading, duh. "Footnotes" should really be sidenotes so people can glance at them while reading the main text. In fact, peripheral vision lets them know if it's a 2 word throwaway joke or 2 paragraphs of extra explanation without even thinking about it.

On mobile, allow tapping to expand them instead.

And for the love of flying spaghetti monster, if you read this and still put footnotes at the bottom for whatever reason, at least make them link back.

<!-- TODO Feel free to substitute with your fairytale creature of choice. -->

Some websites and how they do it:

- [stilldrinking.org](http://www.stilldrinking.org/grammar-maquis) ([archive](https://web.archive.org/web/20231025082455/http://www.stilldrinking.org/grammar-maquis)) - Position calculated ahead of time and hardcoded, does not change when editing the HTML. Not idea how to do this in zola / with styles.
- [verdagon.dev](https://verdagon.dev/blog/generational-references) ([archive](https://web.archive.org/web/20231013010305/https://verdagon.dev/blog/generational-references)) - Seems to use some layout trick, automatically adjusts based on text length but the sidenotes can end up overlapping in some cases.
- [predr.ag](https://predr.ag/blog/speeding-up-rust-semver-checking-by-over-2000x/) ([archive](https://web.archive.org/web/20231015013845/https://predr.ag/blog/speeding-up-rust-semver-checking-by-over-2000x/)) - Sidenotes are part of the paragraph in HTML and positioned to the side using CSS. They never overlap with each other but sometimes do with headings.

And [here's](https://gwern.net/sidenote) a guy writing thousands of words on this basic topic.

Footnote definitions[^1][^2] should be next to the footnote references, not at the end of the paragraph or even lower. Note that Markdown footnote definitions in HTML are generated at the location where they appear in the Markdown source so you might have to move them up somehow.

Another paragraph with a footnote[^3].

[^1]: This is a footnote.

[^2]: This is another footnote, this time somewhat longer. Note that in markdown, you have to leave a blank line between footnote definitions as per [this issue](https://github.com/getzola/zola/issues/585) because of `pulldown-cmark`. And just like that we got to test a link and an inline code block. Plus _emphasis_, **bold**, and **_bold emphasis_**. Note to self: find a way to have multiple paragraphs. This is an essential feature because like half of the reason I made a blog is so I have a place I can rant to my heart's content. <!-- LATER -->

[^3]: This is a third footnote. All three should be on the side of the text, not at the end, and should not overlap with the heading or table below.

## Large tables must not be restricted by the width of the main text content

<div class="table">

<!-- Note the blank line between the div and the table in Markdown. Without it, the raw markdown would be included, not the rendered table. -->

| A wide table | pneumonoultramicroscopicsilicovolcanoconiosis | pseudopseudohypoparathyroidism | antidisestablishmentarianism                        | pseudopseudohypoparathyroidism | electroencephalographically | floccinaucinihilipilification | deinstitutionalization | counterrevolutionaries | uncharacteristically                                       |
|--------------|-----------------------------------------------|--------------------------------|-----------------------------------------------------|--------------------------------|-----------------------------|-------------------------------|------------------------|------------------------|------------------------------------------------------------|
| Meaning      | The disease silicosis                         | A hereditary medical disorder  | The political position of opposing disestablishment | You look it up                 |                             | What???                       |                        |                        | Oh look, even a normal person might actually use this one. |

</div>

Once upon a time, websites looked like [this](https://danluu.com/file-consistency/). Then people realized long lines are hard to read, noticed newspapers put text in columns, and started putting everything in columns like [this](http://bettermotherfuckingwebsite.com/). Now, if you're a general intelligence (e.g. an attention-paying human), you should already see the problem. A lot of people don't really care about actual readability, just with following trends and if the trend is to put some things in columns, why not just squish everything into a column, it's less CSS to write and it's fine most of the time.

Guess what, unlike text, tables are not more readable narrow. Especially not if you have to scroll sideways while over half your **wide**screen monitor is filled with empty space because somebody heard some catchy phrase about letting it breath but lacked the mental capacity to consider what it actually means.

So here's the rules for maximum readability:

- Tables should be as wide as necessary, not limited by text width.
- If the table needs to be wider than the monitor, then the horizontal scrollbar should only scroll the table, not the whole page.
- Tables are used to convey information in a clear and organized manner, information density matters. A table that looks "pretty" at the cost of making you scroll defeats that purpose. Don't add unnecessary whitespace.

Even Wikipeia gets this wrong. The [desktop version](https://en.wikipedia.org/wiki/Comparison_of_operating_system_kernels) doesn't squish tables but if they're too wide, they still start in the middle of the screen instead of more to the left. Yeah, the table of contents is in the way but it can be closed. It's funny, they bothered implementing a way to close it but it's completely useless because it doesn't make the newly empty space usable.

The [mobile version](https://en.m.wikipedia.org/wiki/Comparison_of_operating_system_kernels) is basically the same on a wide screen but when you make the window sufficiently narrow, it changes behavior so that everything is as wide as the screen and each table gets its own scrollbar. Of course that doesn't help you because to get this behavior you need to make the window uselessly narrow in the first place.

And one more thing: If the table is taller than the screen, the header should remain at the top of the screen when scrolling down. There's nothing more annoying than having to scroll up every 10 seconds to look up which column is which. Webpages aren't paper. Keep the header on screen at all times. [Some wikipedia pages](https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population_density) do this, others don't.

## Code blocks must have syntax highlighting and behave reasonably

```rust
fn main() {
    println!("Hello, world!"); // This comment turns this line into a very, very long line. Hopefully normal code is not like this.
}
```

Colors - obvious, moving on.

Code should not be wrapped nor should it overflow. Expand the container past the width of normal text if necessary. Same story as tables. We have widescreen monitors, we put normal text in a column because it's more readable. Code squished into a column is not more readable. Don't squish code into a column.[^wide-code]

[^wide-code]: Yes, long lines often indicate bad code. However: 1) As should be obvious if you got this far, sometimes things are more readable wide. Things like tables, because, yes, code sometimes contains data that is basically a table. 2) Not all code blocks are code, they can be program output, logs, ASCII art, etc. Also, whenever someone tells you a rule of thumb must be always followed, you can be certain they're the kind of person who can't handle nuance and their advice is worthless. This doesn't apply to the previous sentence, that one is always absolutely 100% true.

Only use wrapping / horizontal scrolling if the code block is too wide for the whole screen. Which hopefully never happens unless the content is really _special_.

And provide a copy button where the "Copied" message is _not_ animated. Seriously, animations exist to make slow things still feel smooth. They lie to the user to make them less annoyed. Copying is instant, the feedback should be instant. BTW, do you wonder why it needs feedback at all? Because people are so used to software being broken they won't trust the button alone.

<!-- LATER This would be an interesting experiment: don't give feedback to some users, count how many times they click. -->

## Headings must be linkable

Either the heading itself or an icon next to it.

It's just convenient to send people to a specific section. Or bookmark where you left off.

Note to self: experiment with making any text linkable, at least individual paragraphs. <!-- LATER -->

## Some images should also be wider than text

A lot of the time an image is just a rough illustration or photo that doesn't need to be large. Other times it's a diagram that needs to be readable and scaling it down makes it useless. Decide what works best for each image.

Images that are scaled down should be clickable to open in full size. Yes, you can right click and select Open Image in New Tab but middle click is more convenient and the fact the cursor changes makes it more obvious there's a larger version.

The same thing applies to videos. Consider using videos instead of gifs because they have controls by default.[^sorting-algo-gifs]

[^sorting-algo-gifs]: The internet is full of gifs of how various [sorting](https://upload.wikimedia.org/wikipedia/commons/c/cc/Merge-sort-example-300px.gif) algorithms [work](https://upload.wikimedia.org/wikipedia/commons/8/8e/Merge_sort_animation.gif). I am sure they took a lot of work to produce and their value is almost zero because if you miss something you have to wait for the entire thing to loop again. You can't even pause them or slow them down to examine what is actually happening. And yes, these days repeatedly clicking pause/play is the best way you can slow down a [video in the browser with its default controls](https://user-images.githubusercontent.com/4079823/152082630-a705286d-c630-4507-9213-b8a7b106d47e.mp4). All video players should by default allow setting speed and single stepping frames but it seems civilization has not advanced to that stage yet.

## There should be a list of all posts with just titles and dates

No or very short descriptions. Offer a way to skim all titles and quickly find the one people remember reading but don't remember the exact title.[^google-ctrl-f]

[^google-ctrl-f]: You could use google with `site:` but Ctrl+F has a its charm.

If you want the latest post on your main page in full, that's fine, just offer this list somewhere. There's way too many (wordpress?) blogs where the main page is just one full article after another and you'd have to click through a million pages to find anything or to just scan for topics you like.[^optics-blog]

[^optics-blog]: Like [this](https://skullsinthestars.com/) one. It has a ton of content, [some of it](https://skullsinthestars.com/2023/12/09/what-is-a-zero-refractive-index-material/) interesting but you can't get a proper feeling for what's there because even [filtered by category](https://skullsinthestars.com/category/optics/), the list of posts has infinite scrolling.

## Use page numbers instead of infinite scrolling

Or provide both if you really must.

Infinite scrolling exists for 2 reasons: mobile users[^phone-buttons] and feeding marginally more dopamine mixed with ads to addicts who would have closed your page if they had to overcome the minuscule inconvenience of clicking a button. It's functionally worse in almost every way when actually searching for something.

[^phone-buttons]: This is a rant for another day but most people hold a phone so their thumb can reach the middle of the screen, yet most of the controls (not just for pagination) are either at the top or bottom.

Have a button that goes to the oldest page. Let people see how everything started, especially if your first content was actually good because you had something to day but later became filler.

## Wait, there's a story behind all this, right?

Yes, what prompted this was ~~reading~~ trying to read a large table in a GitHub (GitLab?) readme and having to scroll left and right all the time even though the table would have fit on my screen perfectly if it wasn't unnecessarily restricted by the text width. Sadly I can't find the repo anymore so you can't properly appreciate the pain and suffering i had to go through.

Oh and footnotes on most websites make me wanna do things to other people with my foot, the nature of which shall be left to the reader's imagination.

## So how do I make my website actually readable? Is there a theme or template I can use or something?

Well, it's a website, you press Ctrl+U and the code's right there. More seriously, I have yet to decide whether the blog's source will be public or not.

<!-- How do you generate a random string? You put a first year CS student in front of vim and tell him to save and exit. -->
