Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F9A17BD29
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgCFMtJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:49:09 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35648 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727263AbgCFMtG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:49:06 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 66E1C803078F;
        Fri,  6 Mar 2020 12:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id POJcSfDZTxK9; Fri,  6 Mar 2020 15:49:03 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 15/22] mips: Use offset-sized IO-mem accessors in CPS debug printout
Date:   Fri, 6 Mar 2020 15:46:58 +0300
In-Reply-To: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306124904.66E1C803078F@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Similar to commit 8e5c62e38a88 ("mips: early_printk_8250: Use offset-sized
IO-mem accessors") the IO-memory might require to use a proper load/store
instructions (like Bailal-T1 IO-memory). To fix the cps-vec UART debug
printout lets use the memory access instructions in accordance with the
UART registers offset config specified at boot time.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>

---
There might be another problem in cps-vec-ns16550.S connected with the
difference in CPU/devices endinanness on some platforms. But there is
no such for Baikal-T1 SoC.
---
 arch/mips/kernel/cps-vec-ns16550.S | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cps-vec-ns16550.S b/arch/mips/kernel/cps-vec-ns16550.S
index d5a67b4ce9f6..2adb1c56c7c5 100644
--- a/arch/mips/kernel/cps-vec-ns16550.S
+++ b/arch/mips/kernel/cps-vec-ns16550.S
@@ -14,16 +14,30 @@
 #define UART_TX_OFS	(UART_TX << CONFIG_MIPS_CPS_NS16550_SHIFT)
 #define UART_LSR_OFS	(UART_LSR << CONFIG_MIPS_CPS_NS16550_SHIFT)
 
+#if CONFIG_MIPS_CPS_NS16550_SHIFT == 0
+# define UART_L		lb
+# define UART_S		sb
+#elif CONFIG_MIPS_CPS_NS16550_SHIFT == 1
+# define UART_L		lh
+# define UART_S		sh
+#elif CONFIG_MIPS_CPS_NS16550_SHIFT == 2
+# define UART_L		lw
+# define UART_S		sw
+#else
+# define UART_L		lw
+# define UART_S		sb
+#endif
+
 /**
  * _mips_cps_putc() - write a character to the UART
  * @a0: ASCII character to write
  * @t9: UART base address
  */
 LEAF(_mips_cps_putc)
-1:	lw		t0, UART_LSR_OFS(t9)
+1:	UART_L		t0, UART_LSR_OFS(t9)
 	andi		t0, t0, UART_LSR_TEMT
 	beqz		t0, 1b
-	sb		a0, UART_TX_OFS(t9)
+	UART_S		a0, UART_TX_OFS(t9)
 	jr		ra
 	END(_mips_cps_putc)
 
-- 
2.25.1

