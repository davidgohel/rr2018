my_barchart <- ms_barchart(
  data = browser_data, x = "browser",
  y = "value", group = "serie" )
print(my_barchart, preview = TRUE)


my_scatter <- ms_scatterchart(data = iris, x = "Sepal.Length",
                              y = "Sepal.Width",  group = "Species")

my_scatter <- chart_data_fill(
  my_scatter,
  values = c(virginica = "#6FA2FF",
             versicolor = "#FF6161",
             setosa = "#81FF5B") )

print(my_scatter, preview = TRUE)
