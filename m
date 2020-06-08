Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33591F1CE4
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2020 18:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730401AbgFHQHB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Jun 2020 12:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730378AbgFHQHA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Jun 2020 12:07:00 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DB0C08C5C2;
        Mon,  8 Jun 2020 09:07:00 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g10so56633wmh.4;
        Mon, 08 Jun 2020 09:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xSm/ixCMsXrBbAVZMWIWVyDBFHz6cDKWQtZCmAnN0nA=;
        b=ZLSxxQtAqk9VJDhuTPL/QytUa2FIBQopJdBHKih5e4AAFXp7fINT9N+ePLJodzE/tU
         MIo4bnGqf6TwcM2yJnT8F3mNUgmp+iiR7KVcEf0MRbb/a/WciLworDKVhxZ4gXx6Shts
         HMV0P81Yb2gscczPSxyxyT6ukEYSwfakd0VCuBT7SJriDcBqMux5KKV6paMbOPPS9Ud9
         XRvv63vkPM7+tmGskVRlRvyeSWZZFi+ulGYCSujm6IW2JWESuFocQua+OIV3YkJciJFg
         HRbtsT0RpycizikAmUr1ILfJsTt/0ebbdX3R89RLKixL+YdeRFBH3h6OODLDz9Ucvi9b
         ylXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xSm/ixCMsXrBbAVZMWIWVyDBFHz6cDKWQtZCmAnN0nA=;
        b=OE+YtbCMd+cXQXQjLPW4YTg12Zs1vwv4EGir2dfgVEm4EdyoLImtAKOUXq+JxStD75
         1MvxH3isC93GycVVqjh1W2iwoKNQ7Gk7es5oMu5W0Rrb2bm276l0xx57xrG6PaT3EuGE
         CII4Di19yfsist4ksgybL7T7RQfU2KBr6gHFssPHvX4UTUDyMYOQvKtutJpqp9UhBp9N
         PaJVP9d+pzf4rIAeR5mFNbwsm/rYB6bVixqVqTJzsceq0Ck4R83aawDXvK+O6SvsPgZt
         ESJXD4kWky4uE96Nxbf2D1aE0cRVCaAvaQ7XpkdAv1PnUiPZENWUEOiutGOqzkPs5OtQ
         OrPQ==
X-Gm-Message-State: AOAM531jfpNMASEPBJ6b+pJPCyQGeGX9/LRkNwwAMTSDgiStwuWJlR5T
        DURUcQGSKZ7RDVN9y0eEQdg=
X-Google-Smtp-Source: ABdhPJzlh/xf/IFViONY5iqBfTW9IBvJzeWdZjU4s6WE0zKa+QDIy95NBnZc/nabW15BofK0+Fz87w==
X-Received: by 2002:a1c:24c6:: with SMTP id k189mr72594wmk.9.1591632418158;
        Mon, 08 Jun 2020 09:06:58 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id b187sm32275wmd.26.2020.06.08.09.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 09:06:57 -0700 (PDT)
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
Subject: [PATCH v2] mtd: parsers: bcm63xx: simplify CFE detection
Date:   Mon,  8 Jun 2020 18:06:49 +0200
Message-Id: <20200608160649.3717152-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608094053.3381512-1-noltari@gmail.com>
References: <20200608094053.3381512-1-noltari@gmail.com>
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
 v2: use CFE_EPTSEAL definition and avoid using an additional funtion.

 drivers/mtd/parsers/bcm63xxpart.c | 29 ++++-------------------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/parsers/bcm63xxpart.c b/drivers/mtd/parsers/bcm63xxpart.c
index 78f90c6c18fd..493a75b2f266 100644
--- a/drivers/mtd/parsers/bcm63xxpart.c
+++ b/drivers/mtd/parsers/bcm63xxpart.c
@@ -22,6 +22,9 @@
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
 
+#include <asm/bootinfo.h>
+#include <asm/fw/cfe/cfe_api.h>
+
 #define BCM963XX_CFE_BLOCK_SIZE		SZ_64K	/* always at least 64KiB */
 
 #define BCM963XX_CFE_MAGIC_OFFSET	0x4e0
@@ -32,30 +35,6 @@
 #define STR_NULL_TERMINATE(x) \
 	do { char *_str = (x); _str[sizeof(x) - 1] = 0; } while (0)
 
-static int bcm63xx_detect_cfe(struct mtd_info *master)
-{
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
-}
-
 static int bcm63xx_read_nvram(struct mtd_info *master,
 	struct bcm963xx_nvram *nvram)
 {
@@ -138,7 +117,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	struct bcm963xx_nvram *nvram = NULL;
 	int ret;
 
-	if (bcm63xx_detect_cfe(master))
+	if (fw_arg3 != CFE_EPTSEAL)
 		return -EINVAL;
 
 	nvram = vzalloc(sizeof(*nvram));
-- 
2.26.2

