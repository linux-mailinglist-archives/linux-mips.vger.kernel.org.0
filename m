Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDAA1E3C62
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 10:45:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388200AbgE0Iod (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 04:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388197AbgE0Ioc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 04:44:32 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898A7C061A0F
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 01:44:32 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e4so5435207ljn.4
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=2PTC5EVa307BCUeD9Qn6MzxeHsnfP6zxHuZpiQgUb9p8zPkFis2OpRAKVvV7VLwHaZ
         KsdQ/weUnp6zhUS6p6yH+IgzdJZmE7a+ZLnj4QY8nYN0ErwArMiIVqcDOZb0/Z5Eg2JY
         hrQJervjBqoLNKoiD7Gio7fMMce19aPwfx8mBPnfv2UpqxCJDTbQ/qAOXWgo+THS4KEP
         QqveNEU6fkOzs629RfT0twDtbjH7KHtazzXe58eoCVIWl0kAUOuv7+mWsrXXPvKVj++p
         Kw0JmIIxl3O3QDu4qiPZN38BwwS1f10W6Kn9YTL7ChELxOrG7lxrQ5PfwtRohvdsZY4N
         psRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VdE4MiNfWQ7/UsB/TdHz4sDfTF/wlLohSStV9HV5fKw=;
        b=Hp/pZaa2cgK8N4piuIvOciwlxlq5QZYPFSwEXv5TriRkGli58Qtuk1ewbfroXHXg/A
         arefxbAjZC9lvqaMZTbRumlKvaBrR9M8Ofgd2wLaLKndQ5R/w5PeE/HQm3+OaMKmdZR1
         6Qf2Enp6lpbDAIhKf2SrVc1K0mP7p9owsEI8b7ipfx9CTNnKMkjo9Pf9C8zuVciJjUps
         Q6FPRukFMxbZjYoOrmxfWbUSw8FmH0cuYk7kfOVxIJZF6UlZzIQMvkSlkgrAtcxajFrI
         GigLv3BfG8YvaaJC1+9Du0LGFKoceC+ZhM58SIScdRuQnVfFwGwJshxqcFdA4OIjOrMe
         Mbig==
X-Gm-Message-State: AOAM530nqgqtR0d8LNDq/jQjbYgpI587vXVT9mepxN4LjCk8RLWMsdPs
        54Xve3RBEiRrOXB2c7Of1V2YVQ==
X-Google-Smtp-Source: ABdhPJziTgxYeXbFn91/y2eT3Ii6ad+JT15gJeGS0pT6mJqCoJxfMOQtA9iVyfATXyh1rHurOQCZdA==
X-Received: by 2002:a2e:b0c8:: with SMTP id g8mr2632357ljl.270.1590569070894;
        Wed, 27 May 2020 01:44:30 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id o4sm654925lff.78.2020.05.27.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 01:44:30 -0700 (PDT)
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
        mostafa.chamanara@gmail.com, willy@infradead.org,
        valentin.schneider@arm.com, srikar@linux.vnet.ibm.com,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v6 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Wed, 27 May 2020 11:44:19 +0300
Message-Id: <20200527084421.4673-2-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527084421.4673-1-John.Mathew@unikie.com>
References: <20200527084421.4673-1-John.Mathew@unikie.com>
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

