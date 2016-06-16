# chart-craft (a suite of web-friendly data visualization charts)
## Description
Here is a suite of charts, typically taking data (in the form of XML) and transforming it (via XSLT) into a web-friendly standard like SVG, or (with help) X3D.
## Licences
These chart components were previously released singly, with varying licences. The original licences have been preserved, so please check each component.
## Team Formation Chart
This football (soccer)-based is output in SVG, and described more fully at
[Team Formation Chart: transform organizational unit people via XSLT into SVG football team graphic](http://www.sleepingdog.org.uk/svg/chart/teamformation/).

The files include:

- sample organization XML documents which hold the team data, and might be output from a Human Resources system;
- the XSLT transformation stylesheet;
- another XML file containing formation layout data, imported by the XSLT;
- optional and alternate CSS style sheets representing actual team colours (shirt, hoops or stripes).

Licence: GNU GPL 2.0.

## SVG pie chart
The challenge was to produce a SVG pie chart from XML data using only pure XSLT without extensions. A fuller description is at [A pure XSLT/SVG pie chart](http://www.sleepingdog.org.uk/svg/chart/pie/).

The files include:

- an XML schema to define a simple input data document format;
- a sample XML document based on that schema;
- an XSLT transformation stylesheet to turn the XML data into a SVG pie chart.

Licence: GNU GPL 2.0.
