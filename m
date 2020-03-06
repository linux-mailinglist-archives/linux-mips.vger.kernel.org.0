Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4106D17BD30
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgCFMs4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:48:56 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35584 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbgCFMsz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:48:55 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 34A7E8030793;
        Fri,  6 Mar 2020 12:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3VRnhTjSn49p; Fri,  6 Mar 2020 15:48:52 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 11/22] mips: Add CONFIG/CONFIG6 reg fields macro
Date:   Fri, 6 Mar 2020 15:46:54 +0300
In-Reply-To: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306124853.34A7E8030793@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

There are bit fields which persist in the MIPS CONFIG and CONFIG6
registers, but haven't been described in the generic mipsregs.h
header so far. In particular, the generic CONFIG bitfields are
BE - endian mode, BM - burst mode, SB - SimpleBE, OCP interface mode
indicator, UDI - user-defined "CorExtend" instructions, DSP - data
scratch pad RAM present, ISP - instruction scratch pad RAM present,
etc. The core-specific CONFIG6 bitfields are JRCD - jump register
cache prediction disable, R6 - MIPSr6 extensions enable, IFUPerfCtl -
IFU performance control, SPCD - sleep state performance counter, DLSB -
disable load/store bonding. Lets add them to the mipsregs.h header to
be used in future platform code, which have them utilized.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/include/asm/mipsregs.h | 18 ++++++++++++++++++
 arch/mips/kernel/spram.c         |  4 ++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index b1c761279b13..5ab1c273808b 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -563,9 +563,17 @@
 #define MIPS_CONF_MT_FTLB	(_ULCAST_(4) <<  7)
 #define MIPS_CONF_AR		(_ULCAST_(7) << 10)
 #define MIPS_CONF_AT		(_ULCAST_(3) << 13)
+#define MIPS_CONF_BE		(_ULCAST_(1) << 15)
+#define MIPS_CONF_BM		(_ULCAST_(1) << 16)
 #define MIPS_CONF_MM		(_ULCAST_(3) << 17)
 #define MIPS_CONF_MM_SYSAD	(_ULCAST_(1) << 17)
 #define MIPS_CONF_MM_FULL	(_ULCAST_(2) << 17)
+#define MIPS_CONF_SB		(_ULCAST_(1) << 21)
+#define MIPS_CONF_UDI		(_ULCAST_(1) << 22)
+#define MIPS_CONF_DSP		(_ULCAST_(1) << 23)
+#define MIPS_CONF_ISP		(_ULCAST_(1) << 24)
+#define MIPS_CONF_KU		(_ULCAST_(3) << 25)
+#define MIPS_CONF_K23		(_ULCAST_(3) << 28)
 #define MIPS_CONF_M		(_ULCAST_(1) << 31)
 
 /*
@@ -677,9 +685,19 @@
 #define MIPS_CONF5_CV		(_ULCAST_(1) << 29)
 #define MIPS_CONF5_K		(_ULCAST_(1) << 30)
 
+/* Jump register cache prediction disable */
+#define MIPS_CONF6_JRCD		(_ULCAST_(1) << 0)
+/* MIPSr6 extensions enable */
+#define MIPS_CONF6_R6		(_ULCAST_(1) << 2)
+/* IFU Performance Control */
+#define MIPS_CONF6_IFUPERFCTL	(_ULCAST_(3) << 10)
 #define MIPS_CONF6_SYND		(_ULCAST_(1) << 13)
+/* Sleep state performance counter disable */
+#define MIPS_CONF6_SPCD		(_ULCAST_(1) << 14)
 /* proAptiv FTLB on/off bit */
 #define MIPS_CONF6_FTLBEN	(_ULCAST_(1) << 15)
+/* Disable load/store bonding */
+#define MIPS_CONF6_DLSB		(_ULCAST_(1) << 21)
 /* Loongson-3 FTLB on/off bit */
 #define MIPS_CONF6_FTLBDIS	(_ULCAST_(1) << 22)
 /* FTLB probability bits */
diff --git a/arch/mips/kernel/spram.c b/arch/mips/kernel/spram.c
index 26d355462ace..d5d96214cce5 100644
--- a/arch/mips/kernel/spram.c
+++ b/arch/mips/kernel/spram.c
@@ -209,11 +209,11 @@ void spram_config(void)
 	case CPU_P6600:
 		config0 = read_c0_config();
 		/* FIXME: addresses are Malta specific */
-		if (config0 & (1<<24)) {
+		if (config0 & MIPS_CONF_ISP) {
 			probe_spram("ISPRAM", 0x1c000000,
 				    &ispram_load_tag, &ispram_store_tag);
 		}
-		if (config0 & (1<<23))
+		if (config0 & MIPS_CONF_DSP)
 			probe_spram("DSPRAM", 0x1c100000,
 				    &dspram_load_tag, &dspram_store_tag);
 	}
-- 
2.25.1

