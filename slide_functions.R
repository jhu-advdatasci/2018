rinline <- function(code) { 
  sprintf('<code class="r">``` `r %s` ```</code>', code) 
}
rcode <- function(code) { 
  sprintf('<code class="r">%s</code>', code) 
}
bg_slide = function(
  files_in_order, 
  folder = "../imgs/", 
  suffix = ".png",
  titles = rep("", length(files_in_order)),
  positions = rep("center", length(files_in_order)),
  size = rep("100%", length(files_in_order)),
  footnotes = "",
  add_opts = ""
){
  n_files = length(files_in_order)
  files_in_order = paste0(files_in_order, suffix)
  folder = rep(folder, length.out = n_files)
  size = rep_len(size, length.out = n_files)
  footnotes = rep_len(footnotes, length.out = n_files)
  top_cat = "---"
  add_opts = add_opts[ add_opts != "" ]
  if (length(add_opts) > 0) {
    add_opts = paste(add_opts, collapse = "\n")
    add_opts = paste0(add_opts, "\n")
  } else {
    add_opts = ""
  }
  add_opts = rep_len(add_opts, length.out = n_files)
  top_cat = paste(top_cat, add_opts, sep = "\n")
  top_cat = paste0(top_cat,  "background-image: url(", folder)
  bottom_cat = paste0(")\nbackground-size: ", size, " \n")
  bottom_cat = paste0(bottom_cat, paste0(
    "background-position: ", positions, "\n")
  )
  keep = !titles %in% ""
  titles[  keep ] = paste0("\n# ", titles[keep])
  bottom_cat = paste0(bottom_cat, titles)
  if (any(footnotes != "")) {
    bottom_cat = paste0(bottom_cat, "\n.footnote[", footnotes, "]")  
  }
  res = paste0(top_cat, files_in_order, bottom_cat, "\n")
  cat(res, sep = "")
}

center_slide = function(title) {
  res = paste0("---\nclass: inverse, middle, center\n",
         "# ", title, "\n\n")
  cat(res, sep = "")
}