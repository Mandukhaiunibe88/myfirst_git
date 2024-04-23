# start working with the git, install these 2 packages 
usethis::use_git()
usethis::use_github()


# # load library
library(dplyr)
library(ggplot2)


data_ebola <- ebola

# format column datum of data_ebola as date
data_ebola$Date <- as.Date(data_ebola$Date)

# sort data_ebola by date
data_ebola <- arrange(data_ebola, Date)

head(data_ebola)

# filter data_ebola: cumulative number of confirmed cases in Guinea, 
# Liberia and Sierra Leone before 31 March 2015 

data_ebola_cum_cases <- data_ebola %>% 
  select(date = Date, country = Country, cum_conf_cases = Cum_conf_cases) %>% 
  filter(date <= as.Date("2015-03-31") & 
           (country == "Guinea" | country ==  "Liberia" | country == "Sierra Leone"))


# crete point plot
plot_ebola_point_v0 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_point()
plot_ebola_point_v0

# create line plot
plot_ebola_line_v0 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_line(aes(group = country))

# create column plot
plot_ebola_col_v0 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_col(position = "stack")

# Save the plot as a PNG using ggsave
ggsave("plot_covid_point_goal.png", plot = plot_covid_point_goal, width = 8, height = 6, units = "in", dpi = 300)

# Save the plot as a PDF using ggsave
ggsave("plot_covid_point_goal.pdf", plot = plot_covid_point_goal, width = 8, height = 6)




# create point plot
plot_ebola_point_v1 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_point(alpha = 0.7, colour = "blue", fill = "green", 
             shape = 22, size = 1.5, stroke = 1.5) 
plot_ebola_point_v1 


# create line plot
plot_ebola_line_v1 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_line(mapping = aes(group = country), 
            alpha = 0.7, colour = "blue", linetype = "dashed", linewidth = 1.5)
plot_ebola_line_v1 

# create column plot
plot_ebola_col_v1 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases)) + 
  geom_col(alpha = 0.7, colour = "blue", fill = "green", 
           linetype = "solid", linewidth = 0.1, position = "stack", width = 0.7)

plot_ebola_col_v1 


# create point plot
plot_ebola_point_v2 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 22, size = 1.5, stroke = 1.5) 

plot_ebola_point_v2 

# create line plot
plot_ebola_line_v2 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases, colour = country)) + 
  geom_line(mapping = aes(group = country), 
            alpha = 0.7, linetype = "dashed", linewidth = 1.5)
plot_ebola_line_v2
# create column plot
plot_ebola_col_v2 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_col(alpha = 0.7, linetype = "solid", 
           linewidth = 0.1, position = "stack", width = 0.7)
plot_ebola_col_v2


# create point plot
plot_ebola_point_v3 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 22, size = 1.5, stroke = 1.5) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")

plot_ebola_point_v3
# create line plot
plot_ebola_line_v3 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases, colour = country)) + 
  geom_line(mapping = aes(group = country), 
            alpha = 0.7, linetype = "dashed", linewidth = 1.5) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")
plot_ebola_line_v3

# create column plot
plot_ebola_col_v3 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_col(alpha = 0.7, linetype = "solid", 
           linewidth = 0.1, position = "stack", width = 0.7) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")

plot_ebola_col_v3

library(unibeCols)

# load library
install.packages("remotes")
library(remotes)

remotes::install_github("CTU-Bern/unibeCols")
library(unibeCols)

# Load necessary libraries
library(ggplot2)

# Assuming data_ebola_cum_cases is your dataset

# Create point plot
plot_ebola_point_v4 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 22, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "Country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                    labels = c("GIN", "LBR", "SLE")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  ggtitle(label = "Confirmed Ebola") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")

plot_ebola_point_v4

# Print the plot
print(plot_ebola_point_v4)
install.packages("lubridate")
library(lubridate)


# create point plot
plot_ebola_point_v5 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, 
             shape = 22, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "Country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                    labels = c("GIN", "LBR", "SLE")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2500),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")

plot_ebola_point_v5

# create line plot
plot_ebola_line_v5 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases, colour = country)) + 
  geom_line(mapping = aes(group = country), 
            alpha = 0.7, linetype = "dashed", linewidth = 1.5) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2500),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")

plot_ebola_line_v5

# create column plot
plot_ebola_col_v5 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_col(alpha = 0.7, linetype = "solid", 
           linewidth = 0.1, position = "stack", width = 0.7) +
  scale_fill_manual(name = "Country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                    labels = c("GIN", "LBR", "SLE")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 15000, by = 2500),
                     limits = c(0, 15000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases")

plot_ebola_col_v5 

# create point plot
plot_ebola_point_v6 <- ggplot(data = data_ebola_cum_cases, 
                              mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_point(alpha = 0.7, shape = 22, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "Country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                    labels = c("GIN", "LBR", "SLE")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2500),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") +
  theme_bw() + theme(legend.position="bottom")

# create line plot
plot_ebola_line_v6 <- ggplot(data = data_ebola_cum_cases, 
                             mapping = aes(x = date, y = cum_conf_cases, colour = country)) + 
  geom_line(mapping = aes(group = country), 
            alpha = 0.7, linetype = "dashed", linewidth = 1.5) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2500),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") +
  theme_bw() + theme(legend.position="bottom")

# create column plot
plot_ebola_col_v6 <- ggplot(data = data_ebola_cum_cases, 
                            mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_col(alpha = 0.7, linetype = "solid", 
           linewidth = 0.1, position = "stack", width = 0.7) +
  scale_fill_manual(name = "Country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                    labels = c("GIN", "LBR", "SLE")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 15000, by = 2500),
                     limits = c(0, 15000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") +
  theme_bw() + theme(legend.position="bottom")


# create point plot
plot_ebola_point_facet <- ggplot(data = data_ebola_cum_cases, 
                                 mapping = aes(x = date, y = cum_conf_cases, colour = country,fill = country)) + 
  geom_point(alpha = 0.7,  
             shape = 22, size = 1.5, stroke = 1.5) +
  scale_fill_manual(name = "Country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                    labels = c("GIN", "LBR", "SLE")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", 
                              "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2500),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") +
  theme_bw() + theme(legend.position="bottom") +
  facet_grid(cols = vars(country))

# create line plot
plot_ebola_line_facet <- ggplot(data = data_ebola_cum_cases, 
                                mapping = aes(x = date, y = cum_conf_cases, colour = country)) + 
  geom_line(mapping = aes(group = country), 
            alpha = 0.7, linetype = "dashed", linewidth = 1.5) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 10000, by = 2500),
                     limits = c(0, 10000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") +
  theme_bw() + theme(legend.position="bottom") +
  facet_grid(cols = vars(country))

# create column plot
plot_ebola_col_facet <- ggplot(data = data_ebola_cum_cases, 
                               mapping = aes(x = date, y = cum_conf_cases, fill = country, colour = country)) + 
  geom_col(alpha = 0.7, linetype = "solid", 
           linewidth = 0.1, position = "stack", width = 0.7) +
  scale_fill_manual(name = "Country",
                    breaks = c("Guinea", "Liberia", "Sierra Leone"),
                    values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                    labels = c("GIN", "LBR", "SLE")) +
  scale_colour_manual(name = "Country",
                      breaks = c("Guinea", "Liberia", "Sierra Leone"),
                      values = c(unibeRedS()[1], unibeOceanS()[1], unibeMustardS()[1]),
                      labels = c("GIN", "LBR", "SLE")) +
  scale_x_date(breaks = ymd(c("2014-08-29", "2014-10-01", "2014-12-01", 
                              "2015-02-01", "2015-04-01")),
               labels = c("29 August", "1 October", "1 December", "1 February", "1 April"),
               limits = ymd(c("2014-08-28", "2015-04-01"))) +
  scale_y_continuous(breaks = seq(from = 0, to = 15000, by = 2500),
                     limits = c(0, 15000)) +
  ggtitle(label = "Confirmed Ebola cases") +
  xlab(label = "Time") +
  ylab(label = "Cum. # of confirmed cases") +
  theme_bw() + theme(legend.position="bottom") +
  facet_grid(cols = vars(country))

plot_ebola_col_facet


install.packages("cowplot")
library(cowplot)

plot_ebola_point_grid <- plot_grid(plotlist = list(plot_ebola_col_v0,plot_ebola_col_v1,plot_ebola_col_v2,plot_ebola_col_v3, plot_ebola_col_v5),
                                   labels = c("V1", "V2", "V3", "V4", "V5", "V6"), label_size = 12, nrow = 2)