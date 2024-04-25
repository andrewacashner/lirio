%% lyric-hyphen.ly
%% Andrew Cashner, 2021/06/02
%%
%% Put lyric hyphen at beginning of line when word is broken across line break

\version "2.22"

\layout {
  \context {
    \Lyrics
    \override LyricHyphen.after-line-breaking = ##t
  }
}

