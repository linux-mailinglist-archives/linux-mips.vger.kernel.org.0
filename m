Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97B2611F308
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:55:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfLNRzA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:55:00 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39049 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfLNRy7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:54:59 -0500
Received: by mail-pj1-f67.google.com with SMTP id v93so1122820pjb.6;
        Sat, 14 Dec 2019 09:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cR390BUd1z2kCitxpdbSxliSXAqeOVtm3C9sL9OzjjQ=;
        b=ak3fvDEQ4v6f6WR6iuVyCDGGuOXR5kV7UcWmahh2teo8P+j98Rkfhsic/vSt4LF2S0
         dG816usghYdayQyFi+h73xQK7mV3WEin9ewgy+4obyVj2YJLKxIBJTgWNVo1ReynM9f2
         dGPbh5KaUL27AYtbMhomIj9EpwiJPMiJrFqZGaR8U8Y1Hr81RmU50AXBc5AYTUAAcu+X
         h34m0JUpuOCbta0deTOnbL3CduxIdcdVoOTeaS4rX/cXd1+cHBmGKmJAfRZMkgReE+eh
         ib0Fwx6P7vvwuE0bkNdrKd7uZCbDlbvAJgyao18OQue/ZJTBhgdtEsEcKmDZssmDkZmE
         2MGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cR390BUd1z2kCitxpdbSxliSXAqeOVtm3C9sL9OzjjQ=;
        b=qYMRnM4hSZkktKI+XIWIyPYnu3l9A7XTgvb9TIzK2MAbU0s9WgS95/4uo3s9cwBV43
         v2u9nws9m711i0YQoN5V9qNy2WZ0CdyfTvZThXRl6R37tVPnY/CqhHalhPuUdoHugx70
         xYVDJsvK0s5n3b+pc97ZSlcTlow6VcKxXZtPaDyeMVQ0oiHa4PCmy52aAltbDLyaERPr
         Td+zol0wGJu8rm/JjOSB5TBTsrwtpyt6eWpbs2WfdJyFEm/FZ26Mt8P00TkdQBHKikuu
         MtHZv87hQOgfijF5aI3hmUUZd7x3ml7WKPYLG+NIj+/MtNepKtHlRE0UK1GmKGaxoi6W
         pmTg==
X-Gm-Message-State: APjAAAWukzuIG1YvZDusH19xUGRwqjDHgj5hztraBHo9NmdXz7wG6Q9A
        SUgZ1pQFDmRlJKzrikzFLXA=
X-Google-Smtp-Source: APXvYqwoSFUXO6LtjfdNMc8g3OGbieZm7pvHioNceUic/z+nzmqFIdRcPY5BJ/C1CRPZ5uLd99i6yw==
X-Received: by 2002:a17:902:6b49:: with SMTP id g9mr6338781plt.156.1576346099003;
        Sat, 14 Dec 2019 09:54:59 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id k23sm15535481pgg.7.2019.12.14.09.54.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:54:58 -0800 (PST)
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
Subject: [PATCH 03/10] soc: amlogic: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:40 +0000
Message-Id: <20191214175447.25482-3-tiny.windzz@gmail.com>
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
 drivers/soc/amlogic/meson-canvas.c      | 4 +---
 drivers/soc/amlogic/meson-clk-measure.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index c655f5f92b12..561044063319 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -166,7 +166,6 @@ EXPORT_SYMBOL_GPL(meson_canvas_free);
 
 static int meson_canvas_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct meson_canvas *canvas;
 	struct device *dev = &pdev->dev;
 
@@ -174,8 +173,7 @@ static int meson_canvas_probe(struct platform_device *pdev)
 	if (!canvas)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	canvas->reg_base = devm_ioremap_resource(dev, res);
+	canvas->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(canvas->reg_base))
 		return PTR_ERR(canvas->reg_base);
 
diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 0fa47d77577d..173baa53fce3 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -605,7 +605,6 @@ static int meson_msr_probe(struct platform_device *pdev)
 {
 	const struct meson_msr_id *match_data;
 	struct meson_msr *priv;
-	struct resource *res;
 	struct dentry *root, *clks;
 	void __iomem *base;
 	int i;
@@ -623,8 +622,7 @@ static int meson_msr_probe(struct platform_device *pdev)
 
 	memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "io resource mapping failed\n");
 		return PTR_ERR(base);
-- 
2.17.1

