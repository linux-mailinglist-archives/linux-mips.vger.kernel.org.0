Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFF611F2F2
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:54:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfLNRyx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:54:53 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46428 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfLNRyx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:54:53 -0500
Received: by mail-pf1-f195.google.com with SMTP id y14so3226750pfm.13;
        Sat, 14 Dec 2019 09:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HUgbRO2BhcAt34RLIr2Su6ppZQ/Nd1zKa7NZkK38qdo=;
        b=gHnjEtACweKJQ9KxtQ461Zgr7NfGqheFDsRZTRRJFz6YFL8wuergs72JfrcnO77sdJ
         /QS7UPm1Bg4iIc3NujE4sEMdigb/F/ubMD4/HZVOB5uT9H+42YKgm8+veKx3a8YgFdtN
         4jggFFFOQRkLhxlPZm6C6OxcyQ1QbRzAyrzeiBX8bXkva7ITvJqNDVSY0Fae7CSC21vy
         JP8PdkfrraxJdDi8nNQMD4jxIHdZTp8NmiB1F0c7GS7VpvR2GLV2CyfBpXw8hFKCMdY4
         5RyngV4Optzg3+dljoTt0tZeJ5RhogtepGPUJ1LqLD44vd/D1CspHKleJVWmOwLZLop4
         BhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HUgbRO2BhcAt34RLIr2Su6ppZQ/Nd1zKa7NZkK38qdo=;
        b=i8hKxajTjMxSAODItWeKRUrbuDQXkdjNkwkbkZkTmfkNwfi9G33Kqc5rquh/mFpAwR
         py5Q4w7J78nCsNUmGCy/oEpvNUwRrzFS6l5aTLiRcaT5lR1YrBZN3g7WTmFmevHJ8Cu+
         lZKh0I7vNawShci/l03blwSRgSborehJPi5g0qtpIMb0HBhZ8ZAEs0GQ0rPxe9Vs1Wi1
         K93o/AYWAE2eLIN0neHfmgFdyR3VzjiNOgmhBtMRvoZpoNu0UkRbtyG1HSWp+5hONjVx
         S16DM5lNy5Yb3JUfQYuP55HdSxeX9A8rMCTWFTt2fe6sPFfzlnMlocAETznXqaaGbgDh
         2Zaw==
X-Gm-Message-State: APjAAAU2ma1G9QlDmJ5xnybgOLBs/9J1X2orCwxDFlOlSPU8t4lVQQO1
        eboo52ItxVHDMQatHsYdOwg=
X-Google-Smtp-Source: APXvYqzczN9kvUPQ7Hc2LxnRw9L6ohEd0G4hrwU0EL1lvwEgBvQanEfnjjXSSKWlr9BOfM41oALivA==
X-Received: by 2002:a63:111e:: with SMTP id g30mr6840840pgl.251.1576346092717;
        Sat, 14 Dec 2019 09:54:52 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id j16sm16064250pfi.165.2019.12.14.09.54.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:54:52 -0800 (PST)
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
Subject: [PATCH 01/10] soc: sunxi: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:38 +0000
Message-Id: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/sunxi/sunxi_sram.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 1b0d50f36349..f73fbcc73f51 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -320,7 +320,6 @@ static struct regmap_config sunxi_sram_emac_clock_regmap = {
 
 static int sunxi_sram_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct dentry *d;
 	struct regmap *emac_clock;
 	const struct sunxi_sramc_variant *variant;
@@ -331,8 +330,7 @@ static int sunxi_sram_probe(struct platform_device *pdev)
 	if (!variant)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

