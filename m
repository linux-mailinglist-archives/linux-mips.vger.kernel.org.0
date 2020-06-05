Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9391EF41E
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2020 11:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgFEJ3S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Jun 2020 05:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgFEJ3S (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Jun 2020 05:29:18 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C0AC08C5C2
        for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2020 02:29:18 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c11so10909427ljn.2
        for <linux-mips@vger.kernel.org>; Fri, 05 Jun 2020 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=XZQcxpnQFsR7dWRW2bG4ja76wOXb2EtshnLCYBAPPiw=;
        b=TR82pwPBsSgXOb0+f4945e2lD/2gWu6GXR2oxCrjQEnpVbxzZmgDnoNut8X0zEclKV
         x3Z0wHpA3k6cf7iPIxihyfJfy/Jc1wpHceBqTTVKY5FB1MnO5HtOPVA7feFdi89lmFKx
         QMwqHrSSiGeKJ1QbVAmJ0ixM470umlmITvHIoym9x4fNefevuixCI+3C/erRx8tFlr73
         x1W1wdg7/OvDi9I3CxArJGA1jHYCf85r1YLOfa3XAlKRCRfwousM97XBQKmM0BzQFoZE
         oVim+Lt9reUyQ+iSW1N424xyrWhgQuUSxNMyhj/z0rrsFrG6zQ2qe/SYaxB9v8d9BJa/
         yPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=XZQcxpnQFsR7dWRW2bG4ja76wOXb2EtshnLCYBAPPiw=;
        b=fj3+y9WUjX3nGUgwwM7AM23MK0n60qP4lqMUwAdZd0bE+ahdWFFnbdhWOKx2nWNPG1
         T/RsFv6ANNI3QjTV+j6dHs7xUWXPv74Uo9NEhAPuMOgbPkiMWQGQIfdIjyIyzG4sHmY3
         bjSRLGFjUuprDgRC2+D5OqWUHT+VsM9m7tTaNKZlGPfY7gxqjF11mP4hgGSzNX6tf5FF
         DRxkF8H0pmYxAUP+I5t2BXGdHk0qf8g1Wq9igoN4ajQnC1ICir3XUcLqtd8zvlD1DivQ
         nvEEE8fg54ku0PbnO2mi0PAMZC1EMqRbA+wzNpdXcwBmgSarpIuwVldKsbM0FDan+wg4
         kbEQ==
X-Gm-Message-State: AOAM532ajHyY3dJPbZSWJrFioW1961nZY8uz5K1YjMqBYLB0BB4PQy7g
        QkJxhJEiGcPTLHYGGRrxAJIGRg==
X-Google-Smtp-Source: ABdhPJxefoujOSS1MdEm7C/o48gKms2QHlyTzibqrq7EaZsF9hmiG3VfW4hlY8WBaNOO6+n59G6mFA==
X-Received: by 2002:a2e:9192:: with SMTP id f18mr4638080ljg.383.1591349356572;
        Fri, 05 Jun 2020 02:29:16 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id a1sm746471lfi.36.2020.06.05.02.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 02:29:15 -0700 (PDT)
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
        srikar@linux.vnet.ibm.com, john mathew <John.Mathew@unikie.com>
Subject: [RFC PATCH v7 0/3] scheduler: Add scheduler overview
Date:   Fri,  5 Jun 2020 12:29:03 +0300
Message-Id: <20200605092906.29478-1-John.Mathew@unikie.com>
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
https://lore.kernel.org/lkml/20200527084421.4673-1-John.Mathew@unikie.com/

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
  docs: scheduler: Add scheduler overview documentation
  docs: scheduler: Add introduction to scheduler context-switch

 Documentation/scheduler/arch-specific.rst     |  14 +
 Documentation/scheduler/cfs-overview.rst      |  59 ++++
 Documentation/scheduler/context-switching.rst | 126 ++++++++
 Documentation/scheduler/index.rst             |  33 +-
 .../scheduler/mips-context-switch.rst         |  89 ++++++
 Documentation/scheduler/overview.rst          | 290 ++++++++++++++++++
 Documentation/scheduler/sched-cas.rst         |  92 ++++++
 .../scheduler/sched-data-structs.rst          | 176 +++++++++++
 Documentation/scheduler/sched-debugging.rst   |  14 +
 Documentation/scheduler/sched-features.rst    |  21 ++
 Documentation/scheduler/scheduler-api.rst     |  25 ++
 .../scheduler/x86-context-switch.rst          |  64 ++++
 kernel/sched/core.c                           |  21 +-
 kernel/sched/sched.h                          |  61 ++++
 14 files changed, 1068 insertions(+), 17 deletions(-)
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

