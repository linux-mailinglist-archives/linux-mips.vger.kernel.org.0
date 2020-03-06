Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66B4817BD26
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgCFMtD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:49:03 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35638 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727241AbgCFMtD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:49:03 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 8D4668030700;
        Fri,  6 Mar 2020 12:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JEJKWpV-l5T0; Fri,  6 Mar 2020 15:49:01 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 14/22] mips: early_printk_8250: Use offset-sized IO-mem accessors
Date:   Fri, 6 Mar 2020 15:46:57 +0300
In-Reply-To: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306124901.8D4668030700@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Some platforms may prohibit to access the IO-memory with instructions
of certain memory widths. For instance Bailal-T1 has devices placed
behind memory OCP port (which also the reason of DMA accesses being
incoherent) and can't be accessed through CCA uncacheable memory with
other than 4-bytes aligned (LW/SW) instructions. Ignoring this rule
will cause the APB EHB error with 0xFFs returned on read operations.
In order to fix the issue for this platform and for others, which may
have similar problems, lets recode serial_in()/serial_out() to call
a certain memory accessors in accordance with the UART registers shift
setting.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/kernel/early_printk_8250.c | 34 ++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/early_printk_8250.c b/arch/mips/kernel/early_printk_8250.c
index 567c6ec0cfae..e2c2405cff62 100644
--- a/arch/mips/kernel/early_printk_8250.c
+++ b/arch/mips/kernel/early_printk_8250.c
@@ -23,12 +23,42 @@ void setup_8250_early_printk_port(unsigned long base, unsigned int reg_shift,
 
 static inline u8 serial_in(int offset)
 {
-	return readb(serial8250_base + (offset << serial8250_reg_shift));
+	u8 ret = 0xFF;
+
+	offset <<= serial8250_reg_shift;
+	switch (serial8250_reg_shift) {
+	case 0:
+		ret = readb(serial8250_base + offset);
+		break;
+	case 1:
+		ret = readw(serial8250_base + offset);
+		break;
+	case 2:
+		ret = readl(serial8250_base + offset);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
 }
 
 static inline void serial_out(int offset, char value)
 {
-	writeb(value, serial8250_base + (offset << serial8250_reg_shift));
+	offset <<= serial8250_reg_shift;
+	switch (serial8250_reg_shift) {
+	case 0:
+		writeb(value, serial8250_base + offset);
+		break;
+	case 1:
+		writew(value, serial8250_base + offset);
+		break;
+	case 2:
+		writel(value, serial8250_base + offset);
+		break;
+	default:
+		break;
+	}
 }
 
 void prom_putchar(char c)
-- 
2.25.1

