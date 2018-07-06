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
  body_add_par(style = "heading 1", value = "L'image qui suit est trop cool :") %>%
  body_add_img(src = "img/frink.png", height = 6.18, width = 3.05) %>%
  body_add_par(style = "heading 1", value = "L'image qui suit est un peu tordue :") %>%
  body_add_img(src = "img/frink_rotated.png", height = 5, width = 5) %>%
  headers_replace_all_text(old_value = "machin chose", new_value = "XX127YUD", only_at_cursor = FALSE, warn = FALSE)

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






library(mschart)

my_barchart_01 <- ms_barchart(data = browser_data, x = "browser",
                              y = "value", group = "serie")
my_barchart_01 <- chart_settings( x = my_barchart_01, dir="vertical",
                                  grouping="clustered", gap_width = 50 )
my_barchart_01 <- chart_ax_x( x= my_barchart_01, cross_between = 'between',
                              major_tick_mark="out")
my_barchart_01 <- chart_ax_y( x= my_barchart_01, cross_between = "midCat",
                              major_tick_mark="in")



doc <- body_add_chart(doc, chart = my_barchart_01, style = "centered")
print(doc, target = "demo/result_04.docx")


# unlink("demo/result*.docx")