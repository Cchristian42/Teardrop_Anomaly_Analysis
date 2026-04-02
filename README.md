# Teardrop Anomaly Analysis

R script simulating a teardrop IP fragment attack from Wireshark's teardrop.cap capture.  
Duplicated packets 200x to mimic a flood, then visualized spikes in ggplot2—red dots flag the chaos.

! (teardrop_anomaly_plot.png)

**What it shows:**  
- Original 18-packet data → fake attack bursts over 60 seconds  
- Time-series plot: length vs time, anomalies highlighted  
- Ties cyber vuln detection to data viz—perfect for threat hunting.

Skills: Wireshark export, dplyr/ggplot2 EDA, anomaly simulation.

Files:  
- teardrop_anomaly_analysis.R → full script  
- teardrop_anomaly_plot.png → output viz
