Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9EAC32E1E8
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 06:55:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhCEFzO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 00:55:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCEFzO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 00:55:14 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1E2BC061574;
        Thu,  4 Mar 2021 21:55:13 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f1so1668429lfu.3;
        Thu, 04 Mar 2021 21:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TzVgj4PvcBDxRYDeTfxKKMjDEjys98FzpUIgGLGweA=;
        b=bpgVzM0j4Sb9ENi/7TVXAr/2Gr7KwkPbnAin4m5za60Twwffq1lmkSYhKcLreb4+hY
         SK2Azf3t058U213/+zlDvFY6sXoIaWQxS4tiEq1CWcBrV2MrSxhvKmu7IQyiyV04EDT3
         KCsUOot+l9i1BFCmcMXGD+40kk4UFX5bC0fRZnQsUdcMYTEmIOAnSGEDQJ9pcJKa9BHL
         UuAlclRhyIhdaptJNABYjCxmsa2CTEDJKxtD8egm8qQCrV6EGWbT/lOHKViTLMxsA5u6
         fJaOgqgiPmQvdrzkhI8rX4Pv1T/e5v6LF8QpEnziGgWrwbzM9KE3pa3mvxGj5k80aGzK
         COfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TzVgj4PvcBDxRYDeTfxKKMjDEjys98FzpUIgGLGweA=;
        b=fsyTRS/GVNew0mJzqujDtWlbLmgrN2cULnfxtEzZDTF+QQQdnCWwRLUBj/TlVGdIPL
         IDSe4FjzdxDjxRNwTevW+BpmiOq2mPfxkHR/abz74yS+JNRZgVnsKTDpfgiEAvVeTgB2
         DB9Vr1khb7V9Gt4ZcKOR8xjpH/8JkUfi+N2Fj48AkkMJEiF1f0X7HjZyXWomgEy9p5Dm
         d0TPlGn1jaIyx4Va3CjerIKKSaFAbkpRTp9rmF3VQGurRQ8eb1Dvc4y7XJzuzB4+vtga
         5NrDbLGxD9bHk/5CqUcR51jaPRAXhyeRxslUovGV3SgKVNzjM17eXQiFmGUEs01f2DI8
         /epw==
X-Gm-Message-State: AOAM533ccCfmNYuHcuZN0d4V2oq/fK3pvtUb6q8ZK/0hf7svscL1Ltzx
        NZ5IDbhAnG59X2/pp2AXp/k=
X-Google-Smtp-Source: ABdhPJyuKOi81mrmA7tPZDQDZq0M7//zcbIhwoiRVcVYVLUVDRNJbpTAdsrPAUe0Tt6qXKj2oOdqcw==
X-Received: by 2002:a05:6512:38c6:: with SMTP id p6mr4417434lft.658.1614923712406;
        Thu, 04 Mar 2021 21:55:12 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id k13sm167327lfg.192.2021.03.04.21.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 21:55:11 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH V2 mips/linux.git] firmware: bcm47xx_nvram: refactor finding & reading NVRAM
Date:   Fri,  5 Mar 2021 06:55:01 +0100
Message-Id: <20210305055501.13099-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304072357.31108-1-zajec5@gmail.com>
References: <20210304072357.31108-1-zajec5@gmail.com>
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
V2: Fix comment to match actual function name
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 111 ++++++++++++----------
 1 file changed, 63 insertions(+), 48 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 835ece9c00f1..b47c80a79358 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -34,26 +34,47 @@ static char nvram_buf[NVRAM_SPACE];
 static size_t nvram_len;
 static const u32 nvram_sizes[] = {0x6000, 0x8000, 0xF000, 0x10000};
 
-static u32 find_nvram_size(void __iomem *end)
+/**
+ * bcm47xx_nvram_is_valid - check for a valid NVRAM at specified memory
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

