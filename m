Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46E1317BD28
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgCFMtB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:49:01 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35618 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbgCFMtB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:49:01 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9F6E18030786;
        Fri,  6 Mar 2020 12:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id o_34hQbYHInT; Fri,  6 Mar 2020 15:48:58 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 13/22] mips: MAAR: Add XPA mode support
Date:   Fri, 6 Mar 2020 15:46:56 +0300
In-Reply-To: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306124858.9F6E18030786@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

When XPA mode is enabled the normally 32-bits MAAR pair registers
are extended to be of 64-bits width as in pure 64-bits MIPS
architecture. In this case the MAAR registers can enable the
speculative loads/stores for addresses of up to 39-bits width.
But in this case the process of the MAAR initialization changes a bit.
The upper 32-bits of the registers are supposed to be accessed by mean
of the dedicated instructions mfhc0/mthc0 and there is a CP0.MAAR.VH
bit which should be set together with CP0.MAAR.VL as indication
of the boundary validity. All of these peculiarities were taken into
account in this commit so the speculative loads/stores would work
when XPA mode is enabled.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/include/asm/maar.h     | 17 +++++++++++++++--
 arch/mips/include/asm/mipsregs.h | 10 ++++++++++
 arch/mips/mm/init.c              |  8 +++++++-
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/maar.h b/arch/mips/include/asm/maar.h
index 6908b93c4ff9..99f1c3e4b11f 100644
--- a/arch/mips/include/asm/maar.h
+++ b/arch/mips/include/asm/maar.h
@@ -32,7 +32,7 @@ unsigned platform_maar_init(unsigned num_pairs);
  * @upper:	The highest address that the MAAR pair will affect. Must be
  *		aligned to one byte before a 2^16 byte boundary.
  * @attrs:	The accessibility attributes to program, eg. MIPS_MAAR_S. The
- *		MIPS_MAAR_VL attribute will automatically be set.
+ *		MIPS_MAAR_VL/MIPS_MAAR_VH attributes will automatically be set.
  *
  * Program the pair of MAAR registers specified by idx to apply the attributes
  * specified by attrs to the range of addresses from lower to higher.
@@ -48,17 +48,30 @@ static inline void write_maar_pair(unsigned idx, phys_addr_t lower,
 	/* Automatically set MIPS_MAAR_VL */
 	attrs |= MIPS_MAAR_VL;
 
-	/* Write the upper address & attributes (only MIPS_MAAR_VL matters) */
+	/*
+	 * Write the upper address & attributes (both MIPS_MAAR_VL and
+	 * MIPS_MAAR_VH matter)
+	 */
 	write_c0_maari(idx << 1);
 	back_to_back_c0_hazard();
 	write_c0_maar(((upper >> 4) & MIPS_MAAR_ADDR) | attrs);
 	back_to_back_c0_hazard();
+#ifdef CONFIG_XPA
+	upper >>= MIPS_MAARX_ADDR_SHIFT;
+	writex_c0_maar(((upper >> 4) & MIPS_MAARX_ADDR) | MIPS_MAARX_VH);
+	back_to_back_c0_hazard();
+#endif
 
 	/* Write the lower address & attributes */
 	write_c0_maari((idx << 1) | 0x1);
 	back_to_back_c0_hazard();
 	write_c0_maar((lower >> 4) | attrs);
 	back_to_back_c0_hazard();
+#ifdef CONFIG_XPA
+	lower >>= MIPS_MAARX_ADDR_SHIFT;
+	writex_c0_maar(((lower >> 4) & MIPS_MAARX_ADDR) | MIPS_MAARX_VH);
+	back_to_back_c0_hazard();
+#endif
 }
 
 /**
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 554813a1f6d6..41094f4cf6a7 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -778,6 +778,14 @@
 #define MIPS_MAAR_ADDR_SHIFT	12
 #define MIPS_MAAR_S		(_ULCAST_(1) << 1)
 #define MIPS_MAAR_VL		(_ULCAST_(1) << 0)
+#ifdef CONFIG_XPA
+#define MIPS_MAAR_V		(MIPS_MAAR_VH | MIPS_MAAR_VL)
+#else
+#define MIPS_MAAR_V		MIPS_MAAR_VL
+#endif
+#define MIPS_MAARX_VH		(_ULCAST_(1) << 31)
+#define MIPS_MAARX_ADDR		0xF
+#define MIPS_MAARX_ADDR_SHIFT	32
 
 /* MAARI bit definitions */
 #define MIPS_MAARI_INDEX	(_ULCAST_(0x3f) << 0)
@@ -1738,6 +1746,8 @@ do {									\
 #define write_c0_lladdr(val)	__write_ulong_c0_register($17, 0, val)
 #define read_c0_maar()		__read_ulong_c0_register($17, 1)
 #define write_c0_maar(val)	__write_ulong_c0_register($17, 1, val)
+#define readx_c0_maar()		__readx_32bit_c0_register($17, 1)
+#define writex_c0_maar(val)	__writex_32bit_c0_register($17, 1, val)
 #define read_c0_maari()		__read_32bit_c0_register($17, 2)
 #define write_c0_maari(val)	__write_32bit_c0_register($17, 2, val)
 
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 79684000de0e..620ebfa45ec1 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -358,17 +358,23 @@ void maar_init(void)
 		write_c0_maari(i);
 		back_to_back_c0_hazard();
 		upper = read_c0_maar();
+#ifdef CONFIG_XPA
+		upper |= (phys_addr_t)readx_c0_maar() << MIPS_MAARX_ADDR_SHIFT;
+#endif
 
 		write_c0_maari(i + 1);
 		back_to_back_c0_hazard();
 		lower = read_c0_maar();
+#ifdef CONFIG_XPA
+		lower |= (phys_addr_t)readx_c0_maar() << MIPS_MAARX_ADDR_SHIFT;
+#endif
 
 		attr = lower & upper;
 		lower = (lower & MIPS_MAAR_ADDR) << 4;
 		upper = ((upper & MIPS_MAAR_ADDR) << 4) | 0xffff;
 
 		pr_info("  [%d]: ", i / 2);
-		if (!(attr & MIPS_MAAR_VL)) {
+		if ((attr & MIPS_MAAR_V) != MIPS_MAAR_V) {
 			pr_cont("disabled\n");
 			continue;
 		}
-- 
2.25.1

