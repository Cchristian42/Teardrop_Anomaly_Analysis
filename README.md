# Teardrop Anomaly Analysis

R-powered simulation & visualization of a classic **Teardrop IP fragment attack**—the old-school DoS that crashes systems with overlapping fragments.

! (teardrop_anomaly_plot.png)  
*Spikes in packet length over time—red dots scream "attack!"*

## What this does

- Starts with real Wireshark capture: `teardrop.cap` (just 18 packets)
- Duplicates them **200×** to fake a 60-second flood
- Runs quick EDA with `dplyr` + `ggplot2`
- Plots packet length vs. time, flags anomalies in **red**

Perfect demo for: threat hunting, teaching network anomalies, or showing how data viz beats blind log scrolling.

## Why it matters

Teardrop attacks exploit bad reassembly—modern firewalls catch them, but spotting patterns in raw traffic? That's still gold. This bridges packet-level chaos to visual insight.

## Quick run (one-liner)

```bash
Rscript teardrop_anomaly_analysis.R
