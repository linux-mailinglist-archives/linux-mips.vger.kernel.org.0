Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1954FF459
	for <lists+linux-mips@lfdr.de>; Sat, 16 Nov 2019 18:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbfKPR0N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Nov 2019 12:26:13 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25899 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbfKPR0N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Nov 2019 12:26:13 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573925103; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=UkEy+QVe8pnMOAkRginKBvNgtem5p9MViAOOCCO39xaPEG4fgyZJnvq0c2wXsKFTRvAL15kY0sPV1DA23ujIiRTD/qP1Oo6rYsnsB1P28C4l/fr9T/uPNNyqIiiPy09dl4ZPYl6ovH1d6UyKU6bQyfU5wMsrGjUjLCBOg1mE20Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573925103; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=Hh249eWdz3jy4jRLeEHCamG66hbJRWj6076GKywECNY=; 
        b=JxiqNXvAW67VndWhLRm4yabolRbXEtz83A+8KmPUKDhQFERf2NLvQ9+2j7veaHXgUhCaMkHYcTniZl6BcHE2DPno54PWRtVHZn2curUAazB8QwmYW7naChW9iJAVncLNGzUMGGwv6I/7g1dCIcDU4sXOENPqA9n0KtjKK37MBTo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=qkGPkaX2Z+49ECVWR6aCS64yt40LZxhvd7dckZ6ZpaP7saHIdj9eo6jhbyP6P5wZ6QGBwL5S8KNr
    KT1whnwxxIY5/aC7J4L7hURjzDogE28k+g0+MkL2eAF3gCgwuvRh  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573925103;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2494; bh=Hh249eWdz3jy4jRLeEHCamG66hbJRWj6076GKywECNY=;
        b=HovYRTAB5CPOt6joOFbwB9RGv9bjgKA0h30Zz5sGn8L526+lcdF7rxSkMeCw0t9E
        kwoEvpvrsaFmA5uKokWu+AjLP5waWy2WcHiFctVGeiruWyzWoAnfwjTAkO2/cOYIfA1
        C3+vVR1V5tXSVndqZYSlHYRM1E1uAgMpN1uE8oRY=
Received: from localhost.localdomain (171.221.112.210 [171.221.112.210]) by mx.zohomail.com
        with SMTPS id 1573925103005214.25905012410055; Sat, 16 Nov 2019 09:25:03 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, paul@crapouillou.net,
        malat@debian.org, chenhc@lemote.com, jiaxun.yang@flygoat.com,
        tglx@linutronix.de, allison@lohutok.net
Subject: [PATCH 2/2 v2] MIPS: Ingenic: Disable abandoned HPTLB function.
Date:   Sun, 17 Nov 2019 01:23:58 +0800
Message-Id: <1573925038-100744-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573925038-100744-1-git-send-email-zhouyanjie@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
 <1573925038-100744-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page
tlb, write 0xa9000000 to cp0 register 5 sel 4 to disable
this function to prevent getting stuck. Confirmed by
Ingenic, this operation will not adversely affect
processors without HPTLB function.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/include/asm/mipsregs.h |  6 ++++++
 arch/mips/kernel/cpu-probe.c     | 18 ++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index bdbdc19..0d5a309 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -689,6 +689,9 @@
 #define MIPS_CONF7_IAR		(_ULCAST_(1) << 10)
 #define MIPS_CONF7_AR		(_ULCAST_(1) << 16)
 
+/* Ingenic HPTLB off bits */
+#define XBURST_PAGECTRL_HPTLB_DIS 0xa9000000
+
 /* Ingenic Config7 bits */
 #define MIPS_CONF7_BTB_LOOP_EN	(_ULCAST_(1) << 4)
 
@@ -1971,6 +1974,9 @@ do {									\
 #define read_c0_brcm_sleepcount()	__read_32bit_c0_register($22, 7)
 #define write_c0_brcm_sleepcount(val)	__write_32bit_c0_register($22, 7, val)
 
+/* Ingenic page ctrl register */
+#define write_c0_page_ctrl(val)	__write_32bit_c0_register($5, 4, val)
+
 /*
  * Macros to access the guest system control coprocessor
  */
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 7a0e33c..2bcbaed 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1965,13 +1965,27 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		break;
 	}
 
+	switch (c->processor_id & PRID_COMP_MASK) {
+	/*
+	 * The config0 register in the XBurst CPUs with a processor ID of
+	 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb, write
+	 * 0xa9000000 to cp0 register 5 sel 4 to disable this function to
+	 * prevent getting stuck.
+	 */
+	case PRID_COMP_INGENIC_D1:
+		write_c0_page_ctrl(XBURST_PAGECTRL_HPTLB_DIS);
+		break;
 	/*
-	 * The config0 register in the Xburst CPUs with a processor ID of
+	 * The config0 register in the XBurst CPUs with a processor ID of
 	 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
 	 * but they don't actually support this ISA.
 	 */
-	if ((c->processor_id & PRID_COMP_MASK) == PRID_COMP_INGENIC_D0)
+	case PRID_COMP_INGENIC_D0:
 		c->isa_level &= ~MIPS_CPU_ISA_M32R2;
+		break;
+	default:
+		break;
+	}
 }
 
 static inline void cpu_probe_netlogic(struct cpuinfo_mips *c, int cpu)
-- 
2.7.4


