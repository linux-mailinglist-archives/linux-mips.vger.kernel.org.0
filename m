Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5E013309EE
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 10:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbhCHJEV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 04:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbhCHJDs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 04:03:48 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58B51C06174A;
        Mon,  8 Mar 2021 01:03:48 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id v9so19872294lfa.1;
        Mon, 08 Mar 2021 01:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f0MkKY1UF1QqFhYKVPwOq+Ju9G4IUVvg4Cjsdu6w/3g=;
        b=EhqwmCj+hu7PZmHAM0dMG8J+JeLWiEWiHnApd2/aEUepqpPkN+ocEQ0tGtL7TtqAKk
         4R/zDo7QvDGVtI7/KQCQyQSav0wAR0znPEi12SJ42mLthNUwHuNyP+e2uAEp+i80uNFL
         rfkQMzBVt36d2q5fQE8y39we7tZjRwFG0iCOowXcMnLmX12463GUEy2Msun90lSGFWAj
         ufkEQOKX2Y+lNocNAs7E1fxAzZs3UWoBo4P13A6dmlIb1l+/u3upWpixYshykkxIyvNR
         0jdLr3UwHTM+j0uEupoo0RB/6Evjtxvp7GYw1rOgdgFdqM42U3QWc2z+MvboDEjgk3Sr
         adoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f0MkKY1UF1QqFhYKVPwOq+Ju9G4IUVvg4Cjsdu6w/3g=;
        b=azXb5SqkI+l5K07xImwB7xxNUWY5my50jXPIKHMKjvTJg7gwOfjk63h6qcfKIwtWYE
         TO2Ea+99t6JlhQoTeMsDYj/A4uZjj955PtkQorWxjq0brTH+oxxW/lG+s3kVX6k067Z5
         gqavVZ5PdXS+Z/7na01/7+rSny3kgCIGHGIq6iF9wzijWw+jpLHvAxyFsUEIxstSZLmm
         KtfANL7CPrIK6orxCKKeGfTBuvqkkbsWYjv69lnXOiF3KvYC4uwc7rmkUHXRscl8RZ+B
         e1XYYn6YzxLAHFL4A4liw2xI3C1zSl05IRMmQ83EAVPULVqjhSCGwEThf5BCzo6+xgUe
         aRdw==
X-Gm-Message-State: AOAM5311gPAu1c5LWxa70UY0c9/BIw0tPokJi/1nf138rnCve0doBY6n
        QJLdhYDvFWOzUzMfHakL/y8=
X-Google-Smtp-Source: ABdhPJwWEq2R/+0DcHcTYmLrCNuBZIc3WgrmH7DSX2vHIJ4hzT2ZRTwShzvw+/dXCIBJs69Rs9pwiQ==
X-Received: by 2002:a19:2242:: with SMTP id i63mr13237087lfi.643.1615194226928;
        Mon, 08 Mar 2021 01:03:46 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t13sm1410346ljk.47.2021.03.08.01.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 01:03:46 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH  mips/linux.git 5/5] firmware: bcm47xx_nvram: inline code checking NVRAM size
Date:   Mon,  8 Mar 2021 10:03:20 +0100
Message-Id: <20210308090320.9765-6-zajec5@gmail.com>
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

Separated function was not improving code quality much (or at all).
Moreover it expected possible flash end address as argument and it was
returning NVRAM size.

The new code always operates on offsets which means less logic and less
calculations.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 25 +++++++----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 1d2271b1e07a..bd235833b687 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -42,18 +42,6 @@ static bool bcm47xx_nvram_is_valid(void __iomem *nvram)
 	return ((struct nvram_header *)nvram)->magic == NVRAM_MAGIC;
 }
 
-static u32 find_nvram_size(void __iomem *end)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(nvram_sizes); i++) {
-		if (bcm47xx_nvram_is_valid(end - nvram_sizes[i]))
-			return nvram_sizes[i];
-	}
-
-	return 0;
-}
-
 /**
  * bcm47xx_nvram_copy - copy NVRAM to internal buffer
  */
@@ -85,7 +73,7 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 {
 	size_t flash_size;
 	size_t offset;
-	u32 size;
+	int i;
 
 	if (nvram_len) {
 		pr_warn("nvram already initialized\n");
@@ -93,12 +81,13 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 	}
 
 	/* TODO: when nvram is on nand flash check for bad blocks first. */
+
+	/* Try every possible flash size and check for NVRAM at its end */
 	for (flash_size = FLASH_MIN; flash_size <= res_size; flash_size <<= 1) {
-		/* Windowed flash access */
-		size = find_nvram_size(flash_start + flash_size);
-		if (size) {
-			offset = flash_size - size;
-			goto found;
+		for (i = 0; i < ARRAY_SIZE(nvram_sizes); i++) {
+			offset = flash_size - nvram_sizes[i];
+			if (bcm47xx_nvram_is_valid(flash_start + offset))
+				goto found;
 		}
 	}
 
-- 
2.26.2

