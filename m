Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4B8F1DF5C4
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 09:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387498AbgEWHvL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 03:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387489AbgEWHvL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 May 2020 03:51:11 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F0FC061A0E
        for <linux-mips@vger.kernel.org>; Sat, 23 May 2020 00:51:11 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 5so6051279pjd.0
        for <linux-mips@vger.kernel.org>; Sat, 23 May 2020 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=6+VGZJG5yF13WyiYdAovFdSjxs9bFfUwJaMhAk4QrAA=;
        b=nmzjON6Z1k2QEgUjdlS4ITqvGKkMMi/B4vRua0QqujnF26kbTKH5fQk7nxBG1MvSuw
         qC/hSuoO/hoyBwTEyZmtg/X8KTV5HXZQ3v5jt+pEVGNIwdBafPFNsjpx5RiDy5BRS2N+
         cMjjV4/ZCIsubGq+S9099c6M86lyEfrNetm5kQ5Jl886224H+hy65lp4bofVFtayVECc
         hpv+hJkukposQQL3Y7WxQkxQ4u53sK4pYaWon3M3HsEU+IEp4a9vpMNhXhjiPO12bx4l
         JOcQXtihwUoAscNF6r5yzzh15WxB/xxMdiyN5IA1DRhZiWkl4oz9iK+1+n0LV20FkVcP
         iTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=6+VGZJG5yF13WyiYdAovFdSjxs9bFfUwJaMhAk4QrAA=;
        b=ZzBgzZPUlE0iZ1mDiam3T73jcu1XwrWCsj383cByYhkulnro00Rn+vPLN9U1ihux3/
         KXX0N1NofdWcXngUXY/S4Ctk8eqdq1oUQI+/ejDnCt7Vw7oMNIZBA7sY210VK6Ce8xWa
         XiHV3dBrqpSG+wYYEIqXN3qPQArteTNPeozrOtjDGNE6b5q7YWG1sYuUuzyhlJ699TgD
         5MC2sOe8chprQF19dQuFWnkc+Y/MN1teXX1EcKdjIeiVEYvmIDPbVvZGTY8tiCajgdvG
         YBB5eoiIr8LNKAE/B8ULOvVbh7YiavpxGt7bQ4nvU39orKMMbiYqSRhDrfTQigC6CwHs
         ywJA==
X-Gm-Message-State: AOAM532SPtgO+ftCTUg5T+qWShUmXR/YvVAzHq5mnTViETt5QtEyCZUt
        Xum/grTxZllJol3psRB/zk6MVG5e8j2Wvw==
X-Google-Smtp-Source: ABdhPJwzcTCNpM14KfxKiN4+4uLEaqAE1c4YNbKGYabWVL+/khEqLKD7VVReCvSQzfcvV4l1nNBbHw==
X-Received: by 2002:a17:90a:34cc:: with SMTP id m12mr9107425pjf.123.1590220270644;
        Sat, 23 May 2020 00:51:10 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id d9sm3774376pfn.72.2020.05.23.00.51.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 May 2020 00:51:10 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, WANG Xuerui <git@xen0n.name>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: [PATCH V2] MIPS: Tidy up CP0.Config6 bits definition
Date:   Sat, 23 May 2020 15:51:45 +0800
Message-Id: <1590220305-29176-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CP0.Config6 is a Vendor-defined register whose bits definitions are
different from one to another. Recently, Xuerui's Loongson-3 patch and
Serge's P5600 patch make the definitions inconsistency and unclear.

To make life easy, this patch tidy the definition up:
1, Add a _MTI_ infix for proAptiv/P5600 feature bits;
2, Add a _LOONGSON_ infix for Loongson-3 feature bits;
3, Add bit6/bit7 definition for Loongson-3 which will be used later.

All existing users of these macros are updated.

Cc: WANG Xuerui <git@xen0n.name>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/mipsregs.h | 37 ++++++++++++++++++++++++-------------
 arch/mips/kernel/cpu-probe.c     | 12 ++++++------
 arch/mips/mm/c-r4k.c             |  4 ++--
 3 files changed, 32 insertions(+), 21 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index fe6293f..796dbb8 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -686,27 +686,38 @@
 #define MIPS_CONF5_CV		(_ULCAST_(1) << 29)
 #define MIPS_CONF5_K		(_ULCAST_(1) << 30)
 
+/* Config6 feature bits for proAptiv/P5600 */
+
 /* Jump register cache prediction disable */
-#define MIPS_CONF6_JRCD		(_ULCAST_(1) << 0)
+#define MIPS_CONF6_MTI_JRCD		(_ULCAST_(1) << 0)
 /* MIPSr6 extensions enable */
-#define MIPS_CONF6_R6		(_ULCAST_(1) << 2)
+#define MIPS_CONF6_MTI_R6		(_ULCAST_(1) << 2)
 /* IFU Performance Control */
-#define MIPS_CONF6_IFUPERFCTL	(_ULCAST_(3) << 10)
-#define MIPS_CONF6_SYND		(_ULCAST_(1) << 13)
+#define MIPS_CONF6_MTI_IFUPERFCTL	(_ULCAST_(3) << 10)
+#define MIPS_CONF6_MTI_SYND		(_ULCAST_(1) << 13)
 /* Sleep state performance counter disable */
-#define MIPS_CONF6_SPCD		(_ULCAST_(1) << 14)
+#define MIPS_CONF6_MTI_SPCD		(_ULCAST_(1) << 14)
 /* proAptiv FTLB on/off bit */
-#define MIPS_CONF6_FTLBEN	(_ULCAST_(1) << 15)
+#define MIPS_CONF6_MTI_FTLBEN		(_ULCAST_(1) << 15)
 /* Disable load/store bonding */
-#define MIPS_CONF6_DLSB		(_ULCAST_(1) << 21)
-/* Loongson-3 FTLB on/off bit */
-#define MIPS_CONF6_FTLBDIS	(_ULCAST_(1) << 22)
+#define MIPS_CONF6_MTI_DLSB		(_ULCAST_(1) << 21)
 /* FTLB probability bits */
-#define MIPS_CONF6_FTLBP_SHIFT	(16)
-/* Loongson-3 feature bits */
-#define MIPS_CONF6_LOONGSON_SCRAND	(_ULCAST_(1) << 17)
+#define MIPS_CONF6_MTI_FTLBP_SHIFT	(16)
+
+/* Config6 feature bits for Loongson-3 */
+
+/* Loongson-3 internal timer bit */
+#define MIPS_CONF6_LOONGSON_INTIMER	(_ULCAST_(1) << 6)
+/* Loongson-3 external timer bit */
+#define MIPS_CONF6_LOONGSON_EXTIMER	(_ULCAST_(1) << 7)
+/* Loongson-3 SFB on/off bit, STFill in manual */
+#define MIPS_CONF6_LOONGSON_SFBEN	(_ULCAST_(1) << 8)
+/* Loongson-3's LL on exclusive cacheline */
 #define MIPS_CONF6_LOONGSON_LLEXC	(_ULCAST_(1) << 16)
-#define MIPS_CONF6_LOONGSON_STFILL	(_ULCAST_(1) << 8)
+/* Loongson-3's SC has a random delay */
+#define MIPS_CONF6_LOONGSON_SCRAND	(_ULCAST_(1) << 17)
+/* Loongson-3 FTLB on/off bit, VTLBOnly in manual */
+#define MIPS_CONF6_LOONGSON_FTLBDIS	(_ULCAST_(1) << 22)
 
 #define MIPS_CONF7_WII		(_ULCAST_(1) << 31)
 
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b8ec357..f7c4b1d 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -633,14 +633,14 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
 		config = read_c0_config6();
 
 		if (flags & FTLB_EN)
-			config |= MIPS_CONF6_FTLBEN;
+			config |= MIPS_CONF6_MTI_FTLBEN;
 		else
-			config &= ~MIPS_CONF6_FTLBEN;
+			config &= ~MIPS_CONF6_MTI_FTLBEN;
 
 		if (flags & FTLB_SET_PROB) {
-			config &= ~(3 << MIPS_CONF6_FTLBP_SHIFT);
+			config &= ~(3 << MIPS_CONF6_MTI_FTLBP_SHIFT);
 			config |= calculate_ftlb_probability(c)
-				  << MIPS_CONF6_FTLBP_SHIFT;
+				  << MIPS_CONF6_MTI_FTLBP_SHIFT;
 		}
 
 		write_c0_config6(config);
@@ -660,10 +660,10 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
 		config = read_c0_config6();
 		if (flags & FTLB_EN)
 			/* Enable FTLB */
-			write_c0_config6(config & ~MIPS_CONF6_FTLBDIS);
+			write_c0_config6(config & ~MIPS_CONF6_LOONGSON_FTLBDIS);
 		else
 			/* Disable FTLB */
-			write_c0_config6(config | MIPS_CONF6_FTLBDIS);
+			write_c0_config6(config | MIPS_CONF6_LOONGSON_FTLBDIS);
 		break;
 	default:
 		return 1;
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index a9f55bf..6fb83ac 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1073,12 +1073,12 @@ static inline int alias_74k_erratum(struct cpuinfo_mips *c)
 		if (rev <= PRID_REV_ENCODE_332(2, 4, 0))
 			present = 1;
 		if (rev == PRID_REV_ENCODE_332(2, 4, 0))
-			write_c0_config6(read_c0_config6() | MIPS_CONF6_SYND);
+			write_c0_config6(read_c0_config6() | MIPS_CONF6_MTI_SYND);
 		break;
 	case PRID_IMP_1074K:
 		if (rev <= PRID_REV_ENCODE_332(1, 1, 0)) {
 			present = 1;
-			write_c0_config6(read_c0_config6() | MIPS_CONF6_SYND);
+			write_c0_config6(read_c0_config6() | MIPS_CONF6_MTI_SYND);
 		}
 		break;
 	default:
-- 
2.7.0

