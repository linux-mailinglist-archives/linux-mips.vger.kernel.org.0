Return-Path: <linux-mips+bounces-11665-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE90BBD32D0
	for <lists+linux-mips@lfdr.de>; Mon, 13 Oct 2025 15:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0576D4F237E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Oct 2025 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763812FB632;
	Mon, 13 Oct 2025 13:20:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B86D1547D2;
	Mon, 13 Oct 2025 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361638; cv=none; b=VyiMYuhY2bm5dMPcpaX8Xc+UlIPFOLcycQQ3rN2+uHpTnxMYxYtkF8ul85Zr3T1XpQm3WHVQJWDuhYZckyC/T+EQPc3WJF+nA2rR5A8zKfo/PAkBU6TB8pvxgNVTpVNRhbHGuwdYYgtG9i36K0ZyyYap+21WQDoFKjzkkHi18ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361638; c=relaxed/simple;
	bh=08P6/S9TSCs7VItMP+DAa4ys+h3oQiIBbFRrGwsYaiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rm3cwUaiUisAgdam45k1UGgyspLoHP0lMGP5OKAb9Mx/pOS0wDRT7KVX91EYZwcMSNSHnpae/EbIxn1cAqGGJogwRa2e9b7RWD4yCy4W9MP1t/hYjXPwW77wWwCP/yTyGLOQxUw78cvqEc5LDR6AIdQ/bre+lcQuTjh7zXjK3yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cld112tJkz9sSv;
	Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5E7p9M28w-y; Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cld1122pDz9sSs;
	Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 328DF8B768;
	Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 7EZ7Ik3eZcv6; Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 02E3C8B763;
	Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: [PATCH 1/2] gpio: mm-lantiq: Drop legacy-of-mm-gpiochip.h header from GPIO driver
Date: Mon, 13 Oct 2025 15:07:14 +0200
Message-ID: <c7415e2870b3bd9109f95bab3784d48e708e30e6.1760360638.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760360834; l=4682; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=08P6/S9TSCs7VItMP+DAa4ys+h3oQiIBbFRrGwsYaiY=; b=Qh7mMJyAZpFgoDIS7x52mAKA0zkU5FMUYQszSuDw8b8vGHyjs02lC8B+QfO9P7yWCBIOpVZhR eed+vVRL6BNDw2CCSpqA+w1EiOScuPSdTCiTmGNDf1gDQpBLOQIpcA3
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Remove legacy-of-mm-gpiochip.h header file. The above mentioned
file provides an OF API that's deprecated. There is no agnostic
alternatives to it and we have to open code the logic which was
hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
drivers are using their own labeling schemas and resource retrieval
that only a few may gain of the code deduplication, so whenever
alternative is appear we can move drivers again to use that one.

[Text copied from commit 34064c8267a6 ("powerpc/8xx: Drop
legacy-of-mm-gpiochip.h header")]

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/gpio/Kconfig          |  1 -
 drivers/gpio/gpio-mm-lantiq.c | 47 +++++++++++++++++++----------------
 2 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7ee3afbc2b05d..8fde6730a02dd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -476,7 +476,6 @@ config GPIO_MENZ127
 config GPIO_MM_LANTIQ
 	bool "Lantiq Memory mapped GPIOs"
 	depends on LANTIQ && SOC_XWAY
-	select OF_GPIO_MM_GPIOCHIP
 	help
 	  This enables support for memory mapped GPIOs on the External Bus Unit
 	  (EBU) found on Lantiq SoCs. The GPIOs are output only as they are
diff --git a/drivers/gpio/gpio-mm-lantiq.c b/drivers/gpio/gpio-mm-lantiq.c
index 8f1405733d98b..3d2e24d614751 100644
--- a/drivers/gpio/gpio-mm-lantiq.c
+++ b/drivers/gpio/gpio-mm-lantiq.c
@@ -10,7 +10,6 @@
 #include <linux/platform_device.h>
 #include <linux/mutex.h>
 #include <linux/gpio/driver.h>
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/of.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -27,7 +26,8 @@
 #define LTQ_EBU_WP	0x80000000	/* write protect bit */
 
 struct ltq_mm {
-	struct of_mm_gpio_chip mmchip;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	u16 shadow;	/* shadow the latches state */
 };
 
@@ -44,7 +44,7 @@ static void ltq_mm_apply(struct ltq_mm *chip)
 
 	spin_lock_irqsave(&ebu_lock, flags);
 	ltq_ebu_w32(LTQ_EBU_BUSCON, LTQ_EBU_BUSCON1);
-	__raw_writew(chip->shadow, chip->mmchip.regs);
+	__raw_writew(chip->shadow, chip->regs);
 	ltq_ebu_w32(LTQ_EBU_BUSCON | LTQ_EBU_WP, LTQ_EBU_BUSCON1);
 	spin_unlock_irqrestore(&ebu_lock, flags);
 }
@@ -87,19 +87,19 @@ static int ltq_mm_dir_out(struct gpio_chip *gc, unsigned offset, int value)
  * ltq_mm_save_regs() - Set initial values of GPIO pins
  * @mm_gc: pointer to memory mapped GPIO chip structure
  */
-static void ltq_mm_save_regs(struct of_mm_gpio_chip *mm_gc)
+static void ltq_mm_save_regs(struct ltq_mm *chip)
 {
-	struct ltq_mm *chip =
-		container_of(mm_gc, struct ltq_mm, mmchip);
-
 	/* tell the ebu controller which memory address we will be using */
-	ltq_ebu_w32(CPHYSADDR(chip->mmchip.regs) | 0x1, LTQ_EBU_ADDRSEL1);
+	ltq_ebu_w32(CPHYSADDR((__force void *)chip->regs) | 0x1, LTQ_EBU_ADDRSEL1);
 
 	ltq_mm_apply(chip);
 }
 
 static int ltq_mm_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct gpio_chip *gc;
 	struct ltq_mm *chip;
 	u32 shadow;
 
@@ -107,25 +107,29 @@ static int ltq_mm_probe(struct platform_device *pdev)
 	if (!chip)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, chip);
+	gc = &chip->gc;
+
+	gc->base = -1;
+	gc->ngpio = 16;
+	gc->direction_output = ltq_mm_dir_out;
+	gc->set = ltq_mm_set;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
+	chip->regs = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
 
-	chip->mmchip.gc.ngpio = 16;
-	chip->mmchip.gc.direction_output = ltq_mm_dir_out;
-	chip->mmchip.gc.set = ltq_mm_set;
-	chip->mmchip.save_regs = ltq_mm_save_regs;
+	ltq_mm_save_regs(chip);
 
 	/* store the shadow value if one was passed by the devicetree */
 	if (!of_property_read_u32(pdev->dev.of_node, "lantiq,shadow", &shadow))
 		chip->shadow = shadow;
 
-	return of_mm_gpiochip_add_data(pdev->dev.of_node, &chip->mmchip, chip);
-}
-
-static void ltq_mm_remove(struct platform_device *pdev)
-{
-	struct ltq_mm *chip = platform_get_drvdata(pdev);
-
-	of_mm_gpiochip_remove(&chip->mmchip);
+	return devm_gpiochip_add_data(dev, gc, chip);
 }
 
 static const struct of_device_id ltq_mm_match[] = {
@@ -136,7 +140,6 @@ MODULE_DEVICE_TABLE(of, ltq_mm_match);
 
 static struct platform_driver ltq_mm_driver = {
 	.probe = ltq_mm_probe,
-	.remove = ltq_mm_remove,
 	.driver = {
 		.name = "gpio-mm-ltq",
 		.of_match_table = ltq_mm_match,
-- 
2.49.0


