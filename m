Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81394D4D23
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfJLFP0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:15:26 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25401 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfJLFP0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:15:26 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570857264; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=B3gLLuONyg+jjiweDkI+r6Vk5TafUG4pB72BfKtsqJrWoX04rJmfZoYq5fuRpF2q0iYU78EiDi5Z3f+YtMX3xWOW3/PDDV2AvheqAw++9XQVc0TIbp5f381mLdj/t9a/b2JyjwCVTfM+CjtDE83y2XDa3g9XuphoOSbvZPN+eOs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570857264; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=HLJOVc0FoZwSAt3EYRYKW8jAHE/pfwdL8B/KwgIP7u0=; 
        b=k22pK2A5Sj8w5O8YelisoAhs+P/m/+C53imayfVFQT7qaPqkuH1UBbpCr9OoQavqwXp/hRzI4lz+bLvcAVa7CxV5Rta6R9PgdHFQIPUF/t0QpVzGJzy6X2laPyhjMy3q9RpG1d9BZGPkCLa2ll/AzeHGqRtANW0rTuKZdq1JYuQ=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=R79UcXmQAjb2aS+fGS5TOfvkwy9xAR5nDSBziOyjDoTZ4u+WMg8C05nh8tNqtuogAhjbx+OiLVEZ
    021FadywLmEiUuhd6fEH9TUOBVD9ilaPCNbgRVc4YX3k1BHL7UBR  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570857264;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1598; bh=HLJOVc0FoZwSAt3EYRYKW8jAHE/pfwdL8B/KwgIP7u0=;
        b=mFBrZ0irah5kOn6dd2YnnQD9OGx1FA4Aw9mvpzDEurkVQpZj5L/8quBMzuVtU+Pd
        XHCiSYpDjcW3LhqsQNeP2VTiBVGhVxvHSHVSegcB+rYrJDGN6rtG3RNjNwBNxgHBKEG
        /IDJpcuXTtrjG8t6uqOR++UlcTpOusosyyOg8nOw=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570857263687742.2424629736723; Fri, 11 Oct 2019 22:14:23 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        armijn@tjaldur.nl, tglx@linutronix.de, yuehaibing@huawei.com,
        malat@debian.org, ezequiel@collabora.com, paul@crapouillou.net
Subject: [PATCH 1/6 v2] MMC: Ingenic: Add 8bit mode support.
Date:   Sat, 12 Oct 2019 13:13:15 +0800
Message-Id: <1570857203-49192-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
 <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for 8bit mode, now supports 1bit/4bit/8bit modes.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/mmc/host/jz4740_mmc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index ffdbfaa..69c4a8b 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -79,6 +79,8 @@
 
 #define JZ_MMC_CMDAT_IO_ABORT BIT(11)
 #define JZ_MMC_CMDAT_BUS_WIDTH_4BIT BIT(10)
+#define JZ_MMC_CMDAT_BUS_WIDTH_8BIT (BIT(10) | BIT(9))
+#define	JZ_MMC_CMDAT_BUS_WIDTH_MASK (BIT(10) | BIT(9))
 #define JZ_MMC_CMDAT_DMA_EN BIT(8)
 #define JZ_MMC_CMDAT_INIT BIT(7)
 #define JZ_MMC_CMDAT_BUSY BIT(6)
@@ -899,11 +901,16 @@ static void jz4740_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 
 	switch (ios->bus_width) {
 	case MMC_BUS_WIDTH_1:
-		host->cmdat &= ~JZ_MMC_CMDAT_BUS_WIDTH_4BIT;
+		host->cmdat &= ~JZ_MMC_CMDAT_BUS_WIDTH_MASK;
 		break;
 	case MMC_BUS_WIDTH_4:
+		host->cmdat &= ~JZ_MMC_CMDAT_BUS_WIDTH_MASK;
 		host->cmdat |= JZ_MMC_CMDAT_BUS_WIDTH_4BIT;
 		break;
+	case MMC_BUS_WIDTH_8:
+		host->cmdat &= ~JZ_MMC_CMDAT_BUS_WIDTH_MASK;
+		host->cmdat |= JZ_MMC_CMDAT_BUS_WIDTH_8BIT;
+		break;
 	default:
 		break;
 	}
@@ -1034,7 +1041,8 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
 
 	dev_info(&pdev->dev, "Using %s, %d-bit mode\n",
 		 host->use_dma ? "DMA" : "PIO",
-		 (mmc->caps & MMC_CAP_4_BIT_DATA) ? 4 : 1);
+		 (mmc->caps & MMC_CAP_8_BIT_DATA) ? 8 :
+		 ((mmc->caps & MMC_CAP_4_BIT_DATA) ? 4 : 1));
 
 	return 0;
 
-- 
2.7.4


