---
layout: default
title: OpTiMSoC Documentation Overview
---
{% include doc_versions.txt %}

# Documentation

OpTiMSoC comes with several pieces of documents for the individual parts of the system.
Most documentation is part of the OpTiMSoC source tree.

## User Guide

To get started with OpTiMSoC, have a look at the User Guide. It contains
installation instructions for all tools and tutorials to get you up to speed
quickly.

<div class="btn-group">
  <a class="btn btn-primary"
     href="/docs/{{doc_version_current_release}}/user-guide/chap_introduction.html"
     role="button">
    <span class="glyphicon glyphicon-book" aria-hidden="true"></span> Read the User Guide <small>({{doc_version_current_release}})</small>
  </a>

  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu">
    <li>
      <a href="/docs/{{doc_version_current_dev}}/user_guide/index.html">latest development version ({{doc_version_current_dev}})</a>
    </li>
    <li role="separator" class="divider"></li>
    <li><a href="#document-archive">all versions</a></li>
  </ul>
</div>

## Document Archive
<div class="alert alert-warning">
Always refer to the documentation that matches your OpTiMSoC version.
You can determine the version you're using with <code>echo $OPTIMSOC_VERSION</code>
</div>

<table class="table table-striped">
  <thead>
    <tr>
      <th>OpTiMSoC Version</th>
      <th>User Guide</th>
      <th>Reference Manual</th>
      <th>API Documentation</th>
    </tr>
  </thead>
  {% for doc_version in doc_versions %}
    <tr>
      <td>
        {{ doc_version }}
        {% if doc_version == doc_version_current_dev %}(latest development){% endif %}
        {% if doc_version == doc_version_current_release %}(latest release){% endif %}
      </td>
      <td>
        {% if doc_version == "2015.1" or doc_version == "2016.1" %}<a href="/docs/{{ doc_version }}/user-guide/chap_introduction.html">online</a>,
        <a href="/docs/{{ doc_version }}/user-guide.pdf">PDF</a>
		{% else %}
        <a href="/docs/{{ doc_version }}/user_guide/index.html">online</a>
        {% endif %}
      </td>
      <td>{% if doc_version != "2015.1" and doc_version != "2016.1" %}<a href="/docs/{{ doc_version }}/refman/index.html">online</a>{% endif %}</td>
      <td>{% if doc_version != "2015.1" and doc_version != "2016.1" %}<a href="/docs/{{ doc_version }}/api/index.html">online</a>{% endif %}</td>
    </tr>
  {% endfor %}
</table>

## Talks

We regularly present OpTiMSoC and its current status at various conferences
and meetings. If you are looking for a quick introduction and like watching
videos and slides more than reading documentation, you might want to have a
look at one of our talks, some of which were recorded.

All talks are obviously a snapshot of the project state at the time of
presentation, so be aware that some information might have changed in the
meantime.

 * ORCONF 2014 (October 4th 2014): A update to the ORCONF 2013 talk, also
   including more details about the debug system. A video recording and slides
   are available, see [the blog post]({% post_url 2014-10-12-orconf2014 %}) for
   details.

 * FOSDEM 2014 (February 2nd 2014): A general introduction to OpTiMSoC, slides
   and a rather high-quality video recording are available. See
   [this blog post]({% post_url 2014-01-03-fosdem %}) for all details.

 * ORCONF 2013 (October 5th 2013): A general introduction into OpTiMSoC with a
   focus on the OpenRISC processor cores. A video recording is available on
   YouTube, see [the blog post]({% post_url 2013-10-30-orconf2013 %}) for
   details.
