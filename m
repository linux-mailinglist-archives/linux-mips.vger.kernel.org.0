Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3EE19A919
	for <lists+linux-mips@lfdr.de>; Wed,  1 Apr 2020 12:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732194AbgDAKCv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Apr 2020 06:02:51 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41867 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732163AbgDAKCv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Apr 2020 06:02:51 -0400
Received: by mail-lj1-f196.google.com with SMTP id n17so25108193lji.8
        for <linux-mips@vger.kernel.org>; Wed, 01 Apr 2020 03:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=g2acQBwSdU8TClaR1PdrlLUVyKKZBvmfDgY4bZv6CmQ=;
        b=SQ5ypJulyOsWIY3Ku0c0sdTpo8CFdwNq9pU9PKkyuH0O1H+hNSfPsW5ofyi3gGlpSg
         TWWLl8t2kD3LGgxzaY321b3JbSeQn2nf32tTxsePH9WxrOhaQGdU2aaG5iSCn64Jhl2K
         MrEqIqqbs31++Hhu5bjEGF73pngDZEIqv0qRNkuyLW2bxyRgHziPvbx7m82Qvfa04+il
         f1zVa2brw7CZy7CvX+CnT38xcJSTqXa4m8pok+HYiAOr3XDowk7T4PgmiAxXZKA1Xqbd
         hjhDyb11yKz+n2/AnaVGej0uJAnxdmlRj833TUFoQq7HNYu6bcobre1DQEqerpcJaQGZ
         NV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=g2acQBwSdU8TClaR1PdrlLUVyKKZBvmfDgY4bZv6CmQ=;
        b=ABq6ME5ZjI0TDQkSowZXGcNz1uE/hqTWOj++zp3DCvs/mm03ek5F7Lg5EosiK+Ye3t
         fvIG/OycIB6pij4wvNl1G4eLGM4y3Gw2OwyVmFDPBPbWmTZeZPJxtzS3aFrHYfa9fKnk
         r/X+7KwTNsyCVDCoT5wna9v8aZM9Cnbbm4TZ/jy/lL5OZrw4vIP673Pg9r6n2Tr4aUnb
         JpzdqHLkMhv33ITlHU9zS12Rx6Z/z+nsR2ExSw3oV71+zluT3xSy/uS2cuzAvhc6FOxO
         zP+YCighFW8q5Fdv3E6SYWLUmoOVtB3kZXs7MFCUUEhO2JqqqRhIe9PiYsiady1dOylZ
         0AQw==
X-Gm-Message-State: AGi0PuZ/gfL3UWOH0UC/yfzyOkaDHr/RJO4b9zEBZzbLSMWjwAb4H/Uz
        4CK02xEgKOhEcO0R4RLTAxZS8g==
X-Google-Smtp-Source: APiQypIVOHoTA5JEJDVAZclyEu7xiRg0Hp96XPCiq34AJLs31TbktOyQFFcVg1/Xq9gQLD8rhGCqEg==
X-Received: by 2002:a05:651c:404:: with SMTP id 4mr12957660lja.281.1585735368186;
        Wed, 01 Apr 2020 03:02:48 -0700 (PDT)
Received: from localhost.localdomain (dyvyn9m99j8s7-9xsphjt-4.rev.dnainternet.fi. [2001:14bb:440:beab:bd3f:1fbf:f66f:618f])
        by smtp.googlemail.com with ESMTPSA id n14sm862986ljm.104.2020.04.01.03.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 03:02:47 -0700 (PDT)
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
Subject: [RFC PATCH 0/3] Add scheduler overview documentation
Date:   Wed,  1 Apr 2020 13:00:26 +0300
Message-Id: <20200401100029.1445-1-john.mathew@unikie.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

Based on our investigation in the area of the MIPS scheduler context
switch we wish to share our learnings about the kernel scheduler in
the form of kernel documentation. Investigations were done mostly by
stepping through the code using GDB and code inspection. The aim of
the patchset is to provide a brief overview of the kernel scheduler
starting from a brief history, the overview of the kernel structs
used by the scheduler, scheduler invocation and context switch. We
have also added a small section on scheduler state modelling
possibilities. In order to add these subjects we have restructured
the existing scheduler documentation so as to put them in to suitable
sections. We hope the new structure will enable easy extension of the
scheduler documentation.

Patch 1 creates place holders and new structure for the scheduler documentation.
The main sections are
 - Scheduler overview: Overview of the scheduler.
 - CFS: A section dedicated to CFS scheduler.
 - Process context switching: Context switching overview.
 - Scheduler features: We thought most of the existing documentation can be moved
   here.
 - Architecture Specific Scheduler Implementation Differences: Aimed for each
   architecture and future updates.
 - Scheduler Debugging Interface: For scheduler diagnostics and utilities
 - Scheduler related functions: Scheduler API reference.

Patch 2: Adds documentation for the place holders of the Scheduler overview,
 Scheduler State Transition and CFS sections.

Patch 3: Adds documentation for the place holder of the Process context switching
 and add 2 new sections to for x86 and MIPS context switch.


John Mathew (3):
  docs: scheduler: Restructure scheduler documentation.
  docs: scheduler: Add scheduler overview documentation
  docs: scheduler: Add introduction to scheduler context-switch

 Documentation/scheduler/arch-specific.rst     |  14 +
 Documentation/scheduler/cfs-data-structs.rst  | 208 ++++++++++++++
 Documentation/scheduler/cfs-overview.rst      |  46 ++++
 .../scheduler/cfs-sched-overview.rst          |  17 ++
 Documentation/scheduler/context-switching.rst |  71 +++++
 Documentation/scheduler/index.rst             |  31 ++-
 .../scheduler/mips-context-switch.rst         |  78 ++++++
 Documentation/scheduler/overview.rst          | 260 ++++++++++++++++++
 Documentation/scheduler/sched-debugging.rst   |  14 +
 Documentation/scheduler/sched-features.rst    |  20 ++
 Documentation/scheduler/scheduler-api.rst     |  34 +++
 .../scheduler/x86-context-switch.rst          |  59 ++++
 kernel/sched/core.c                           |  36 ++-
 13 files changed, 867 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/scheduler/arch-specific.rst
 create mode 100644 Documentation/scheduler/cfs-data-structs.rst
 create mode 100644 Documentation/scheduler/cfs-overview.rst
 create mode 100644 Documentation/scheduler/cfs-sched-overview.rst
 create mode 100644 Documentation/scheduler/context-switching.rst
 create mode 100644 Documentation/scheduler/mips-context-switch.rst
 create mode 100644 Documentation/scheduler/overview.rst
 create mode 100644 Documentation/scheduler/sched-debugging.rst
 create mode 100644 Documentation/scheduler/sched-features.rst
 create mode 100644 Documentation/scheduler/scheduler-api.rst
 create mode 100644 Documentation/scheduler/x86-context-switch.rst

-- 
2.17.1

