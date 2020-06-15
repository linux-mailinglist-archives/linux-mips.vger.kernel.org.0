Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC381F9313
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 11:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729213AbgFOJRp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 05:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgFOJRo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 05:17:44 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6CBC061A0E;
        Mon, 15 Jun 2020 02:17:44 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j10so16280462wrw.8;
        Mon, 15 Jun 2020 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ViDG/uNaLf+kHGoLWwh7AEgB81iiukfSSIutqnlLBfs=;
        b=esXNHJ/yPdIUKaOhRsqZnZ0bBMnXZY/5Gr1KOnjLV5fdxZYpw8whEz80nQdUpe10ju
         RtG6yTLCAEsBhmKScyva3SDjRZg1ttEf21P04eugHnABT9ofj1rhptSByP4upST+ew/q
         NpK56ud7fIMEicDXidhi2K5YnSYNw45ga9+oIaF/sM69zJtgcng5PUjBXQphGuaera8o
         S8E7K+26dIMweAIoyhuvmvrnTe8h8CVIP0GNy+zHhOIfVkkQvwrb2CvvrntRdNtSFtOw
         vEvzZMwdnXeBP0thGyxf5k7K5lEzeazHFDFuMYflSs9Or6YBMZRurJ7KTlHiXCkjaAIX
         1NJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ViDG/uNaLf+kHGoLWwh7AEgB81iiukfSSIutqnlLBfs=;
        b=IZ0tgbpJxnZ9Wufdct0a4n2YCAtipf8TjyacHmwmHVh0RhyzaCttGcrZ9I3AInPyZt
         pk/1Embd0wHBU9V6rigRhwKUhD2BTfX0NlXK2SBrXhQXnLgrRavFAdItDsLuVYPC+OBp
         faxNkNnZtFVnXVsCMO3jsJAQQsZ+VjkBcks5w+19hKBYmxogF+PFsasWZKowygaoPPyu
         sn2vjCWG5XTUE4OuIsq480hXHTZMqm9PsKoAesjYZVhKUU/JNnoBj2cd2K9Aprq7LIBT
         e03JH8J1KlQEzhAJZMAwDK62kE5N2F777s2+eT0vpG6FJACvhUWe97Kts/Dd1P5y/a12
         ETRw==
X-Gm-Message-State: AOAM531ZGZ1O11ZyYOW3xoRQ5wWZIea+uZkds6ssj8a87bJhmP1X2WXb
        VLfGSeyqbCLEijoCs/orcQn6Ov5LcyzCRA==
X-Google-Smtp-Source: ABdhPJx8i5wy03KmXkXmCHQsrLmD1GWhxkDsUKs0ZAE2/d+hX0PBNi9YajMHPT4+f//fb5CE0mfj9A==
X-Received: by 2002:adf:82ab:: with SMTP id 40mr26566597wrc.85.1592212662596;
        Mon, 15 Jun 2020 02:17:42 -0700 (PDT)
Received: from skynet.lan (168.red-88-20-188.staticip.rima-tde.net. [88.20.188.168])
        by smtp.gmail.com with ESMTPSA id z12sm25840592wrg.9.2020.06.15.02.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 02:17:42 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, jonas.gorski@gmail.com,
        linus.walleij@linaro.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4] mtd: parsers: bcm63xx: simplify CFE detection
Date:   Mon, 15 Jun 2020 11:17:40 +0200
Message-Id: <20200615091740.2958303-1-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612073549.1658336-1-noltari@gmail.com>
References: <20200612073549.1658336-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of trying to parse CFE version string, which is customized by some
vendors, let's just check that "CFE1" was passed on argument 3.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 v4: shorten conditional compilation part as suggested by Miquèl.
 v3: keep COMPILE_TEST compatibility by adding a new function that only checks
     fw_arg3 when CONFIG_MIPS is defined.
 v2: use CFE_EPTSEAL definition and avoid using an additional function.

 drivers/mtd/parsers/bcm63xxpart.c | 32 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
index 78f90c6c18fd..b15bdadaedb5 100644
--- a/drivers/mtd/parsers/bcm63xxpart.c
+++ b/drivers/mtd/parsers/bcm63xxpart.c
@@ -22,6 +22,11 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 
+#ifdef CONFIG_MIPS
+#include <asm/bootinfo.h>
+#include <asm/fw/cfe/cfe_api.h>
+#endif /* CONFIG_MIPS */
+
 #define BCM963XX_CFE_BLOCK_SIZE		SZ_64K	/* always at least 64KiB */
 
 #define BCM963XX_CFE_MAGIC_OFFSET	0x4e0
@@ -32,28 +37,15 @@
 #define STR_NULL_TERMINATE(x) \
 	do { char *_str = (x); _str[sizeof(x) - 1] = 0; } while (0)
 
-static int bcm63xx_detect_cfe(struct mtd_info *master)
+static inline int bcm63xx_detect_cfe(void)
 {
-	char buf[9];
-	int ret;
-	size_t retlen;
+	int ret = 0;
 
-	ret = mtd_read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
-		       (void *)buf);
-	buf[retlen] = 0;
+#ifdef CONFIG_MIPS
+	ret = (fw_arg3 == CFE_EPTSEAL);
+#endif /* CONFIG_MIPS */
 
-	if (ret)
-		return ret;
-
-	if (strncmp("cfe-v", buf, 5) == 0)
-		return 0;
-
-	/* very old CFE's do not have the cfe-v string, so check for magic */
-	ret = mtd_read(master, BCM963XX_CFE_MAGIC_OFFSET, 8, &retlen,
-		       (void *)buf);
-	buf[retlen] = 0;
-
-	return strncmp("CFE1CFE1", buf, 8);
+	return ret;
 }
 
 static int bcm63xx_read_nvram(struct mtd_info *master,
@@ -138,7 +130,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	struct bcm963xx_nvram *nvram = NULL;
 	int ret;
 
-	if (bcm63xx_detect_cfe(master))
+	if (!bcm63xx_detect_cfe())
 		return -EINVAL;
 
 	nvram = vzalloc(sizeof(*nvram));
-- 
2.27.0

