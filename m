Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEDB811F30D
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfLNRzG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:55:06 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36220 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbfLNRzF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:55:05 -0500
Received: by mail-pg1-f195.google.com with SMTP id k3so1192603pgc.3;
        Sat, 14 Dec 2019 09:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v6oAG/oclrFZaQCUj3wJrPoJgy8LLnv+ppI5zjGSg18=;
        b=OCcdjtzdFuDyzNdFRzdJGEK76qLV1wGwcTnhFwUzPrNIPhZ9jWkNZij8M6nrd2EqfQ
         xLdaVpLufWVdsT/JQCTm7lDYNoW5zbwtCZ3JNDX9PBDxZEeDrr4LM94ONhsxXiBoRYSD
         vwMSJnvm2XuH/yOd7dnU9xcj13rrYnxkxAdEB0sheLW1J/ap+GQdqZDSfv7y/fC3AO05
         q8jxfaZssVfvuKTZ5klKz3YaPLhO9FNqhKBHW9Zj8q9hcdEPxDNLOD88YHAJFHlAKzH3
         RmKZEcild3g8BPyIPHduEF8bqveRyYY24EdZfRKUZ+xRhqr4Sbmhg7f/o/Tu/c95uI1S
         whoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v6oAG/oclrFZaQCUj3wJrPoJgy8LLnv+ppI5zjGSg18=;
        b=bZzytglpg3aFxnXKNtBOs+t6g/acffzhejzInXu6gdMEofdoc+JB5yxGt9YzVOS4iT
         /n2+nYysuisvSJsvDLsMJ2ggQdNwQu23VfTxleFj1p/a9vbxnAwzay8zILkfU1U2VTYC
         S7gt5sAYMvt2sDFHBcji6l9cMBTZePo5h7GCWH/T4NVNXjSmL4esapyEgYtH53vQJUkZ
         ty+liaWMfn+/IlczBSdhqdOPI00fhAzffL7vNBDpwXaXeMOILNZns83Af4F9DueZjePl
         XpxVFRxLcPZLN791l7ZK/fs1XVMghAHentAE3XoBzRPwAqfCChbFL+RZUXlq4URy5neP
         nNrg==
X-Gm-Message-State: APjAAAVQh7CW/ku9N6Wxz/34c0xmciK7nL7KNDzYYutI9mbxwvMmSy2C
        +Gh+s+miw2V/QXWxi472fbs=
X-Google-Smtp-Source: APXvYqzpEedmt61YxQUSdB6sRDA3ehIRbG8Z9JBjQgmUFXEG8lTrpXVy3xxhvrG+pkjNaW8TwDq1eA==
X-Received: by 2002:a63:4f5c:: with SMTP id p28mr6565754pgl.409.1576346104392;
        Sat, 14 Dec 2019 09:55:04 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id b22sm16045885pfd.63.2019.12.14.09.55.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:55:03 -0800 (PST)
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
Subject: [PATCH 05/10] soc: fsl: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:42 +0000
Message-Id: <20191214175447.25482-5-tiny.windzz@gmail.com>
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
 drivers/soc/fsl/guts.c | 4 +---
 drivers/soc/fsl/rcpm.c | 7 +------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 34810f9bb2ee..ebec06a22ab4 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -140,7 +140,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	const struct fsl_soc_die_attr *soc_die;
 	const char *machine;
 	u32 svr;
@@ -152,8 +151,7 @@ static int fsl_guts_probe(struct platform_device *pdev)
 
 	guts->little_endian = of_property_read_bool(np, "little-endian");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	guts->regs = devm_ioremap_resource(dev, res);
+	guts->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(guts->regs))
 		return PTR_ERR(guts->regs);
 
diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index a093dbe6d2cb..322fde95974b 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -102,7 +102,6 @@ static const struct dev_pm_ops rcpm_pm_ops = {
 static int rcpm_probe(struct platform_device *pdev)
 {
 	struct device	*dev = &pdev->dev;
-	struct resource *r;
 	struct rcpm	*rcpm;
 	int ret;
 
@@ -110,11 +109,7 @@ static int rcpm_probe(struct platform_device *pdev)
 	if (!rcpm)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r)
-		return -ENODEV;
-
-	rcpm->ippdexpcr_base = devm_ioremap_resource(&pdev->dev, r);
+	rcpm->ippdexpcr_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rcpm->ippdexpcr_base)) {
 		ret =  PTR_ERR(rcpm->ippdexpcr_base);
 		return ret;
-- 
2.17.1

