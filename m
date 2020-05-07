Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF7321C98C1
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 20:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgEGSGP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 14:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726470AbgEGSGP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 14:06:15 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5D9C05BD43
        for <linux-mips@vger.kernel.org>; Thu,  7 May 2020 11:06:14 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g10so5256599lfj.13
        for <linux-mips@vger.kernel.org>; Thu, 07 May 2020 11:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cftDsj6KL8i0ele2DpxcgTrxsQlYO091MF3gCFeL+aQ=;
        b=yTt+H+bkJynKnfmdp1Z2iJbB0LxhTMM/ZKMiSJowXShxF9cArwiTE1cLQoZj9YRe52
         K3WRYBjsHauBJORb2rI79txHZ0oQI4QKQ8Wp6LshYtGCmEPPzwQLjF5YUaX4zpM/zzIJ
         9s3QYyBLuE8UqmoIBXGe/54pNctABtHeThQfpz2Co9WfEVMB1Zo/mQyDtyv53hiRt2Ur
         VQWBjZeglu1oeiCjv95wGavI4fbQr8Mscdfkrmuoh00JqBfzTOdQPC8JG1fpQvZwolj2
         MfumjM85yvCpyfWSq4z74YjfVUD0sKgc6TGkKxe9aQgElDhw4FTASoQU4agHbRsKToVA
         YVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cftDsj6KL8i0ele2DpxcgTrxsQlYO091MF3gCFeL+aQ=;
        b=B8IlGCw949yvaaQ5SR32RkCYnwxCrUMwV2/HZ+QQHCnCp4mx25WnsrYAQTq0rpQD0F
         6JW3CZnvaQzTHbRC+18Vhpsb8ENsxB/J9Pg9G6DO1WyDLusMYkJbkozEQ/CbvBRZ1P/D
         uFBx+vYUgEkAFHuPQZJVr8whGBxF1/8iFlODAoyr8U4JKnYXSociJ9qS8DP1bmjX6xiG
         A++3A0aofT9Lb199DMebF2Z9oXUKj+Zlu/tEberOJo3zxG0PZcQBDNTfXuUkAeD2mH0r
         1K14cZsKWtMesgsrgLQkC6b9K0EoaVzSQV7DuO9GHqRGehI50AlGveystATZH/ijb6+C
         gTVg==
X-Gm-Message-State: AGi0PubyghY+6fc27GFwyOfUnMVNlB1YtncRnANlWDiFIwEcSuMgE7D2
        N7TEa+mHObTfcoxWuG605KX6wA==
X-Google-Smtp-Source: APiQypLXRmZBR/8ZYONjY5Vn2vslB/E9Ob6zIUcn9rNcIQ7QBb/KkQ4BPmJkrjxmbzNFxLNGmkvtzg==
X-Received: by 2002:ac2:5b5e:: with SMTP id i30mr4314698lfp.161.1588874773057;
        Thu, 07 May 2020 11:06:13 -0700 (PDT)
Received: from localhost.localdomain (84-253-205-124.bb.dnainternet.fi. [84.253.205.124])
        by smtp.googlemail.com with ESMTPSA id w21sm3715392lji.26.2020.05.07.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 11:06:11 -0700 (PDT)
From:   John Mathew <john.mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        mostafa.chamanara@basemark.com, rdunlap@infradead.org,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v3 1/3] docs: scheduler: Restructure scheduler documentation.
Date:   Thu,  7 May 2020 21:05:51 +0300
Message-Id: <20200507180553.9993-2-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507180553.9993-1-john.mathew@unikie.com>
References: <20200507180553.9993-1-john.mathew@unikie.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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

