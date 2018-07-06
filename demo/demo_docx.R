library(officer)
library(flextable)
library(magrittr)

doc <- read_docx("demo/monmodele.docx")

# View(docx_summary(doc))
#
# View(styles_info(x = doc))


doc <- doc %>%
  # suppression du paragraph vide
  body_remove() %>%

  # ajout d'un tableau
  body_add_table(value = head(iris)) %>%

  # nouveau slide et ajout de contenu
  body_add_par(style = "heading 1", value = "district9 est un film cool") %>%
  body_add_img(src = "img/frink.png", height = 6.18, width = 3.05)

print(doc, target = "demo/result_01.docx")




library(ggplot2)

d <- ggplot(diamonds, aes(carat, price)) +
  geom_hex() + scale_fill_viridis_c() + theme_minimal()

doc <- doc %>%
  body_add_gg(value = d, height = 409/72/2, width = 801/72/2)


print(doc, target = "demo/result_02.docx")


mon_ft <- head(mtcars) %>%
  regulartable() %>%
  color(part = "header", color = "red") %>%
  bold(part = "header", bold = TRUE) %>%
  color(i = ~ mpg < 21, color = "orange") %>%
  set_header_labels(mpg = "Miles per gallon") %>%
  autofit()

doc <- body_add_flextable(doc, value = mon_ft)
print(doc, target = "demo/result_03.docx")



