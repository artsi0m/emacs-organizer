(defconst my-howm-subsubdir-regexp
  (rx (seq "howm/" (= 4 num ) "/" (= 2 num)))
  "Regexp that matches second level of subdirectories in howm,
   like  ~/homw/2024/01/, but with ltximg")



(defconst my-howm-excluded-subdirs-regexp
  (rx (or ".git" ".elfeed" "ltximg"))
  "Regexp that matches howm subdirs that I don't need
   like .git .elfeed and ltximg, basically like .gitignore,
   but i don't want to rely on them")
