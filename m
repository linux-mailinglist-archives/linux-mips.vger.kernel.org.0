Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FD732CD93
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 08:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbhCDH0V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 02:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhCDH0I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 02:26:08 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD39C061574;
        Wed,  3 Mar 2021 23:25:28 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id d3so41494375lfg.10;
        Wed, 03 Mar 2021 23:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nk4Sm/a2W5mKT2nJYes9ly+Sao6uPhVPqbljVOlCzEA=;
        b=YGe1pLbcDy9iGlLPxpGgiMve+O6mIeQu6LznERUOxaibs69e9Rx9UgdFjeav4z9gSk
         0zSsvGS986wHchDcnvHaMaU4T5Nx4dt4hYlype6tTLag/YY72cDdd7WsOwrSUBhf2KNG
         qB4NK0FyfaziqiyeDm2tfOry1iOq/jTFFS3eGI1Dp0V3ZnJOqBqXrHfEvYubbKwL7RwX
         JhqIba5HS6MhXrPYJP1qhrWZuvNwQUo8wx0Fj849ZOKXHrcEDeHH7A+JYa25jL5s/zBs
         aXE+6p7KNcyB4y5MAIEW53IEpuylhzE+OA8Nzg63BoorfQMXqnoBq+eILmhlHYXauyfc
         Yb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nk4Sm/a2W5mKT2nJYes9ly+Sao6uPhVPqbljVOlCzEA=;
        b=eLgtcYyAIHKjl7q6IC+25mKNh9Zt2rWUkL490SGFH7nAnVs2MB9SOrSxnts+qXn11J
         V2rVyyXHldaJxhk5YhuzhntZF7iusX/UL3iItwUob//buj3cdEemoaR+BSKmKqmmiQxz
         1KiCqb7dgpI4HIJhSw58srkZ91GRHnN+Sw8b4M50SFKdfHkE3/UxQhEA8F3aCx8ERZkK
         cFCzNDUtqKfURn31vnqoGCZxjAuVLGs5ydyygs4Hu1uKERDZtX/qG3dDTFg/BEXJzrc3
         QV07oE4yYpc3HByjlYmDd9cp830yK0H0RtjnNhUTELO5ViZuEbPmWb0eUsQp4d+A8YHl
         xuPQ==
X-Gm-Message-State: AOAM530jxZs+yDCsxgY3R/OUNkPQskheESr2mZh6idxzTf181EDPzEQQ
        vsfo0iU7Ut59RqaimrMiMm0=
X-Google-Smtp-Source: ABdhPJz2khWmNxscc0ERLdSOh2Q+id8b975F4AJmiGMFSOHorOtt/PpqniUqDP7ooPDk43ChftDQDA==
X-Received: by 2002:ac2:5e9d:: with SMTP id b29mr1519869lfq.31.1614842726984;
        Wed, 03 Mar 2021 23:25:26 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id q3sm1105989lfp.233.2021.03.03.23.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 23:25:26 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH mips/linux.git] firmware: bcm47xx_nvram: refactor finding & reading NVRAM
Date:   Thu,  4 Mar 2021 08:23:57 +0100
Message-Id: <20210304072357.31108-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

1. Use meaningful variable names (e.g. "flash_start", "res_size" instead
   of e.g. "iobase", "end")
2. Always operate on "offset" instead of mix of start, end, size, etc.
3. Add helper checking for NVRAM to avoid duplicating code
4. Use "found" variable instead of goto
5. Use simpler checking of offsets and sizes (2 nested loops with
   trivial check instead of extra function)

This change has been tested on BCM4706. Updated code checks the same
offsets as before. Driver still finds & copies NVRAM content.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 111 ++++++++++++----------
 1 file changed, 63 insertions(+), 48 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 835ece9c00f1..7cfe857b3e98 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -34,26 +34,47 @@ static char nvram_buf[NVRAM_SPACE];
 static size_t nvram_len;
 static const u32 nvram_sizes[] = {0x6000, 0x8000, 0xF000, 0x10000};
 
-static u32 find_nvram_size(void __iomem *end)
+/**
+ * bcm47xx_nvram_validate - check for a valid NVRAM at specified memory
+ */
+static bool bcm47xx_nvram_is_valid(void __iomem *nvram)
 {
-	struct nvram_header __iomem *header;
-	int i;
+	return ((struct nvram_header *)nvram)->magic == NVRAM_MAGIC;
+}
 
-	for (i = 0; i < ARRAY_SIZE(nvram_sizes); i++) {
-		header = (struct nvram_header *)(end - nvram_sizes[i]);
-		if (header->magic == NVRAM_MAGIC)
-			return nvram_sizes[i];
+/**
+ * bcm47xx_nvram_copy - copy NVRAM to internal buffer
+ */
+static void bcm47xx_nvram_copy(void __iomem *nvram_start, size_t res_size)
+{
+	struct nvram_header __iomem *header = nvram_start;
+	size_t copy_size;
+
+	copy_size = header->len;
+	if (copy_size > res_size) {
+		pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
+		copy_size = res_size;
+	}
+	if (copy_size >= NVRAM_SPACE) {
+		pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
+		       copy_size, NVRAM_SPACE - 1);
+		copy_size = NVRAM_SPACE - 1;
 	}
 
-	return 0;
+	__ioread32_copy(nvram_buf, nvram_start, DIV_ROUND_UP(copy_size, 4));
+	nvram_buf[NVRAM_SPACE - 1] = '\0';
+	nvram_len = copy_size;
 }
 
-/* Probe for NVRAM header */
-static int nvram_find_and_copy(void __iomem *iobase, u32 lim)
+/**
+ * bcm47xx_nvram_find_and_copy - find NVRAM on flash mapping & copy it
+ */
+static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_size)
 {
-	struct nvram_header __iomem *header;
-	u32 off;
-	u32 size;
+	size_t flash_size;
+	size_t offset;
+	bool found;
+	int i;
 
 	if (nvram_len) {
 		pr_warn("nvram already initialized\n");
@@ -61,49 +82,43 @@ static int nvram_find_and_copy(void __iomem *iobase, u32 lim)
 	}
 
 	/* TODO: when nvram is on nand flash check for bad blocks first. */
-	off = FLASH_MIN;
-	while (off <= lim) {
-		/* Windowed flash access */
-		size = find_nvram_size(iobase + off);
-		if (size) {
-			header = (struct nvram_header *)(iobase + off - size);
-			goto found;
+
+	found = false;
+
+	/* Try every possible flash size and check for NVRAM at its end */
+	for (flash_size = FLASH_MIN; flash_size <= res_size; flash_size <<= 1) {
+		for (i = 0; i < ARRAY_SIZE(nvram_sizes); i++) {
+			offset = flash_size - nvram_sizes[i];
+			if (bcm47xx_nvram_is_valid(flash_start + offset)) {
+				found = true;
+				break;
+			}
 		}
-		off <<= 1;
+
+		if (found)
+			break;
 	}
 
 	/* Try embedded NVRAM at 4 KB and 1 KB as last resorts */
-	header = (struct nvram_header *)(iobase + 4096);
-	if (header->magic == NVRAM_MAGIC) {
-		size = NVRAM_SPACE;
-		goto found;
-	}
 
-	header = (struct nvram_header *)(iobase + 1024);
-	if (header->magic == NVRAM_MAGIC) {
-		size = NVRAM_SPACE;
-		goto found;
+	if (!found) {
+		offset = 4096;
+		if (bcm47xx_nvram_is_valid(flash_start + offset))
+			found = true;
 	}
 
-	pr_err("no nvram found\n");
-	return -ENXIO;
-
-found:
-	__ioread32_copy(nvram_buf, header, sizeof(*header) / 4);
-	nvram_len = ((struct nvram_header *)(nvram_buf))->len;
-	if (nvram_len > size) {
-		pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
-		nvram_len = size;
+	if (!found) {
+		offset = 1024;
+		if (bcm47xx_nvram_is_valid(flash_start + offset))
+			found = true;
 	}
-	if (nvram_len >= NVRAM_SPACE) {
-		pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
-		       nvram_len, NVRAM_SPACE - 1);
-		nvram_len = NVRAM_SPACE - 1;
+
+	if (!found) {
+		pr_err("no nvram found\n");
+		return -ENXIO;
 	}
-	/* proceed reading data after header */
-	__ioread32_copy(nvram_buf + sizeof(*header), header + 1,
-			DIV_ROUND_UP(nvram_len, 4));
-	nvram_buf[NVRAM_SPACE - 1] = '\0';
+
+	bcm47xx_nvram_copy(flash_start + offset, res_size - offset);
 
 	return 0;
 }
@@ -124,7 +139,7 @@ int bcm47xx_nvram_init_from_mem(u32 base, u32 lim)
 	if (!iobase)
 		return -ENOMEM;
 
-	err = nvram_find_and_copy(iobase, lim);
+	err = bcm47xx_nvram_find_and_copy(iobase, lim);
 
 	iounmap(iobase);
 
-- 
2.26.2

