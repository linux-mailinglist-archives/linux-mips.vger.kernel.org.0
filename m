Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7176D38BAAC
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 02:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234883AbhEUAGZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 20:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234849AbhEUAGV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 20:06:21 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A20BC061574;
        Thu, 20 May 2021 17:04:59 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id v12so10012090plo.10;
        Thu, 20 May 2021 17:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v7TpLTV4vsoKBG/fnm3hLhrh2W548ux1D/aVpANdFpI=;
        b=VSMD7tvcClM7J6cKEVOkwIGTqAYrGVuQIY9FFniKguEN1z50nLg66po6lose8+fu6o
         DA7InAEuNj/1pQ5fFVqzSz5F8R777azAXHNGONbArjQeJEJaifrPrziAG7hxbxNHCjV3
         yXIBe+8cY5TZ7hWMlyhx6XCeaBzs+Ie6tkBdbCPnZBEEhbzJCxZKBfSRT8yb71LRvkji
         9NdeTYcY9eqpHn9UpDdwcpSz5wM9lFnwfqS8MSvLFwqcUmKUw0iFF9sQVpnXCIk79lm/
         xaRkpy9/enYBac1ngY6D1OqpHlArNQa5MonyrVfzyfPXYCxp2JJ1BU8rCXxp516vNOzg
         beiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v7TpLTV4vsoKBG/fnm3hLhrh2W548ux1D/aVpANdFpI=;
        b=p3R04BCWzp6HW+B9gVx8qxSXPpnfetVEgAlxOlfAmo8ZGuCt2Hx5XfH3Y7FJdQVYjK
         chNpE42v+C3d+mUWnUcf3/FdNNyWB/JTfNO9TFuauJg1Cbejv8F4Q0dBI8zfKyPFvzHD
         4Q7UnyJ8r7BipxYfCHfF9pfNv1drD3XaJQgB4oN7HdGctCWrdqoCUpS1kqIJDghMjxEX
         vefHhfTFy832gwh+G/sLmEoR1uT8NoA16esu6DnlRRMbc0z3mVMESpRmAAxJ/9WH+KyL
         FT62+q2AxMupzAdW1ml+INJX0yRnIGV94Q4rn01Km3DqRZrbZvcQxPGoYOC/hVPs6Rck
         IGYA==
X-Gm-Message-State: AOAM531A6Hx1oPVr9OTTdL/817HCbjzH1jJhPLo8lIcjlXhys9Fp3Syh
        AlTjQjaIKd+PNUAnRU9QwWhXMPH1p5ARig==
X-Google-Smtp-Source: ABdhPJyF9EiFy+ptQeujBjFfQDYOBewrafLc42wM7cIG4TeZRY2vcCNUoODbZ+2RnJPL3VevwTa7Rg==
X-Received: by 2002:a17:902:dac9:b029:f2:bda7:a4b8 with SMTP id q9-20020a170902dac9b02900f2bda7a4b8mr8639734plx.15.1621555498350;
        Thu, 20 May 2021 17:04:58 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([117.173.227.56])
        by smtp.gmail.com with ESMTPSA id t22sm2736016pfl.50.2021.05.20.17.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 17:04:57 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH 2/3] MIPS: Loongson1B: Add Loongson1 dmaengine device
Date:   Fri, 21 May 2021 08:04:04 +0800
Message-Id: <20210521000405.4387-3-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521000405.4387-1-keguang.zhang@gmail.com>
References: <20210521000405.4387-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch adds DMA Engine device its platform data for Loongson1B.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 .../include/asm/mach-loongson32/platform.h    |  2 ++
 arch/mips/loongson32/common/platform.c        | 36 +++++++++++++++++++
 arch/mips/loongson32/ls1b/board.c             | 15 +++++++-
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson32/platform.h b/arch/mips/include/asm/mach-loongson32/platform.h
index eb83e2741887..d4d2a9baacdb 100644
--- a/arch/mips/include/asm/mach-loongson32/platform.h
+++ b/arch/mips/include/asm/mach-loongson32/platform.h
@@ -13,6 +13,7 @@
 
 extern struct platform_device ls1x_uart_pdev;
 extern struct platform_device ls1x_cpufreq_pdev;
+extern struct platform_device ls1x_dma_pdev;
 extern struct platform_device ls1x_eth0_pdev;
 extern struct platform_device ls1x_eth1_pdev;
 extern struct platform_device ls1x_ehci_pdev;
@@ -22,6 +23,7 @@ extern struct platform_device ls1x_rtc_pdev;
 extern struct platform_device ls1x_wdt_pdev;
 
 void __init ls1x_clk_init(void);
+void __init ls1x_dma_set_platdata(struct plat_ls1x_dma *pdata);
 void __init ls1x_rtc_set_extclk(struct platform_device *pdev);
 void __init ls1x_serial_set_uartclk(struct platform_device *pdev);
 
diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
index 794c96c2a4cd..2092a7ff32e0 100644
--- a/arch/mips/loongson32/common/platform.c
+++ b/arch/mips/loongson32/common/platform.c
@@ -77,6 +77,42 @@ struct platform_device ls1x_cpufreq_pdev = {
 	},
 };
 
+/* DMA */
+static struct resource ls1x_dma_resources[] = {
+	[0] = {
+		.start = LS1X_DMAC_BASE,
+		.end = LS1X_DMAC_BASE + SZ_4 - 1,
+		.flags = IORESOURCE_MEM,
+	},
+	[1] = {
+		.start = LS1X_DMA0_IRQ,
+		.end = LS1X_DMA0_IRQ,
+		.flags = IORESOURCE_IRQ,
+	},
+	[2] = {
+		.start = LS1X_DMA1_IRQ,
+		.end = LS1X_DMA1_IRQ,
+		.flags = IORESOURCE_IRQ,
+	},
+	[3] = {
+		.start = LS1X_DMA2_IRQ,
+		.end = LS1X_DMA2_IRQ,
+		.flags = IORESOURCE_IRQ,
+	},
+};
+
+struct platform_device ls1x_dma_pdev = {
+	.name		= "ls1x-dma",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(ls1x_dma_resources),
+	.resource	= ls1x_dma_resources,
+};
+
+void __init ls1x_dma_set_platdata(struct plat_ls1x_dma *pdata)
+{
+	ls1x_dma_pdev.dev.platform_data = pdata;
+}
+
 /* Synopsys Ethernet GMAC */
 static struct stmmac_mdio_bus_data ls1x_mdio_bus_data = {
 	.phy_mask	= 0,
diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson32/ls1b/board.c
index 727e06718dab..2be4d8544444 100644
--- a/arch/mips/loongson32/ls1b/board.c
+++ b/arch/mips/loongson32/ls1b/board.c
@@ -12,6 +12,17 @@
 #include <nand.h>
 #include <platform.h>
 
+static const struct dma_slave_map ls1x_dma_slave_map[] = {
+	{ "ls1x-nand", "dmachan0", (void *)LS1X_DMA_CHANNEL0 },
+	{ "ls1x-ac97", "dmachan1", (void *)LS1X_DMA_CHANNEL1 },
+	{ "ls1x-ac97", "dmachan2", (void *)LS1X_DMA_CHANNEL2 },
+};
+
+struct plat_ls1x_dma ls1x_dma_pdata = {
+	.slave_map = ls1x_dma_slave_map,
+	.slavecnt = ARRAY_SIZE(ls1x_dma_slave_map),
+};
+
 static const struct gpio_led ls1x_gpio_leds[] __initconst = {
 	{
 		.name			= "LED9",
@@ -36,6 +47,7 @@ static const struct gpio_led_platform_data ls1x_led_pdata __initconst = {
 static struct platform_device *ls1b_platform_devices[] __initdata = {
 	&ls1x_uart_pdev,
 	&ls1x_cpufreq_pdev,
+	&ls1x_dma_pdev,
 	&ls1x_eth0_pdev,
 	&ls1x_eth1_pdev,
 	&ls1x_ehci_pdev,
@@ -48,11 +60,12 @@ static struct platform_device *ls1b_platform_devices[] __initdata = {
 static int __init ls1b_platform_init(void)
 {
 	ls1x_serial_set_uartclk(&ls1x_uart_pdev);
+	ls1x_dma_set_platdata(&ls1x_dma_pdata);
 
 	gpio_led_register_device(-1, &ls1x_led_pdata);
 
 	return platform_add_devices(ls1b_platform_devices,
-				   ARRAY_SIZE(ls1b_platform_devices));
+				    ARRAY_SIZE(ls1b_platform_devices));
 }
 
 arch_initcall(ls1b_platform_init);
-- 
2.30.2

