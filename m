Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E2A25B195
	for <lists+linux-mips@lfdr.de>; Wed,  2 Sep 2020 18:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbgIBQ0m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Sep 2020 12:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgIBQ0l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Sep 2020 12:26:41 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB92C061244
        for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2020 09:26:41 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y2so109371lfy.10
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2020 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=47YQwNjkGGbbE3i7sa2Kuqbb7Myc36HPrhccYNPndjE=;
        b=GYEgzlLRF5E9KClXQ6VQiRgCtaXfKiCps7bAj9IPVI/YNpT6Vn//aRZd1/RQxSgEvO
         I1q5GYysfVrZylmChEVF80N3SfIgI/aEwFdmJpyIsv9hrWYpeEPgr6r4Y6qEGxTAhT/1
         Qgv5kvnMZ203jNnivOkAcNR68XUH/qf8g0oAPMdel0xQuLLhRgeCOa33Rnr6g9GQm+Vh
         4mubMIp2bvVbd6kPmcKjKTlFPjxCNOORselo27s1wmts5zZC/XOZkKnIW0/r1cr8oULj
         8A9MGmY3YXxpBDwhXfxgCQxMxx5Dw0suEBDT0MZKbuaQiu1OeqlmnJ7oTg6oZ/zAS2rm
         HwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=47YQwNjkGGbbE3i7sa2Kuqbb7Myc36HPrhccYNPndjE=;
        b=YfXLy4xqCE5vatyZi8LIPR8+e6vaIRCqoJ4amt6UcJpPZuQoaDInzh9cb+dwoZ6BkX
         2Oh53nAO7U09+xT9+9yPlVLz1zhWV9S2j0A1wfiybt5+2TcMXnn9YtYu2staXU5Sw5zS
         H/+YCPHCHplgdHeke7UB0qMZPtaNY6euPMDIGSFVZYKnc9wxYnLsBziGfNZHiz9k2dYJ
         fbgHwAOOZzC+jsvsnr4ONnbnF9/nJ/av2Hy/sgN2s/o6Bt9Hm5jAbzbuMEfPG3OwlAxH
         8qeMRQd5b5t/CbHVpdUc/VXbflhpGhOh76LKNN2G6vBQhVfNTWQqowkfBA0rKAO5FIdN
         3CxQ==
X-Gm-Message-State: AOAM530OsebvR6JuBymHo+zggtq1w1OIMyrWt7xZmN9Hqddkwb+/ukLc
        kEblVuNlQnnF6lOGIL+3Fjz7RQ==
X-Google-Smtp-Source: ABdhPJxIhQZqLm3VDDnqmQv14PZqsN3hQCeJl6ul2i5e9pvdHaq07YSfKCVjqHBO2X03/oZ4bh5/NA==
X-Received: by 2002:a05:6512:3087:: with SMTP id z7mr3709857lfd.52.1599063999463;
        Wed, 02 Sep 2020 09:26:39 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id y24sm1191887lfg.75.2020.09.02.09.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 09:26:39 -0700 (PDT)
From:   John Mathew <john.mathew@unikie.com>
To:     linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, tsbogend@alpha.franken.de,
        lukas.bulwahn@gmail.com, x86@kernel.org,
        linux-mips@vger.kernel.org, tglx@linutronix.de,
        willy@infradead.org, valentin.schneider@arm.com,
        John Mathew <john.mathew@unikie.com>
Subject: [RFC PATCH v8 0/3] Add scheduler overview documentation
Date:   Wed,  2 Sep 2020 19:26:28 +0300
Message-Id: <20200902162632.10271-1-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series updates the scheduler documentation to add more topics
wrt to scheduler overview. New sections are added to provide a brief
overview of the kernel structs used by the scheduler, scheduler invocation,
and context switch. Previous version of the patch was reviewed at:
https://lore.kernel.org/lkml/20200527084421.4673-1-John.Mathew@unikie.com/

version 8:
 - Rebase

version 7:
 -Fix overview description
 -Removed rst headers
 -Removed kernel-doc for struct rq and meged it as struct
  member comments

version 6:
 -Fix typos.

version 5:
 -Fix description error on CAS

version 4:
 -Added section on Capacity-Aware Scheduling
 -Reworded CFS recently added features.
 -Removed vruntime description from scheduler structs
 -Added description of idle and stopper sched classses

version 3:
 -Fix spelling, spacing and typo errors.

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
  docs: scheduler: Add scheduler overview  documentation
  docs: scheduler: Add introduction to scheduler context-switch

 Documentation/scheduler/arch-specific.rst     |  14 +
 Documentation/scheduler/cfs-overview.rst      |  59 ++++
 Documentation/scheduler/context-switching.rst | 126 ++++++++
 Documentation/scheduler/index.rst             |  34 +-
 .../scheduler/mips-context-switch.rst         |  89 ++++++
 Documentation/scheduler/overview.rst          | 297 ++++++++++++++++++
 .../scheduler/sched-data-structs.rst          | 176 +++++++++++
 Documentation/scheduler/sched-debugging.rst   |  14 +
 Documentation/scheduler/sched-features.rst    |  25 ++
 Documentation/scheduler/scheduler-api.rst     |  24 ++
 .../scheduler/x86-context-switch.rst          |  55 ++++
 kernel/sched/core.c                           |  21 +-
 kernel/sched/sched.h                          |  63 +++-
 13 files changed, 978 insertions(+), 19 deletions(-)
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

