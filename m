Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0F432AF74
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 04:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237368AbhCCAW6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Mar 2021 19:22:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239808AbhCBH4G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Mar 2021 02:56:06 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F2A8C06178A;
        Mon,  1 Mar 2021 23:44:45 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id k12so13708032ljg.9;
        Mon, 01 Mar 2021 23:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gZNTatbnHb+7B3cifLvu1nq4X6pcmEEmjpKFoMb/vdM=;
        b=veyh53ntviSLpdEMoBgWaX81jpp5Z5M40bdVat+k0hrZxC1K7QftkvE5LYiCpZH4lO
         HRaoEtTrY/yAe/gcoByU+9de1fYwZXVHvJ72j5hEr/10dL2FOj2spoG9fxfAj1uCZ3UU
         iKHnmUrfVsKensHxhw8pM5aPC5WagNMRTZ3mAfZxZYppBGLh63T3CuYwxKGKBS+vdrJE
         XUkzZyoa9RqbIPTjCj1hDMJNDcIkv60n1vusMsRVfqwnyCZzQP8QRssrauL5RSuy7m6N
         368MAm97lWLGpQpZD4UPRC++8vJbOiLI7kZHmSjk15BxcW1s53rqECzyBdHjOTuxvN9V
         kdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gZNTatbnHb+7B3cifLvu1nq4X6pcmEEmjpKFoMb/vdM=;
        b=JEt2WU9Wjw1gnVRYUtmuC7qr1xhiqDN8VM8A/6eJ/Re0VOARmkDFh89kt/6CL2gzGH
         SPhV2tfG0AQWXSni/Rcbx6UbOtRa2O95tuUk3MacGum4FDlnO3J1bvwvkro5B3RZBwxB
         LnwAWDhyFGSYpCz7CfQNgFSLAEaCHnV3TbHxtk3olKAGclmixjVPTWZI22mvrzOVh23r
         Vm1LTpDofXqVJKapQs9B9SiAINi7v7sYYY2mwroWStK7EgpbeGrCvImW+kSkiNsvooPF
         5qDPW+RBDfUmreh+0jt8nqC79S/LxXDEWXddfb/87D0huBmTvQBudUlrWnW2OdTik5yN
         KoRw==
X-Gm-Message-State: AOAM533NPR45NvAlH9l4aNMB/M/2yB+fC5NY+Tk0Tje8dSp1KiSDUq8e
        MZfWpA382PjYse4PUmynHwE=
X-Google-Smtp-Source: ABdhPJy5WZKx8Db12jFNbVaHP3Fz1Red+MdnyuyzuB4bQ3KfRZmKcM41nCu17nw2QIiZIENKiPhvqQ==
X-Received: by 2002:a2e:140e:: with SMTP id u14mr11582726ljd.413.1614671083925;
        Mon, 01 Mar 2021 23:44:43 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id e15sm2552600lfs.83.2021.03.01.23.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 23:44:43 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Vivek Unune <npcomplete13@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH stblinux.git 2/2] firmware: bcm47xx_nvram: support platform device "brcm,nvram"
Date:   Tue,  2 Mar 2021 08:44:05 +0100
Message-Id: <20210302074405.18998-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302074405.18998-1-zajec5@gmail.com>
References: <20210302074405.18998-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Add support for platform device providing mapping resource. This allows
reading NVRAM based on DT mapping binding. It's required for devices
that boot depending on NVRAM stored setup and provides early access to
NVRAM data.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
bcm47xx_nvram driver was originally added through MIPS tree, but this
change doesn't affect BCM47XX (MIPS) as it doesn't use DT. It targets
ARCH_BCM_5301X so I suggest this goes through the stblinux.git tree.
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 55 +++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 835ece9c00f1..d5d19dd1b9e1 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/mtd/mtd.h>
+#include <linux/platform_device.h>
 #include <linux/bcm47xx_nvram.h>
 
 #define NVRAM_MAGIC			0x48534C46	/* 'FLSH' */
@@ -162,6 +163,60 @@ static int nvram_init(void)
 	return -ENXIO;
 }
 
+static int brcm_nvram_probe(struct platform_device *pdev)
+{
+	struct nvram_header __iomem *header;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
+	void __iomem *mmio;
+	size_t copy_len;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "Failed to get resource\n");
+		return -ENODEV;
+	}
+
+	mmio = ioremap(res->start, resource_size(res));
+	if (!mmio)
+		return -ENOMEM;
+
+	header = (struct nvram_header *)mmio;
+	copy_len = DIV_ROUND_UP(sizeof(*header) + header->len, 4);
+	if (header->magic != NVRAM_MAGIC) {
+		dev_err(dev, "No NVRAM found at %pR\n", res);
+		return -EPROTO;
+	} else if (copy_len > resource_size(res)) {
+		dev_err(dev, "NVRAM size exceeds %pR\n", res);
+		return -ERANGE;
+	} else if (copy_len >= NVRAM_SPACE) {
+		dev_err(dev, "NVRAM size exceeds buffer size %d\n", NVRAM_SPACE);
+		return -ENOMEM;
+	}
+
+	__ioread32_copy(nvram_buf, mmio, copy_len);
+	nvram_buf[NVRAM_SPACE - 1] = '\0';
+
+	iounmap(mmio);
+
+	return 0;
+}
+
+static const struct of_device_id brcm_nvram_of_match[] = {
+	{ .compatible = "brcm,nvram "},
+	{},
+};
+
+static struct platform_driver brcm_nvram_driver = {
+	.driver = {
+		.name = "brcm_nvram",
+		.of_match_table = brcm_nvram_of_match,
+	},
+	.probe	= brcm_nvram_probe,
+};
+
+module_platform_driver(brcm_nvram_driver);
+
 int bcm47xx_nvram_getenv(const char *name, char *val, size_t val_len)
 {
 	char *var, *value, *end, *eq;
-- 
2.26.2

