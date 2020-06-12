Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB341F74A9
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jun 2020 09:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgFLHfy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Jun 2020 03:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgFLHfy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Jun 2020 03:35:54 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C4BC03E96F;
        Fri, 12 Jun 2020 00:35:53 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id y17so8646230wrn.11;
        Fri, 12 Jun 2020 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+dRr0+LqXIl7Im4UO44miDTuI38sVf6D3sGaM7BzTw=;
        b=TVxEWGAFYaT7Abyc6rM/L/LAQewp9ZFr4x0CqCfwUknqU4gB6N64hJXnjQ0tLBW1nj
         t1xpJ2B+fWTAsOlOe2LgEkv9sw1Rws6uYFpNC+fprC/cgvGx78PZnD9fiK7v5QHB9BBe
         p001z7xrik0ysWNGlBdRCIdQhVHJ2i7841wW9DkGsYZFOBz7AiWHdhNdZjv3ugH/qTpX
         8S3k02koXX91fHvjOYx9KRm7WSh1DDnMV76BpmwiG7BKHqJ9uCva+KqgztLb1vpsvwvT
         XPGho0bR7/RdnzsFKa5jnXu7mP9vN1EQu9PcOrjlAweqJVPcUGrEybolvfF8YtqJjsjr
         OhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+dRr0+LqXIl7Im4UO44miDTuI38sVf6D3sGaM7BzTw=;
        b=aRQ533AP/IHkFG9c6By0pCttprjLwYNl3rn9bIfFRXAzC5HG/i3Ub/OjFUI4MNfj2h
         rqJimkX+e4vJANqjQVj9ti9oZ2Hfx/J4sVhuUAvVWDU0LT1rn5aCjGdoMNQvR8usjfVj
         PzvslLpqjHVckd7/x27qFRU0zfcoPEm30fNjLx+Cu0/1DoDU2pjGCGv0Jo1/kDnA5UZ7
         1iFHtJXEAzQB5mG/M4s1i7fuDZrYwFAfltJKzMTQzMTJXVhcJqWnulNNTvaPQgEfI208
         DzTEpzE6xQjojPlcFWTlVlHepDi9ErGvpKYEPEMmkYzBh5BcpUOwrktetnVpup4wHPO5
         rIaA==
X-Gm-Message-State: AOAM532xoqo+Gt+qv9Ibu+bgZXD2ImJNCzeKla1cbddqS5ZoBBnRNdYp
        BOeV2kXgNtjKF3TY8N0p43vruSGkR8c=
X-Google-Smtp-Source: ABdhPJxOsgd6flPA0JCauNhh1ZlR45HzUiPV+lbPcExOT9NWKh6pnzfSbwJJpTuxHF33g4XFITkT0Q==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr14341234wrw.179.1591947352233;
        Fri, 12 Jun 2020 00:35:52 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id a1sm7729914wmd.28.2020.06.12.00.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 00:35:51 -0700 (PDT)
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
Subject: [PATCH v3] mtd: parsers: bcm63xx: simplify CFE detection
Date:   Fri, 12 Jun 2020 09:35:49 +0200
Message-Id: <20200612073549.1658336-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608160649.3717152-1-noltari@gmail.com>
References: <20200608160649.3717152-1-noltari@gmail.com>
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
 v3: keep COMPILE_TEST compatibility by adding a new function that only checks
     fw_arg3 when CONFIG_MIPS is defined.
 v2: use CFE_EPTSEAL definition and avoid using an additional function.

 drivers/mtd/parsers/bcm63xxpart.c | 34 +++++++++++--------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
index 78f90c6c18fd..c514c04789af 100644
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
@@ -32,28 +37,13 @@
 #define STR_NULL_TERMINATE(x) \
 	do { char *_str = (x); _str[sizeof(x) - 1] = 0; } while (0)
 
-static int bcm63xx_detect_cfe(struct mtd_info *master)
+static inline int bcm63xx_detect_cfe(void)
 {
-	char buf[9];
-	int ret;
-	size_t retlen;
-
-	ret = mtd_read(master, BCM963XX_CFE_VERSION_OFFSET, 5, &retlen,
-		       (void *)buf);
-	buf[retlen] = 0;
-
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
+#ifdef CONFIG_MIPS
+	return (fw_arg3 == CFE_EPTSEAL);
+#else
+	return 0;
+#endif /* CONFIG_MIPS */
 }
 
 static int bcm63xx_read_nvram(struct mtd_info *master,
@@ -138,7 +128,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	struct bcm963xx_nvram *nvram = NULL;
 	int ret;
 
-	if (bcm63xx_detect_cfe(master))
+	if (!bcm63xx_detect_cfe())
 		return -EINVAL;
 
 	nvram = vzalloc(sizeof(*nvram));
-- 
2.26.2

