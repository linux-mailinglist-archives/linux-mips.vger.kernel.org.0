Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80C5F1026B3
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2019 15:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfKSOam (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Nov 2019 09:30:42 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25845 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbfKSOam (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Nov 2019 09:30:42 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574173772; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=haNrHXmZ8f5gKg7Aqd56b9lZvE3/LWraVNamsBfZoS8jPJpkFaOs0er1j2Mu4/PoqEJ/sYA6Kl9/7GGNxs1E7s19QErXrQsgA+Je4xf92OE0/VQf12p1wYWpzOCS9QFqNu/xEcWhk/itJMQn6XeJJMxh3Ofgq1jcpVfdZULEVP8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574173772; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=K3eeJlCStJlagedwM9bTo7SweAVG0wRCc805HZD/FBs=; 
        b=MbNEHtCntZuO+9TwjZwLtaFw7zaAeOCVmsMwG+Vvb2N+O1oD/JZVqEDsdMCdQm3OebGeBzLL1njTsuHpUUyr9d+OLxmGwmLU/+iYzzubHiJR/9FQP+BVO10sfvoMT5db5wRbGRrDcxlinr7bdyMljpFfMdPpG51ewU9TK92b2LE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=T8f/CLB8BgSro3xqmKC80DFGsPE/+fTpkUE/V24jOrguijNYAB8KiQmA5WWm/SSdbaZC61BBsfzV
    aXzzVeLfcjlqD4l1d8Yeid/W77hhTugcBE7PGKZE8ekvhlQbOEO+  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574173772;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2889; bh=K3eeJlCStJlagedwM9bTo7SweAVG0wRCc805HZD/FBs=;
        b=BeQiadmuk4U9Fs7d1JA24clkREYJ5QChKsuds4mHdVkjFIIbneUI3YCvpdijTejS
        HwxzOJ7/MM6vofFbDtgE2n9o+EN1dVGkYl2WUk/JQXmDV5SveskYOUxKlXv6btEVi2t
        PsVMrxxgjr+XDyAa07BeMCOycCPY8F12D0750I/I=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.24 [171.221.113.24]) by mx.zohomail.com
        with SMTPS id 1574173771482827.3018728700847; Tue, 19 Nov 2019 06:29:31 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paulburton@kernel.org, jhogan@kernel.org, paul@crapouillou.net,
        jiaxun.yang@flygoat.com, gregkh@linuxfoundation.org,
        malat@debian.org, tglx@linutronix.de, chenhc@lemote.com
Subject: [PATCH 2/2 v3] MIPS: Ingenic: Disable abandoned HPTLB function.
Date:   Tue, 19 Nov 2019 22:28:47 +0800
Message-Id: <1574173727-123321-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574173727-123321-1-git-send-email-zhouyanjie@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
 <1574173727-123321-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page tlb,
this mode is not compatible with the MIPS standard, it will cause
tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
when starting the init process. write 0xa9000000 to cp0 register 5
sel 4 to disable this function to prevent getting stuck. Confirmed
by Ingenic, this operation will not adversely affect processors
without HPTLB function.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/include/asm/mipsregs.h |  6 ++++++
 arch/mips/kernel/cpu-probe.c     | 21 +++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

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
index 7a0e33c..3b5f4fb 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1965,13 +1965,30 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		break;
 	}
 
+	switch (c->processor_id & PRID_COMP_MASK) {
+	/*
+	 * The config0 register in the XBurst CPUs with a processor ID of
+	 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb mode, this
+	 * mode is not compatible with the MIPS standard, it will cause
+	 * tlbmiss and into an infinite loop (line 21 in the tlb-funcs.S)
+	 * when starting the init process. After chip reset, the default
+	 * is HPTLB mode, Write 0xa9000000 to cp0 register 5 sel 4 to
+	 * switch back to VTLB mode to prevent getting stuck.
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


