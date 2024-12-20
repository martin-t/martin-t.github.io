+++
title = "Basic requirements for readable websites which most devs don't seem to understand for some reason"
+++

<!--
  Feel free to look how it's done, just keep in mind I normally avoid webdev like the plague
  and although I do somewhat enjoy doing everything here myself to learn how things work,
  everything here is based on potentially incomplete/incorrect understanding and copious amounts of Stack Overflowing.
-->

Here's a list of rules how I think websites should by structured and styled for better readability. In my opinion these are all fairly obvious once you think about it and should be baseline requirements for text content. Unfortunately, however, and I have no idea why, most websites fail to meet them and that bothers me enough to write this mildly annoyed post.{% sidenote() %}
  You'll immediately notice that while I am preaching, my own blog doesn't meet all of them (at the moment). That's because I couldn't find a single Zola theme which ~~looked at least barely acceptable~~ satisfied them. So I guess I am now learning enough HTML/CSS to do it myself ... or at least discover on my own why so few websites do things right, understand why it's literally impossible to put pixels on screen the way I want, and rekindle my hatred for webdev.
{% end %}
{% sidenote() %}
  Two months of learning HTML/CSS later: OK, I am beginning to have an idea why...
{% end %}

With examples.

<!-- more -->

Note that everything here is my personal opinion but feel free to consider it fact and absolute truth. I have no formal education in design... but these days that should give me _more_ authority when it comes to readability and usability.

## Use sidenotes instead of footnotes

TODO FIX Diagram of screen with empty space? Gimp smooth stroke? canva.com? excalidraw.com?

Having to jump to the bottom breaks the flow of reading, duh. "Footnotes" should really be sidenotes so people can glance at them while reading the main text. In fact, peripheral vision lets them know if it's a 2 word throwaway joke or 2 paragraphs of extra explanation without even thinking about it.

On mobile, allow tapping to expand them instead or include them in a different font right under the paragraph they refer to.

And for the love of <span title="Feel free to substitute with your fairytale creature of choice.">flying spaghetti monster</span>, if you read this and still use footnotes at the bottom for whatever reason, at least make them link back.

[Here's](https://gwern.net/sidenote) a guy writing thousands of words on this basic topic.

So how to do it? The TL;DR of Gwern's article is to use Tufte-CSS, unless you have special needs. I think it's a good start, unfortunately:

- You can't use markdown footnotes. They get rendered below the paragraph and there's no way to place them at the right height next to the reference. You have to write sidenotes manually as raw HTML.
- Some of the other requirements here, like wide tables, _are_ fairly special. As I said, they should be basic stuff but CSS is so bad even people who care about readability don't usually bother with them. And because most people don't know what they want unless they see it somewhere else, very few even want them. And, going full circle, this means there's nobody putting pressure on CSS to evolve and get a proper layout system.{% sidenote(side="right") %}
  What do I mean? Basic stuff like raise one element to the height of another but lower if there's something already in the way. Or a way to apply `clear: right` conditionally based on the element's width. Or a way to make `clear: right` only apply between elements of one class. Try to have a sidenote floated all the way to the website's margin and an image floated to the side of the text column. Everything works perfectly ~~unless~~ until, by chance, they end up at the same height, then it silently breaks.
  <br><br>
  Or imagine such sci-fi requirements as wanting the sidenote to prefer the side closer to the sidenote reference, unless that would overlap with a previous sidenote, then prefer the other side.
  <br><br>
  Or just look at the heading here. Like, wouldn't it be nice to get rid of the gap between the heading and the table by moving the heading down a bit conditionally when the first paragraph has to clear an overly long sidenote? You can't do that with CSS.
{% end %}

If you want an in-depth explanation how to implement these suggestions in CSS, there will be a separate post about it. This one mostly just complains about the current state and tells you what to do instead, not how.

## Large tables must not be restricted by the width of the main text content

<div class="table">

| A wide table | Pneumonoultramicroscopicsilicovolcanoconiosis | Pseudopseudohypoparathyroidism | Antidisestablishmentarianism | Pseudopseudohypoparathyroidism | Electroencephalographically | Floccinaucinihilipilification | Deinstitutionalization | Counterrevolutionaries | Uncharacteristically |
|-|-|-|-|-|-|-|-|-|-|
| Meaning | The disease silicosis | A hereditary medical disorder  | The political position of opposing disestablishment | You look it up | Approcahing normal word territory | What??? | ... | | Oh look, even a normal person might actually use this one. |

</div>

Once upon a time, websites looked like [this](https://danluu.com/file-consistency/). Then people realized long lines are hard to read, noticed newspapers put text in columns, and started putting everything into a column like [this](http://bettermotherfuckingwebsite.com/).{% sidenote() %}
  Well, usually one column.<br><br>Now that I think about it, I can't recall any websites going all-in on a proper newspaper-like layout that uses the whole screen.
{% end %}
Now, if you're a general intelligence (e.g. an attention-paying human){% sidenote() %}
  [Humans Who Are Not Concentrating Are Not General Intelligences](https://www.lesswrong.com/posts/4AHXDwcGab5PhKhHT/humans-who-are-not-concentrating-are-not-general)
{% end %}, you should already see the problem.

Newspapers split the text into many columns and fill the whole page with them (interspersed with pictures and bigger headlines). What websites do instead is shrink the width of the main text into one column (any maybe put some menus or ads on the sides).

In reality, a lot of people don't really care about actual readability, just about following trends. And if the trend is to put some things in columns, why not just squish everything into a column, it's less CSS to write and it's fine most of the time.

Guess what, unlike text, tables are not more readable narrow. Especially not if you have to scroll sideways while over half your **wide**screen monitor is filled with empty space because somebody heard a catchy phrase about letting it breath but lacked the mental capacity to consider what it actually means.

So here's the rules for maximum readability:

- Tables should be as wide as necessary, not limited by text width.
- If the table needs to be wider than the monitor, then the horizontal scrollbar should only scroll the table, not the whole page.
- Tables are used to convey information in a clear and organized manner, information density matters. A table that looks "pretty" at the cost of making you scroll defeats that purpose. Don't add tons of unnecessary whitespace.{% sidenote(side="right") %}
  This is not just about websites. Compare screenshots of common Windows and Linux tools. WinDirStat vs QDirStat, ProcessExplorer vs any linux system monitor, OlldDbg/x64dbg vs edb. As much as I prefer linux, I always felt its GUI tools were clumsy and inefficient. Then I tried Windows again and realized its tools consistently fit more information on screen because their Linux counterparts have slightly larger fonts, larger icons, thicker borders and put a shitton of unnecessary whitespace around everything.
  <br><br>
  Not to mention ProcessExplorer doesn't even have a proper alternative. Ever had random CPU usage spikes? On Windows you keep PE open and when it happens you mouse over the graph to see which process caused it. Linux doesn't have a single tool that can do that. Some idiot told me Linux is still better because I can _just_ write a script. No. Just no.
{% end %}
- Headers should be sticky - remain visible even when scrolling.

Even Wikipedia gets this wrong.

The [desktop version](https://en.wikipedia.org/wiki/Comparison_of_operating_system_kernels) doesn't squish tables but if they're too wide, they still start in the middle of the screen instead of more to the left. Yeah, the table of contents is in the way but it can be closed. It's funny, they bothered implementing a way to close it but it's completely useless because it doesn't make the newly empty space usable.{% sidenote() %}
  A prime example of cargo culting. The "designers" just repeated what other designers do without ever actually thinking about why. I wouldn't be surprised if some people went their entire lives without ever thinking about why they do anything. Don't be like them.
{% end %}

The [mobile version](https://en.m.wikipedia.org/wiki/Comparison_of_operating_system_kernels) is basically the same on a wide screen but when you make the window sufficiently narrow, it changes behavior so that everything is as wide as the screen and each table gets its own scrollbar. Of course that doesn't help you because to get this behavior you need to make the window uselessly narrow in the first place.

Now, a little experiment. If you've read this article, or at least found this sentence, and are writing a comment - on Reddit, the orange website, wherever - misspell "the" as "teh". Yes, this is the <span title="If you don't know what that is (and it turns out to be surprisingly hard to google), you're gonna have to wait for a future article, which is probably a good time to remind you this blog has RSS and atom feeds.">banana comment experiment</span>.

And one more thing: If the table is taller than the screen, the header should remain at the top of the screen when scrolling down. There's nothing more annoying than having to scroll up every 10 seconds to look up which column is which. Webpages aren't paper. Keep the header on screen at all times. [Some wikipedia pages](https://en.wikipedia.org/wiki/List_of_countries_and_dependencies_by_population_density) do this, others don't.

Ideally both top and left headers should be sticky but I am told it's insanely hard to have both at the same time. Hopefully tables both taller and wider than screen are rare so you can pick which one you make sticky for each table separately.

## Code blocks must have syntax highlighting and behave reasonably

```rust
fn main() {
    println!("Hello, world!"); // This comment turns this line into a very, very long line. Hopefully normal code is not like this.
}
```

Colors - <span title="Unless you were traumatized by colored rods as a kid and still haven't processed it 60 years later so you intentionally design a language to be hard to syntax highlight properly.">obvious</span>, moving on.

Code should not be wrapped nor should it overflow. Expand the container past the width of normal text if necessary. Same story as tables. We have widescreen monitors, we put normal text in a column because it's more readable. Code squished into a column is not more readable. Don't squish code into a column.{% sidenote() %}
  Yes, long lines often indicate bad code. Remember this the next time you have to scroll right on a highly upvoted StackOverflow answer. Its code blocks are 80 chars wide.
  <br><br>Anyway:
  <br><br>1) As should be obvious if you got this far, sometimes things are more readable wide. Things like large arrays formatted as tables, because, yes, code sometimes contains data.
  <br><br>2) Not all code blocks are code, they can be program output, logs, ASCII art, etc.
  <br><br>Also, whenever someone tells you a rule of thumb must be always followed, you can be certain they're the kind of person who can't handle nuance and their advice is worthless. This advice doesn't apply to the advice itself, the previous sentence is always absolutely 100% true.
{% end %}

Only use wrapping / horizontal scrolling if the code block is too wide for the whole screen. Which hopefully never happens unless the content is really _special_.

And provide a copy button where the "Copied" message is _not_ animated. Seriously, animations exist to make slow things still feel smooth. They lie to the user to make them less annoyed. Copying is instant, the feedback should be instant. BTW, do you wonder why it needs feedback at all? Because people are so used to software being broken they won't trust the button alone.{% sidenote() %}
  This would be an interesting experiment: don't give feedback to some users, count how many of them click multiple times. <!-- LATER -->
{% end %}

<!-- TODO Screenshot of SO on phone (in Pictures) -->

## Headings must be linkable

Either the heading itself or an icon next to it.

It's just convenient to send people to a specific section. Or bookmark where you left off.

Note to self: experiment with making any text linkable, at least individual paragraphs. <!-- LATER -->

## Some images should also be wider than text

A lot of the time an image is just a rough illustration or photo that doesn't need to be large. Other times it's a diagram that needs to be readable and scaling it down makes it useless. Decide what works best for each image.

Images that are scaled down should be clickable to open in full size. Yes, you can right click and select Open Image in New Tab but middle click is more convenient and the fact the cursor changes makes it more obvious there's a larger version.

The same thing applies to videos. Consider using videos instead of gifs because they have controls by default.{% sidenote() %}
  The internet is full of gifs of how various [sorting](https://upload.wikimedia.org/wikipedia/commons/c/cc/Merge-sort-example-300px.gif) algorithms [work](https://upload.wikimedia.org/wikipedia/commons/8/8e/Merge_sort_animation.gif). I am sure they took a lot of work to produce and they look really cool but their educational value is almost zero because if you miss something you have to wait for the entire thing to loop again and nobody ain't got patience for that. You can't even pause them or slow them down to examine what is actually happening. And yes, these days repeatedly clicking pause/play is the best way you can slow down a [video in the browser with its default controls](https://user-images.githubusercontent.com/4079823/152082630-a705286d-c630-4507-9213-b8a7b106d47e.mp4). All video players should by default allow setting speed and single stepping frames but it seems civilization has not advanced to that level yet.
{% end %}

## There should be a list of all posts with just titles and dates

No or very short descriptions. Offer a way to skim all titles and quickly find the one people remember reading but don't remember the exact title.{% sidenote() %}
  You could use google/DDG with `site:` but Ctrl+F has its charm. Specifically, it's instant.
{% end %}

If you want the latest post on your main page in full, that's fine, just offer this list _somewhere_. There's way too many (wordpress?) blogs where the main page is just one full article after another and you'd have to click through a million pages to find anything or to just scan for topics you like.{% sidenote() %}
  Like [this](https://skullsinthestars.com/) one. It has a ton of content, [some of it](https://skullsinthestars.com/2023/12/09/what-is-a-zero-refractive-index-material/) interesting but you can't get a proper feeling for what's there because even [filtered by category](https://skullsinthestars.com/category/optics/), the list of posts has infinite scrolling and you can't Ctrl+F what you know must be there somewhere until you've spent 10 minutes of your life holding down PgDn.
{% end %}

### Pretty please, with sugar on top, make sure posts have dates

...and that they're visible on the post's page. I can't tell you how many times I ran across a review or rant or even a positive post and I had no idea if it reflected the current state or was 10 years out of date.{% sidenote() %}
  For example, [Julia is shit](https://yuri.is/not-julia) and you could have guessed it by how they handle NaNs but here you have explicit, specific, undisputable proof that the devs just don't care about correctness. And a systemic issue like this is unlikely to improve any time soon but it would be nice to know at a glance this is a recent article, not something from Julia's early days (especially given this kind and density of issues isn't normal in a supposedly mature project). And because I compulsively have to point out irony, notice how the author uses dates (years) to drive home that this is a long term issue while he provides no date on his own article.
{% end %}

## Use page numbers instead of infinite scrolling

Or provide both if you really must.

Infinite scrolling exists for 2 reasons: mobile users{% sidenote() %}
  This is a rant for another day but most people hold a phone so their thumb can reach the middle of the screen, yet most of the controls (not just for pagination) are either at the top or bottom.
{% end %}
and feeding marginally more dopamine mixed with ads to addicts who would have closed your page if they had to overcome the minuscule inconvenience of clicking a button. It's functionally worse in almost every way when actually looking for something.{% sidenote() %}
  Off the top of my head:
  <br><br>1) There's no longer a footer so it's harder to find things like FAQs, copyright/contact info, socials, RSS/atom, etc.
  <br><br>2) If the request fails, which happens with some regularity even on good connections, there's often no way to retry. (Why this happens way more than with plain old HTTP requests is a mystery to me, I thought newer meant better, right?)
  <br><br>3) You can't "sample" the content at various points (e.g. pages 10, 50, 100, 200) and old content is effectively unreachable.
{% end %}

Have a button that goes to the oldest page. Let people see how everything started, especially if your first content was actually good because you had something to say and only later became filler.

## Wait, there's a story behind all this, right?

Yes, what prompted this was ~~reading~~ trying to read a large table in a GitHub (GitLab?) readme and having to scroll left and right all the time even though the table would have fit on my screen perfectly if it wasn't unnecessarily restricted by the text width. Sadly I can't find the repo anymore so you can't properly appreciate the pain and suffering I had to go through.

Oh and footnotes on most websites make me wanna do things to other people with my foot, the nature of which shall be left to the reader's imagination.

## So how do I make my website actually readable? Is there a theme or template I can use or something?

Well, it's a website, you press Ctrl+U and the code's right there. More seriously, I don't plan to make this a reusable theme but the code's [available](https://github.com/martin-t/martin-t.github.io) under [AGPLv3](https://www.tldrlegal.com/license/gnu-affero-general-public-license-v3-agpl-3-0) and they say imitation is the sincerest form of flattery.

**There will be a part 2** explaining not just how to do everything mentioned here but also what else I tried and why it didn't work. You might think each of these requirements is just a couple lines of CSS you can copy-paste but this is webdev, turns out things interact with each other in surprising ways (especially elements wider than text, sidenotes and anything using `float`) so I am still ironing out the kinks.

That being a said, I am not a frontend guy. I learned most of the HTML/CSS used here in the last few weeks. Take that into account and if you know how to do things better, let me know. <!-- LATER contact page? -->

There's also a [test page](/test) which contains more thorough examples of some of the stuff covered here.

<!-- How do you generate a random string? You put a first year CS student in front of vim and tell him to save and exit. -->
