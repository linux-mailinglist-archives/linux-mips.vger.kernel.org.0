Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D3D138BAAE
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 02:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234927AbhEUAGa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 20:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234852AbhEUAG0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 20:06:26 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3BEC061574;
        Thu, 20 May 2021 17:05:03 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id v12so10012156plo.10;
        Thu, 20 May 2021 17:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2DQOrp/2nBQQBAnbdNXHFx/Lg5dT9OWRcZXgoZ6JVwA=;
        b=M1g4QPrvuUpA6oe5QcQc9LE9VQvKlE5cblnk3B5EUw5qE917I5k1+J9mJ9GNmfo9SE
         75oFZzpPNNVUbBWoBBpBvfExicC3MhxzxGbO1MGg4VbcaVdIL/AXgYB5WQat3ao0BazI
         XljUG19F6f8QpVZvB0M31Fd4q66WMKGub4j3iH5hTUXn2GPDDovETtdyJpcmNiUJ/iaz
         AaAhysVXPw5qDuhCMEg6fzfKCHX/FAvtzFahOtAMbwx5ynsX3DhYQAHItYy7PynKPtkS
         9ZSKshW9asjeZzGhsL3B4q6Gg80ocpvXLqZkPtPpJu+5ausYbVddqMNcnCc6S47fAatR
         NVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2DQOrp/2nBQQBAnbdNXHFx/Lg5dT9OWRcZXgoZ6JVwA=;
        b=rN0yYPmXotlKcrs8/UcieHrABLQf+ykVFo1NPKYk3WnmA6QEN24zF5lTOlLGbATc5O
         nKzqNfCYYbCeWlTQ/Nn3CLOA+bOYgyBRysM4nFZSx7CkpSRElzfFHOlYDm73/ZlCT5Mm
         /SRB5xmDnNrBR75nqQDZqNmmFyG56oJb7GaBQEzbkM4m8YItFlAkStsV7bPtcMtP695+
         P81Wt2Bb9+WkC/OJnDbWK1gQa+byg2qRRHEXmfYcivxeCWRZbr/7XaRQAUzjXwK6ULlG
         1pscYxvBihgZFhjkJKjeLZ+CaDvrEhIwaGoL3A0Mqa93kxArItqb+me8GfjlpqAVc4RG
         Nzzw==
X-Gm-Message-State: AOAM5324qg3WrH3oZWk2Eiz/Fc6+eImnScFy1Xk9ztc0TXWEpXKYltYa
        YUuGzU623EFLPu05X6Jr1V/8aPgEIOQO3A==
X-Google-Smtp-Source: ABdhPJyj5oovAUjQ+7HRZhKMz3f96P13YumlJRw+FUoH693DLPZBxupjJVAqpsWEIOUtjC7dtACL0Q==
X-Received: by 2002:a17:902:dccc:b029:f1:c207:b10b with SMTP id t12-20020a170902dcccb02900f1c207b10bmr8861300pll.41.1621555502255;
        Thu, 20 May 2021 17:05:02 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([117.173.227.56])
        by smtp.gmail.com with ESMTPSA id t22sm2736016pfl.50.2021.05.20.17.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 17:05:01 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH 3/3] MIPS: Loongson1B: Add Loongson1 NAND device
Date:   Fri, 21 May 2021 08:04:05 +0800
Message-Id: <20210521000405.4387-4-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521000405.4387-1-keguang.zhang@gmail.com>
References: <20210521000405.4387-1-keguang.zhang@gmail.com>
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

