Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB388D43B6
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2019 17:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbfJKPF5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Oct 2019 11:05:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:54590 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726692AbfJKPF5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Oct 2019 11:05:57 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A635DB19D;
        Fri, 11 Oct 2019 15:05:55 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Joshua Kinard <kumba@gentoo.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org
Subject: [PATCH 3/3] rtc: ds1685: add indirect access method and remove plat_read/plat_write
Date:   Fri, 11 Oct 2019 17:05:45 +0200
Message-Id: <20191011150546.9186-3-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191011150546.9186-1-tbogendoerfer@suse.de>
References: <20191011150546.9186-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use of provided plat_read/plat_write introduces the problem of possible
different lifetime of rtc driver and plat_XXX function provider. As
this was only intended for SGI Octane (IP30) this patchset implements
a register indirect access method for IP30 and introduces an
access_type field in platform data to select how registers are
accessed. And since there are no resource allocating stunts needed
anymore it also gets rid of alloc_io_resources from platform data.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
 arch/mips/sgi-ip32/ip32-platform.c |  2 +-
 drivers/rtc/rtc-ds1685.c           | 67 ++++++++++++++++++++++++--------------
 include/linux/rtc/ds1685.h         |  8 +++--
 3 files changed, 48 insertions(+), 29 deletions(-)

diff --git a/arch/mips/sgi-ip32/ip32-platform.c b/arch/mips/sgi-ip32/ip32-platform.c
index 5a2a82148d8d..c3909bd8dd1a 100644
--- a/arch/mips/sgi-ip32/ip32-platform.c
+++ b/arch/mips/sgi-ip32/ip32-platform.c
@@ -115,7 +115,7 @@ ip32_rtc_platform_data[] = {
 		.bcd_mode = true,
 		.no_irq = false,
 		.uie_unsupported = false,
-		.alloc_io_resources = true,
+		.access_type = ds1685_reg_direct,
 		.plat_prepare_poweroff = ip32_prepare_poweroff,
 	},
 };
diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 349a8d1caca1..9c5d064ebb6c 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -59,6 +59,32 @@ ds1685_write(struct ds1685_priv *rtc, int reg, u8 value)
 }
 /* ----------------------------------------------------------------------- */
 
+/* Indirect read/write functions */
+
+/**
+ * ds1685_indir_read - read a value from an rtc register.
+ * @rtc: pointer to the ds1685 rtc structure.
+ * @reg: the register address to read.
+ */
+static u8
+ds1685_indir_read(struct ds1685_priv *rtc, int reg)
+{
+	writeb(reg, rtc->regs);
+	return readb(rtc->data);
+}
+
+/**
+ * ds1685_indir_write - write a value to an rtc register.
+ * @rtc: pointer to the ds1685 rtc structure.
+ * @reg: the register address to write.
+ * @value: value to write to the register.
+ */
+static void
+ds1685_indir_write(struct ds1685_priv *rtc, int reg, u8 value)
+{
+	writeb(reg, rtc->regs);
+	writeb(value, rtc->data);
+}
 
 /* ----------------------------------------------------------------------- */
 /* Inlined functions */
@@ -1062,16 +1088,25 @@ ds1685_rtc_probe(struct platform_device *pdev)
 	if (!rtc)
 		return -ENOMEM;
 
-	/*
-	 * Allocate/setup any IORESOURCE_MEM resources, if required.  Not all
-	 * platforms put the RTC in an easy-access place.  Like the SGI Octane,
-	 * which attaches the RTC to a "ByteBus", hooked to a SuperIO chip
-	 * that sits behind the IOC3 PCI metadevice.
-	 */
-	if (pdata->alloc_io_resources) {
+	/* Setup resources and access functions */
+	switch (pdata->access_type) {
+	case ds1685_reg_direct:
+		rtc->regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(rtc->regs))
+			return PTR_ERR(rtc->regs);
+		rtc->read = ds1685_read;
+		rtc->write = ds1685_write;
+		break;
+	case ds1685_reg_indirect:
 		rtc->regs = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(rtc->regs))
 			return PTR_ERR(rtc->regs);
+		rtc->data = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(rtc->data))
+			return PTR_ERR(rtc->data);
+		rtc->read = ds1685_indir_read;
+		rtc->write = ds1685_indir_write;
+		break;
 	}
 
 	/* Get the register step size. */
@@ -1080,24 +1115,6 @@ ds1685_rtc_probe(struct platform_device *pdev)
 	else
 		rtc->regstep = 1;
 
-	/* Platform read function, else default if mmio setup */
-	if (pdata->plat_read)
-		rtc->read = pdata->plat_read;
-	else
-		if (pdata->alloc_io_resources)
-			rtc->read = ds1685_read;
-		else
-			return -ENXIO;
-
-	/* Platform write function, else default if mmio setup */
-	if (pdata->plat_write)
-		rtc->write = pdata->plat_write;
-	else
-		if (pdata->alloc_io_resources)
-			rtc->write = ds1685_write;
-		else
-			return -ENXIO;
-
 	/* Platform pre-shutdown function, if defined. */
 	if (pdata->plat_prepare_poweroff)
 		rtc->prepare_poweroff = pdata->plat_prepare_poweroff;
diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
index 101c7adc05a2..67ee9d20cc5a 100644
--- a/include/linux/rtc/ds1685.h
+++ b/include/linux/rtc/ds1685.h
@@ -42,6 +42,7 @@
 struct ds1685_priv {
 	struct rtc_device *dev;
 	void __iomem *regs;
+	void __iomem *data;
 	u32 regstep;
 	int irq_num;
 	bool bcd_mode;
@@ -70,12 +71,13 @@ struct ds1685_rtc_platform_data {
 	const bool bcd_mode;
 	const bool no_irq;
 	const bool uie_unsupported;
-	const bool alloc_io_resources;
-	u8 (*plat_read)(struct ds1685_priv *, int);
-	void (*plat_write)(struct ds1685_priv *, int, u8);
 	void (*plat_prepare_poweroff)(void);
 	void (*plat_wake_alarm)(void);
 	void (*plat_post_ram_clear)(void);
+	enum {
+		ds1685_reg_direct,
+		ds1685_reg_indirect
+	} access_type;
 };
 
 
-- 
2.16.4

