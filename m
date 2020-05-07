Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736921C98BE
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 20:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgEGSGI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 14:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726514AbgEGSGI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 14:06:08 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A734C05BD09
        for <linux-mips@vger.kernel.org>; Thu,  7 May 2020 11:06:08 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id z22so5296845lfd.0
        for <linux-mips@vger.kernel.org>; Thu, 07 May 2020 11:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=uPvUkFT01w2TDYWgbcI7ufjq3faBUrMBaYiJbDvssNE=;
        b=iR2ssMXC/ymlyFfbbDiNpySrdnRo65etLifVTjA1sILNi21+i+/w1pVDIiYP8PDwN0
         Y8/5pexTjm9m2vEb10yLbpWNr+dt1DPUFPYhtdJRH3Cpso/Y2fwo6h3dmsyl+5OSG2pj
         UgjhDs1ea2d/fTmTYWLBQUmENy58rhFSIkJ7EsScFGyNEIerdsUZOMWXi9JPzEW4j/ZZ
         kn5zVDGxyLwh3TiGCKys3xX2QtgFmyv6+OCEjxDgvYTENyzjXi3P1AtdLJxeYRRvZBSX
         nvWftHxqhv4aCDQSuMum5SEVavGonpAA1arUvNOtD7HO9pKwL9eWzkZltGzLYtCH0/W6
         9yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=uPvUkFT01w2TDYWgbcI7ufjq3faBUrMBaYiJbDvssNE=;
        b=nR51DAbIirSUcmAF6FUCPRT/1oGz0lbUxNsHyaVEKGk6PSasIwcuKbbvn/zNUcKv8G
         a6i/FGAcsb1aqzGOt+E8FD7ecMM5mRog97VzOYpxpcZevw6hJQBYJbSWekrHyxCeHdNc
         r6xkeCMgipTy6jo4b9R4lVsG20TIVnmAw7ehgwXPVXxlOFWdTS8fJIYQRUrIQ+95ev1p
         cXDrB7qGjA6OQM/QG8w12TJt1jdSQ5YUN82Kva89GhXlzfHEolfxz6S4wqJ5mJbHB5be
         pvEj1FfIDMhXZuikKwl756YoG4VIt3XQ+gRI8FUyuGhKmZB+MZqAoX2Y7wqfY8jFa+3l
         nuGw==
X-Gm-Message-State: AOAM533DNYLYpY16v8XHg+jP4bguJJ1UboWIOv9TCnS+Au7yCXXhelIA
        mXC6J1uvL3I+J7HsJuG2542www==
X-Google-Smtp-Source: ABdhPJzestKpxUSSr1Kh6hfHv2V8zg6qbH1ZR5V8CcoNiTTzU5SJjjMRO8zPDL+5Kctwnesh/bow+Q==
X-Received: by 2002:a19:cc07:: with SMTP id c7mr2367026lfg.163.1588874766524;
        Thu, 07 May 2020 11:06:06 -0700 (PDT)
Received: from localhost.localdomain (84-253-205-124.bb.dnainternet.fi. [84.253.205.124])
        by smtp.googlemail.com with ESMTPSA id w21sm3715392lji.26.2020.05.07.11.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 11:06:05 -0700 (PDT)
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
Subject: [RFC PATCH v3 0/3] Add scheduler overview documentation
Date:   Thu,  7 May 2020 21:05:50 +0300
Message-Id: <20200507180553.9993-1-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series updates the scheduler documentation to add more topics
wrt to scheduler overview. New sections are added to provide a brief
overview of the kernel structs used by the scheduler, scheduler invocation
and context switch.
The previous version was reviewed at 
Link: https://lkml.org/lkml/2020/5/6/630

version 3:
 Fix spelling, spacing and typo errors.

version 2:
- Remove :c:func: directive as it was redundant
- Limit document width (line symbol count) to 75
- Replace dot file with ASCII art
- Describe prepare_task_switch(), ASID use, 
  kernel/user transtion, MIPS FPU affinity correctly
- Add missing references to files
- Removed internal APIs from scheduler API reference
- Described rq struct member as kernel-doc comments
- Replaced CFS history with CFS current status
- Added documentation for sched_class fields
- Refined explanation of context swtich functionality
- Replace CFS history with recent changes
- Added kernel-doc comments for struct rq

John Mathew (3):
  docs: scheduler: Restructure scheduler documentation.
  docs: scheduler: Add scheduler overview documentation
  docs: scheduler: Add introduction to scheduler context-switch

 Documentation/scheduler/arch-specific.rst     |  14 +
 Documentation/scheduler/cfs-overview.rst      | 113 ++++++++
 Documentation/scheduler/context-switching.rst | 125 ++++++++
 Documentation/scheduler/index.rst             |  33 ++-
 .../scheduler/mips-context-switch.rst         |  89 ++++++
 Documentation/scheduler/overview.rst          | 271 ++++++++++++++++++
 .../scheduler/sched-data-structs.rst          | 253 ++++++++++++++++
 Documentation/scheduler/sched-debugging.rst   |  14 +
 Documentation/scheduler/sched-features.rst    |  20 ++
 Documentation/scheduler/scheduler-api.rst     |  31 ++
 .../scheduler/x86-context-switch.rst          |  65 +++++
 kernel/sched/core.c                           |  28 +-
 kernel/sched/sched.h                          | 169 ++++++++++-
 13 files changed, 1205 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/scheduler/arch-specific.rst
 create mode 100644 Documentation/scheduler/cfs-overview.rst
 create mode 100644 Documentation/scheduler/context-switching.rst
 create mode 100644 Documentation/scheduler/mips-context-switch.rst
 create mode 100644 Documentation/scheduler/overview.rst
 create mode 100644 Documentation/scheduler/sched-data-structs.rst
 create mode 100644 Documentation/scheduler/sched-debugging.rst
 create mode 100644 Documentation/scheduler/sched-features.rst
 create mode 100644 Documentation/scheduler/scheduler-api.rst
 create mode 100644 Documentation/scheduler/x86-context-switch.rst

-- 
2.17.1

