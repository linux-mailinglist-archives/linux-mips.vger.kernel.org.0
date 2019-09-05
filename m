Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEA4BA9C19
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 09:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731746AbfIEHkn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 03:40:43 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25521 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730769AbfIEHkn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 03:40:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1567669138; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=bbyvOXRs9Tcc7kCLTdH0JOWp66Ask/teV8N0yAkNv48JTvvEUDgEhhnXrQodA10ECo4qAoybzPdOKU7HuRIINfedgwsGu7ddyEKPwKroxZtidaGrMcHd3UYHV0UhPMsglZPxPg6fDEZAhAZg2sM6+7bh4fg6a6usIRrJXGKh3Ng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567669138; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=I5Jl+lRwVJSmYK5N04Ftz1awAcGGAYjkgicsp1LfCyk=; 
        b=T69p+TdOmZIXKkTIxE6daC9rT68eKWGSI7M4Qw1Gg4XZBkfAcuRPg5v7VTzt4JGiy8jBiPqh6UhPYs++ZpGj8ajN94RQ969HQR8cYmknPiX87lHtCxDAkZDGVzTwHekpqYq2QJjn2axa8ym7Ebpig37hjLD4B9obON1g/hAbC/4=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=EJYjrjBwwp5bhvwJq7W/6i9l8gYEDG/kQEHJI7Rm5ndzu6VEyqW7m5E/mdYOox0/BEqKrtqWtM8A
    Eu7A26gfmN9kVyprQG+uEeicCp8eJKNswoXiAnB2Wc+bg1kJKBgW  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1567669138;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1944; bh=I5Jl+lRwVJSmYK5N04Ftz1awAcGGAYjkgicsp1LfCyk=;
        b=dUSE5lByWPHkV4P5NSPYSBiFnFagA3tbZyL/er/zkLkExddUjgqzZ3DiY8GHPhUR
        mtHNy0WggqLNGv2OiQZvNNBaODLDFfH6HThC8BQleFsPuiOTMDl0aLfxQPWQlNbCcvg
        m7AcmotbrC9O2ZKYH6GwKXmCOrYW9n3vE8q6GWnY=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1567669136703108.89236573844028; Thu, 5 Sep 2019 00:38:56 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com,
        ezequiel@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org, jiaxun.yang@flygoat.com
Subject: [PATCH 4/4] MMC: Ingenic: Add support for JZ4760 and support for LPM.
Date:   Thu,  5 Sep 2019 15:38:09 +0800
Message-Id: <1567669089-88693-5-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.add support for probing mmc driver on the JZ4760 Soc from Ingenic.
2.add support for Low Power Mode of Ingenic's MMC/SD Controller.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/mmc/host/jz4740_mmc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index d6811a7..1e61f1b 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -43,6 +43,7 @@
 #define JZ_REG_MMC_RES		0x34
 #define JZ_REG_MMC_RXFIFO	0x38
 #define JZ_REG_MMC_TXFIFO	0x3C
+#define JZ_REG_MMC_LPM		0x40
 #define JZ_REG_MMC_DMAC		0x44
 
 #define JZ_MMC_STRPCL_EXIT_MULTIPLE BIT(7)
@@ -102,11 +103,15 @@
 #define JZ_MMC_DMAC_DMA_SEL BIT(1)
 #define JZ_MMC_DMAC_DMA_EN BIT(0)
 
+#define	JZ_MMC_LPM_DRV_RISING BIT(31)
+#define	JZ_MMC_LPM_LOW_POWER_MODE_EN BIT(0)
+
 #define JZ_MMC_CLK_RATE 24000000
 
 enum jz4740_mmc_version {
 	JZ_MMC_JZ4740,
 	JZ_MMC_JZ4725B,
+	JZ_MMC_JZ4760,
 	JZ_MMC_JZ4780,
 };
 
@@ -858,6 +863,16 @@ static int jz4740_mmc_set_clock_rate(struct jz4740_mmc_host *host, int rate)
 	}
 
 	writew(div, host->base + JZ_REG_MMC_CLKRT);
+
+	if (host->version >= JZ_MMC_JZ4760) {
+		if (real_rate > 25000000)
+			writel(JZ_MMC_LPM_DRV_RISING |
+				   JZ_MMC_LPM_LOW_POWER_MODE_EN,
+				   host->base + JZ_REG_MMC_LPM);
+	} else if (host->version >= JZ_MMC_JZ4725B)
+		writel(JZ_MMC_LPM_LOW_POWER_MODE_EN,
+			   host->base + JZ_REG_MMC_LPM);
+
 	return real_rate;
 }
 
@@ -935,6 +950,7 @@ static const struct mmc_host_ops jz4740_mmc_ops = {
 static const struct of_device_id jz4740_mmc_of_match[] = {
 	{ .compatible = "ingenic,jz4740-mmc", .data = (void *) JZ_MMC_JZ4740 },
 	{ .compatible = "ingenic,jz4725b-mmc", .data = (void *)JZ_MMC_JZ4725B },
+	{ .compatible = "ingenic,jz4760-mmc", .data = (void *) JZ_MMC_JZ4760 },
 	{ .compatible = "ingenic,jz4780-mmc", .data = (void *) JZ_MMC_JZ4780 },
 	{},
 };
-- 
2.7.4


