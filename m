Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AC11C730D
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 16:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgEFOle (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 10:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728911AbgEFOld (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 10:41:33 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB97C061A10
        for <linux-mips@vger.kernel.org>; Wed,  6 May 2020 07:41:33 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id j3so2616895ljg.8
        for <linux-mips@vger.kernel.org>; Wed, 06 May 2020 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uI/8h++JcbOK9Wocdl/er5d/uhXgta69eLKDJkZDekg=;
        b=nmZ7lObQurUYlGF/rLz1+aLS2rMM/WXupnGDzTR9Ob3yStwCfFOvlifJ8JVAmFrxn5
         XzbcCFHjVingioQZ4UC8Lv7ummKOoeWQrV8JjnJY5ezTu7t+xRokRY0nB6knN8sxazg4
         KNC5uPuF2+8cqebZX1cv5zZZPuX6qWES/AEdHsElTUoJg+4uF5vsDHhd9hHu3f+DbqHV
         uehbg48P34l0V+b6ZpMnjmlf4ljmXz1amRYPH/o3X0a3NUE8znprurI+g6WNZ9SgMRvd
         EnP174sglmgK3F3isDMVOnG+3Ivr9IIXJKTwyIO/UWa51i3YwxoEYMBC5+fvUclyV8W6
         SJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uI/8h++JcbOK9Wocdl/er5d/uhXgta69eLKDJkZDekg=;
        b=J1q60YEKT/oBhAUql9u8biLg1JMwekt4DKeivJQzdsS99ts22eUzKFsGw2+MRK5t3q
         BFrM1vRBFpwIG1wBzE7DN+gTjcd8SjevOQ0EPR1r1Jz6F4OQEWRb99pMDf2N0O/9/Xbm
         2uO820hFhOODgJj8o8SFI2hATDXmJRKuHpiWbJF7B6F/VOsE44lfyDdUd0VCppC2sYhF
         9cLH8p2WFWfggp2ZZPpLGxX0wiPTt8LkgfwWB5sCSRwVg+i8nXoqNh4PA73r+BwVm2A1
         bztcLXMNsz08dMEnMBwa7oIFvodPnOmNpJ1zNMHo/Br5qZl6ksewgBTs1DhD5Gwws9CR
         fn9A==
X-Gm-Message-State: AGi0PuZrHdepmpa7JwLEmtRxOlSZUzOiBxrp3rnSYgWIqR2xE7/L6fxP
        5zJpcNUBz66ZVhgSPnIR260ZNw==
X-Google-Smtp-Source: APiQypLTa0Fj6ZDBSqok/u9uX6ZxgT4pcrgGXaa/WJe+fW40AHqLKX/vrmTroT8vkE/miajh4qLZaw==
X-Received: by 2002:a05:651c:118b:: with SMTP id w11mr5293818ljo.76.1588776091712;
        Wed, 06 May 2020 07:41:31 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id c2sm1784178lfb.43.2020.05.06.07.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 07:41:31 -0700 (PDT)
From:   john mathew <john.mathew@unikie.com>
X-Google-Original-From: john mathew <John.Mathew@partner.bmw.de>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@gmail.com, oleg.tsymbal@unikie.com,
        willy@infradead.org, valentin.schneider@arm.com,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v2 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Wed,  6 May 2020 17:39:29 +0300
Message-Id: <20200506143931.23387-2-John.Mathew@partner.bmw.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200506143931.23387-1-John.Mathew@partner.bmw.de>
References: <20200506143931.23387-1-John.Mathew@partner.bmw.de>
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
 Documentation/scheduler/index.rst           | 29 ++++++++++++---------
 Documentation/scheduler/overview.rst        |  5 ++++
 Documentation/scheduler/sched-debugging.rst | 14 ++++++++++
 Documentation/scheduler/sched-features.rst  | 20 ++++++++++++++
 5 files changed, 66 insertions(+), 13 deletions(-)
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
index 69074e5de9c4..ede1a30a6894 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -1,23 +1,26 @@
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
+    arch-specific.rst
+    sched-debugging.rst
 
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

