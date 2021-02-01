Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 409AA30A65B
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 12:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233227AbhBALTa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 06:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233120AbhBALT0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Feb 2021 06:19:26 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C346C061573;
        Mon,  1 Feb 2021 03:18:46 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id a12so15756876qkh.10;
        Mon, 01 Feb 2021 03:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gaGvv58JGYagmylyy3D1eubHzQ869JT6Zg0K0j8aoGI=;
        b=fgD2p6Ajdg7WbtGKKD/YMRqi8XjTTxoA4P1r7JGjGMwDfrIszRdCEdHX3wWRjJtCh9
         BG/p6Ck7rV1GdrC7dgLVFnj6suteB9PtEodMsQYIIRta+E2CP30XwnLHtQ3k6aSMQl//
         IIl+4InxJrY6RX2ER0ZD0rrZDCILvHSB+ceS0B6hTpyzcNMkbh3pCoZDRm2KO+VnEiDM
         MNf3yHgC13oYACpI1ZFgEXBDiSBbJYolxypr0EqEhrP5fvxvqhILIai3DR+Pi15QamPf
         NDW/QM0lpnbBLwJpT2TZ5HLeIq/+mYcjs+PQ4ePSbcPLpfAxEcKDluPW48NwQJLPxXax
         mRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gaGvv58JGYagmylyy3D1eubHzQ869JT6Zg0K0j8aoGI=;
        b=NSnf/xEIF3gc14aSuFRwGtIvtVpxFMuOsydKrYkzOLlweHq0W13y5coQfwLPC7BOre
         Mcrz2KivicU8tY0p3GIjZ49ob7KogElmfsMGuu47QBBv1D+h4NBah+KxB+RYX0C3ZtNr
         sbkKybNL6LYuFeSq5FFRVbeL0e4TVmaIfq1k5wvSxonkRm2AujERFEpwviEmdYebFfBR
         Fo+X9JkljX+z57jKCRnil7ho4+FCWL4PM+IXTzdy8dE7A+7cRyeyNPmpHeIWbMRKo0Ot
         fNg1GMO/dbyIRFrfB+ZnbvVx1UGG2edDMBhLK8MpczIiRCo69mAmU2Cu6mgDxsXUYaHl
         eA0w==
X-Gm-Message-State: AOAM533R5EXPmyKptUqhOcPBAMQqa6DMKlB1qWs8zVxtYPmD+dzcdNNI
        Sqe0ndmX8Z8EK1p4H0IkYKg1IP9BZF14Mg==
X-Google-Smtp-Source: ABdhPJxWPHYEGCRXgsWif6sEHzgiAGg/9VSpUB/pAD52/vb97aRqb/y/sdjkVTWQB0NFvr0ORhED7g==
X-Received: by 2002:a05:620a:ed8:: with SMTP id x24mr15399556qkm.381.1612178325578;
        Mon, 01 Feb 2021 03:18:45 -0800 (PST)
Received: from localhost.localdomain ([156.146.54.77])
        by smtp.gmail.com with ESMTPSA id p23sm14187541qtu.4.2021.02.01.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 03:18:44 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     tsbogend@alpha.franken.de, peterz@infradead.org,
        frederic@kernel.org, mingo@kernel.org, peterx@redhat.com,
        afzal.mohd.ma@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] arch: mips: kernel: Made couple of spelling fixes and a sentence construction in smp.c
Date:   Mon,  1 Feb 2021 16:47:57 +0530
Message-Id: <20210201111757.8019-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

s/intercpu/inter CPU/
s/debugees/debuge's/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/mips/kernel/smp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 74b9102fd06e..e8a4ce7330ab 100644
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
@@ -510,10 +510,10 @@ static inline void smp_on_each_tlb(void (*func) (void *info), void *info)
  * address spaces, a new context is obtained on the current cpu, and tlb
  * context on other cpus are invalidated to force a new context allocation
  * at switch_mm time, should the mm ever be used on other cpus. For
- * multithreaded address spaces, intercpu interrupts have to be sent.
- * Another case where intercpu interrupts are required is when the target
+ * multithreaded address spaces, inter CPU interrupts have to be sent.
+ * Another case where inter CPU interrupts are required is when the target
  * mm might be active on another cpu (eg debuggers doing the flushes on
- * behalf of debugees, kswapd stealing pages from another process etc).
+ * behalf of debuge's, kswapd stealing pages from another process etc).
  * Kanoj 07/00.
  */

--
2.26.2

