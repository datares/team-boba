library(plotly)

# load data
reopen <- read.csv("reopeningnew.csv", header = TRUE)

# set variable for size of points
reopen["size"] = 0.2

# create plot
fig <- plot_ly(data = reopen, 
               type = "scatter",
               span = ~size,
               x = ~Planned.Length.of.Closure..Weeks., 
               y = ~Total.Weeks.closed, 
               color = ~Region,
               colors = c("#5778A4", "#E49444", "#D1615D","#85B6B2","#6A9F58","#E7CA60", "#B07AA2"),
               hoverinfo = "text",
               text = ~paste("Country: ", Country, '<br>Region: ', Region)
)

# x axis label
x <- list(
  title = "Planned Length of School Closure (weeks)"
)

# y axis label
y <- list(
  title = "Actual Length of School Closure (weeks)"
)

# add title, axis labels
fig <- fig %>% layout(title = 'Actual vs. Expected Length of School Closure',
                      xaxis = list(title = 'Expected Length of School Closure (weeks)'
                      ),
                      yaxis = list(title = 'Acrual Lenght of School Closure (weeks)'),
                      shapes=list(type='line', x0= 0, x1= 12, y0=0, y1=12, 
                                  line=list(dash='dot', width=1))
)

# annotate Hong Kong
fig <- fig %>% add_annotations(
  x=11.2,
  y=16,
  xref = "x",
  yref = "y",
  text = "Hong Kong",
  xanchor = 'left',
  showarrow = F
)

# annotate Japan
fig <- fig %>% add_annotations(
  x=6.2,
  y=5,
  xref = "x",
  yref = "y",
  text = "Japan",
  xanchor = 'left',
  showarrow = F
)


fig
