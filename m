Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269453918E1
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 15:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234191AbhEZNdd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 May 2021 09:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbhEZNda (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 May 2021 09:33:30 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEF8EC061574;
        Wed, 26 May 2021 06:31:56 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id m8-20020a17090a4148b029015fc5d36343so348284pjg.1;
        Wed, 26 May 2021 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2DQOrp/2nBQQBAnbdNXHFx/Lg5dT9OWRcZXgoZ6JVwA=;
        b=TAHBfywIJjcUTa3g6EdBZMf97q5GVuhNpYDBMsBl1qv9cxFUXdoftHJP/B6tbacO50
         2fU1sw23THJI5V+MlRBEar0IHV7xquEBiW/D8qOosOo34DhaH9V9e+TKFwFZvugiVMxS
         Ec9lao6GayyjmYaZzFa+YyrgYIH0CfQPMic5xv9PX1KB1+0kX5Fo5Sn5YZodUG0wCYx5
         5qWOJq60YzURUDqaRy3FCl45psUlvMSShlfYe7Sy7oEEO/AxwO/rGUPPaAP/KSnreLsi
         wZSiyg3VngLbx7iMYLYrtFYx4JqlaSNwM4EdfewKrPs84Pf7VgBojD4q7dGkY+AkIAM/
         uPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2DQOrp/2nBQQBAnbdNXHFx/Lg5dT9OWRcZXgoZ6JVwA=;
        b=k+QowEya+D60TtcTxMnQRc0iqeRuzpiRMSJjZcTND/E74+6s6H2BC3vm5dGZ8flBMt
         vQjdRwwxqit5xFUCVt5lGvFxi0ubIgPOD9+frbuvD0DV+UBiLJmdGgHdfVcP2sO+sL1h
         mJFLcDTpSlBzSIfSBzvH0dU5JIPCGML+33E6g+4N/xZyN8Qkn88qnCLOMNOX58a+IvVo
         kVEh6b0O2Eh3q1FQKZNgiGSbdJJLsKynGINYRcc9cMYcmtde36EBIBC47Nl19/lormAC
         ZFiAmCNUJkarXXbgu3dmdfivilG1KzPnmMWbe/zSFmNC7gMlbzZtV1fsSZHCtownWNtz
         ixMw==
X-Gm-Message-State: AOAM532g6kOTUSh6UDH/Sk3jhveX5EhvKq4HZkzGyJ3D7f0VNYQIVNob
        x/exUq4yJCnPjHAJJWJUaPHj4gfiQ477LA==
X-Google-Smtp-Source: ABdhPJxgfuFx7lRZrK8PscSYRLNl8OgdCtBeJRBDOk+Odtd1M8dO2nmSSdnXeBbLSKGVUQ9aZC37UQ==
X-Received: by 2002:a17:903:20cc:b029:f0:cc11:51c2 with SMTP id i12-20020a17090320ccb02900f0cc1151c2mr35990343plb.32.1622035915869;
        Wed, 26 May 2021 06:31:55 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([112.45.97.46])
        by smtp.gmail.com with ESMTPSA id a15sm15223088pff.128.2021.05.26.06.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:31:55 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH V1 3/4] MIPS: Loongson1B: Add Loongson1 NAND device
Date:   Wed, 26 May 2021 21:30:59 +0800
Message-Id: <20210526133100.436048-4-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526133100.436048-1-keguang.zhang@gmail.com>
References: <20210526133100.436048-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch adds NAND device and its platform data for Loongson1B.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 .../include/asm/mach-loongson32/platform.h    |  2 ++
 arch/mips/loongson32/common/platform.c        | 27 +++++++++++++++++++
 arch/mips/loongson32/ls1b/board.c             | 22 +++++++++++++++
 3 files changed, 51 insertions(+)

diff --git a/arch/mips/include/asm/mach-loongson32/platform.h b/arch/mips/include/asm/mach-loongson32/platform.h
index d4d2a9baacdb..daf02b5c83a7 100644
--- a/arch/mips/include/asm/mach-loongson32/platform.h
+++ b/arch/mips/include/asm/mach-loongson32/platform.h
@@ -19,11 +19,13 @@ extern struct platform_device ls1x_eth1_pdev;
 extern struct platform_device ls1x_ehci_pdev;
 extern struct platform_device ls1x_gpio0_pdev;
 extern struct platform_device ls1x_gpio1_pdev;
+extern struct platform_device ls1x_nand_pdev;
 extern struct platform_device ls1x_rtc_pdev;
 extern struct platform_device ls1x_wdt_pdev;
 
 void __init ls1x_clk_init(void);
 void __init ls1x_dma_set_platdata(struct plat_ls1x_dma *pdata);
+void __init ls1x_nand_set_platdata(struct plat_ls1x_nand *pdata);
 void __init ls1x_rtc_set_extclk(struct platform_device *pdev);
 void __init ls1x_serial_set_uartclk(struct platform_device *pdev);
 
diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
index 2092a7ff32e0..d47a84ecf193 100644
--- a/arch/mips/loongson32/common/platform.c
+++ b/arch/mips/loongson32/common/platform.c
@@ -287,6 +287,33 @@ struct platform_device ls1x_gpio1_pdev = {
 	.resource	= ls1x_gpio1_resources,
 };
 
+/* NAND Flash */
+static struct resource ls1x_nand_resources[] = {
+	[0] = {
+		.start	= LS1X_NAND_BASE,
+		.end	= LS1X_NAND_BASE + SZ_32 - 1,
+		.flags	= IORESOURCE_MEM,
+	},
+	[1] = {
+		.name	= "dmachan0",
+		.start	= LS1X_DMA_CHANNEL0,
+		.end	= LS1X_DMA_CHANNEL0,
+		.flags	= IORESOURCE_DMA,
+	},
+};
+
+struct platform_device ls1x_nand_pdev = {
+	.name		= "ls1x-nand",
+	.id		= -1,
+	.num_resources	= ARRAY_SIZE(ls1x_nand_resources),
+	.resource	= ls1x_nand_resources,
+};
+
+void __init ls1x_nand_set_platdata(struct plat_ls1x_nand *pdata)
+{
+	ls1x_nand_pdev.dev.platform_data = pdata;
+}
+
 /* USB EHCI */
 static u64 ls1x_ehci_dmamask = DMA_BIT_MASK(32);
 
diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson32/ls1b/board.c
index 2be4d8544444..dd5a0ce9e4fb 100644
--- a/arch/mips/loongson32/ls1b/board.c
+++ b/arch/mips/loongson32/ls1b/board.c
@@ -23,6 +23,26 @@ struct plat_ls1x_dma ls1x_dma_pdata = {
 	.slavecnt = ARRAY_SIZE(ls1x_dma_slave_map),
 };
 
+static struct mtd_partition ls1x_nand_parts[] = {
+	{
+		.name        = "kernel",
+		.offset      = 0,
+		.size        = SZ_16M,
+	},
+	{
+		.name        = "rootfs",
+		.offset      = MTDPART_OFS_APPEND,
+		.size        = MTDPART_SIZ_FULL,
+	},
+};
+
+struct plat_ls1x_nand ls1x_nand_pdata = {
+	.parts		= ls1x_nand_parts,
+	.nr_parts	= ARRAY_SIZE(ls1x_nand_parts),
+	.hold_cycle	= 0x2,
+	.wait_cycle	= 0xc,
+};
+
 static const struct gpio_led ls1x_gpio_leds[] __initconst = {
 	{
 		.name			= "LED9",
@@ -53,6 +73,7 @@ static struct platform_device *ls1b_platform_devices[] __initdata = {
 	&ls1x_ehci_pdev,
 	&ls1x_gpio0_pdev,
 	&ls1x_gpio1_pdev,
+	&ls1x_nand_pdev,
 	&ls1x_rtc_pdev,
 	&ls1x_wdt_pdev,
 };
@@ -61,6 +82,7 @@ static int __init ls1b_platform_init(void)
 {
 	ls1x_serial_set_uartclk(&ls1x_uart_pdev);
 	ls1x_dma_set_platdata(&ls1x_dma_pdata);
+	ls1x_nand_set_platdata(&ls1x_nand_pdata);
 
 	gpio_led_register_device(-1, &ls1x_led_pdata);
 
-- 
2.30.2

