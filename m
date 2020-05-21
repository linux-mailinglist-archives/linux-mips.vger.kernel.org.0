Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADF11DC3BD
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgEUAf7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:35:59 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33048 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbgEUAf3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 20:35:29 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9C0F58030790;
        Thu, 21 May 2020 00:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id I5xiJfj_m-SZ; Thu, 21 May 2020 03:35:26 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 09/14] mips: Add CPS_NS16550_WIDTH config
Date:   Thu, 21 May 2020 03:34:38 +0300
Message-ID: <20200521003443.11385-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On some platforms IO-memory might require to use a proper load/store
instructions (like Baikal-T1 IO-memory). To fix the cps-vec UART debug
printout let's add the CONFIG_CPS_NS16550_WIDTH config to determine which
instructions lb/sb, lh/sh or lw/sw are required for MMIO operations.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org

---
There might be another problem in cps-vec-ns16550.S connected with the
difference in CPU/devices endinanness on some platforms. But there is
no such for Baikal-T1 SoC.

Changelog v3:
- Introduce new CPS_NS16550_WIDTH to determine the IO access instrctions
  instead of using the CPS_NS16550_OFFSET config.
---
 arch/mips/Kconfig.debug            | 10 ++++++++++
 arch/mips/kernel/cps-vec-ns16550.S | 18 ++++++++++++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index 93a2974d2ab7..7a8d94cdd493 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -148,4 +148,14 @@ config MIPS_CPS_NS16550_SHIFT
 	  form their addresses. That is, log base 2 of the span between
 	  adjacent ns16550 registers in the system.
 
+config MIPS_CPS_NS16550_WIDTH
+	int "UART Register Width"
+	default 1
+	help
+	  ns16550 registers width. UART registers IO access methods will be
+	  selected in accordance with this parameter. By setting it to 1, 2 or
+	  4 UART registers will be accessed by means of lb/sb, lh/sh or lw/sw
+	  instructions respectively. Any value not from that set activates
+	  lb/sb instructions.
+
 endif # MIPS_CPS_NS16550_BOOL
diff --git a/arch/mips/kernel/cps-vec-ns16550.S b/arch/mips/kernel/cps-vec-ns16550.S
index d5a67b4ce9f6..30725e1df987 100644
--- a/arch/mips/kernel/cps-vec-ns16550.S
+++ b/arch/mips/kernel/cps-vec-ns16550.S
@@ -14,16 +14,30 @@
 #define UART_TX_OFS	(UART_TX << CONFIG_MIPS_CPS_NS16550_SHIFT)
 #define UART_LSR_OFS	(UART_LSR << CONFIG_MIPS_CPS_NS16550_SHIFT)
 
+#if CONFIG_MIPS_CPS_NS16550_WIDTH == 1
+# define UART_L		lb
+# define UART_S		sb
+#elif CONFIG_MIPS_CPS_NS16550_WIDTH == 2
+# define UART_L		lh
+# define UART_S		sh
+#elif CONFIG_MIPS_CPS_NS16550_WIDTH == 4
+# define UART_L		lw
+# define UART_S		sw
+#else
+# define UART_L		lb
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

