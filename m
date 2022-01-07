Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55AF4871BB
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jan 2022 05:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiAGESk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Jan 2022 23:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiAGESi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Jan 2022 23:18:38 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DDEC061245
        for <linux-mips@vger.kernel.org>; Thu,  6 Jan 2022 20:18:31 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id gp5so4201760pjb.0
        for <linux-mips@vger.kernel.org>; Thu, 06 Jan 2022 20:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I2q0RLyFEvzApTWH8i/Hld3NdelFtnpt84+oj/cYpCU=;
        b=SQyU3ghTPaqLNovq29VAHB6wUzPa5TJpT6xFoFGP7pQTKjLD3P5a1PcyMxoncbjQOb
         eoTTz2fmKTAWImEloxNpSqygN/IB9tsc7UNFqQ+VXbVoYwPSYT5Cf9pUJtiROvflahJQ
         /dwDyG6dLAqU2A0KxkrI9izCh56jORZ4ZrHbSeJpv+/Zd/gHwlVS38+qxzSZErSb9/1C
         Y+A9equKa2ZaEe6VIypJ7TCbpjqj5UJ3mZ64CYiwmuuFnuGw+aGSByLtnHvXbat1OQ70
         mJG3ToFWR74CC7fGKh1qjjVAjQWDhxpd7u+BK8kgqv3yVxaaYRVtienruXhR3ONBl/vI
         WX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I2q0RLyFEvzApTWH8i/Hld3NdelFtnpt84+oj/cYpCU=;
        b=jwI+og7fWTXOHDR5i/mCpDCa3R8xzevgxZ+fMDG9A3DTkCGU1P2k77Syudtf3VGMu4
         MCvomWaEupNhEaKQTYLK00wXbjq1lRxbAwhlVhw+USbSnZrnZAq3seDkQSygLDYNfYGl
         OqW3qgenCeYmWe/xI1JBdvzthAQxYS7d8oZoK3Msd1mPfy164bwVRlIafMwq5zG1A7lm
         2rDPnbZrAkh8XMB+K6KvmZxuO+VHNY3YkI9GEdVPafgz/+35og4IUgn1I0XrwlZ/gt4D
         LZGUJoh2ppF8zyLMuKL2CyMYCHlKaHEVuCR9e1jYsOCuDpE27Ou6auJDgETzGjny2uAS
         gmRg==
X-Gm-Message-State: AOAM533+vmnc4kOTyMDd27jQ96UEhvdPJzLlFdccQ9eBDZ0UauEjHGkf
        sY0FQbZ/D4wSN1UoIyGeqEMIazO95no=
X-Google-Smtp-Source: ABdhPJxOUA6eB5TBXNsUjGvi1vDivaEZOBDyrMPi9VnEbgGBmY5R3OdCaM5vYcBBmdSO0tuSJQ0wxw==
X-Received: by 2002:a17:902:9343:b0:148:a2e7:fb5f with SMTP id g3-20020a170902934300b00148a2e7fb5fmr65004517plp.160.1641529111059;
        Thu, 06 Jan 2022 20:18:31 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id nv2sm4299264pjb.12.2022.01.06.20.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 20:18:30 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] bcma: get SoC device struct & assign dma_mask
Date:   Thu,  6 Jan 2022 20:17:44 -0800
Message-Id: <20220107041744.2388470-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

For bus devices to be fully usable it's required to set their DMA
parameters.

For years it has been missing and remained unnoticed because of
mips_dma_alloc_coherent() silently handling the empty coherent_dma_mask.
Kernel 4.19 came with a lot of DMA changes and caused a regression on
the bcm47xx. Starting with the commit f8c55dc6e828 ("MIPS: use generic
dma noncoherent ops for simple noncoherent platforms") DMA coherent
allocations just fail. Example:
[    1.114914] bgmac_bcma bcma0:2: Allocation of TX ring 0x200 failed
[    1.121215] bgmac_bcma bcma0:2: Unable to alloc memory for DMA
[    1.127626] bgmac_bcma: probe of bcma0:2 failed with error -12
[    1.133838] bgmac_bcma: Broadcom 47xx GBit MAC driver loaded

This change fixes above regression in addition to the MIPS bcm47xx
commit 321c46b91550 ("MIPS: BCM47XX: Setup struct device for the SoC").

It also fixes another *old* GPIO regression caused by a parent pointing
to the NULL:
[    0.157054] missing gpiochip .dev parent pointer
[    0.157287] bcma: bus0: Error registering GPIO driver: -22
introduced by the commit 74f4e0cc6108 ("bcma: switch GPIO portions to
use GPIOLIB_IRQCHIP").

Fixes: f8c55dc6e828 ("MIPS: use generic dma noncoherent ops for simple noncoherent platforms")
Fixes: 74f4e0cc6108 ("bcma: switch GPIO portions to use GPIOLIB_IRQCHIP")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
Christoph,

I don't know if this is what you had in mind. I am also not sure if we
should have the bcma_bus_type implement .dma_configure and set it to
platform_dma_configure?

 drivers/bcma/host_soc.c | 2 ++
 drivers/bcma/main.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/bcma/host_soc.c b/drivers/bcma/host_soc.c
index 90d5bdc12e03..fd2e8ff17c76 100644
--- a/drivers/bcma/host_soc.c
+++ b/drivers/bcma/host_soc.c
@@ -191,6 +191,8 @@ int __init bcma_host_soc_init(struct bcma_soc *soc)
 	struct bcma_bus *bus = &soc->bus;
 	int err;
 
+	bus->dev = soc->dev;
+
 	/* Scan bus and initialize it */
 	err = bcma_bus_early_register(bus);
 	if (err)
diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index 8e7ca3e4c8c4..6793c2ff60fd 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -253,6 +253,8 @@ void bcma_prepare_core(struct bcma_bus *bus, struct bcma_device *core)
 		if (IS_ENABLED(CONFIG_OF) && bus->dev) {
 			core->dma_dev = bus->dev;
 		} else {
+			if (!core->dev.coherent_dma_mask)
+				core->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 			core->dev.dma_mask = &core->dev.coherent_dma_mask;
 			core->dma_dev = &core->dev;
 		}
-- 
2.25.1

