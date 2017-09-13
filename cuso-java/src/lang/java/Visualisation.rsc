module lang::java::Visualisation

import shapes::Figure; // to make charts
import shapes::Render; // to view charts
import analysis::statistics::Frequency; // to compute the distribution
import Set; // to sort a set into a list

void histogram(rel[&T item, num metric] r, str count="Count", str metric="Metric") {
  map[num metric, int frequency] dist = distribution(r);
  chs = [bar ([<i, dist[i], "<i>"> | i <- sort(dist<0>)], name = "<metric> distribution")];
  
  fig = comboChart(
           fillColor="antiquewhite", charts = chs, tickLabels = true,  tooltipColumn = 2, 
           options = chartOptions(
                       hAxis = axis(title=metric, slantedText = true, slantedTextAngle=90),  
                       vAxis = axis(title=count),
                       chartArea_ = chartArea(width="80%", height = "40%"),
                       bar_ = bar(groupWidth = "10px"),
                       width=500,
                       height=500,
                       legend_ = legend(position="top")
                     ), 
           width = 510, 
           height = 510);
  render(fig, static=true);
}

void graph(rel[&T from, &T to] r, int width=500, int height=500) {
  fig = graph(nodes=[ <"<e>", box(fig=text("<e>"))> | e <- (r<from> + r<to>)], edges=[edge("<f>","<t>") | <f,t> <- r], size=<width, height>);
  render(fig, static=true);
}