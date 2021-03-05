Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C9432F2BA
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 19:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbhCESfr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 13:35:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbhCESfV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 13:35:21 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6696FC061764;
        Fri,  5 Mar 2021 10:32:56 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 18so5232762lff.6;
        Fri, 05 Mar 2021 10:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PjTLZM8e0f8v+1gejOLEjQVfC8/951TSPeQCDviKHHE=;
        b=c8F10EakFYE4/GxV/Ief/dUTChUo0NchyO0rnDhbLxOyUZfkKNYBftoGuYnc36qNMJ
         r1XcWF+15ill/E+3tHDr25e/llt/sx6YWztfmXDm/mkU7JISLDy00OFAbT93OFB7uJUL
         BR+3e5PcxLZx90OYTyt0GEmqaDaLaPcV6DwYkHxWnXgrffPTHd7RkCq60EZ2oMnJm4uO
         ZjyhZWe1Ci8+rKxdI3+OHSKhi1Gz0843TQXjNkV9WC4rSq86g/SKuivYJW0N0dUVmVWP
         Hf3aYuls75QFDoObpxEDQmMaq6aSZeOI8/wGjJoNl03jfI7aTbGR1Yb8hD1MJfad/Fcs
         HdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PjTLZM8e0f8v+1gejOLEjQVfC8/951TSPeQCDviKHHE=;
        b=bqVjfXTlKKGBJPIuTq7KFiV/cIJPtrqj3ZLI2ZF8pWtzYWHvsTwg48rRh6EL/jXq3x
         9M7kRxoeCTJpbINa6ca6fN6EwEFMaM+9iENLFGOfpZxNgMI8F++6JJCAAx8L7AzVV1lX
         XAPiCVuQPX2lfvzHWOL21hzOhY+5N9l7TPazTTTydqhdkIystep8lqiytQFIkSYRumWx
         7hIItNDJr7Joa/Xn5KOvlWNu0ELPvS63PMJ+C7AxE+Bqd5ltrNjN2zbMM1bDqaPzMqxE
         K4IDYS5uRUzh7HnNqBuifqh6cKR2Nj8iKsmuxoZsvhMODnd/AmVv/AnahALghy5esFGF
         4wSw==
X-Gm-Message-State: AOAM533PngwPxma5nQ1CMWp3ZSN6xxK6WP77R/a1vM3UuUYJNqrfTtM3
        qdpPgxwRnMnkfOjkMSKfz+U=
X-Google-Smtp-Source: ABdhPJxSdmXgEv6uNaFa3yqkiHSVOFdEspqIMjmdF5gYiieNZhHq+zLsvUcH7B5w/GDeXtbkwcvLYA==
X-Received: by 2002:a19:4c41:: with SMTP id z62mr6035631lfa.360.1614969174885;
        Fri, 05 Mar 2021 10:32:54 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id a10sm396571lfu.263.2021.03.05.10.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:32:54 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] nvmem: brcm_nvram: new driver exposing Broadcom's NVRAM
Date:   Fri,  5 Mar 2021 19:32:36 +0100
Message-Id: <20210305183236.11784-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305183236.11784-1-zajec5@gmail.com>
References: <20210305183236.11784-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This driver provides access to Broadcom's NVRAM.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Applied Srinivas's suggestions:
    * Simplified brcm_nvram_read
    * Drop unneeded check & prints from probe
    * Fixed MODULE_LICENSE
    * Switched to Broadcom specific binding & driver. This is such a trivial
      driver that even if we get another similar one, it probably won't be worth
      it to share their code.
    Thank you Srinivas!
---
 drivers/nvmem/Kconfig      |  9 +++++
 drivers/nvmem/Makefile     |  2 +
 drivers/nvmem/brcm_nvram.c | 78 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/nvmem/brcm_nvram.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 75d2594c16e1..d2a848fab82a 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -278,4 +278,13 @@ config NVMEM_RMEM
 
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-rmem.
+
+config NVMEM_BRCM_NVRAM
+	tristate "Broadcom's NVRAM support"
+	depends on ARCH_BCM_5301X || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  This driver provides support for Broadcom's NVRAM that can be accessed
+	  using I/O mapping.
+
 endif
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5376b8e0dae5..bbea1410240a 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -57,3 +57,5 @@ obj-$(CONFIG_SPRD_EFUSE)	+= nvmem_sprd_efuse.o
 nvmem_sprd_efuse-y		:= sprd-efuse.o
 obj-$(CONFIG_NVMEM_RMEM) 	+= nvmem-rmem.o
 nvmem-rmem-y			:= rmem.o
+obj-$(CONFIG_NVMEM_BRCM_NVRAM)	+= nvmem_brcm_nvram.o
+nvmem_brcm_nvram-y		:= brcm_nvram.o
diff --git a/drivers/nvmem/brcm_nvram.c b/drivers/nvmem/brcm_nvram.c
new file mode 100644
index 000000000000..bd2ecaaf4585
--- /dev/null
+++ b/drivers/nvmem/brcm_nvram.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl>
+ */
+
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+
+struct brcm_nvram {
+	struct device *dev;
+	void __iomem *base;
+};
+
+static int brcm_nvram_read(void *context, unsigned int offset, void *val,
+			   size_t bytes)
+{
+	struct brcm_nvram *priv = context;
+	u8 *dst = val;
+
+	while (bytes--)
+		*dst++ = readb(priv->base + offset++);
+
+	return 0;
+}
+
+static int brcm_nvram_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.name = "brcm-nvram",
+		.reg_read = brcm_nvram_read,
+	};
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct brcm_nvram *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	config.dev = dev;
+	config.priv = priv;
+	config.size = resource_size(res);
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
+}
+
+static const struct of_device_id brcm_nvram_of_match_table[] = {
+	{ .compatible = "brcm,nvram", },
+	{},
+};
+
+static struct platform_driver brcm_nvram_driver = {
+	.probe = brcm_nvram_probe,
+	.driver = {
+		.name = "brcm_nvram",
+		.of_match_table = brcm_nvram_of_match_table,
+	},
+};
+
+static int __init brcm_nvram_init(void)
+{
+	return platform_driver_register(&brcm_nvram_driver);
+}
+
+subsys_initcall_sync(brcm_nvram_init);
+
+MODULE_AUTHOR("Rafał Miłecki");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, brcm_nvram_of_match_table);
-- 
2.26.2

