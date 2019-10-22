Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B156E0C44
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 21:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732564AbfJVTLH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 15:11:07 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44181 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731436AbfJVTLH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Oct 2019 15:11:07 -0400
Received: by mail-wr1-f67.google.com with SMTP id z9so19281523wrl.11
        for <linux-mips@vger.kernel.org>; Tue, 22 Oct 2019 12:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=9vziTHLGRySfTf7IJZ8RvDGitE1pSycSa0/YB41VIrg=;
        b=a6+YfUM4UCT8QMNibszaLdROgK9/zT1Vxf3kJf+QB2pXmTviY+apzmEs+M7eSycRqI
         vH+Yd5Xdqar5/RNlWYYjLA/0etADWD4ug/kUPkyX/Yzg4hXFt4XFAGBUEZ1MvdJ7mcIu
         vr1XBdVwC01+CHE4PMfM93Qmyz+Tlkc0uAtNJvMbk8pCnsQ6QiXqUfc+0Cv1W2nq7ArI
         AVGAY75zrcVVdzkfEKsVUAMJ6RgviQTZdoLspR16qMIrijzcnScJXfYjnUWX1X9MC9di
         Km7V+kp4AKXCDq6CWcO/FYYWPdbH2jjs08UPSeVdqEmiMYsxxqynPVDynlwCSlsEGESt
         x1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9vziTHLGRySfTf7IJZ8RvDGitE1pSycSa0/YB41VIrg=;
        b=GE4ApJmOASkGpekMoBtZPo0qjCUi6h3i697L/ZCvc87c+CpU64nr254PoiBUTVZg3z
         miLAN1evzQ+kPiCG6baSE5Er2gkXS0UGyB1BBnA0/n3jtm91tgtaPh1f0wXc+F3veV+/
         mopmlwNtB/DVHkERIcr8ER96ZrcG9mJI6U0lMm8Qapv4y5ebdNUuxcg73ehkGtEhudh2
         V6SryvJO9UyxYwNct/PJkxWyL3JbEF3ZNmug6NLEfWujHbNUpk38OZ7WOHb4eXvu9Fa1
         YBxLPlIbYl4gghUrXxZNm6ChTIMpVa5/2z4420iGMDXI0dqBWPD6TOxgmVNZkhgwhCMb
         b/+Q==
X-Gm-Message-State: APjAAAWMJEmZHnRTPNFyX2P+OQngS2XvjtwZ80Q6+I9TzgtHQLaJrYjR
        gPhM5zBNgOL1Apkqd1Ig85owjp0K
X-Google-Smtp-Source: APXvYqyEPoOKpAcJZcml8rsP0qFLCTL3O2pieju3gPy9SlVa/dwU/8Izv9LozONdu4BWX3gK0N7VLw==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr4670638wrr.42.1571771465203;
        Tue, 22 Oct 2019 12:11:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id 65sm15789366wrs.9.2019.10.22.12.11.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 12:11:04 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH v2] MIPS: bmips: mark exception vectors as char arrays
Date:   Tue, 22 Oct 2019 21:11:00 +0200
Message-Id: <20191022191100.19373-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The vectors span more than one byte, so mark them as arrays.

Fixes the following build error when building when using GCC 8.3:

In file included from ./include/linux/string.h:19,
                 from ./include/linux/bitmap.h:9,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/mips/include/asm/processor.h:15,
                 from ./arch/mips/include/asm/thread_info.h:16,
                 from ./include/linux/thread_info.h:38,
                 from ./include/asm-generic/preempt.h:5,
                 from ./arch/mips/include/generated/asm/preempt.h:1,
                 from ./include/linux/preempt.h:81,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/mmzone.h:8,
                 from ./include/linux/bootmem.h:8,
                 from arch/mips/bcm63xx/prom.c:10:
arch/mips/bcm63xx/prom.c: In function 'prom_init':
./arch/mips/include/asm/string.h:162:11: error: '__builtin_memcpy' forming offset [2, 32] is out of the bounds [0, 1] of object 'bmips_smp_movevec' with type 'char' [-Werror=array-bounds]
   __ret = __builtin_memcpy((dst), (src), __len); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/bcm63xx/prom.c:97:3: note: in expansion of macro 'memcpy'
   memcpy((void *)0xa0000200, &bmips_smp_movevec, 0x20);
   ^~~~~~
In file included from arch/mips/bcm63xx/prom.c:14:
./arch/mips/include/asm/bmips.h:80:13: note: 'bmips_smp_movevec' declared here
 extern char bmips_smp_movevec;

Fixes: 18a1eef92dcd ("MIPS: BMIPS: Introduce bmips.h")
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---

v1 -> v2:
 * Actually update the callers as well, to not break the build in a
   different way.

 arch/mips/bcm63xx/prom.c      |  2 +-
 arch/mips/include/asm/bmips.h | 10 +++++-----
 arch/mips/kernel/smp-bmips.c  |  8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/bcm63xx/prom.c b/arch/mips/bcm63xx/prom.c
index 77a836e661c9..df69eaa453a1 100644
--- a/arch/mips/bcm63xx/prom.c
+++ b/arch/mips/bcm63xx/prom.c
@@ -84,7 +84,7 @@ void __init prom_init(void)
 		 * Here we will start up CPU1 in the background and ask it to
 		 * reconfigure itself then go back to sleep.
 		 */
-		memcpy((void *)0xa0000200, &bmips_smp_movevec, 0x20);
+		memcpy((void *)0xa0000200, bmips_smp_movevec, 0x20);
 		__sync();
 		set_c0_cause(C_SW0);
 		cpumask_set_cpu(1, &bmips_booted_mask);
diff --git a/arch/mips/include/asm/bmips.h b/arch/mips/include/asm/bmips.h
index bf6a8afd7ad2..581a6a3c66e4 100644
--- a/arch/mips/include/asm/bmips.h
+++ b/arch/mips/include/asm/bmips.h
@@ -75,11 +75,11 @@ static inline int register_bmips_smp_ops(void)
 #endif
 }
 
-extern char bmips_reset_nmi_vec;
-extern char bmips_reset_nmi_vec_end;
-extern char bmips_smp_movevec;
-extern char bmips_smp_int_vec;
-extern char bmips_smp_int_vec_end;
+extern char bmips_reset_nmi_vec[];
+extern char bmips_reset_nmi_vec_end[];
+extern char bmips_smp_movevec[];
+extern char bmips_smp_int_vec[];
+extern char bmips_smp_int_vec_end[];
 
 extern int bmips_smp_enabled;
 extern int bmips_cpu_offset;
diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 76fae9b79f13..712c15de6ab9 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -464,10 +464,10 @@ static void bmips_wr_vec(unsigned long dst, char *start, char *end)
 
 static inline void bmips_nmi_handler_setup(void)
 {
-	bmips_wr_vec(BMIPS_NMI_RESET_VEC, &bmips_reset_nmi_vec,
-		&bmips_reset_nmi_vec_end);
-	bmips_wr_vec(BMIPS_WARM_RESTART_VEC, &bmips_smp_int_vec,
-		&bmips_smp_int_vec_end);
+	bmips_wr_vec(BMIPS_NMI_RESET_VEC, bmips_reset_nmi_vec,
+		bmips_reset_nmi_vec_end);
+	bmips_wr_vec(BMIPS_WARM_RESTART_VEC, bmips_smp_int_vec,
+		bmips_smp_int_vec_end);
 }
 
 struct reset_vec_info {
-- 
2.13.2

