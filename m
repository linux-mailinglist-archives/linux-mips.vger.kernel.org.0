Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279193309E3
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 10:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhCHJDt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 04:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhCHJDi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 04:03:38 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8783AC06174A;
        Mon,  8 Mar 2021 01:03:38 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id e7so19885739lft.2;
        Mon, 08 Mar 2021 01:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4NRGthBs+/q6+vesB70sO/ZVgC35VhS+qss/CaaE9UA=;
        b=hkPT+yy42ZOCPfhktzDUpM2IGYj7wGh/2f4CCg6AEIPGqZwCQg1TRWFEWFwjJcC0m3
         5srsz48WKVBlGs6zh3Oo9iBtN6fjmi/8KL8yRh7+0/yRgZm76/nG0DpSN3lX63NtcSa6
         CklF0TyYLpXSzIMkpIr84Xtvi9D0HcZ115Yy/IIr1CV8t94NKz3ebE+z5FrxEAdzz+5e
         k8YShFkerVs8rLlM0fj0xYzgnVAforElJ0KpjEcxld9K0CRxLFGT83J3QohmibZMp/X/
         w6wP8uIkhrRvGUpBffrDxA+y2ssw4Erjwt38TZEdnOo3z1IHyFLJCQ/hC+RYgg8RJol2
         q4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4NRGthBs+/q6+vesB70sO/ZVgC35VhS+qss/CaaE9UA=;
        b=d6gJG6F4BZtztw0qOdDcN2QYPxIPEsdybmcSVdeCK+UArt/hpbP44LL+uhJsq2a004
         xZYuDnMNQerdhkW5ie8ULKZXapUtD2DTyANSM3+Z43e3l5gHmMjO4es0+51pMOK2mP6x
         x4m8OzA4nkZ1vbZRsQuq4h0hsZLB5cvWuMdCjBJlv27I/fopPs4C8eplm32tlTVXaOUC
         cS5yn/2OnQcY00bzhgwwiAKbGm488gJbbVEY7W8jKnQLSxRXU/zFhrME3zht+wwcxevd
         aIOpfN9dP/lMaqPRSOGhnJFbPGbAPjlB8dgD5VEge2LQSftScX1YY5Bt0gyW0kRZeWWZ
         FU0w==
X-Gm-Message-State: AOAM531flX0mWNIPswaEjZTLrJ1T1Ncx6Xpi0GNRLwi2gkcooTQgc4Y3
        iTCUCKB97FidGMWm+168qIE=
X-Google-Smtp-Source: ABdhPJxawVsYQ9hY0VZC/ES9+JkCRXPfPnkqDEheTdpmlN7cJ+cczwO5v9XXATvai3xOKDK0Cfnnew==
X-Received: by 2002:a19:ab0a:: with SMTP id u10mr14637656lfe.540.1615194217138;
        Mon, 08 Mar 2021 01:03:37 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t13sm1410346ljk.47.2021.03.08.01.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 01:03:36 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH  mips/linux.git 1/5] firmware: bcm47xx_nvram: rename finding function and its variables
Date:   Mon,  8 Mar 2021 10:03:16 +0100
Message-Id: <20210308090320.9765-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308090320.9765-1-zajec5@gmail.com>
References: <20210308090320.9765-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

1. Use "bcm47xx_" function name prefix for consistency
2. It takes flash start as argument so s/iobase/flash_start/
3. "off" was used for finding flash end so just call it "flash_size"

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 24 ++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 835ece9c00f1..b04007adc79f 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -48,11 +48,13 @@ static u32 find_nvram_size(void __iomem *end)
 	return 0;
 }
 
-/* Probe for NVRAM header */
-static int nvram_find_and_copy(void __iomem *iobase, u32 lim)
+/**
+ * bcm47xx_nvram_find_and_copy - find NVRAM on flash mapping & copy it
+ */
+static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_size)
 {
 	struct nvram_header __iomem *header;
-	u32 off;
+	size_t flash_size;
 	u32 size;
 
 	if (nvram_len) {
@@ -61,25 +63,25 @@ static int nvram_find_and_copy(void __iomem *iobase, u32 lim)
 	}
 
 	/* TODO: when nvram is on nand flash check for bad blocks first. */
-	off = FLASH_MIN;
-	while (off <= lim) {
+	flash_size = FLASH_MIN;
+	while (flash_size <= res_size) {
 		/* Windowed flash access */
-		size = find_nvram_size(iobase + off);
+		size = find_nvram_size(flash_start + flash_size);
 		if (size) {
-			header = (struct nvram_header *)(iobase + off - size);
+			header = (struct nvram_header *)(flash_start + flash_size - size);
 			goto found;
 		}
-		off <<= 1;
+		flash_size <<= 1;
 	}
 
 	/* Try embedded NVRAM at 4 KB and 1 KB as last resorts */
-	header = (struct nvram_header *)(iobase + 4096);
+	header = (struct nvram_header *)(flash_start + 4096);
 	if (header->magic == NVRAM_MAGIC) {
 		size = NVRAM_SPACE;
 		goto found;
 	}
 
-	header = (struct nvram_header *)(iobase + 1024);
+	header = (struct nvram_header *)(flash_start + 1024);
 	if (header->magic == NVRAM_MAGIC) {
 		size = NVRAM_SPACE;
 		goto found;
@@ -124,7 +126,7 @@ int bcm47xx_nvram_init_from_mem(u32 base, u32 lim)
 	if (!iobase)
 		return -ENOMEM;
 
-	err = nvram_find_and_copy(iobase, lim);
+	err = bcm47xx_nvram_find_and_copy(iobase, lim);
 
 	iounmap(iobase);
 
-- 
2.26.2

