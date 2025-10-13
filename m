Return-Path: <linux-mips+bounces-11664-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D3BD32D3
	for <lists+linux-mips@lfdr.de>; Mon, 13 Oct 2025 15:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7DAE3A926C
	for <lists+linux-mips@lfdr.de>; Mon, 13 Oct 2025 13:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CE22773F8;
	Mon, 13 Oct 2025 13:20:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33516269B1C;
	Mon, 13 Oct 2025 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361637; cv=none; b=nhqOitENl3r4ntzIAiFfiIooKFhhgBolcOQW/ZGfP9m424WFhiHD4lMuXmeHPG5dlnH0yP0XLbatAvGJ2vh2SoQSAXI05Vn70yrxk8TyQESTYTPBpHqcOUINvKPW1OuEDdRc/c1G1avYY98ZWr6qbkbEe8RPp/OkK7bFFQwjSJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361637; c=relaxed/simple;
	bh=ef2s9p6jYLAdXDaS+zt9DqMZ6ZmrlV+rXr3jgJNXoqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uH50WVL6ylawUPoFyJnzdno79vD6TNVxrNjsTABA5/ogjw6um2o6pJeh+W59oNGhhwcMesOrUHNA5kVGI0yswrSq5YwxDH9GFEn+ekmXpsSUszzXkR50lnrmb3OspeJTw3nf7hHVfDPo90CzXIxZtjKVA++MANvEKWOnA3jchY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cld1249rpz9sSy;
	Mon, 13 Oct 2025 15:07:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PFL4tiX2ENYH; Mon, 13 Oct 2025 15:07:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cld112qQtz9sSt;
	Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4AECF8B763;
	Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9BQah-aAhZmX; Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B6C78B767;
	Mon, 13 Oct 2025 15:07:17 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	John Crispin <john@phrozen.org>
Subject: [PATCH 2/2] gpiolib: of: Get rid of <linux/gpio/legacy-of-mm-gpiochip.h>
Date: Mon, 13 Oct 2025 15:07:15 +0200
Message-ID: <e8efe5d1828a99e68552e2b88c20e784e2cac106.1760360638.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <c7415e2870b3bd9109f95bab3784d48e708e30e6.1760360638.git.christophe.leroy@csgroup.eu>
References: <c7415e2870b3bd9109f95bab3784d48e708e30e6.1760360638.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760360834; l=5690; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ef2s9p6jYLAdXDaS+zt9DqMZ6ZmrlV+rXr3jgJNXoqQ=; b=I8qsze1XiPDT3+7RtNtSA9XIjOvhhjlkcSomzx8ut3kRRQJadrUKXwagcNmtA7L7t+/GHeseB xexRovCpWGVCpny5ew6LeluTBnOYJXL8QR6LQipFiE8dCwlCwiMelD2
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Last user of linux/gpio/legacy-of-mm-gpiochip.h is gone.

Remove linux/gpio/legacy-of-mm-gpiochip.h and
CONFIG_OF_GPIO_MM_GPIOCHIP

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/gpio/Kconfig                       |  8 ---
 drivers/gpio/TODO                          | 11 ---
 drivers/gpio/gpiolib-of.c                  | 79 ----------------------
 include/linux/gpio/legacy-of-mm-gpiochip.h | 36 ----------
 4 files changed, 134 deletions(-)
 delete mode 100644 include/linux/gpio/legacy-of-mm-gpiochip.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8fde6730a02dd..40b7a295a8d2c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -42,14 +42,6 @@ config GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN
 	bool
 
-config OF_GPIO_MM_GPIOCHIP
-	bool
-	help
-	  This adds support for the legacy 'struct of_mm_gpio_chip' interface
-	  from PowerPC. Existing drivers using this interface need to select
-	  this symbol, but new drivers should use the generic gpio-regmap
-	  infrastructure instead.
-
 config DEBUG_GPIO
 	bool "Debug GPIO calls"
 	depends on DEBUG_KERNEL
diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 8ed74e05903a9..5acaeab029ec6 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -86,17 +86,6 @@ Work items:
 
 -------------------------------------------------------------------------------
 
-Get rid of <linux/gpio/legacy-of-mm-gpiochip.h>
-
-Work items:
-
-- Get rid of struct of_mm_gpio_chip altogether: use the generic  MMIO
-  GPIO for all current users (see below). Delete struct of_mm_gpio_chip,
-  to_of_mm_gpio_chip(), of_mm_gpiochip_add_data(), of_mm_gpiochip_remove(),
-  CONFIG_OF_GPIO_MM_GPIOCHIP from the kernel.
-
--------------------------------------------------------------------------------
-
 Collect drivers
 
 Collect GPIO drivers from arch/* and other places that should be placed
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index fad4edf9cc5c0..8657379e9165c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -1031,85 +1031,6 @@ static int of_gpio_threecell_xlate(struct gpio_chip *gc,
 	return gpiospec->args[1];
 }
 
-#if IS_ENABLED(CONFIG_OF_GPIO_MM_GPIOCHIP)
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
-/**
- * of_mm_gpiochip_add_data - Add memory mapped GPIO chip (bank)
- * @np:		device node of the GPIO chip
- * @mm_gc:	pointer to the of_mm_gpio_chip allocated structure
- * @data:	driver data to store in the struct gpio_chip
- *
- * To use this function you should allocate and fill mm_gc with:
- *
- * 1) In the gpio_chip structure:
- *    - all the callbacks
- *    - of_gpio_n_cells
- *    - of_xlate callback (optional)
- *
- * 3) In the of_mm_gpio_chip structure:
- *    - save_regs callback (optional)
- *
- * If succeeded, this function will map bank's memory and will
- * do all necessary work for you. Then you'll able to use .regs
- * to manage GPIOs from the callbacks.
- *
- * Returns:
- * 0 on success, or negative errno on failure.
- */
-int of_mm_gpiochip_add_data(struct device_node *np,
-			    struct of_mm_gpio_chip *mm_gc,
-			    void *data)
-{
-	int ret = -ENOMEM;
-	struct gpio_chip *gc = &mm_gc->gc;
-
-	gc->label = kasprintf(GFP_KERNEL, "%pOF", np);
-	if (!gc->label)
-		goto err0;
-
-	mm_gc->regs = of_iomap(np, 0);
-	if (!mm_gc->regs)
-		goto err1;
-
-	gc->base = -1;
-
-	if (mm_gc->save_regs)
-		mm_gc->save_regs(mm_gc);
-
-	fwnode_handle_put(mm_gc->gc.fwnode);
-	mm_gc->gc.fwnode = fwnode_handle_get(of_fwnode_handle(np));
-
-	ret = gpiochip_add_data(gc, data);
-	if (ret)
-		goto err2;
-
-	return 0;
-err2:
-	of_node_put(np);
-	iounmap(mm_gc->regs);
-err1:
-	kfree(gc->label);
-err0:
-	pr_err("%pOF: GPIO chip registration failed with status %d\n", np, ret);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(of_mm_gpiochip_add_data);
-
-/**
- * of_mm_gpiochip_remove - Remove memory mapped GPIO chip (bank)
- * @mm_gc:	pointer to the of_mm_gpio_chip allocated structure
- */
-void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc)
-{
-	struct gpio_chip *gc = &mm_gc->gc;
-
-	gpiochip_remove(gc);
-	iounmap(mm_gc->regs);
-	kfree(gc->label);
-}
-EXPORT_SYMBOL_GPL(of_mm_gpiochip_remove);
-#endif
-
 #ifdef CONFIG_PINCTRL
 static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 {
diff --git a/include/linux/gpio/legacy-of-mm-gpiochip.h b/include/linux/gpio/legacy-of-mm-gpiochip.h
deleted file mode 100644
index 2e2bd3b19cc35..0000000000000
--- a/include/linux/gpio/legacy-of-mm-gpiochip.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * OF helpers for the old of_mm_gpio_chip, used on ppc32 and nios2,
- * do not use in new code.
- *
- * Copyright (c) 2007-2008  MontaVista Software, Inc.
- *
- * Author: Anton Vorontsov <avorontsov@ru.mvista.com>
- */
-
-#ifndef __LINUX_GPIO_LEGACY_OF_MM_GPIO_CHIP_H
-#define __LINUX_GPIO_LEGACY_OF_MM_GPIO_CHIP_H
-
-#include <linux/gpio/driver.h>
-#include <linux/of.h>
-
-/*
- * OF GPIO chip for memory mapped banks
- */
-struct of_mm_gpio_chip {
-	struct gpio_chip gc;
-	void (*save_regs)(struct of_mm_gpio_chip *mm_gc);
-	void __iomem *regs;
-};
-
-static inline struct of_mm_gpio_chip *to_of_mm_gpio_chip(struct gpio_chip *gc)
-{
-	return container_of(gc, struct of_mm_gpio_chip, gc);
-}
-
-extern int of_mm_gpiochip_add_data(struct device_node *np,
-				   struct of_mm_gpio_chip *mm_gc,
-				   void *data);
-extern void of_mm_gpiochip_remove(struct of_mm_gpio_chip *mm_gc);
-
-#endif /* __LINUX_GPIO_LEGACY_OF_MM_GPIO_CHIP_H */
-- 
2.49.0


