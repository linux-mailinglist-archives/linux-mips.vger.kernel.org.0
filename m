Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA011E9BFC
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 05:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgFADRX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 May 2020 23:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbgFADRX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 31 May 2020 23:17:23 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E958C061A0E
        for <linux-mips@vger.kernel.org>; Sun, 31 May 2020 20:17:23 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bh7so3660384plb.11
        for <linux-mips@vger.kernel.org>; Sun, 31 May 2020 20:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=4HKFlhbzM2jrAmge9PUj5gI+hzYrPA33D0sQqrR3Hks=;
        b=r6mCZ12PSjctwYJr0qnyQJovaGKxJVcM6D3FnRSpvcsRhatP6NUj+VARdIoIAH9yJZ
         lPQVAE/jhmGjAYPZgx35xUKgAOG4XaW9ZHdbBSK8nrdrV8Lew/vJWniHhWRpCyk0ID6F
         mq+vhr3xvXw3C4Nb4ECLPfabnrbHPrONiZAxhrmdVPf8/sCWmBV2grM8bXNome72Jvyq
         pEiMtI3rOwwx8ppiZBbrgvIEq+jsTl0+orS6RvNTAftKhGCvZWckbJLV5wEZ0ECVMSnu
         1u40aWSTlN4HGTT6Hjh4ZR8F/8OPKIrhaTe7vq5eF4SoK4hT5N185hy6uHGhCX4RrF24
         RCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=4HKFlhbzM2jrAmge9PUj5gI+hzYrPA33D0sQqrR3Hks=;
        b=UmhawMs7M0SuHHCkutdV+H4uAoiG44FPeoB4rvra2NZKIDjssqqRI8NFgpccNvwvON
         ZjRogeWjw0yrZ23hbdhkh6cWwanizDvCkGh3yTCUC2o/7/ULwXeDzc2MKeAfrrNqY9U0
         qcHLy5wRSoibvBOiLBdMV6gFnpVRr3PCbrhD4HnGd2SHMiS6m7AWOf41YbrNoJ43ZS3i
         A1aD1x1GzA2siL6OWKSqOtkHvA1olp7h6+Kw+RTqqXP/BFP4cEEvgdgC5npXaRM7++c7
         rtdKZGMfD4PASonGAepfnWCTZpcHs4evPpLGq0+PZnLuj+41S7M9lqxBfdnHONb4u9si
         7hMw==
X-Gm-Message-State: AOAM530GzUb3yRCx8bcGfyeaCRTWGitd6XfsJxqxpUbm3SHZsVxzYjdN
        +A4BNeiAH+IyNbvppZ2jvNI=
X-Google-Smtp-Source: ABdhPJwu8sUz2cbHRtlKzkPsRdGXK33Cmw3e4eyZJ5Bma6qaj61aKsT60LOlBIIZYg7KYC8rXcPDhg==
X-Received: by 2002:a17:90a:36af:: with SMTP id t44mr8810437pjb.49.1590981441187;
        Sun, 31 May 2020 20:17:21 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id y26sm3327913pff.26.2020.05.31.20.17.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 31 May 2020 20:17:20 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] MIPS: Unify naming style of vendor CP0.Config6 bits
Date:   Mon,  1 Jun 2020 11:17:17 +0800
Message-Id: <1590981437-9701-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Other vendor-defined registers use the vendor name as a prefix, not an
infix, so unify the naming style of CP0.Config6 bits.

Suggested-by: Maciej W. Rozycki" <macro@linux-mips.org>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/mipsregs.h   | 28 ++++++++++++++--------------
 arch/mips/kernel/cpu-probe.c       | 12 ++++++------
 arch/mips/loongson64/cpucfg-emul.c |  6 +++---
 arch/mips/mm/c-r4k.c               |  4 ++--
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 796dbb8..ef4912e 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -689,35 +689,35 @@
 /* Config6 feature bits for proAptiv/P5600 */
 
 /* Jump register cache prediction disable */
-#define MIPS_CONF6_MTI_JRCD		(_ULCAST_(1) << 0)
+#define MTI_CONF6_JRCD		(_ULCAST_(1) << 0)
 /* MIPSr6 extensions enable */
-#define MIPS_CONF6_MTI_R6		(_ULCAST_(1) << 2)
+#define MTI_CONF6_R6		(_ULCAST_(1) << 2)
 /* IFU Performance Control */
-#define MIPS_CONF6_MTI_IFUPERFCTL	(_ULCAST_(3) << 10)
-#define MIPS_CONF6_MTI_SYND		(_ULCAST_(1) << 13)
+#define MTI_CONF6_IFUPERFCTL	(_ULCAST_(3) << 10)
+#define MTI_CONF6_SYND		(_ULCAST_(1) << 13)
 /* Sleep state performance counter disable */
-#define MIPS_CONF6_MTI_SPCD		(_ULCAST_(1) << 14)
+#define MTI_CONF6_SPCD		(_ULCAST_(1) << 14)
 /* proAptiv FTLB on/off bit */
-#define MIPS_CONF6_MTI_FTLBEN		(_ULCAST_(1) << 15)
+#define MTI_CONF6_FTLBEN	(_ULCAST_(1) << 15)
 /* Disable load/store bonding */
-#define MIPS_CONF6_MTI_DLSB		(_ULCAST_(1) << 21)
+#define MTI_CONF6_DLSB		(_ULCAST_(1) << 21)
 /* FTLB probability bits */
-#define MIPS_CONF6_MTI_FTLBP_SHIFT	(16)
+#define MTI_CONF6_FTLBP_SHIFT	(16)
 
 /* Config6 feature bits for Loongson-3 */
 
 /* Loongson-3 internal timer bit */
-#define MIPS_CONF6_LOONGSON_INTIMER	(_ULCAST_(1) << 6)
+#define LOONGSON_CONF6_INTIMER	(_ULCAST_(1) << 6)
 /* Loongson-3 external timer bit */
-#define MIPS_CONF6_LOONGSON_EXTIMER	(_ULCAST_(1) << 7)
+#define LOONGSON_CONF6_EXTIMER	(_ULCAST_(1) << 7)
 /* Loongson-3 SFB on/off bit, STFill in manual */
-#define MIPS_CONF6_LOONGSON_SFBEN	(_ULCAST_(1) << 8)
+#define LOONGSON_CONF6_SFBEN	(_ULCAST_(1) << 8)
 /* Loongson-3's LL on exclusive cacheline */
-#define MIPS_CONF6_LOONGSON_LLEXC	(_ULCAST_(1) << 16)
+#define LOONGSON_CONF6_LLEXC	(_ULCAST_(1) << 16)
 /* Loongson-3's SC has a random delay */
-#define MIPS_CONF6_LOONGSON_SCRAND	(_ULCAST_(1) << 17)
+#define LOONGSON_CONF6_SCRAND	(_ULCAST_(1) << 17)
 /* Loongson-3 FTLB on/off bit, VTLBOnly in manual */
-#define MIPS_CONF6_LOONGSON_FTLBDIS	(_ULCAST_(1) << 22)
+#define LOONGSON_CONF6_FTLBDIS	(_ULCAST_(1) << 22)
 
 #define MIPS_CONF7_WII		(_ULCAST_(1) << 31)
 
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 6b93162..e5b218d 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -635,14 +635,14 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
 		config = read_c0_config6();
 
 		if (flags & FTLB_EN)
-			config |= MIPS_CONF6_MTI_FTLBEN;
+			config |= MTI_CONF6_FTLBEN;
 		else
-			config &= ~MIPS_CONF6_MTI_FTLBEN;
+			config &= ~MTI_CONF6_FTLBEN;
 
 		if (flags & FTLB_SET_PROB) {
-			config &= ~(3 << MIPS_CONF6_MTI_FTLBP_SHIFT);
+			config &= ~(3 << MTI_CONF6_FTLBP_SHIFT);
 			config |= calculate_ftlb_probability(c)
-				  << MIPS_CONF6_MTI_FTLBP_SHIFT;
+				  << MTI_CONF6_FTLBP_SHIFT;
 		}
 
 		write_c0_config6(config);
@@ -662,10 +662,10 @@ static int set_ftlb_enable(struct cpuinfo_mips *c, enum ftlb_flags flags)
 		config = read_c0_config6();
 		if (flags & FTLB_EN)
 			/* Enable FTLB */
-			write_c0_config6(config & ~MIPS_CONF6_LOONGSON_FTLBDIS);
+			write_c0_config6(config & ~LOONGSON_CONF6_FTLBDIS);
 		else
 			/* Disable FTLB */
-			write_c0_config6(config | MIPS_CONF6_LOONGSON_FTLBDIS);
+			write_c0_config6(config | LOONGSON_CONF6_FTLBDIS);
 		break;
 	default:
 		return 1;
diff --git a/arch/mips/loongson64/cpucfg-emul.c b/arch/mips/loongson64/cpucfg-emul.c
index cd619b4..630927e 100644
--- a/arch/mips/loongson64/cpucfg-emul.c
+++ b/arch/mips/loongson64/cpucfg-emul.c
@@ -57,11 +57,11 @@ static void decode_loongson_config6(struct cpuinfo_mips *c)
 {
 	u32 config6 = read_c0_config6();
 
-	if (config6 & MIPS_CONF6_LOONGSON_SFBEN)
+	if (config6 & LOONGSON_CONF6_SFBEN)
 		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SFBP;
-	if (config6 & MIPS_CONF6_LOONGSON_LLEXC)
+	if (config6 & LOONGSON_CONF6_LLEXC)
 		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_LLEXC;
-	if (config6 & MIPS_CONF6_LOONGSON_SCRAND)
+	if (config6 & LOONGSON_CONF6_SCRAND)
 		c->loongson3_cpucfg_data[0] |= LOONGSON_CFG1_SCRAND;
 }
 
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 6fb83ac..8f51617 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1073,12 +1073,12 @@ static inline int alias_74k_erratum(struct cpuinfo_mips *c)
 		if (rev <= PRID_REV_ENCODE_332(2, 4, 0))
 			present = 1;
 		if (rev == PRID_REV_ENCODE_332(2, 4, 0))
-			write_c0_config6(read_c0_config6() | MIPS_CONF6_MTI_SYND);
+			write_c0_config6(read_c0_config6() | MTI_CONF6_SYND);
 		break;
 	case PRID_IMP_1074K:
 		if (rev <= PRID_REV_ENCODE_332(1, 1, 0)) {
 			present = 1;
-			write_c0_config6(read_c0_config6() | MIPS_CONF6_MTI_SYND);
+			write_c0_config6(read_c0_config6() | MTI_CONF6_SYND);
 		}
 		break;
 	default:
-- 
2.7.0

