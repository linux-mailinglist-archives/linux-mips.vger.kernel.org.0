Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70BC86178A3
	for <lists+linux-mips@lfdr.de>; Thu,  3 Nov 2022 09:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbiKCIZh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Nov 2022 04:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiKCIZe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 3 Nov 2022 04:25:34 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489C764FA
        for <linux-mips@vger.kernel.org>; Thu,  3 Nov 2022 01:25:33 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id f5so3232731ejc.5
        for <linux-mips@vger.kernel.org>; Thu, 03 Nov 2022 01:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UlW2y7VuJeAMvz9RJMxr1Fhv6BL6fjaEWjnn5aAAx14=;
        b=mbyhVJMFKkVLazUQTlD0KVtcMgCAFCKe+Mb30v5VaKANFlEBrRQOXlukzQqtS2GCOy
         GIpuhR/ba87m505+8XBpQjdq1xV06sYb+cIq1ztKo5c80eEfn+Qjw9mSO/z6N0JPBmHP
         mn7wWyKW890vEy5xMBIbkphkqfYtECdnoFav7UJYZ02hmZddpw5gN2RBbjz+F6LZ+c8p
         H54MUK8j1GAVnnKFY+tzpgvUXMA+wOBT1vtjKlX8swCzSR+JqJqeOp97CBqivuBbxy2i
         wmRwQnD3CsZojeK10yASdCnIdHKEj4qNMXdhebdb/DbRYMwyivcoMaBc//JFgyRqTzFq
         rAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlW2y7VuJeAMvz9RJMxr1Fhv6BL6fjaEWjnn5aAAx14=;
        b=UFfpzqaGsn6Bgu6YSetQMoJhe0EFfUmIiynqFjmGTQiS/IBDQ8gHYYtlSL+K3Qz+By
         kxNk8QSlLksrKEJF6K26v0soHzgdpIB7QCs4nTzLr3H1E+ykQONmSxIgsu9Lf815BufM
         OD6x5rudWje+gZT/uUw1dG3lSYGjsRoz1MF6M1bul/xu7BQAwJpwHc39GdeiPYEHVDUS
         sijiZPoLkEBhv4sxG+D+bY0u5qdmvVUP750u+lg6GNki3b/x8tx5Ucdb1VgDsuEU05qL
         lR9l9hKwOFerHeRQWAmJqsb6Gys7KUuPXsmmYP69v9PKx0ozAxHc8oiSdmPla7Q3eCG/
         /GsQ==
X-Gm-Message-State: ACrzQf3ZHm4BvX6voWM8CXeRenBdIDv5Vk0es2qzkdNfXjkQe5uZTrrL
        ZKM38JCfPhLlhz9IZkRo2V/+og==
X-Google-Smtp-Source: AMsMyM5ycI0v5R98Ww96M3YWMtiiy+RVt2mfUNKK2hVwIrHsuyXbyCx1Og36zeGYFhF1X/Ja02Ep2Q==
X-Received: by 2002:a17:906:3b48:b0:7ad:fa67:1daa with SMTP id h8-20020a1709063b4800b007adfa671daamr9113202ejf.653.1667463931779;
        Thu, 03 Nov 2022 01:25:31 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id m7-20020a1709066d0700b007add1c4dadbsm181057ejr.153.2022.11.03.01.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 01:25:31 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] firmware/nvram: bcm47xx: support init from IO memory
Date:   Thu,  3 Nov 2022 09:25:29 +0100
Message-Id: <20221103082529.359084-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

Provide NVMEM content to the NVRAM driver from a simple
memory resource. This is necessary to use NVRAM in a memory-
mapped flash device. Patch taken from OpenWrts development
tree.

This patch makes it possible to use memory-mapped NVRAM
on the D-Link DWL-8610AP and the D-Link DIR-890L.

Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
[Added an export for modules potentially using the init symbol]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This affects the ARM SoC in my case, but previous patches to
this driver were merged through the MIPS tree so I expect
Thomas to pick this up, if you prefer the SoC tree please
tell me and I will resend.
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 18 ++++++++++++++++++
 drivers/nvmem/brcm_nvram.c                |  3 +++
 include/linux/bcm47xx_nvram.h             |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index bd235833b687..5f47dbf4889a 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -110,6 +110,24 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 	return 0;
 }
 
+int bcm47xx_nvram_init_from_iomem(void __iomem *nvram_start, size_t res_size)
+{
+	if (nvram_len) {
+		pr_warn("nvram already initialized\n");
+		return -EEXIST;
+	}
+
+	if (!bcm47xx_nvram_is_valid(nvram_start)) {
+		pr_err("No valid NVRAM found\n");
+		return -ENOENT;
+	}
+
+	bcm47xx_nvram_copy(nvram_start, res_size);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(bcm47xx_nvram_init_from_iomem);
+
 /*
  * On bcm47xx we need access to the NVRAM very early, so we can't use mtd
  * subsystem to access flash. We can't even use platform device / driver to
diff --git a/drivers/nvmem/brcm_nvram.c b/drivers/nvmem/brcm_nvram.c
index 4441daa20965..34130449f2d2 100644
--- a/drivers/nvmem/brcm_nvram.c
+++ b/drivers/nvmem/brcm_nvram.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2021 Rafał Miłecki <rafal@milecki.pl>
  */
 
+#include <linux/bcm47xx_nvram.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -136,6 +137,8 @@ static int brcm_nvram_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	bcm47xx_nvram_init_from_iomem(priv->base, resource_size(res));
+
 	config.dev = dev;
 	config.cells = priv->cells;
 	config.ncells = priv->ncells;
diff --git a/include/linux/bcm47xx_nvram.h b/include/linux/bcm47xx_nvram.h
index 53b31f69b74a..7615f8d7b1ed 100644
--- a/include/linux/bcm47xx_nvram.h
+++ b/include/linux/bcm47xx_nvram.h
@@ -11,6 +11,7 @@
 #include <linux/vmalloc.h>
 
 #ifdef CONFIG_BCM47XX_NVRAM
+int bcm47xx_nvram_init_from_iomem(void __iomem *nvram_start, size_t res_size);
 int bcm47xx_nvram_init_from_mem(u32 base, u32 lim);
 int bcm47xx_nvram_getenv(const char *name, char *val, size_t val_len);
 int bcm47xx_nvram_gpio_pin(const char *name);
@@ -20,6 +21,11 @@ static inline void bcm47xx_nvram_release_contents(char *nvram)
 	vfree(nvram);
 };
 #else
+static inline int bcm47xx_nvram_init_from_iomem(void __iomem *nvram_start,
+						size_t res_size)
+{
+	return -ENOTSUPP;
+}
 static inline int bcm47xx_nvram_init_from_mem(u32 base, u32 lim)
 {
 	return -ENOTSUPP;
-- 
2.34.1

