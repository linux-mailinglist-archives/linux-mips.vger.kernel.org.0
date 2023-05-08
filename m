Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1253E6FB962
	for <lists+linux-mips@lfdr.de>; Mon,  8 May 2023 23:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbjEHVUl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 May 2023 17:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjEHVU3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 May 2023 17:20:29 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D307B7DA9
        for <linux-mips@vger.kernel.org>; Mon,  8 May 2023 14:20:20 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f24ddf514eso1965630e87.0
        for <linux-mips@vger.kernel.org>; Mon, 08 May 2023 14:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683580819; x=1686172819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Wp4D72mqNcj1hIUm5lP7PH7jzGtATEkkvBitN4BceE=;
        b=lCM2EAQjej+CVzfwGSa6bzAVa5SNksMB7eQj4chXzlnjaGKnjBbVEyjLghCkJA6vCP
         gbZV55dTdX6EejrBxKuzBQZEwbijkEuaBQxEl+IZRhs/zDBfLEgoWoHTQbCorJJ3hqF+
         P5oByqye8JdxKM8+q32zcFYmYgw6tlnpQ7l5hSWL4CQ5Hu5UD0MyW/xhHb/PGwviKpLL
         6kPxC8FSLMmJ8nFERFvzc0v52pqV6MEOjo9QMKRH472WhUq5PBK/ZRaTBpkJ0upqJVhy
         +GHjUskHZTgzPftYVUPDAqMx4lElfmhMcW84h0TjEnibSJBb0tzkCx8dRkPUWiOObUfF
         Zcsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683580819; x=1686172819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Wp4D72mqNcj1hIUm5lP7PH7jzGtATEkkvBitN4BceE=;
        b=QngtjHny3wv/xjadKdh2TsXxRG2f/rw69GbJ9y4+mT8R59965NCN/wHSsLjWwvEAK9
         grz9KnHxjKpfQN1LmCOtbuFbEBUHHR3fS8WxAlQh+QKl2MwP+bUIvfWTykjCNS3fK/9H
         4jQ55VIpVAEV11iJuahgjGCVgJg917TGt0uDhpzNhYNFydVquRVtT07LSpQmEOJxWOrI
         3NOjurTMwznhYlHDqLlKdhs7ZS/nV6Ljlfw5adIpns46J7irzUkHtkwFATwZv6iVcreT
         1IaZBGmMqZTvGXnDJ9hnV+2C3V5czmnhpi1l9SUPg06J4MfRNqzyQYb1tgzTbqKMvZL8
         3apw==
X-Gm-Message-State: AC+VfDwRLZs7kKHnvAeJvGg7JTTSzzSsPrV9ixSX8Vor4SRvCHQ92iEb
        tjH191vN3JymxlhZQxGqySnHkQ==
X-Google-Smtp-Source: ACHHUZ7mlnb57iwM/DMxx5HpNDR8bOhvincshn4HXDxzPkfNKKo16wcXaH+9PYK9qfJSCU+EBlarUA==
X-Received: by 2002:ac2:5687:0:b0:4db:3882:8f42 with SMTP id 7-20020ac25687000000b004db38828f42mr131559lfr.45.1683580818982;
        Mon, 08 May 2023 14:20:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 4-20020ac24844000000b004edc3bd7fa1sm102164lfy.201.2023.05.08.14.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 14:20:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 08 May 2023 23:20:07 +0200
Subject: [PATCH v4 2/4] ARM/mmc: Convert old mmci-omap to GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230430-nokia770-regression-v4-2-9b6dc5536b17@linaro.org>
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
In-Reply-To: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Helge Deller <deller@gmx.de>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mmc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

A recent change to the OMAP driver making it use a dynamic GPIO
base created problems with some old OMAP1 board files, among
them Nokia 770, SX1 and also the OMAP2 Nokia n8x0.

Fix up all instances of GPIOs being used for the MMC driver
by pushing the handling of power, slot selection and MMC
"cover" into the driver as optional GPIOs.

This is maybe not the most perfect solution as the MMC
framework have some central handlers for some of the
stuff, but it at least makes the situtation better and
solves the immediate issue.

Fixes: 92bf78b33b0b ("gpio: omap: use dynamic allocation of base")
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-nokia770.c   | 43 ++++++-----------
 arch/arm/mach-omap1/board-sx1-mmc.c    |  1 -
 arch/arm/mach-omap2/board-n8x0.c       | 85 +++++++++++-----------------------
 drivers/mmc/host/omap.c                | 46 +++++++++++++++++-
 include/linux/platform_data/mmc-omap.h |  2 -
 5 files changed, 83 insertions(+), 94 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 8a1f2572deea..218c928f71b3 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -183,27 +183,23 @@ static struct omap_usb_config nokia770_usb_config __initdata = {
 
 #if IS_ENABLED(CONFIG_MMC_OMAP)
 
-#define NOKIA770_GPIO_MMC_POWER		41
-#define NOKIA770_GPIO_MMC_SWITCH	23
-
-static int nokia770_mmc_set_power(struct device *dev, int slot, int power_on,
-				int vdd)
-{
-	gpio_set_value(NOKIA770_GPIO_MMC_POWER, power_on);
-	return 0;
-}
-
-static int nokia770_mmc_get_cover_state(struct device *dev, int slot)
-{
-	return gpio_get_value(NOKIA770_GPIO_MMC_SWITCH);
-}
+static struct gpiod_lookup_table nokia770_mmc_gpio_table = {
+	.dev_id = "mmci-omap",
+	.table = {
+		/* Slot index 0, VSD power, GPIO 41 */
+		GPIO_LOOKUP_IDX("gpio-32-47", 9,
+				"vsd", 0, GPIO_ACTIVE_HIGH),
+		/* Slot index 0, switch, GPIO 23 */
+		GPIO_LOOKUP_IDX("gpio-16-31", 7,
+				"cover", 0, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
 
 static struct omap_mmc_platform_data nokia770_mmc2_data = {
 	.nr_slots                       = 1,
 	.max_freq                       = 12000000,
 	.slots[0]       = {
-		.set_power		= nokia770_mmc_set_power,
-		.get_cover_state	= nokia770_mmc_get_cover_state,
 		.ocr_mask               = MMC_VDD_32_33|MMC_VDD_33_34,
 		.name                   = "mmcblk",
 	},
@@ -213,20 +209,7 @@ static struct omap_mmc_platform_data *nokia770_mmc_data[OMAP16XX_NR_MMC];
 
 static void __init nokia770_mmc_init(void)
 {
-	int ret;
-
-	ret = gpio_request(NOKIA770_GPIO_MMC_POWER, "MMC power");
-	if (ret < 0)
-		return;
-	gpio_direction_output(NOKIA770_GPIO_MMC_POWER, 0);
-
-	ret = gpio_request(NOKIA770_GPIO_MMC_SWITCH, "MMC cover");
-	if (ret < 0) {
-		gpio_free(NOKIA770_GPIO_MMC_POWER);
-		return;
-	}
-	gpio_direction_input(NOKIA770_GPIO_MMC_SWITCH);
-
+	gpiod_add_lookup_table(&nokia770_mmc_gpio_table);
 	/* Only the second MMC controller is used */
 	nokia770_mmc_data[1] = &nokia770_mmc2_data;
 	omap1_init_mmc(nokia770_mmc_data, OMAP16XX_NR_MMC);
diff --git a/arch/arm/mach-omap1/board-sx1-mmc.c b/arch/arm/mach-omap1/board-sx1-mmc.c
index f1c160924dfe..f183a8448a7b 100644
--- a/arch/arm/mach-omap1/board-sx1-mmc.c
+++ b/arch/arm/mach-omap1/board-sx1-mmc.c
@@ -9,7 +9,6 @@
  * Copyright (C) 2007 Instituto Nokia de Tecnologia - INdT
  */
 
-#include <linux/gpio.h>
 #include <linux/platform_device.h>
 
 #include "hardware.h"
diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index 3353b0a923d9..baa2f0341aed 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/gpio/machine.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/irq.h>
@@ -170,22 +171,32 @@ static struct spi_board_info n800_spi_board_info[] __initdata = {
  * GPIO23 and GPIO9		slot 2 EMMC on N810
  *
  */
-#define N8X0_SLOT_SWITCH_GPIO	96
-#define N810_EMMC_VSD_GPIO	23
-#define N810_EMMC_VIO_GPIO	9
-
 static int slot1_cover_open;
 static int slot2_cover_open;
 static struct device *mmc_device;
 
-static int n8x0_mmc_switch_slot(struct device *dev, int slot)
-{
-#ifdef CONFIG_MMC_DEBUG
-	dev_dbg(dev, "Choose slot %d\n", slot + 1);
-#endif
-	gpio_set_value(N8X0_SLOT_SWITCH_GPIO, slot);
-	return 0;
-}
+static struct gpiod_lookup_table nokia8xx_mmc_gpio_table = {
+	.dev_id = "mmci-omap",
+	.table = {
+		/* Slot switch, GPIO 96 */
+		GPIO_LOOKUP("gpio-80-111", 16,
+			    "switch", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table nokia810_mmc_gpio_table = {
+	.dev_id = "mmci-omap",
+	.table = {
+		/* Slot index 1, VSD power, GPIO 23 */
+		GPIO_LOOKUP_IDX("gpio-16-31", 7,
+				"vsd", 1, GPIO_ACTIVE_HIGH),
+		/* Slot index 1, VIO power, GPIO 9 */
+		GPIO_LOOKUP_IDX("gpio-0-15", 9,
+				"vsd", 1, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
 
 static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
 					int power_on, int vdd)
@@ -256,31 +267,13 @@ static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
 	return 0;
 }
 
-static void n810_set_power_emmc(struct device *dev,
-					 int power_on)
-{
-	dev_dbg(dev, "Set EMMC power %s\n", power_on ? "on" : "off");
-
-	if (power_on) {
-		gpio_set_value(N810_EMMC_VSD_GPIO, 1);
-		msleep(1);
-		gpio_set_value(N810_EMMC_VIO_GPIO, 1);
-		msleep(1);
-	} else {
-		gpio_set_value(N810_EMMC_VIO_GPIO, 0);
-		msleep(50);
-		gpio_set_value(N810_EMMC_VSD_GPIO, 0);
-		msleep(50);
-	}
-}
-
 static int n8x0_mmc_set_power(struct device *dev, int slot, int power_on,
 			      int vdd)
 {
 	if (board_is_n800() || slot == 0)
 		return n8x0_mmc_set_power_menelaus(dev, slot, power_on, vdd);
 
-	n810_set_power_emmc(dev, power_on);
+	/* The n810 power will be handled by GPIO code in the driver */
 
 	return 0;
 }
@@ -418,13 +411,6 @@ static void n8x0_mmc_shutdown(struct device *dev)
 static void n8x0_mmc_cleanup(struct device *dev)
 {
 	menelaus_unregister_mmc_callback();
-
-	gpio_free(N8X0_SLOT_SWITCH_GPIO);
-
-	if (board_is_n810()) {
-		gpio_free(N810_EMMC_VSD_GPIO);
-		gpio_free(N810_EMMC_VIO_GPIO);
-	}
 }
 
 /*
@@ -433,7 +419,6 @@ static void n8x0_mmc_cleanup(struct device *dev)
  */
 static struct omap_mmc_platform_data mmc1_data = {
 	.nr_slots			= 0,
-	.switch_slot			= n8x0_mmc_switch_slot,
 	.init				= n8x0_mmc_late_init,
 	.cleanup			= n8x0_mmc_cleanup,
 	.shutdown			= n8x0_mmc_shutdown,
@@ -463,14 +448,9 @@ static struct omap_mmc_platform_data mmc1_data = {
 
 static struct omap_mmc_platform_data *mmc_data[OMAP24XX_NR_MMC];
 
-static struct gpio n810_emmc_gpios[] __initdata = {
-	{ N810_EMMC_VSD_GPIO, GPIOF_OUT_INIT_LOW,  "MMC slot 2 Vddf" },
-	{ N810_EMMC_VIO_GPIO, GPIOF_OUT_INIT_LOW,  "MMC slot 2 Vdd"  },
-};
-
 static void __init n8x0_mmc_init(void)
 {
-	int err;
+	gpiod_add_lookup_table(&nokia8xx_mmc_gpio_table);
 
 	if (board_is_n810()) {
 		mmc1_data.slots[0].name = "external";
@@ -483,20 +463,7 @@ static void __init n8x0_mmc_init(void)
 		 */
 		mmc1_data.slots[1].name = "internal";
 		mmc1_data.slots[1].ban_openended = 1;
-	}
-
-	err = gpio_request_one(N8X0_SLOT_SWITCH_GPIO, GPIOF_OUT_INIT_LOW,
-			       "MMC slot switch");
-	if (err)
-		return;
-
-	if (board_is_n810()) {
-		err = gpio_request_array(n810_emmc_gpios,
-					 ARRAY_SIZE(n810_emmc_gpios));
-		if (err) {
-			gpio_free(N8X0_SLOT_SWITCH_GPIO);
-			return;
-		}
+		gpiod_add_lookup_table(&nokia810_mmc_gpio_table);
 	}
 
 	mmc1_data.nr_slots = 2;
diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index ce78edfb402b..a14af21f12da 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -26,6 +26,7 @@
 #include <linux/clk.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_data/mmc-omap.h>
 
 
@@ -111,6 +112,9 @@ struct mmc_omap_slot {
 	struct mmc_request      *mrq;
 	struct mmc_omap_host    *host;
 	struct mmc_host		*mmc;
+	struct gpio_desc	*vsd;
+	struct gpio_desc	*vio;
+	struct gpio_desc	*cover;
 	struct omap_mmc_slot_data *pdata;
 };
 
@@ -133,6 +137,7 @@ struct mmc_omap_host {
 	int			irq;
 	unsigned char		bus_mode;
 	unsigned int		reg_shift;
+	struct gpio_desc	*slot_switch;
 
 	struct work_struct	cmd_abort_work;
 	unsigned		abort:1;
@@ -216,8 +221,13 @@ static void mmc_omap_select_slot(struct mmc_omap_slot *slot, int claimed)
 
 	if (host->current_slot != slot) {
 		OMAP_MMC_WRITE(host, CON, slot->saved_con & 0xFC00);
-		if (host->pdata->switch_slot != NULL)
-			host->pdata->switch_slot(mmc_dev(slot->mmc), slot->id);
+		if (host->slot_switch)
+			/*
+			 * With two slots and a simple GPIO switch, setting
+			 * the GPIO to 0 selects slot ID 0, setting it to 1
+			 * selects slot ID 1.
+			 */
+			gpiod_set_value(host->slot_switch, slot->id);
 		host->current_slot = slot;
 	}
 
@@ -297,6 +307,9 @@ static void mmc_omap_release_slot(struct mmc_omap_slot *slot, int clk_enabled)
 static inline
 int mmc_omap_cover_is_open(struct mmc_omap_slot *slot)
 {
+	/* If we have a GPIO then use that */
+	if (slot->cover)
+		return gpiod_get_value(slot->cover);
 	if (slot->pdata->get_cover_state)
 		return slot->pdata->get_cover_state(mmc_dev(slot->mmc),
 						    slot->id);
@@ -1106,6 +1119,11 @@ static void mmc_omap_set_power(struct mmc_omap_slot *slot, int power_on,
 
 	host = slot->host;
 
+	if (slot->vsd)
+		gpiod_set_value(slot->vsd, power_on);
+	if (slot->vio)
+		gpiod_set_value(slot->vio, power_on);
+
 	if (slot->pdata->set_power != NULL)
 		slot->pdata->set_power(mmc_dev(slot->mmc), slot->id, power_on,
 					vdd);
@@ -1240,6 +1258,23 @@ static int mmc_omap_new_slot(struct mmc_omap_host *host, int id)
 	slot->power_mode = MMC_POWER_UNDEFINED;
 	slot->pdata = &host->pdata->slots[id];
 
+	/* Check for some optional GPIO controls */
+	slot->vsd = gpiod_get_index_optional(host->dev, "vsd",
+					     id, GPIOD_OUT_LOW);
+	if (IS_ERR(slot->vsd))
+		return dev_err_probe(host->dev, PTR_ERR(slot->vsd),
+				     "error looking up VSD GPIO\n");
+	slot->vio = gpiod_get_index_optional(host->dev, "vio",
+					     id, GPIOD_OUT_LOW);
+	if (IS_ERR(slot->vio))
+		return dev_err_probe(host->dev, PTR_ERR(slot->vio),
+				     "error looking up VIO GPIO\n");
+	slot->cover = gpiod_get_index_optional(host->dev, "cover",
+						id, GPIOD_IN);
+	if (IS_ERR(slot->cover))
+		return dev_err_probe(host->dev, PTR_ERR(slot->cover),
+				     "error looking up cover switch GPIO\n");
+
 	host->slots[id] = slot;
 
 	mmc->caps = 0;
@@ -1349,6 +1384,13 @@ static int mmc_omap_probe(struct platform_device *pdev)
 	if (IS_ERR(host->virt_base))
 		return PTR_ERR(host->virt_base);
 
+	host->slot_switch = gpiod_get_optional(host->dev, "switch",
+					       GPIOD_OUT_LOW);
+	if (IS_ERR(host->slot_switch))
+		return dev_err_probe(host->dev, PTR_ERR(host->slot_switch),
+				     "error looking up slot switch GPIO\n");
+
+
 	INIT_WORK(&host->slot_release_work, mmc_omap_slot_release_work);
 	INIT_WORK(&host->send_stop_work, mmc_omap_send_stop_work);
 
diff --git a/include/linux/platform_data/mmc-omap.h b/include/linux/platform_data/mmc-omap.h
index 91051e9907f3..054d0c3c5ec5 100644
--- a/include/linux/platform_data/mmc-omap.h
+++ b/include/linux/platform_data/mmc-omap.h
@@ -20,8 +20,6 @@ struct omap_mmc_platform_data {
 	 * maximum frequency on the MMC bus */
 	unsigned int max_freq;
 
-	/* switch the bus to a new slot */
-	int (*switch_slot)(struct device *dev, int slot);
 	/* initialize board-specific MMC functionality, can be NULL if
 	 * not supported */
 	int (*init)(struct device *dev);

-- 
2.34.1

