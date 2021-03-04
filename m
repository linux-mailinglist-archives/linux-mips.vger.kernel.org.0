Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35BFF32D599
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 15:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhCDOnA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 09:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbhCDOmj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 09:42:39 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CFD9C06175F;
        Thu,  4 Mar 2021 06:41:58 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id t9so4464626ljt.8;
        Thu, 04 Mar 2021 06:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uaToOPE5Jw50VJdHITMFWjh+kkyiVY45ldzA1CqmWhE=;
        b=IFiRJE5Ufvpn4xyBUAOWEx+s44tz4E4fvv+Qfms4YFWawYDjnzHhTUY7undfh9VCBy
         Gu5GRIM625V9w6VQBmMenJCYW7cGGuH1AGAWLbRpVT+MdnqJ6CS1d+mbSx+01sdsdSLz
         MI8yjwCT4yHnOVOHjxzToA91uUkUp4bX3IBA/vtvts9xKpsmUnNoSVU2nB1JrzY9AIAF
         EIy3duM+Y1+i4OZx8l2ukolwogwsCIfZkKgVeto1jqtnaz72zBJ+2oVMBv7Iy9cJPev6
         KThARsywx+TWVi+rjEJZ1iKrIRYxeVjPMBMt5CGrWIQq9SdaFLajvvSa+QJ5MaY34lm8
         VYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uaToOPE5Jw50VJdHITMFWjh+kkyiVY45ldzA1CqmWhE=;
        b=JNISx/IyHiNIetJjuN8jcIUEKFNpkbLWS5SfqAc9+cK02F/1glBbeIpaA869nOmvsr
         MAzOdkUrUVQz9pMbpDYw0H+/gZ8IEAYKOmsfvUpheEm137S/AR0oQIiyz6jIfn1iD6pP
         zXmQh9SOCC37/BhIDo3MZU4XPBRgVW+ENcc4l4O0LAp3WM0rgW+fuTqrfKXSmlSSFAzi
         XZpALkc/heMDNu243WTVKOMgc5YBmdK1hKubVTTzzYocxX/PEFyA6xK7041W4OW7Hvt8
         BDIroqSc4WtS6xnGS1Jdikb+IxPG8GsDpo9fisQDwXhAB5LmX4JUiom6UEoBewWPvYpm
         nPXQ==
X-Gm-Message-State: AOAM533+byJkfDbZ8ag95uc7jDPQT/anf0lm3UcSY+TjtHVq7vUla25p
        GGHAznRO9zs8f8PnADIWA/Q=
X-Google-Smtp-Source: ABdhPJzmJPgT99W49RI/oOGskBC6aiEbDOVWhiQ3mevfIK/4fCpF4d++kbxPXhMFdMpNAEooWKxadQ==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr2607503ljk.50.1614868917081;
        Thu, 04 Mar 2021 06:41:57 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t17sm1396694lft.224.2021.03.04.06.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 06:41:56 -0800 (PST)
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
Subject: [PATCH 2/2] nvmem: iomap: new driver exposing NVMEM accessible using I/O mapping
Date:   Thu,  4 Mar 2021 15:41:32 +0100
Message-Id: <20210304144132.24098-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304144132.24098-1-zajec5@gmail.com>
References: <20210304144132.24098-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This is a generic NVMEM access method used e.g. by Broadcom for their
NVRAM on MIPS and Northstar devices.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/nvmem/Kconfig  |  7 +++
 drivers/nvmem/Makefile |  2 +
 drivers/nvmem/iomap.c  | 99 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 108 insertions(+)
 create mode 100644 drivers/nvmem/iomap.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 75d2594c16e1..3d5c5684685d 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -278,4 +278,11 @@ config NVMEM_RMEM
 
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-rmem.
+
+config NVMEM_IOMAP
+	tristate "I/O mapped NVMEM support"
+	depends on HAS_IOMEM
+	help
+	  This driver supports NVMEM that can be accessed using I/O mapping.
+
 endif
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5376b8e0dae5..88a3b6979c53 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -57,3 +57,5 @@ obj-$(CONFIG_SPRD_EFUSE)	+= nvmem_sprd_efuse.o
 nvmem_sprd_efuse-y		:= sprd-efuse.o
 obj-$(CONFIG_NVMEM_RMEM) 	+= nvmem-rmem.o
 nvmem-rmem-y			:= rmem.o
+obj-$(CONFIG_NVMEM_IOMAP)	+= nvmem_iomap.o
+nvmem_iomap-y			:= iomap.o
diff --git a/drivers/nvmem/iomap.c b/drivers/nvmem/iomap.c
new file mode 100644
index 000000000000..ab6b40858a64
--- /dev/null
+++ b/drivers/nvmem/iomap.c
@@ -0,0 +1,99 @@
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
+struct iomap {
+	struct device *dev;
+	void __iomem *base;
+};
+
+static int iomap_read(void *context, unsigned int offset, void *val,
+		      size_t bytes)
+{
+	struct iomap *priv = context;
+	u8 *src = priv->base + offset;
+	u8 *dst = val;
+	size_t tmp;
+
+	tmp = offset % 4;
+	memcpy_fromio(dst, src, tmp);
+	dst += tmp;
+	src += tmp;
+	bytes -= tmp;
+
+	tmp = rounddown(bytes, 4);
+	__ioread32_copy(dst, src, tmp / 4);
+	dst += tmp;
+	src += tmp;
+	bytes -= tmp;
+
+	memcpy_fromio(dst, src, bytes);
+
+	return 0;
+}
+
+static int iomap_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.name = "iomap",
+		.reg_read = iomap_read,
+	};
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	struct iomap *priv;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "Failed to get resource\n");
+		return -ENODEV;
+	}
+
+	priv->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->base)) {
+		dev_err(dev, "Failed to map resource: %ld\n", PTR_ERR(priv->base));
+		return PTR_ERR(priv->base);
+	}
+
+	config.dev = dev;
+	config.priv = priv;
+	config.size = resource_size(res);
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(dev, &config));
+}
+
+static const struct of_device_id iomap_of_match_table[] = {
+	{ .compatible = "brcm,nvram", },
+	{ .compatible = "nvmem-iomap", },
+	{},
+};
+
+static struct platform_driver iomap_driver = {
+	.probe = iomap_probe,
+	.driver = {
+		.name = "nvmem_iomap",
+		.of_match_table = iomap_of_match_table,
+	},
+};
+
+static int __init iomap_init(void)
+{
+	return platform_driver_register(&iomap_driver);
+}
+
+subsys_initcall_sync(iomap_init);
+
+MODULE_AUTHOR("Rafał Miłecki");
+MODULE_LICENSE("GPL v2");
+MODULE_DEVICE_TABLE(of, iomap_of_match_table);
-- 
2.26.2

