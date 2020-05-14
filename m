Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1CA1D2B5E
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 11:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgENJ0s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 05:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726070AbgENJ0s (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 05:26:48 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE730C061A0E
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 02:26:47 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id d21so2701343ljg.9
        for <linux-mips@vger.kernel.org>; Thu, 14 May 2020 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=/tJIRKNQneeHlQjEaZHszK2k+iclO+jR+dvoNvPPVag=;
        b=0w4nQel5wYmmZuOCNC96sAPuFmQwbr0ilMU5hH0f2m5RwAJDAf0vWJaJjGpDd4Xye/
         5sgD0Jrp7stAugAy5kTH/BFKJOhiJUZ/f65X13cYFZM31Z5sQMkmeX8wtZvzYu0vDeIf
         d/x+KrDtoLAArPmF5sFwM7+C4vhIGtai0LXmnrJpZ/kv27w6zkQgIhNYcHTnNe6/12lY
         sV5Vhad3rEy4OI919WVv+fZlccGcCLA0igXtdSXXa4ehV2f8CR6NgCY0MZDJLQp//i7n
         sA81o26C1WgsQyNpR3eDgkMibS1XJK/0c/r77nF6p5r5s/dYJ4KfUkCvvqpJEwdPHcdG
         hGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/tJIRKNQneeHlQjEaZHszK2k+iclO+jR+dvoNvPPVag=;
        b=qUpQUUh/OPLJoYZPv4z77oFtDeFLVrmqYHD+5qmIrz+pajJc4N9m4DZHsQOhHFv5pY
         d7zmYzB0p5QCI2E7H9/seqSO1K2aNZJz9GeOmMv9BOFHOlLcWyRoXNcmLLppBqxy3BJZ
         at+6ceV+m8rbcN6uMs/wCpTSiMK5UK9EeK6SAOuCbqK7sDXLxQOaHDxD+jLK9YOIsmD+
         kMWO3GSHL39qPsbuwwSIZ4fZDohE7jwj598FY+M3FhxoZGVbf6nky8xfMLfKAFS10Voy
         tujtqAQ0bibvOQTl4Gd6mXSo0piec2uAJnsjNqNax8J4Zo+kqC6D5mTkMkaSXFucLACR
         8tWQ==
X-Gm-Message-State: AOAM533dLya4JMak9kFuWzwSOONFkS2BFqVUxByckPMYfXeloN4kCueq
        Q6UaBhpDSn8cX7PopNtWeQ9uKw==
X-Google-Smtp-Source: ABdhPJypxqTmuwxppOif/Z3CQU8dOmf27s2EyHuP2mHtcLneEg9vxjP+VMreICRF8ePrT6CXo0k70w==
X-Received: by 2002:a2e:731a:: with SMTP id o26mr2227667ljc.189.1589448406062;
        Thu, 14 May 2020 02:26:46 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id e25sm1426117lfb.89.2020.05.14.02.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 02:26:45 -0700 (PDT)
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
        valentin.schneider@arm.com, rdunlap@infradead.org,
        john mathew <John.Mathew@unikie.com>
Subject: [RFC PATCH v5 0/3] Add scheduler overview documentation
Date:   Thu, 14 May 2020 12:26:34 +0300
Message-Id: <20200514092637.15684-1-John.Mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series updates the scheduler documentation to add more topics
wrt to scheduler overview. New sections are added to provide a brief
overview of the kernel structs used by the scheduler, scheduler invocation,
context switch and Capacity Aware Scheduling. Previous version of
the patch was reviewed at:
Link: https://lore.kernel.org/lkml/20200513134338.19688-2-John.Mathew@unikie.com/

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
  docs: scheduler: Add scheduler overview documentation
  docs: scheduler: Add introduction to scheduler context-switch

 Documentation/scheduler/arch-specific.rst     |  14 +
 Documentation/scheduler/cfs-overview.rst      | 102 ++++++
 Documentation/scheduler/context-switching.rst | 125 ++++++++
 Documentation/scheduler/index.rst             |  33 +-
 .../scheduler/mips-context-switch.rst         |  89 ++++++
 Documentation/scheduler/overview.rst          | 293 ++++++++++++++++++
 Documentation/scheduler/sched-cas.rst         |  92 ++++++
 .../scheduler/sched-data-structs.rst          | 182 +++++++++++
 Documentation/scheduler/sched-debugging.rst   |  14 +
 Documentation/scheduler/sched-features.rst    |  21 ++
 Documentation/scheduler/scheduler-api.rst     |  31 ++
 .../scheduler/x86-context-switch.rst          |  65 ++++
 kernel/sched/core.c                           |  28 +-
 kernel/sched/sched.h                          | 169 +++++++++-
 14 files changed, 1238 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/scheduler/arch-specific.rst
 create mode 100644 Documentation/scheduler/cfs-overview.rst
 create mode 100644 Documentation/scheduler/context-switching.rst
 create mode 100644 Documentation/scheduler/mips-context-switch.rst
 create mode 100644 Documentation/scheduler/overview.rst
 create mode 100644 Documentation/scheduler/sched-cas.rst
 create mode 100644 Documentation/scheduler/sched-data-structs.rst
 create mode 100644 Documentation/scheduler/sched-debugging.rst
 create mode 100644 Documentation/scheduler/sched-features.rst
 create mode 100644 Documentation/scheduler/scheduler-api.rst
 create mode 100644 Documentation/scheduler/x86-context-switch.rst

-- 
2.17.1

