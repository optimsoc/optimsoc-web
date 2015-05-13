---
layout: default
title: Get OpTiMSoC
---

# Get OpTiMSoC

<div class="panel panel-danger">
  <div class="panel-heading">
    <h3 class="panel-title">Before you get started</h3>
  </div>
  <div class="panel-body">
    To get OpTiMSoC up and running it's strongly recommended that you read the <a href="/docs">documentation</a>, especially the first part the user guide which describes which components you need to get started.
  </div>
</div>

## Sources

There is not one single large repository with all OpTiMSoC code, but
instead we have split it into multiple logical repositories. For the
user's convenience there is a common repository that is managed using
[Google repo](https://code.google.com/p/git-repo/) at
[https://github.com/optimsoc/optimsoc-repo](https://github.com/optimsoc/optimsoc-repo).

Just run the following steps to create the basic tree structure if you
are new to OpTiMSoC:

    mkdir optimsoc
    cd optimsoc
    wget https://storage.googleapis.com/git-repo-downloads/repo
    chmod a+x repo
    ./repo init -u https://github.com/optimsoc/optimsoc-repo
    ./repo sync

Afterwards you will have a tree that is identical to the one found in
the [user guide](/docs/index.html). Just follow the instructions there
to build and use the parts of OpTiMSoC interesting to you.
