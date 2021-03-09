# Synopsys Intelligent Security Scan

## Overview

The Synopsys Intelligent Security Scan Pipe helps selectively perform SAST and SCA scans, triggered during a variety of Bitbucket Platform events, such as push or pull request. The Synopsys Intelligent Security Scan Pipe allows your projects to run the only required type of security scans, optimizing the time taken by security testing and provide quicker feedback on scan results.

## Prerequisites

* To use this Pipe you **must be a licensed Polaris customer.**
* Intelligent scan server must be deployed and accessible via Bitbucket.

## Unclogging the Pipeline

While many AppSec tools support automation through CI tool integrations, teams often find it is very easy to bring their pipelines to a halt if they insert a security scan into the middle of it.  Rather than simply initiating a full static or software composition analysis scan whenever a pipeline job is invoked, Polaris first reviews code changes in order to calculate a ‘risk score.’ This risk score takes into account risk rules the team have defined, as well as the scope of the changes that have been made to the code. This score is then used to determine which security scans to perform, and at what depth.

Once this determination has been made, the prescribed tests will then execute using Bitbucket Pipelines or a Polaris cloud-hosted pipeline. This combination of selective testing and out-of-band execution ensures that security analysis doesn’t hinder the progress of other build and integration activities.

## Avoiding Vulnerability Overload

Another obstacle facing teams is the number of findings that can be produced by SAST and SCA analysis.  The spirit of DevOps is continuous incremental improvement, a goal that can be hard to realize when your security tools bury the team with hundreds or thousands of vulnerability reports to review.  Here too, Polaris reduces the burden on the team by filtering and prioritizing results so that teams can “avoid the noise” and focus on the more important security issues based on their risk.

Filtered and prioritized results are made available directly to the developer within the Pull requests page interface as well as other tracking tools they may be using.

## Example YAML config

comming soon...