Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1261EF424
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2020 11:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgFEJ3X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Jun 2020 05:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgFEJ3V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Jun 2020 05:29:21 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EB80C08C5C2
        for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2020 02:29:21 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z18so10828830lji.12
        for <linux-mips@vger.kernel.org>; Fri, 05 Jun 2020 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=1IWoS+33ErNyiA3yH8nMtRVbOCnndSGaOj8uQdnVKiFNVtZQGIpo5v0oXeGcR/pDG4
         5gk48Go/7+DisXxemVTVIE7ib5tkdh11A6KrLqA8JBiPbPzvQUy1SvsLbiDWjfdoGMEq
         wFq8xtbCOMEWRX4JXqcQim2EA1PLtA8pUZmjhCglScI7as05f9rpNvzRHqBf/Gn1+15x
         E+sIJ08DL7/0y5ciz9lwbRCc68x/diPjQTc2ZTi+SM2N3CSeBMvNcBmaowtWpe30kfvZ
         EvgX1dHL3JwZ9iHQtY4J6R/y4JZbz8XcCBBeDms26pv5xqHmwOzUnFMHt1hfamxVbxd9
         lRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=tVLEf0kLdeFVbt8EQH0nrHlWvyZDH2K0nXmtB1Txr4FsppE0I0Q1kl1R/svdUaS+jT
         CeIPCzN1cu2mogUriLP+BGOXqTJTaqLRiKwQADVWy5IhaoLMHoueByCDXmyV8ujSWI5j
         e6kBcy8fsxRPycsZNvCt5UKt6uNvBrlO+SYThgsyHJ5lgaS7D7+pCnezefULtIUm/z+u
         sfOXpQGKrCdyXXSu6tsID+n9xUPtDqp2UQ7nMiTK7l48d60PxbwkuyKSBhFQYJ5Uu5tH
         EnTWGdGYzy3HKJl3yVQPQOlvb4ixRcl1LZuhP+h3b5lOk1g0NntWvE620XPIP7b1oLLs
         hxlw==
X-Gm-Message-State: AOAM5301QiDQkk+wJda6U0LAbx6m+UIqmpdT/Q1jn0T60/9xLeDNKCmz
        w6UNvtu6X50zhd/HKOwFiOTrxQ==
X-Google-Smtp-Source: ABdhPJyUyQ5T84ZDlaQj5Pl+zqj9w4V8r6dMsK//5MYT0qXxl/qwAqwVvTT2LbSsxI+H1mBKC70rCw==
X-Received: by 2002:a2e:81d4:: with SMTP id s20mr4195887ljg.248.1591349359372;
        Fri, 05 Jun 2020 02:29:19 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id a1sm746471lfi.36.2020.06.05.02.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 02:29:18 -0700 (PDT)
From:   john mathew <john.mathew@unikie.com>
X-Google-Original-From: john mathew <John.Mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        willy@infradead.org, valentin.schneider@arm.com,
        srikar@linux.vnet.ibm.com, John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v7 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Fri,  5 Jun 2020 12:29:04 +0300
Message-Id: <20200605092906.29478-2-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605092906.29478-1-John.Mathew@unikie.com>
References: <20200605092906.29478-1-John.Mathew@unikie.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: John Mathew <john.mathew@unikie.com>

Add new sections to enable addition of new documentation on
the scheduler. Existing documentation is moved under the related
new sections. The sections are
  - overview
  - sched-features
  - arch-specific.rst
  - sched-debugging.rst

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: John Mathew <john.mathew@unikie.com>
---
 Documentation/scheduler/arch-specific.rst   | 11 ++++++++
 Documentation/scheduler/index.rst           | 30 ++++++++++++---------
 Documentation/scheduler/overview.rst        |  5 ++++
 Documentation/scheduler/sched-debugging.rst | 14 ++++++++++
 Documentation/scheduler/sched-features.rst  | 20 ++++++++++++++
 5 files changed, 67 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/scheduler/arch-specific.rst
 create mode 100644 Documentation/scheduler/overview.rst
 create mode 100644 Documentation/scheduler/sched-debugging.rst
 create mode 100644 Documentation/scheduler/sched-features.rst

diff --git a/Documentation/scheduler/arch-specific.rst b/Documentation/scheduler/arch-specific.rst
new file mode 100644
index 000000000000..c9c34863d994
--- /dev/null
+++ b/Documentation/scheduler/arch-specific.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Architecture Specific Scheduler Implementation Differences
+==========================================================
+
+.. class:: toc-title
+
+	   Table of contents
+
+.. toctree::
+   :maxdepth: 2
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 69074e5de9c4..9bdccea74af9 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,23 +1,27 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
 ===============
 Linux Scheduler
 ===============
 
-.. toctree::
-    :maxdepth: 1
+This documentation outlines the Linux kernel scheduler with its concepts,
+details about the scheduler design and its data structures and architecture
+specific implementation differences.
 
 
-    completion
-    sched-arch
-    sched-bwc
-    sched-deadline
-    sched-design-CFS
-    sched-domains
-    sched-energy
-    sched-nice-design
-    sched-rt-group
-    sched-stats
+.. class:: toc-title
+
+	   Table of contents
 
-    text_files
+.. toctree::
+    :maxdepth: 2
+
+    overview
+    sched-design-CFS
+    sched-features
+    arch-specific
+    sched-debugging
+    scheduler-api
 
 .. only::  subproject and html
 
diff --git a/Documentation/scheduler/overview.rst b/Documentation/scheduler/overview.rst
new file mode 100644
index 000000000000..aee16feefc61
--- /dev/null
+++ b/Documentation/scheduler/overview.rst
@@ -0,0 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+====================
+Scheduler overview
+====================
diff --git a/Documentation/scheduler/sched-debugging.rst b/Documentation/scheduler/sched-debugging.rst
new file mode 100644
index 000000000000..e332069f99d6
--- /dev/null
+++ b/Documentation/scheduler/sched-debugging.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Scheduler Debugging Interface
+==============================
+
+.. class:: toc-title
+
+	   Table of contents
+
+.. toctree::
+   :maxdepth: 2
+
+   sched-stats
+   text_files
diff --git a/Documentation/scheduler/sched-features.rst b/Documentation/scheduler/sched-features.rst
new file mode 100644
index 000000000000..1afbd9cc8d52
--- /dev/null
+++ b/Documentation/scheduler/sched-features.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+Scheduler Features
+=====================
+
+.. class:: toc-title
+
+	   Table of contents
+
+.. toctree::
+   :maxdepth: 2
+
+   sched-arch
+   sched-bwc
+   sched-deadline
+   sched-domains
+   sched-energy
+   sched-nice-design
+   sched-rt-group
+   completion
-- 
2.17.1

