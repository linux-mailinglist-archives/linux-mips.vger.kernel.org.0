Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 991C619A91B
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 12:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732208AbgDAKCy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 06:02:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34587 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732203AbgDAKCx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 06:02:53 -0400
Received: by mail-lj1-f193.google.com with SMTP id p10so24869925ljn.1
        for <linux-mips@vger.kernel.org>; Wed, 01 Apr 2020 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=AaFao30w/2kIvZw9/s29i3Jz2nxOQX8V+ssYL6KtF3U=;
        b=17Zg3Wpouk9v5/Ehq3zgR62jsJKFeQ+fPaUc2Y++MpsQmdXkTm8RcYK2RySZ9NPHYV
         HNiNbcDkZJD9/yNlzXN+EnEZJI2B4JySIc7zphD1V67dTLMs7do/s14X16DvRAk4XLhM
         /XFrCsfmdipp0lzr5e4q9l9ROCJVxje1D1HwHLP/9RrAhuy4tX2xlcyNVReQeSs9NYcO
         17DiqDI4rX4O6uUzUMDZ5NbNjdh+5j5bHqOHT8Vmc2AepTb1jaipKjZ6AUNgr6oMzg58
         vQtVnBavMRB+TH8dit7v8YEn+iGBvEBrXWOcCeNbzNJ4XSgFlTAKx+zwchk6iahJkr8P
         A8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=AaFao30w/2kIvZw9/s29i3Jz2nxOQX8V+ssYL6KtF3U=;
        b=l0LVzkOFQwrqnw04xATVrRspu5RkJ5NlFuf+838JZGPHPH7xnT21ga3Gycv/GSJJ3h
         kv8lqAxWWYisnJUOZ+/lAbz69A3ZGpIzbfRTv8WLDcDUPzKE/aQfNNFxXlBujKy0+YqR
         fbNM+6HM5mELPaS/c28MGXHuo3X+nO3qzXDJQU3gJMXOawPepS3PPRZvWtwBU028kQVo
         n9YrEgrRRi5dIpWvpfWfd1FGvZCec6pAuToo3eQsYkq21M0cdnjcnsaJ4hmBHTWIrMlf
         HxfL/7XMkm3PIzHRzk2YOn7CFK3c30r7jaPg38iBp5zISbuPjwwT2HEGQxz0BmyNTcuG
         Tj+w==
X-Gm-Message-State: AGi0PuYnTSEzmBG9aszyrOccw7u1mxu+G2imU/7jXPA4/xhljrTRVA3i
        6LvoMIRH0KDa7DAJ1FIhEwOYeQ==
X-Google-Smtp-Source: APiQypLZl4DJFpCLnjmydDcHgDNB1XXhq0SYDjt1QtuF+kJ9RDVV+rM+eNjDgm482JKA7kO3qf3b+A==
X-Received: by 2002:a2e:9912:: with SMTP id v18mr8656454lji.199.1585735369897;
        Wed, 01 Apr 2020 03:02:49 -0700 (PDT)
Received: from localhost.localdomain (dyvyn9m99j8s7-9xsphjt-4.rev.dnainternet.fi. [2001:14bb:440:beab:bd3f:1fbf:f66f:618f])
        by smtp.googlemail.com with ESMTPSA id n14sm862986ljm.104.2020.04.01.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 03:02:49 -0700 (PDT)
From:   John Mathew <john.mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Wed,  1 Apr 2020 13:00:27 +0300
Message-Id: <20200401100029.1445-2-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200401100029.1445-1-john.mathew@unikie.com>
References: <20200401100029.1445-1-john.mathew@unikie.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add new sections to enable addition of new documentation on
the scheduler. Existing documentation is moved under the related
new sections. The sections are
  - overview
  - cfs-sched-overview
  - sched-features
  - arch-specific.rst
  - sched-debugging.rst

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: John Mathew <john.mathew@unikie.com>
---
 Documentation/scheduler/arch-specific.rst     | 11 +++++++
 .../scheduler/cfs-sched-overview.rst          | 15 ++++++++++
 Documentation/scheduler/index.rst             | 29 ++++++++++---------
 Documentation/scheduler/overview.rst          |  5 ++++
 Documentation/scheduler/sched-debugging.rst   | 14 +++++++++
 Documentation/scheduler/sched-features.rst    | 20 +++++++++++++
 6 files changed, 81 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/scheduler/arch-specific.rst
 create mode 100644 Documentation/scheduler/cfs-sched-overview.rst
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
diff --git a/Documentation/scheduler/cfs-sched-overview.rst b/Documentation/scheduler/cfs-sched-overview.rst
new file mode 100644
index 000000000000..44dac92d9462
--- /dev/null
+++ b/Documentation/scheduler/cfs-sched-overview.rst
@@ -0,0 +1,15 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+CFS
+====
+
+This documentation describes the linux CFS scheduler.
+
+.. class:: toc-title
+
+	   Table of contents
+
+.. toctree::
+   :maxdepth: 2
+
+   sched-design-CFS
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 69074e5de9c4..83c718d05b9d 100644
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
+
 
+.. class:: toc-title
 
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
+	   Table of contents
+
+.. toctree::
+    :maxdepth: 2
 
-    text_files
+    overview
+    cfs-sched-overview
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

