Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 403FC3309E8
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 10:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbhCHJDv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 04:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCHJDp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 04:03:45 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EAE1C06174A;
        Mon,  8 Mar 2021 01:03:44 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id t9so15087754ljt.8;
        Mon, 08 Mar 2021 01:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BB78i/TOrdtbQgIIMS5144s3mE6rskxVn8XRXaD3Po0=;
        b=unSEgdNsO1ZS1AOfxEfdlbhZxdoZDrxS7aH36MTZ/KfZkdnmNg1MnzbIJD5E2BVSC1
         vy5Fh1ZXZGaD2wpSM616BISiaz8KLnWJHHGwC603poxTZeDve4lv9ZnUWvGEK6hoy/we
         rcsInr8pjkBbZtCBiXOxS4xEGk/ZMwhb/EWQZbjohF/sBUhxzTSPR9JutKdCRTG5ZCIz
         d4/aYGDZ6U5wwqeAaW545aQW5Y1jSflWKlVGCuOj7YPSiiwCvNXMmjMXp9gQ+EhDvaXf
         l89UMnAy6M7QOxsSpiZWLyvpZ36WDNGh+g5QA9Y+K3Xr5uR2zpqGz37SZhQy6ZAXbCJ7
         LSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BB78i/TOrdtbQgIIMS5144s3mE6rskxVn8XRXaD3Po0=;
        b=nQ5TNgtIrvImyU1mJNQ9NgfoHGuNBcl6uygOVgbg9LXo+rEB25ziaOjVDMxy51ET97
         a4KpAXnKVUkHZ9l6rWGjdJC5DfR5etgs2g56roMWz7R4cQHgBMxGK5RWWVi36HKenqmk
         92jQ+6ucGjKsj1o0CVXekmXEeNznAyfxs6KifpijYQzuYXwI0gDvJJg5nVrRfrSw7hfT
         GMGmyAgjqyCd3sFZnOFOPVwhSFS9yYjZWG6f85GYv2i4WkgZDwLXc7acEk4TntfwgYcN
         f64uHVdSXNG9/iTKecdtBvKPghsojX+cJg8y+utOfbGIrhIPQWIfUFqZD/AVQCR+JMfR
         Q2aA==
X-Gm-Message-State: AOAM532TV+uiB+6UrOVgB1IS5W+i/xcIlzhMHuARjJSdBy8xb9iNXpdi
        Wb+Hyjp+fmEclnnBRxhCBlc=
X-Google-Smtp-Source: ABdhPJyK7mQGyO2W7OgUqJ1I3bccbBt71tnUSxhtbuAwNi3kvGd13XX/UjUyaP8e1zUbhRjn1huGnw==
X-Received: by 2002:a2e:b814:: with SMTP id u20mr13062565ljo.370.1615194223105;
        Mon, 08 Mar 2021 01:03:43 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t13sm1410346ljk.47.2021.03.08.01.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 01:03:42 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH  mips/linux.git 4/5] firmware: bcm47xx_nvram: look for NVRAM with for instead of while
Date:   Mon,  8 Mar 2021 10:03:19 +0100
Message-Id: <20210308090320.9765-5-zajec5@gmail.com>
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

This loop requires variable initialization, stop condition and post
iteration increment. It's pretty much a for loop definition.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 09f51b95849e..1d2271b1e07a 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -93,15 +93,13 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 	}
 
 	/* TODO: when nvram is on nand flash check for bad blocks first. */
-	flash_size = FLASH_MIN;
-	while (flash_size <= res_size) {
+	for (flash_size = FLASH_MIN; flash_size <= res_size; flash_size <<= 1) {
 		/* Windowed flash access */
 		size = find_nvram_size(flash_start + flash_size);
 		if (size) {
 			offset = flash_size - size;
 			goto found;
 		}
-		flash_size <<= 1;
 	}
 
 	/* Try embedded NVRAM at 4 KB and 1 KB as last resorts */
-- 
2.26.2

