Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAFA0135717
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 11:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730194AbgAIKgE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 05:36:04 -0500
Received: from mx2.suse.de ([195.135.220.15]:55512 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729165AbgAIKgE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 05:36:04 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 07B266A05A;
        Thu,  9 Jan 2020 10:34:45 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v12 2/3] MIPS: SGI-IP27: fix readb/writeb addressing
Date:   Thu,  9 Jan 2020 11:34:28 +0100
Message-Id: <20200109103430.12057-3-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109103430.12057-1-tbogendoerfer@suse.de>
References: <20200109103430.12057-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Our chosen byte swapping, which is what firmware already uses, is to
do readl/writel by normal lw/sw intructions (data invariance). This
also means we need to mangle addresses for u8 and u16 accesses. The
mangling for 16bit has been done aready, but 8bit one was missing.
Correcting this causes different addresses for accesses to the
SuperIO and local bus of the IOC3 chip. This is fixed by changing
byte order in ioc3 and m48rtc_rtc structs.

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/include/asm/mach-ip27/mangle-port.h |  4 +-
 arch/mips/include/asm/sn/ioc3.h               | 38 +++++++++----------
 drivers/net/ethernet/sgi/ioc3-eth.c           | 12 ++++++
 drivers/rtc/rtc-m48t35.c                      | 11 ++++++
 4 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip27/mangle-port.h b/arch/mips/include/asm/mach-ip27/mangle-port.h
index f6e4912ea062..27c56efa519f 100644
--- a/arch/mips/include/asm/mach-ip27/mangle-port.h
+++ b/arch/mips/include/asm/mach-ip27/mangle-port.h
@@ -8,7 +8,7 @@
 #ifndef __ASM_MACH_IP27_MANGLE_PORT_H
 #define __ASM_MACH_IP27_MANGLE_PORT_H
 
-#define __swizzle_addr_b(port)	(port)
+#define __swizzle_addr_b(port)	((port) ^ 3)
 #define __swizzle_addr_w(port)	((port) ^ 2)
 #define __swizzle_addr_l(port)	(port)
 #define __swizzle_addr_q(port)	(port)
@@ -20,6 +20,6 @@
 # define ioswabl(a, x)		(x)
 # define __mem_ioswabl(a, x)	cpu_to_le32(x)
 # define ioswabq(a, x)		(x)
-# define __mem_ioswabq(a, x)	cpu_to_le32(x)
+# define __mem_ioswabq(a, x)	cpu_to_le64(x)
 
 #endif /* __ASM_MACH_IP27_MANGLE_PORT_H */
diff --git a/arch/mips/include/asm/sn/ioc3.h b/arch/mips/include/asm/sn/ioc3.h
index 78ef760ddde4..3865d3225780 100644
--- a/arch/mips/include/asm/sn/ioc3.h
+++ b/arch/mips/include/asm/sn/ioc3.h
@@ -21,50 +21,50 @@ struct ioc3_serialregs {
 
 /* SUPERIO uart register map */
 struct ioc3_uartregs {
+	u8	iu_lcr;
 	union {
-		u8	iu_rbr;	/* read only, DLAB == 0 */
-		u8	iu_thr;	/* write only, DLAB == 0 */
-		u8	iu_dll;	/* DLAB == 1 */
+		u8	iu_iir;	/* read only */
+		u8	iu_fcr;	/* write only */
 	};
 	union {
 		u8	iu_ier;	/* DLAB == 0 */
 		u8	iu_dlm;	/* DLAB == 1 */
 	};
 	union {
-		u8	iu_iir;	/* read only */
-		u8	iu_fcr;	/* write only */
+		u8	iu_rbr;	/* read only, DLAB == 0 */
+		u8	iu_thr;	/* write only, DLAB == 0 */
+		u8	iu_dll;	/* DLAB == 1 */
 	};
-	u8	iu_lcr;
-	u8	iu_mcr;
-	u8	iu_lsr;
-	u8	iu_msr;
 	u8	iu_scr;
+	u8	iu_msr;
+	u8	iu_lsr;
+	u8	iu_mcr;
 };
 
 struct ioc3_sioregs {
 	u8	fill[0x141];	/* starts at 0x141 */
 
-	u8	uartc;
 	u8	kbdcg;
+	u8	uartc;
 
-	u8	fill0[0x150 - 0x142 - 1];
+	u8	fill0[0x151 - 0x142 - 1];
 
-	u8	pp_data;
-	u8	pp_dsr;
 	u8	pp_dcr;
+	u8	pp_dsr;
+	u8	pp_data;
 
-	u8	fill1[0x158 - 0x152 - 1];
+	u8	fill1[0x159 - 0x153 - 1];
 
-	u8	pp_fifa;
-	u8	pp_cfgb;
 	u8	pp_ecr;
+	u8	pp_cfgb;
+	u8	pp_fifa;
 
-	u8	fill2[0x168 - 0x15a - 1];
+	u8	fill2[0x16a - 0x15b - 1];
 
-	u8	rtcad;
 	u8	rtcdat;
+	u8	rtcad;
 
-	u8	fill3[0x170 - 0x169 - 1];
+	u8	fill3[0x170 - 0x16b - 1];
 
 	struct ioc3_uartregs	uartb;	/* 0x20170  */
 	struct ioc3_uartregs	uarta;	/* 0x20178  */
diff --git a/drivers/net/ethernet/sgi/ioc3-eth.c b/drivers/net/ethernet/sgi/ioc3-eth.c
index d242906ae233..4ebb58b8572e 100644
--- a/drivers/net/ethernet/sgi/ioc3-eth.c
+++ b/drivers/net/ethernet/sgi/ioc3-eth.c
@@ -1079,6 +1079,16 @@ static int ioc3_is_menet(struct pci_dev *pdev)
  * Can't use UPF_IOREMAP as the whole of IOC3 resources have already been
  * registered.
  */
+static unsigned int ioc3_serial_in(struct uart_port *p, int offset)
+{
+	return readb(p->membase + (offset ^ 3));
+}
+
+static void ioc3_serial_out(struct uart_port *p, int offset, int value)
+{
+	writeb(value, p->membase + (offset ^ 3));
+}
+
 static void ioc3_8250_register(struct ioc3_uartregs __iomem *uart)
 {
 #define COSMISC_CONSTANT 6
@@ -1093,6 +1103,8 @@ static void ioc3_8250_register(struct ioc3_uartregs __iomem *uart)
 
 			.membase	= (unsigned char __iomem *)uart,
 			.mapbase	= (unsigned long)uart,
+			.serial_in	= ioc3_serial_in,
+			.serial_out	= ioc3_serial_out,
 		}
 	};
 	unsigned char lcr;
diff --git a/drivers/rtc/rtc-m48t35.c b/drivers/rtc/rtc-m48t35.c
index d3a75d447fce..e8194f1f01a8 100644
--- a/drivers/rtc/rtc-m48t35.c
+++ b/drivers/rtc/rtc-m48t35.c
@@ -20,6 +20,16 @@
 
 struct m48t35_rtc {
 	u8	pad[0x7ff8];    /* starts at 0x7ff8 */
+#ifdef CONFIG_SGI_IP27
+	u8	hour;
+	u8	min;
+	u8	sec;
+	u8	control;
+	u8	year;
+	u8	month;
+	u8	date;
+	u8	day;
+#else
 	u8	control;
 	u8	sec;
 	u8	min;
@@ -28,6 +38,7 @@ struct m48t35_rtc {
 	u8	date;
 	u8	month;
 	u8	year;
+#endif
 };
 
 #define M48T35_RTC_SET		0x80
-- 
2.24.1

