Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9709111F300
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbfLNRzJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:55:09 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:43921 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbfLNRzJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:55:09 -0500
Received: by mail-pj1-f68.google.com with SMTP id g4so1117130pjs.10;
        Sat, 14 Dec 2019 09:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ng8Q0G8vgCj6uZQhSm10VUxj1CLBc6zwwLxL5iSkIvg=;
        b=uwDo3TMv8S2LoOFtW4JVpy1MDe4ohxY3mDft8b066gcYOSuhrz7Vn+cChfAtY3zyqn
         IAyetRDDXThqE289VVS2YvJOiNym3+wHdqebZAOj/+de9OBlKY5zjjmSIqBB9ae1zcyE
         QsjU0e36EmG8HlZAn2z14x2grKm00ym36TewLzHqvcoWKlXNBvO36kzVqFZ+C9rdQ5vB
         8psuuCLMuKqOqlZxA2CdL8otclGnRw8GGN4mAppdWQKbQOEHr6G//zV1s+vOZGE2ysCF
         yfb7BEDTYGm17ide1ziXmZvv3fdOSWOiBnjE8djoQeQ9JuszfdfL9RNemPFm4yVxJLYK
         IpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ng8Q0G8vgCj6uZQhSm10VUxj1CLBc6zwwLxL5iSkIvg=;
        b=Isaqo14FRH2rCREZmg7Nsdv84yLMCwu1Ks2i+EQ4wD3jLS5vQIMTV/T1//U00t5wu/
         dVEj3u4X9ohBWlqYyd4DpdGc7HYb0xdiqLcd4dNaUMksh/eDHOtOKzRnH/HFd388AssV
         yxnohZgRwHyQ18+ljzr96uTzM1SjkD9Ggm5Tr3mfLyXdMk6iueA5MBX+vvbwKzz5cRs5
         wUDylW7LCyveb+WKEQ04pxqo8hagx8M2epzOFz4nue/FEccyWawsATR5XGCKcH+bl3DH
         S5idZ9H/Jtc5tBQUZ3cP39jjqDwk3+b0aIo360BF9mtDDyR4/HXBm+g+MR4n+b6h6hoG
         Crzg==
X-Gm-Message-State: APjAAAUkd8uRpg+2RxPHH8QAPs1E8ULKUjyCNBTS4goXbyf2ICegSrLG
        Ly7BhVMrKx3OtIh/w1nt6M0=
X-Google-Smtp-Source: APXvYqw4NxLBs8k/N3sZ95qNmbftyGzDAHq+3kcbBnLjVVt0Sw+VMa4Kzi1WhBK/Tx84u07Lwngzfg==
X-Received: by 2002:a17:902:8501:: with SMTP id bj1mr6375383plb.84.1576346108088;
        Sat, 14 Dec 2019 09:55:08 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id u2sm15056755pgc.19.2019.12.14.09.55.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:55:07 -0800 (PST)
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
Subject: [PATCH 06/10] soc: mediatek: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:43 +0000
Message-Id: <20191214175447.25482-6-tiny.windzz@gmail.com>
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
 drivers/soc/mediatek/mtk-scpsys.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index f669d3754627..2aa2afdc9ccf 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -425,7 +425,6 @@ static struct scp *init_scp(struct platform_device *pdev,
 			bool bus_prot_reg_update)
 {
 	struct genpd_onecell_data *pd_data;
-	struct resource *res;
 	int i, j;
 	struct scp *scp;
 	struct clk *clk[CLK_MAX];
@@ -441,8 +440,7 @@ static struct scp *init_scp(struct platform_device *pdev,
 
 	scp->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	scp->base = devm_ioremap_resource(&pdev->dev, res);
+	scp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(scp->base))
 		return ERR_CAST(scp->base);
 
-- 
2.17.1

