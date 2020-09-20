Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110BC271363
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgITLH0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:07:26 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53206 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgITLHY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:07:24 -0400
X-Greylist: delayed 388 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Sep 2020 07:07:20 EDT
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 4C92B803073C;
        Sun, 20 Sep 2020 11:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0TPLSPyiVhKC; Sun, 20 Sep 2020 14:00:45 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] mips: Add strong UC ordering config
Date:   Sun, 20 Sep 2020 14:00:09 +0300
Message-ID: <20200920110010.16796-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
References: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In accordance with [1, 2] memory transactions using CCA=2 (Uncached
Cacheability and Coherency Attribute) are always strongly ordered. This
means the younger memory accesses using CCA=2 are never allowed to be
executed before older memory accesses using CCA=2 (no bypassing is
allowed), and Loads and Stores using CCA=2 are never speculative. It is
expected by the specification that the rest of the system maintains these
properties for processor initiated uncached accesses. So the system IO
interconnect doesn't reorder uncached transactions once they have left the
processor subsystem. Taking into account these properties and what [3]
says about the relaxed IO-accessors we can infer that normal Loads and
Stores from/to CCA=2 memory and without any additional execution barriers
will fully comply with the {read,write}X_relaxed() methods requirements.

Let's convert then currently generated relaxed IO-accessors to being pure
Loads and Stores. Seeing the commit 3d474dacae72 ("MIPS: Enforce strong
ordering for MMIO accessors") and commit 8b656253a7a4 ("MIPS: Provide
actually relaxed MMIO accessors") have already made a preparation in the
corresponding macro, we can do that just by replacing the "barrier"
parameter utilization with the "relax" one. Note the "barrier" macro
argument can be removed, since it isn't fully used anyway other than being
always assigned to 1.

Of course it would be fullish to believe that all the available MIPS-based
CPUs completely follow the denoted specification, especially considering
how old the architecture is. Instead we introduced a dedicated kernel
config, which when enabled will convert the relaxed IO-accessors to being
pure Loads and Stores without any additional barriers around. So if some
CPU supports the strongly ordered UC memory access, it can enable that
config and use a fully optimized relaxed IO-methods. For instance,
Baikal-T1 architecture support code will do that.

[1] MIPS Coherence Protocol Specification, Document Number: MD00605,
    Revision 01.01. September 14, 2015, 4.2 Execution Order Behavior,
    p. 33

[2] MIPS Coherence Protocol Specification, Document Number: MD00605,
    Revision 01.01. September 14, 2015, 4.8.1 IO Device Access, p. 58

[3] "LINUX KERNEL MEMORY BARRIERS", Documentation/memory-barriers.txt,
    Section "KERNEL I/O BARRIER EFFECTS"

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Maciej W. Rozycki <macro@linux-mips.org>
---
 arch/mips/Kconfig          |  8 ++++++++
 arch/mips/include/asm/io.h | 20 ++++++++++----------
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index c95fa3a2484c..2c82d927347d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2066,6 +2066,14 @@ config WEAK_ORDERING
 #
 config WEAK_REORDERING_BEYOND_LLSC
 	bool
+
+#
+# CPU may not reorder reads and writes R->R, R->W, W->R, W->W within Uncached
+# Cacheability and Coherency Attribute (CCA=2)
+#
+config STRONG_UC_ORDERING
+	bool
+
 endmenu
 
 #
diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 78537aa23500..130c4b6458fc 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -213,7 +213,7 @@ void iounmap(const volatile void __iomem *addr);
 #define war_io_reorder_wmb()		barrier()
 #endif
 
-#define __BUILD_MEMORY_SINGLE(pfx, bwlq, type, barrier, relax, irq)	\
+#define __BUILD_MEMORY_SINGLE(pfx, bwlq, type, relax, irq)		\
 									\
 static inline void pfx##write##bwlq(type val,				\
 				    volatile void __iomem *mem)		\
@@ -221,7 +221,7 @@ static inline void pfx##write##bwlq(type val,				\
 	volatile type *__mem;						\
 	type __val;							\
 									\
-	if (barrier)							\
+	if (!(relax && IS_ENABLED(CONFIG_STRONG_UC_ORDERING)))		\
 		iobarrier_rw();						\
 	else								\
 		war_io_reorder_wmb();					\
@@ -262,7 +262,7 @@ static inline type pfx##read##bwlq(const volatile void __iomem *mem)	\
 									\
 	__mem = (void *)__swizzle_addr_##bwlq((unsigned long)(mem));	\
 									\
-	if (barrier)							\
+	if (!(relax && IS_ENABLED(CONFIG_STRONG_UC_ORDERING)))		\
 		iobarrier_rw();						\
 									\
 	if (sizeof(type) != sizeof(u64) || sizeof(u64) == sizeof(long)) \
@@ -294,14 +294,14 @@ static inline type pfx##read##bwlq(const volatile void __iomem *mem)	\
 	return pfx##ioswab##bwlq(__mem, __val);				\
 }
 
-#define __BUILD_IOPORT_SINGLE(pfx, bwlq, type, barrier, relax, p)	\
+#define __BUILD_IOPORT_SINGLE(pfx, bwlq, type, relax, p)		\
 									\
 static inline void pfx##out##bwlq##p(type val, unsigned long port)	\
 {									\
 	volatile type *__addr;						\
 	type __val;							\
 									\
-	if (barrier)							\
+	if (!(relax && IS_ENABLED(CONFIG_STRONG_UC_ORDERING)))		\
 		iobarrier_rw();						\
 	else								\
 		war_io_reorder_wmb();					\
@@ -325,7 +325,7 @@ static inline type pfx##in##bwlq##p(unsigned long port)			\
 									\
 	BUILD_BUG_ON(sizeof(type) > sizeof(unsigned long));		\
 									\
-	if (barrier)							\
+	if (!(relax && IS_ENABLED(CONFIG_STRONG_UC_ORDERING)))		\
 		iobarrier_rw();						\
 									\
 	__val = *__addr;						\
@@ -338,7 +338,7 @@ static inline type pfx##in##bwlq##p(unsigned long port)			\
 
 #define __BUILD_MEMORY_PFX(bus, bwlq, type, relax)			\
 									\
-__BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
+__BUILD_MEMORY_SINGLE(bus, bwlq, type, relax, 1)
 
 #define BUILDIO_MEM(bwlq, type)						\
 									\
@@ -358,8 +358,8 @@ __BUILD_MEMORY_PFX(__mem_, q, u64, 0)
 #endif
 
 #define __BUILD_IOPORT_PFX(bus, bwlq, type)				\
-	__BUILD_IOPORT_SINGLE(bus, bwlq, type, 1, 0,)			\
-	__BUILD_IOPORT_SINGLE(bus, bwlq, type, 1, 0, _p)
+	__BUILD_IOPORT_SINGLE(bus, bwlq, type, 0,)			\
+	__BUILD_IOPORT_SINGLE(bus, bwlq, type, 0, _p)
 
 #define BUILDIO_IOPORT(bwlq, type)					\
 	__BUILD_IOPORT_PFX(, bwlq, type)				\
@@ -374,7 +374,7 @@ BUILDIO_IOPORT(q, u64)
 
 #define __BUILDIO(bwlq, type)						\
 									\
-__BUILD_MEMORY_SINGLE(____raw_, bwlq, type, 1, 0, 0)
+__BUILD_MEMORY_SINGLE(____raw_, bwlq, type, 0, 0)
 
 __BUILDIO(q, u64)
 
-- 
2.27.0

