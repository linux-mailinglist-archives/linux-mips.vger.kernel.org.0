Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD8B1FCD79
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jun 2020 14:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFQMdY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 08:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgFQMdX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 08:33:23 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A124C061573
        for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2020 05:33:23 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id b5so1203563pgm.8
        for <linux-mips@vger.kernel.org>; Wed, 17 Jun 2020 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=FlY841xZ+o0bAljsbVUhpzI7TCRjyxxKWYefpRN3X/U=;
        b=aLjFhK4FneMS6YL8Cbnl0RBaRw8GVlWHgeZsSmBPCljFt6CtJTHeG+yvScaQn+9Ehp
         h7QOFO1VG1mXSZiy4Ti7+Cr8BZNPCb5Yfb45fxIqWyTStR6961AAVQ+14Ak5kH52pw/s
         KsuOn2Ksjm9PEx9nF7etEG20xMJTaThTWX0a9WnKF0Dph9yOHtmF1h0rL15w0Pr6GxRh
         5mBUXIYBq6COtU2imtaYsHabX57/3xwUcWwV85PSIarJDx21tyLVSQFqq9UgBCS2+Uov
         VwpREx/0GG19fE1QgR7ZMBi9FvyqtZJx6wzIw17/v77pz/Ll4n2pOULsYwOuwdWWCYP0
         LFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=FlY841xZ+o0bAljsbVUhpzI7TCRjyxxKWYefpRN3X/U=;
        b=dZCU7EPn7hd6yQYzllaxNSO3D3kCczeqc69JBAdfXWjJa0hsOpL5+sY0faxzvFfBin
         KUxv4bHIgbqyFcFG2vwtB6OW0ze/hIpYDMOAuqf/9w+pcqdio2jwEXhuEG0szJyjeXbD
         u3dSD6z7C1l/GBK1QcR5otOA86r1LKJ/8Ihd/Tgj/aAxE+5JvtiqSpUcy4MprbPI5jeW
         X/mFEFGimkuqIpGpqe5/OigY+wHGfStgdmye0wyAy5aQygfvrt4mCz/bgdzzNhp20tbz
         MLqEf4NKoPEaHxs8NxTgZY/OD+P3ESBZ7jGro5yAWwYVMWph1U7C5Mb9M6jcPHAIFB1W
         UJTQ==
X-Gm-Message-State: AOAM531q0NnM3FMonrLN87qb8chHnrDvP6gQojHdqrlgQQkzj9hjmEHK
        cCT0qmJCdhzeJwDSB75PqghxADrA8Dc7ow==
X-Google-Smtp-Source: ABdhPJzAviYkdubbsBHMlCa0d1d9L2VuYnAu1XDai+XY50zpqcGAzjxwNHg3lPRwQ8BRVJwFHu2GvA==
X-Received: by 2002:a62:2bc6:: with SMTP id r189mr6355514pfr.11.1592397203000;
        Wed, 17 Jun 2020 05:33:23 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id 10sm19907492pfn.6.2020.06.17.05.33.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jun 2020 05:33:22 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2] MIPS: Unify naming style of vendor CP0.Config6 bits
Date:   Wed, 17 Jun 2020 20:34:42 +0800
Message-Id: <1592397282-14433-1-git-send-email-chenhc@lemote.com>
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
V2: modify kvm code as well.

 arch/mips/include/asm/mipsregs.h   | 28 ++++++++++++++--------------
 arch/mips/kernel/cpu-probe.c       | 12 ++++++------
 arch/mips/kvm/vz.c                 |  4 ++--
 arch/mips/loongson64/cpucfg-emul.c |  6 +++---
 arch/mips/mm/c-r4k.c               |  4 ++--
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 20d6d40..11094d8 100644
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
index def1659..c231c1b 100644
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
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index d9c462c..9d03bd0 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -129,7 +129,7 @@ static inline unsigned int kvm_vz_config5_guest_wrmask(struct kvm_vcpu *vcpu)
 
 static inline unsigned int kvm_vz_config6_guest_wrmask(struct kvm_vcpu *vcpu)
 {
-	return MIPS_CONF6_LOONGSON_INTIMER | MIPS_CONF6_LOONGSON_EXTIMER;
+	return LOONGSON_CONF6_INTIMER | LOONGSON_CONF6_EXTIMER;
 }
 
 /*
@@ -189,7 +189,7 @@ static inline unsigned int kvm_vz_config5_user_wrmask(struct kvm_vcpu *vcpu)
 static inline unsigned int kvm_vz_config6_user_wrmask(struct kvm_vcpu *vcpu)
 {
 	return kvm_vz_config6_guest_wrmask(vcpu) |
-		MIPS_CONF6_LOONGSON_SFBEN | MIPS_CONF6_LOONGSON_FTLBDIS;
+		LOONGSON_CONF6_SFBEN | LOONGSON_CONF6_FTLBDIS;
 }
 
 static gpa_t kvm_vz_gva_to_gpa_cb(gva_t gva)
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
index 49569e5..fc5a6d2 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1066,12 +1066,12 @@ static inline int alias_74k_erratum(struct cpuinfo_mips *c)
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

