Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030A627135F
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 13:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgITLHW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 07:07:22 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:53210 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgITLHW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 07:07:22 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id D27E380307CB;
        Sun, 20 Sep 2020 11:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uS0z8x_TjkDE; Sun, 20 Sep 2020 14:00:46 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] mips: Introduce MIPS CM2 GCR Control register accessors
Date:   Sun, 20 Sep 2020 14:00:10 +0300
Message-ID: <20200920110010.16796-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
References: <20200920110010.16796-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For some reason these accessors have been absent from the MIPS kernel,
while some of them can be used to tune the MIPS code execution up (the
default value are fully acceptable though). For instance, in the framework
of MIPS P5600/P6600 (see [1] for details) if we are sure the IO
interconnect doesn't reorder the requests we can freely set
GCR_CONTROL.SYNCDIS, which will make CM2 to respond on SYNCs just
after a request is accepted on the L2/Memory interface instead of
executing the legacy SYNC and waiting for the full response from
L2/Memory. Needless to say that this will significantly speed the
{read,write}X() IO-accessors due to having more lightweight barriers
around the IO Loads and Stores. There are others MIPS Coherency Manager
optimizations available in framework of that register like cache ops
serialization limits, speculative read enable, etc, which can be useful
for the various MIPS platforms.

[1] MIPS32 P5600 Multiprocessing System Software User's Manual,
    Document Number: MD01025, Revision 01.60, April 19, 2016, p. 400

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Folks, do you think it would be better to implement a dedicated config for
arch/mips/kernel/mips-cm.c code, which would disable the SI_SyncTxEn
acceptance by setting the GCR_CONTROL.SYNCDIS bit? Currently I intend to
set it in the out platform-specific prom_init() method.
---
 arch/mips/include/asm/mips-cm.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/include/asm/mips-cm.h b/arch/mips/include/asm/mips-cm.h
index aeae2effa123..17b2adf57e0c 100644
--- a/arch/mips/include/asm/mips-cm.h
+++ b/arch/mips/include/asm/mips-cm.h
@@ -143,6 +143,21 @@ GCR_ACCESSOR_RW(64, 0x008, base)
 #define  CM_GCR_BASE_CMDEFTGT_IOCU0		2
 #define  CM_GCR_BASE_CMDEFTGT_IOCU1		3
 
+/* GCR_CONTROL - Global CM2 Settings */
+GCR_ACCESSOR_RW(64, 0x010, control)
+#define CM_GCR_CONTROL_SYNCCTL			BIT(16)
+#define CM_GCR_CONTROL_SYNCDIS			BIT(5)
+#define CM_GCR_CONTROL_IVU_EN			BIT(4)
+#define CM_GCR_CONTROL_SHST_EN			BIT(3)
+#define CM_GCR_CONTROL_PARK_EN			BIT(2)
+#define CM_GCR_CONTROL_MMIO_LIMIT_DIS		BIT(1)
+#define CM_GCR_CONTROL_SPEC_READ_EN		BIT(0)
+
+/* GCR_CONTROL2 - Global CM2 Settings (continue) */
+GCR_ACCESSOR_RW(64, 0x018, control2)
+#define CM_GCR_CONTROL2_L2_CACHEOP_LIMIT	GENMASK(19, 16)
+#define CM_GCR_CONTROL2_L1_CACHEOP_LIMIT	GENMASK(3, 0)
+
 /* GCR_ACCESS - Controls core/IOCU access to GCRs */
 GCR_ACCESSOR_RW(32, 0x020, access)
 #define CM_GCR_ACCESS_ACCESSEN			GENMASK(7, 0)
-- 
2.27.0

