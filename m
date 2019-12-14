Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08AF811F316
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727110AbfLNRzU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:55:20 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:34928 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727109AbfLNRzS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:55:18 -0500
Received: by mail-pj1-f68.google.com with SMTP id w23so1133127pjd.2;
        Sat, 14 Dec 2019 09:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G5UK5DwBUduQN5XnwW7khvuWSh3A6ZcbhwTioDRukl8=;
        b=CbiDXSDajwRpx8W14h4Me/LqDY31+yHYAfRzx0gJjjZCKzYKeU/z+dRgbh8G0FB8Kz
         n23u0oKZqKSzIYv+ZL33ayO6Nm2GUXWzXYlOWey+vH7BxOSNg1x5YuD+KX3DbDKrOn6L
         s5pmk0dhSJQD63OQQyVOnnG5MA+j9dwufNQjp4qEDTK3V5YkQwYrGSY+U3Pc6GbbZRxC
         CajxwBSj4cWprH+2jMO3kzlI61ws7Qkomli0Aczwwl3k6qQ00RIGGRQNNK5T1/gCZVZt
         gSTJw7QQeLaRrJDTor/KB3Wx5TNqwOMf490slViV18ZldipGn352lX01mW6xS17FsVQG
         TjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G5UK5DwBUduQN5XnwW7khvuWSh3A6ZcbhwTioDRukl8=;
        b=AKCU7AA0QNN6B+Y/CxspVq22FdFOZzzypwRQFz1jCrRW71coVwvGA2IXxXHIMC7BgN
         QuapwuMhwxZJrXoAMEwP8szH/SPhSo6bggJAwYQacYRPgSoaQPoOSvIm2jhTDyosUnuH
         1qs9fzQkygchZ84Eub0PWLJ23+BSXWh/u18O6C907wyFDLeOdRtXxU/oBpiTX2FpvVH+
         2ygSd5057AAIOgys+efFlUnO+gN4j4mxWiJFqzJSamae32UxE3xgOTs444frPvgWkIZl
         bE09vW8kGD4tuzbdDFFF4jKugZUU63AyYtnXWUKEOrJK/sn6sEsni6LCTnq3AQ4GJHHP
         jNqA==
X-Gm-Message-State: APjAAAWtFQ0EaBoAcxST1Tj3SpzdWPsPLdmMJugugwJRcu5e62HttFrC
        r3Zl2HP9M0LXxh2LbD3tkhg=
X-Google-Smtp-Source: APXvYqxLeBRtno5UO/xbNsZnN4kmZhB035ExJnlkIwjScfYHKudBua3+fBmjaQTpdULAB/liHFw71A==
X-Received: by 2002:a17:90a:33e8:: with SMTP id n95mr7043968pjb.17.1576346118077;
        Sat, 14 Dec 2019 09:55:18 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id g18sm16392573pfi.80.2019.12.14.09.55.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:55:17 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
        john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
        mripard@kernel.org, wens@csie.org, ssantosh@kernel.org,
        jun.nie@linaro.org, shawnguo@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 09/10] soc: ixp4xx: qmgr: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:46 +0000
Message-Id: <20191214175447.25482-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 8c968382cea7..520babbd9037 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -375,13 +375,9 @@ static int ixp4xx_qmgr_probe(struct platform_device *pdev)
 	int i, err;
 	irq_handler_t handler1, handler2;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int irq1, irq2;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-	qmgr_regs = devm_ioremap_resource(dev, res);
+	qmgr_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(qmgr_regs))
 		return PTR_ERR(qmgr_regs);
 
-- 
2.17.1

