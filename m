Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6C2C11F2F6
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbfLNRy5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:54:57 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34704 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfLNRy4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:54:56 -0500
Received: by mail-pf1-f196.google.com with SMTP id l127so1462311pfl.1;
        Sat, 14 Dec 2019 09:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ndfZOSOPMFzdlsJ4y++gytIs8MeUXglHTS0DvEbmTno=;
        b=IdnEahgWAR9M4ay1p7g7jXGNeleJSN/P4VE30OGOw9nwFkNumcqzoq8i3h9o4rIrUu
         Nurp0p2IiltqBDNFiqIVSHRXRwmvF75PwfIGvhnVdzMvWhV6G8AINxl2D9oEa1D6/pQe
         ytdcI6Wex7iWcRLeDfkXp+Vciij7n77J4rN6sIy1fw+8gTuR7m894EJ5/IyqVEaLOEJ9
         xtPABBFefL/DQZ3qA5wCEinKv2ZWtgxyx4/lRYaZDd5wYVFpm4aDjFQ0AHugNROjJzvb
         WPdwxO4zXX8wVPTvkieEKPZzux9cfO7YuHwXLHEni208k1iAUI8slHYwMcnswHyhf4nG
         ws3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ndfZOSOPMFzdlsJ4y++gytIs8MeUXglHTS0DvEbmTno=;
        b=EmmSuxOpcvFy0Z53LKkqrSBy2Say1HTo3buqsu6ebm0CTjhrQ2KoOFCh49QRJKZvLg
         7tbHGdHOI3czuzQpphm4CnehOaD/ctiNzUIB5+fuMm/tWp77L0nasCeKhYRDQKNpYfDE
         b1N+w+cwgVZHy/mBbph+FMxyV8lZeGIsy24wH4OUu9HUo26HVgU5wOxEryBfKNZJnUF0
         2TgWvPJbGjyaPPiA7hl1x0WMHNX1aPnpBnoAlXlsfigEW3OV/+Oi9HGTervF023D11fQ
         54smrhcKbBTvsugM5No59YkQTvXNvzc/C8Se9BQAv8yQAitTIpZVofGjOfUEowyEG6J7
         PQfg==
X-Gm-Message-State: APjAAAXP2Djz0Bwe+6bdbvQqm4/xl1AeqXDyXA6PNY/fqly021XOVrak
        chafNdQ60Hdkam54Sccbkbk=
X-Google-Smtp-Source: APXvYqyntHYYzT5XK8Is3T2y43EjL546dQMIWdhxgNlwlneNp8k3SwJP9re1oPWgimXPNxBXbgGHIQ==
X-Received: by 2002:aa7:8d03:: with SMTP id j3mr6687115pfe.162.1576346096173;
        Sat, 14 Dec 2019 09:54:56 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id k9sm13731248pje.26.2019.12.14.09.54.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:54:55 -0800 (PST)
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
Subject: [PATCH 02/10] soc: samsung: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:39 +0000
Message-Id: <20191214175447.25482-2-tiny.windzz@gmail.com>
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
 drivers/soc/samsung/exynos-pmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index d34ca201b8b7..7da2701c871a 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -110,10 +110,8 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 static int exynos_pmu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pmu_base_addr = devm_ioremap_resource(dev, res);
+	pmu_base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pmu_base_addr))
 		return PTR_ERR(pmu_base_addr);
 
-- 
2.17.1

