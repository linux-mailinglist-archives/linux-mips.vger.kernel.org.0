Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BA13309E7
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 10:04:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhCHJDu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 04:03:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbhCHJDl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 04:03:41 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A74BCC06174A;
        Mon,  8 Mar 2021 01:03:40 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id r25so15063325ljk.11;
        Mon, 08 Mar 2021 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h1CjJ6ig+osO4HlHfodxEJpSRAPR8gnCp6G0zXv92EQ=;
        b=Aq5Vac6XFUbDeHf/eDsLNcU2rtbhFI0kgrnfm74+LT45UmDR+IbEWs9dzm5nYlWdGv
         UlYn+IqZps28P81MpxOUTNuI2IfKBYJfQ/DuHceQnWLay7fhO8OBZbkfWKstvu7DG9SX
         KvmK3IAFK0wUx4L5ffF6EfOesrgp037+mEiDqSFQdmQAsstEk1dJHCKyMHsQj1TZzhRG
         +yDTy6ihf+l4ky+kcpNAcyvazrK7wsCrlLSkikT/5IbM7FzT6UbyWSXA6QbyKluzI/uL
         aiInrl6Wu8/BWSzlNs+tkZINXInL5xKSzfabkmSivXEhS1YeknL4Y10Bc5o+ExICSLp3
         EytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h1CjJ6ig+osO4HlHfodxEJpSRAPR8gnCp6G0zXv92EQ=;
        b=G4jEKqsCUG3EgOBGrMsrnSellKO011zXceritD6UzOl8mcU37YoQDhHn/oKe6bik4P
         B9iwfNGHvy2mx5IIvxa5j5Y2dPZVyoc/9ypa2MYlwM1085UBLd2wiMypypsfH5jMmNrd
         PcVxQrtr5Bf+rWIEc6tJ7lagxWZOZ/cGn5ErxfF36LoXYSg+tjw3uSGKZfCl1NMSq2sL
         E7Mf1MVh36Yln1rQ8XuuypZnWnVrnojS/tqBdL6/VhX4/QuqjNVg2YLCVVsyK49efuR1
         C/poGEvXP8TI4P9FFO2bwJ0Up3D1IbORlUq0ujvdllRNeXfaBYUokfj8UX6z/QXfIG5k
         YdFw==
X-Gm-Message-State: AOAM530QhX0KJO459pWXzJCiVT3iYMgujN8tRZnTZ6SBAUHQrjp4Anpk
        7a1QfUTh9JvMLFEQY0eAubs=
X-Google-Smtp-Source: ABdhPJxxFvkWKBZcUaNh47icOgTHGTyNzsE8gIyB1DbBexlYZDYK+UeSxJB0HiNHuBgl1IOx1cTTEg==
X-Received: by 2002:a2e:810a:: with SMTP id d10mr12910149ljg.304.1615194219267;
        Mon, 08 Mar 2021 01:03:39 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t13sm1410346ljk.47.2021.03.08.01.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 01:03:38 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH  mips/linux.git 2/5] firmware: bcm47xx_nvram: add helper checking for NVRAM
Date:   Mon,  8 Mar 2021 10:03:17 +0100
Message-Id: <20210308090320.9765-3-zajec5@gmail.com>
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

This avoids duplicating code doing casting and checking for NVRAM magic.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 30 ++++++++++++++---------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index b04007adc79f..99f3ec180be6 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -34,14 +34,20 @@ static char nvram_buf[NVRAM_SPACE];
 static size_t nvram_len;
 static const u32 nvram_sizes[] = {0x6000, 0x8000, 0xF000, 0x10000};
 
+/**
+ * bcm47xx_nvram_is_valid - check for a valid NVRAM at specified memory
+ */
+static bool bcm47xx_nvram_is_valid(void __iomem *nvram)
+{
+	return ((struct nvram_header *)nvram)->magic == NVRAM_MAGIC;
+}
+
 static u32 find_nvram_size(void __iomem *end)
 {
-	struct nvram_header __iomem *header;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(nvram_sizes); i++) {
-		header = (struct nvram_header *)(end - nvram_sizes[i]);
-		if (header->magic == NVRAM_MAGIC)
+		if (bcm47xx_nvram_is_valid(end - nvram_sizes[i]))
 			return nvram_sizes[i];
 	}
 
@@ -55,6 +61,7 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 {
 	struct nvram_header __iomem *header;
 	size_t flash_size;
+	size_t offset;
 	u32 size;
 
 	if (nvram_len) {
@@ -68,31 +75,30 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 		/* Windowed flash access */
 		size = find_nvram_size(flash_start + flash_size);
 		if (size) {
-			header = (struct nvram_header *)(flash_start + flash_size - size);
+			offset = flash_size - size;
 			goto found;
 		}
 		flash_size <<= 1;
 	}
 
 	/* Try embedded NVRAM at 4 KB and 1 KB as last resorts */
-	header = (struct nvram_header *)(flash_start + 4096);
-	if (header->magic == NVRAM_MAGIC) {
-		size = NVRAM_SPACE;
+
+	offset = 4096;
+	if (bcm47xx_nvram_is_valid(flash_start + offset))
 		goto found;
-	}
 
-	header = (struct nvram_header *)(flash_start + 1024);
-	if (header->magic == NVRAM_MAGIC) {
-		size = NVRAM_SPACE;
+	offset = 1024;
+	if (bcm47xx_nvram_is_valid(flash_start + offset))
 		goto found;
-	}
 
 	pr_err("no nvram found\n");
 	return -ENXIO;
 
 found:
+	header = (struct nvram_header *)(flash_start + offset);
 	__ioread32_copy(nvram_buf, header, sizeof(*header) / 4);
 	nvram_len = ((struct nvram_header *)(nvram_buf))->len;
+	size = res_size - offset;
 	if (nvram_len > size) {
 		pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
 		nvram_len = size;
-- 
2.26.2

