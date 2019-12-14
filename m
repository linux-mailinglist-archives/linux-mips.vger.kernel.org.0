Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E2811F310
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfLNRzP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:55:15 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35801 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfLNRzP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:55:15 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so850plt.2;
        Sat, 14 Dec 2019 09:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p464edzUa2iPp9uHgJjpc0nSudXprxPgj9c87WZ/a/8=;
        b=jwbTlKjUlgdBEVsfFGJ0AFRM27IrT+5/nGVpeqjmCQY8Pvog9nLbJEGs3BoJShCWcc
         HUCs/NcUJEbspXufkbpSOSgpcLjHI9uSC2uL8deL98KCPLdAycltVaMbDTSY7BfErs2r
         3jb+3au9m3HLLvo5IanTkhro0u+uMh+7QnL1Kmvn6n0zxgK8PqWxjbHB9UOlTP9lJERQ
         fRA0q2rQ0Mg0I4cJZ6oR/WvAPyLLemDcLzfJOfJwdMDJDyZj6sbgdurkJ9mbvF3rvF94
         qtAuTF6Xj2R2j2anoXaTjjEStkzmzXjXeUm9O3eCz5K6gXyVi95VvTd8QtE1eKhmZ/RZ
         FutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p464edzUa2iPp9uHgJjpc0nSudXprxPgj9c87WZ/a/8=;
        b=WS7vIVch4MTHFK1LyKHyJDrFFR/tymOvVfDq1ATaYUXxcmR0bMp9qRHLNKxtrWwYXb
         OjT30sRlns2fUQL0HRmYJ7v5uRo9exUJhCI3kf4g1BS2JpsK1A/msFDzl2f+5oh/eVaA
         mo6jx8+m/h93GCkvvW+w3Ow2isCMciREYTk4qIGe+BTZD95lBgJ48WESUKrAY2NO1xLM
         X+Xi+T7PdSrDP3hFd64xsvzahZVSLwNqskStcNv1NngMjuFUCUGzneyw1OabBMzywGzz
         F3Iu0B8+RJxdRRZFC4qoRmHcffmPR7LqN+yCTpVfxFdAwAV9cErWOR3wd/mpIkyTFDE+
         CNdQ==
X-Gm-Message-State: APjAAAUVfP4feqk+jgF+k4IiHePNkmW3BeduFj2NWO+U5EDP/lF3eliX
        JUsnwp/bFBDnKuNSdfz2Mnc=
X-Google-Smtp-Source: APXvYqxG8GAI4f/vKneCzHJdyU3sDnTOcUKGttUJVG0Uipa0HZQ6CtNPSXlPYC7sJOX/nTAUj+QlEA==
X-Received: by 2002:a17:90a:374b:: with SMTP id u69mr6820565pjb.23.1576346114545;
        Sat, 14 Dec 2019 09:55:14 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id z23sm14868517pgj.43.2019.12.14.09.55.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:55:13 -0800 (PST)
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
Subject: [PATCH 08/10] soc: lantiq: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:45 +0000
Message-Id: <20191214175447.25482-8-tiny.windzz@gmail.com>
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
 drivers/soc/lantiq/fpi-bus.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/lantiq/fpi-bus.c b/drivers/soc/lantiq/fpi-bus.c
index cb0303a0fe60..dff1375851cf 100644
--- a/drivers/soc/lantiq/fpi-bus.c
+++ b/drivers/soc/lantiq/fpi-bus.c
@@ -28,14 +28,12 @@ static int ltq_fpi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct resource *res_xbar;
 	struct regmap *rcu_regmap;
 	void __iomem *xbar_membase;
 	u32 rcu_ahb_endianness_reg_offset;
 	int ret;
 
-	res_xbar = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	xbar_membase = devm_ioremap_resource(dev, res_xbar);
+	xbar_membase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(xbar_membase))
 		return PTR_ERR(xbar_membase);
 
-- 
2.17.1

