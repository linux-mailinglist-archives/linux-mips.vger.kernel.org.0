Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C58430BAD0
	for <lists+linux-mips@lfdr.de>; Tue,  2 Feb 2021 10:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbhBBJVT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Feb 2021 04:21:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhBBJVP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Feb 2021 04:21:15 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AF0C061573;
        Tue,  2 Feb 2021 01:20:34 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id h16so13336661qth.11;
        Tue, 02 Feb 2021 01:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FCZ/0hspr/CKWmqTo6R0TsTjOvk6ZFUd1V6vLB39+XI=;
        b=gzb1yiSqWhHgar0tFaSOrejCEQPj+ML1SMvoBx6ibY7PFc9PBf1WpYlVIImeeHlHtz
         +NEgCwy6D5XrSmMvTfaJjXKdYIEmfYM6fJLHnUN6pWpU6J+AXDjA26vXC2zRkO5uJ8U+
         5sA/uYT62OpGY+J1fb/PFlENh37X7Dn0noj1iITBg5lhjYbk0JKp2I2orOqXXQ7+D0IF
         N2kwBoYG1wuqh27nEJ/6ImDg4twfGRojNgbMC5Hayhf1JimKizeyCQhcyLq54DrsiVf/
         hjlNibSCJuZi8XA/UsHm/LRR/hHuKWqez+/2A4kIAAO431rVfdF/uPLqRTcsjwDGlKnQ
         TLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FCZ/0hspr/CKWmqTo6R0TsTjOvk6ZFUd1V6vLB39+XI=;
        b=cYuC8kvyPp4ACk4ffH3gwPy4BmbZJUqCu3TiywQ6/LXwpzqD2zWFR6cS7c4mBwMZw0
         caFfn49425Om2clo/hTRtUV17XRsv5TaYNe90lSx94hTuUmSCxQFP72D70Maw6SwSG75
         PScVcBVXJzrQUOM0nKaJPcaMfc6NEED2UWqSt87gsLJTLzIaUI8b49ib3aU5icmthRZM
         D4qDJPr1EcqTZmjk5Zfw8bWi1SMzgL76xno8WNaYB1rtdFX22F/IwOkdCgxIFtVF9MSv
         dVHEgZrnj+OY+g9KkPp4kVNNMlfklEGxMiEWDmoVE0bFSRY+xFNC0MKLQeEUuxHVCh7n
         KVKw==
X-Gm-Message-State: AOAM532VS7NRSOpaJYQw2l4k9NGfikBW/X3oiwCloRCcjhJDcrX9ITu6
        Vj1Hoq12v+2dihwlkYnQGuk=
X-Google-Smtp-Source: ABdhPJxDHSdPJoBi9sThgAu6yTV72u/XAjsuVeE/QG5CeMIggcFOEp35rTYPtA0WCgrOfeI+DTkevg==
X-Received: by 2002:ac8:598e:: with SMTP id e14mr19389057qte.346.1612257633652;
        Tue, 02 Feb 2021 01:20:33 -0800 (PST)
Received: from localhost.localdomain ([156.146.58.43])
        by smtp.gmail.com with ESMTPSA id x49sm16992513qth.95.2021.02.02.01.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 01:20:32 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     tsbogend@alpha.franken.de, peterz@infradead.org,
        frederic@kernel.org, peterx@redhat.com, afzal.mohd.ma@gmail.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH V2] arch: mips: kernel: Fix two spelling in smp.c
Date:   Tue,  2 Feb 2021 14:48:11 +0530
Message-Id: <20210202091811.21057-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

s/logcal/logical/
s/intercpu/inter-CPU/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V1 :
   Bart point out actual sentence construction was right,so keep it as it is.
   Randy suggested to put better spelling casing,so inducted
   Subject line adjusted accoring to the change
 arch/mips/kernel/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 74b9102fd06e..ef86fbad8546 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -59,7 +59,7 @@ static DECLARE_COMPLETION(cpu_starting);
 static DECLARE_COMPLETION(cpu_running);

 /*
- * A logcal cpu mask containing only one VPE per core to
+ * A logical cpu mask containing only one VPE per core to
  * reduce the number of IPIs on large MT systems.
  */
 cpumask_t cpu_foreign_map[NR_CPUS] __read_mostly;
@@ -510,8 +510,8 @@ static inline void smp_on_each_tlb(void (*func) (void *info), void *info)
  * address spaces, a new context is obtained on the current cpu, and tlb
  * context on other cpus are invalidated to force a new context allocation
  * at switch_mm time, should the mm ever be used on other cpus. For
- * multithreaded address spaces, intercpu interrupts have to be sent.
- * Another case where intercpu interrupts are required is when the target
+ * multithreaded address spaces, inter-CPU interrupts have to be sent.
+ * Another case where inter-CPU interrupts are required is when the target
  * mm might be active on another cpu (eg debuggers doing the flushes on
  * behalf of debugees, kswapd stealing pages from another process etc).
  * Kanoj 07/00.
--
2.26.2

