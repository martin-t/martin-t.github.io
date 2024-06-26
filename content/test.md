+++
title = "Hidden test page"
# date = 1337-04-20 Don't include a date or the page will appear in the feed.
+++

This page tests all kinds of combinations of all kinds of stuff. All content below is just filler text.

## Heading 2 - text

TODO FIX manual sidenotes

Lorem ipsum[^fna1] [^fna2] [^fna3] dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris.

Maecenas<sup class="sidenote-reference"></sup>
<span class="sidenote-definition left">
  <sup class="sidenote-definition-label"></sup>
  This is sidenote 1<br>with a line break.
</span>
congue{% sidenote() %}
  This is sidenote 2<br>with a line break.
{% end %} ligulaac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue.[^fna4]

Nam tincidunt congue enim, ut porta lorem lacinia consectetur. Donec ut libero sed arcu vehicula ultricies a non tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut gravida lorem. Ut turpis felis, pulvinar a semper sed, adipiscing id dolor.

<!-- Footnotes intentionally together, not under their paragraphs. -->

[^fna1]: This is footnote 1.

[^fna2]: This is footnote 2.

[^fna3]: This is footnote 3.

[^fna4]: This is footnote 4.

### Heading 3 - fancy text

Lorem **ipsum** dolor _sit_ amet, _**consectetur**_ adipiscing **_clit_**. Donec ~~a diam~~ lectus.[^fn-fancy]

[^fn-fancy]: Lorem **ipsum** dolor _sit_ amet, _**consectetur**_ adipiscing **_clit_**. Donec ~~a diam~~ lectus.

### Heading 3 - links

At least one of [these](/test) [three](.) [links](/test/) is visited and they're clearly separate.<br>This is an [unvisited multiword link](https://example831041059898111108101101116.com).[^fn-link]

[^fn-link]: At least one of [these](/test) [three](.) [links](/test/) is visited and they're clearly separate.<br>This is an [unvisited multiword link](https://example831041059898111108101101116.com).

<!-- The unvisited link should give server not found so the browser doesn't add it to history and it remains unvisited. At least until someone registers the domain just to break my test page. -->

### Heading 3 - tooltips

It's one of <span title="This one.">these</span> words. And <span style="text-decoration: underline dotted;" title="Yup, this.">this</span> one.

### Heading 3 - nested list

- Item 1
  - Item 1.1
  - Item 1.2
    - Item 1.2.1
    - Item 1.2.2
- Item 2
  - Item 2.1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.
  - Item 2.2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.
    - Item 2.2.1 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.
    - Item 2.2.2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.

#### Heading 4 - more text

Lorem ipsum[^fnb1] [^fnb2] [^fnb3] dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue.[^fnb4] Nam tincidunt congue enim, ut porta lorem lacinia consectetur. Donec ut libero sed arcu vehicula ultricies a non tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. I said it's just filler, why are you reading <span title=":D">this<span>? Aenean ut gravida lorem. Ut turpis felis, pulvinar a semper sed, adipiscing id dolor.

[^fnb1]: This is footnote 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.

[^fnb2]: This is footnote 2. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.

[^fnb3]: This is footnote 3. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.

[^fnb4]: This is footnote 4. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.

##### Heading 5 - even more text

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.

<!--
TODO: Manual paragraphs that can have blank lines and other HTML inside
so I can put footnotes inline with text and not have unreadable source code.
-->

<p>

Manual paragraph.

Second sentence. Should be on the same line.

</p>

###### Heading 6 - even even more text

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit.

## Heading 2 - code

Fits in the column[^footnote-narrow-code]

[^footnote-narrow-code]: This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below.

```rust
fn main() {
    println!("Hello, world!");
}
```

Overflows the column but fits on the screen[^footnote-wide-code]

[^footnote-wide-code]: This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below.

```rust
fn main() {
    println!("Hello, world!"); // This comment turns this line into a very, very long line. Hopefully normal code is not like this.
}
```

Overflows the screen

```rust
fn main() {
    println!("Hello, world!"); // This comment turns this line into a very, very long line. Hopefully normal code is not like this. Message repeats. This comment turns this line into a very, very long line. Hopefully normal code is not like this. Message repeats. This comment turns this line into a very, very long line. Hopefully normal code is not like this.
}
```

Inline `code` block.

Very long inline code block `// This comment turns this line into a very, very long line. Hopefully normal code is not like this. Message repeats. This comment turns this line into a very, very long line. Hopefully normal code is not like this. Message repeats. This comment turns this line into a very, very long line. Hopefully normal code is not like this.`.

## Heading 2 - table

Fits in the column[^footnote-narrow-table]

[^footnote-narrow-table]: This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below.

<!-- LATER table-narrow without clear:both, with scrollbar as fallback in case we're wrong, same for code and images -->
<div class="table">

| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   |

</div>

Overflows the column but fits on the screen[^footnote-wide-table]

[^footnote-wide-table]: This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below.

<div class="table">

| Column 1 | Column 2 | Column 3 | Column 4 | Column 5 | Column 6 | Column 7 | Column 8 | Column 9 | Column 10 |
| -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   | Cell 4   | Cell 5   | Cell 6   | Cell 7   | Cell 8   | Cell 9   | Cell 10  |

</div>

Overflows the screen

<div class="table">

| Column 1 | Column 2 | Column 3 | Column 4 | Column 5 | Column 6 | Column 7 | Column 8 | Column 9 | Column 10 | Column 11 | Column 12 | Column 13 | Column 14 | Column 15 | Column 16 | Column 17 | Column 18 | Column 19 | Column 20 | Column 21 | Column 22 | Column 23 | Column 24 | Column 25 | Column 26 | Column 27 | Column 28 | Column 29 | Column 30 | Column 31 | Column 32 | Column 33 | Column 34 | Column 35 | Column 36 | Column 37 | Column 38 | Column 39 | Column 40 | Column 41 | Column 42 | Column 43 | Column 44 | Column 45 | Column 46 | Column 47 | Column 48 | Column 49 | Column 50 | Column 51 | Column 52 | Column 53 | Column 54 | Column 55 | Column 56 | Column 57 | Column 58 | Column 59 | Column 60 | Column 61 | Column 62 | Column 63 | Column 64 |
| -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   | Cell 4   | Cell 5   | Cell 6   | Cell 7   | Cell 8   | Cell 9   | Cell 10  | Cell 11  | Cell 12  | Cell 13  | Cell 14  | Cell 15  | Cell 16  | Cell 17  | Cell 18  | Cell 19  | Cell 20  | Cell 21  | Cell 22  | Cell 23  | Cell 24  | Cell 25  | Cell 26  | Cell 27  | Cell 28  | Cell 29  | Cell 30  | Cell 31  | Cell 32  | Cell 33  | Cell 34  | Cell 35  | Cell 36  | Cell 37  | Cell 38  | Cell 39  | Cell 40  | Cell 41  | Cell 42  | Cell 43  | Cell 44  | Cell 45  | Cell 46  | Cell 47  | Cell 48  | Cell 49  | Cell 50  | Cell 51  | Cell 52  | Cell 53  | Cell 54  | Cell 55  | Cell 56  | Cell 57  | Cell 58  | Cell 59  | Cell 60  | Cell 61  | Cell 62  | Cell 63  | Cell 64  |

</div>

Taller than screen

<!-- LATER Restore table div? -->
<!-- <div class="table"> -->

| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
| Cell 7   | Cell 8   | Cell 9   |
| Cell 10  | Cell 11  | Cell 12  |
| Cell 13  | Cell 14  | Cell 15  |
| Cell 16  | Cell 17  | Cell 18  |
| Cell 19  | Cell 20  | Cell 21  |
| Cell 22  | Cell 23  | Cell 24  |
| Cell 25  | Cell 26  | Cell 27  |
| Cell 28  | Cell 29  | Cell 30  |
| Cell 31  | Cell 32  | Cell 33  |
| Cell 34  | Cell 35  | Cell 36  |
| Cell 37  | Cell 38  | Cell 39  |
| Cell 40  | Cell 41  | Cell 42  |
| Cell 43  | Cell 44  | Cell 45  |
| Cell 46  | Cell 47  | Cell 48  |
| Cell 49  | Cell 50  | Cell 51  |
| Cell 52  | Cell 53  | Cell 54  |
| Cell 55  | Cell 56  | Cell 57  |
| Cell 58  | Cell 59  | Cell 60  |
| Cell 61  | Cell 62  | Cell 63  |
| Cell 64  | Cell 65  | Cell 66  |
| Cell 67  | Cell 68  | Cell 69  |
| Cell 70  | Cell 71  | Cell 72  |
| Cell 73  | Cell 74  | Cell 75  |
| Cell 76  | Cell 77  | Cell 78  |
| Cell 79  | Cell 80  | Cell 81  |
| Cell 82  | Cell 83  | Cell 84  |
| Cell 85  | Cell 86  | Cell 87  |
| Cell 88  | Cell 89  | Cell 90  |
| Cell 91  | Cell 92  | Cell 93  |
| Cell 94  | Cell 95  | Cell 96  |
| Cell 97  | Cell 98  | Cell 99  |
| Cell 100 | Cell 101 | Cell 102 |
| Cell 103 | Cell 104 | Cell 105 |
| Cell 106 | Cell 107 | Cell 108 |
| Cell 109 | Cell 110 | Cell 111 |
| Cell 112 | Cell 113 | Cell 114 |
| Cell 115 | Cell 116 | Cell 117 |
| Cell 118 | Cell 119 | Cell 120 |
| Cell 121 | Cell 122 | Cell 123 |
| Cell 124 | Cell 125 | Cell 126 |
| Cell 127 | Cell 128 | Cell 129 |
| Cell 130 | Cell 131 | Cell 132 |
| Cell 133 | Cell 134 | Cell 135 |
| Cell 136 | Cell 137 | Cell 138 |
| Cell 139 | Cell 140 | Cell 141 |
| Cell 142 | Cell 143 | Cell 144 |
| Cell 145 | Cell 146 | Cell 147 |
| Cell 148 | Cell 149 | Cell 150 |

<!-- </div> -->

## Heading 2 - image

Fits in the column[^footnote-narrow-image]

[^footnote-narrow-image]: This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below. Message repeats. This is a footnote that should not interfere with the narrow content below.

![Image](/stripes-400x32.png)

Overflows the column but fits on the screen[^footnote-wide-image]

[^footnote-wide-image]: This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below. Message repeats. This is a footnote that should not interfere with the wide content below.

![Image](/stripes-1200x32.png)

Overflows the screen

![Image](/stripes-4000x32.png)
