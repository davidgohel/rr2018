library(flextable)
library(xtable)



##

typology <- data.frame(
  col_keys = c( "Sepal.Length", "Sepal.Width", "Petal.Length",
                "Petal.Width", "Species" ),
  type = c("double", "double", "double", "double", "factor"),
  what = c("Sepal", "Sepal", "Petal", "Petal", "Species"),
  measure = c("Length", "Width", "Length", "Width", "Species"),
  stringsAsFactors = FALSE )
autofit( theme_vanilla(flextable(typology)) )


ft <- regulartable( head( iris ) )
ft <- set_header_df( ft, mapping = typology, key = "col_keys" )

ft <- merge_h(ft, part = "header")
ft <- merge_v(ft, part = "header")

ft <- theme_vanilla(ft)
ft <- autofit(ft)
ft

print(ft, preview = "docx")

data(tli)

ft <- flextable(tli) %>%
  theme_tron_legacy() %>%
  rotate(rotation = "tbrl", part = "header", align = "top") %>%
  height(height = .8, part = "header") %>%
  width(width = c(.5, .5, .5, .8, .5) )
print(ft, preview = "docx")


xtable(tli[1:10, ])


fm3 <- glm(disadvg ~ ethnicty*grade, data = tli, family = binomial)
xtable_to_flextable(xtable(fm3))


