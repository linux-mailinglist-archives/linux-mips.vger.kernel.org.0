Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8451C7305
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 16:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgEFOkB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 10:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728712AbgEFOkB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 10:40:01 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A627EC061A0F
        for <linux-mips@vger.kernel.org>; Wed,  6 May 2020 07:40:00 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id l19so2601755lje.10
        for <linux-mips@vger.kernel.org>; Wed, 06 May 2020 07:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=d1/xG5dqhlwWc5rbz1CW+9PYc2c8GDV/QXEqpAy4DqA=;
        b=zlOglc4W8Lo1zP6l+SElnBShjGZba+3A2KUR/0XsTPgSBv0gQKyWskaFYAra/dYlBO
         P/HpknJmeM1596PcgzEv28IjgU5qmcoQTyKmfNNjwd5Gun+f9J7JXa1DWS/0ruO3XaC/
         7jClgwfiCgvopEEIATejf/IL8PC7vHjlDd0JtLP97YWBQOkkH+6pqoOb97oK0n95a5FR
         669Oy1Sy83dwKO3JHT7fkh+20RKj5N2ogMHAYVQ60xd3csDI7WEcm3bEBlj3nOCVFjPm
         eqSxpcAoDzsuRN+0YmeQkWpT/DOcsd56uJbIc7JJl+ediIt+XtokYR40UaRPIUsSamQz
         KnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=d1/xG5dqhlwWc5rbz1CW+9PYc2c8GDV/QXEqpAy4DqA=;
        b=iac3cYAAGro81OoTQZ7fVRpkD/jC9WdIGwU0Zl3Jf1WC74qv6B30z90L4LZTQ5kop6
         L+EyTU3tnXs9cWQ+edSBU2Mr8ktLd+Xn2c7bK+ZFsyAlrLu3AZVIMhZyFKPxATcdvB2o
         ikIC3pzg9vjbNFuP3Y9KxZHkt0NYdQx86gHTHPdsSFXsSWmGp7M06i4rI/TAGK1qnQId
         rvtwyMvHJ4qJo0Q2tbPM9O2QznGy8L9y2p+ZTJYs6kVONc5EePodQVKv86LAhb294WQL
         esKTlUghxr2lIqZ+jcfQTRYttBOla8d2G79YVA8eoewzgjNjzqoMxq/cgHNebX1AzKm4
         56Dg==
X-Gm-Message-State: AGi0PubIMKS2C2N3FMp23MditHQnbohIWD5eMXaI21cKCHL5BacPc/Cn
        J7HwtH2KpSt/KuZQfiwe7HPTewQpZApDSqv7
X-Google-Smtp-Source: APiQypLOIsZSj6wUjcPnIAdJk2l3ppliWS7cuqaJdsXnqGrup5nEWDV4zEEUxd/F6yaj/m2fYH8vVQ==
X-Received: by 2002:a2e:8046:: with SMTP id p6mr5006664ljg.21.1588775999065;
        Wed, 06 May 2020 07:39:59 -0700 (PDT)
Received: from localhost.localdomain ([109.204.235.119])
        by smtp.googlemail.com with ESMTPSA id c2sm1784178lfb.43.2020.05.06.07.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 07:39:58 -0700 (PDT)
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
        john mathew <John.Mathew@partner.bmw.de>
Subject: [RFC PATCH v2 0/3] Add scheduler overview documentation
Date:   Wed,  6 May 2020 17:39:28 +0300
Message-Id: <20200506143931.23387-1-John.Mathew@partner.bmw.de>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch series updates the scheduler documentation to add more topics
wrt to scheduler overview. New sections are added to provide a brief
overview of the kernel structs used by the scheduler, scheduler invocation
and context switch. First version of this patch series was reviewed at

Link: https://lore.kernel.org/lkml/20200401100029.1445-1-john.mathew@unikie.com/

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
- Added kernel-doc comments for struct rq
- Mention SCHED_DEADLINE and add pointer to sched-deadline.txt

John Mathew (3):
  docs: scheduler: Restructure scheduler documentation.
  docs: scheduler: Add scheduler overview documentation
  docs: scheduler: Add introduction to scheduler context-switch

 Documentation/scheduler/arch-specific.rst     |  14 +
 Documentation/scheduler/cfs-overview.rst      | 110 +++++++
 Documentation/scheduler/context-switching.rst | 126 ++++++++
 Documentation/scheduler/index.rst             |  33 ++-
 .../scheduler/mips-context-switch.rst         |  88 ++++++
 Documentation/scheduler/overview.rst          | 274 ++++++++++++++++++
 .../scheduler/sched-data-structs.rst          | 253 ++++++++++++++++
 Documentation/scheduler/sched-debugging.rst   |  14 +
 Documentation/scheduler/sched-features.rst    |  20 ++
 Documentation/scheduler/scheduler-api.rst     |  30 ++
 .../scheduler/x86-context-switch.rst          |  65 +++++
 kernel/sched/core.c                           |  28 +-
 kernel/sched/sched.h                          | 169 ++++++++++-
 13 files changed, 1204 insertions(+), 20 deletions(-)
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

