Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A87CD4D2B
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 07:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfJLFQX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Oct 2019 01:16:23 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25430 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfJLFQW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Oct 2019 01:16:22 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1570857294; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=ZTWaLQmc0gjhBy84aeTb3RYtvDuiYIFuAD/lUzcXoefgXHqwHS/Gql82SXd+QaStZCp8lnxgEm3kMaJJTIKsjXaxEaJpcNrPURbCyQ9bSBb06fmhSA3wAW0E/4mTliwtqkhR4+vykJO3k8pPSJY4CaxOKBNtn1v4AvkCENMK1bE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1570857294; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=C0apDRgSc6LA8qMRVIi13ga9yNXfuBb7StrbdjX9Oiw=; 
        b=bn3yCie7C0tC3JJntbdUCKm0XAyXhlu6aNhWRJE2XEd7FO6dWSWGJ1d1Z60QoJdWov9AGpKYA3gcji6p6ydKi1dcC9UEsnG4N8/Tpsz/Sik41Bm+phqfDI3VIw4pENpHMp8+SyZNwC/saTgMAwMsfokLxUOJ47oUa0d7oE2O4fM=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=UssMQhHqA8isLkEmOs24Do3vgqgoIvrWaUpDiMvVe8AfqKa+AFwsQsWJ/GxXhOUZEmO863PGt6FJ
    cF8gfX369YOCtcged+CAAWkL+LY1qtpgU2068q1szLjwrY6P5ciS  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1570857294;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=961;
        bh=C0apDRgSc6LA8qMRVIi13ga9yNXfuBb7StrbdjX9Oiw=;
        b=K5+tkkNFQ521rAH7mIuZ88NPMjZpgzYN4YSCzCEXJaA3sS2EyN0XmxfFtTQmPbTy
        V0Ii422nmQIAKJrC8xXC6dzUsp+xhKNqFYglc+Yp6LIdAKpuWWjKTEYTHnB7xy3Ff9i
        yTdxfq3g+X3B3zJHNj3iVDLT8qRkPzahlouTLTHM=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1570857293413883.9512660333022; Fri, 11 Oct 2019 22:14:53 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, mark.rutland@arm.com, syq@debian.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        armijn@tjaldur.nl, tglx@linutronix.de, yuehaibing@huawei.com,
        malat@debian.org, ezequiel@collabora.com, paul@crapouillou.net
Subject: [PATCH 3/6 v2] MMC: JZ4740: Add support for the JZ4760.
Date:   Sat, 12 Oct 2019 13:13:17 +0800
Message-Id: <1570857203-49192-4-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
 <1570857203-49192-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing mmc driver on the JZ4760 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/mmc/host/jz4740_mmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 69c4a8b..f4c4890 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -107,6 +107,7 @@
 enum jz4740_mmc_version {
 	JZ_MMC_JZ4740,
 	JZ_MMC_JZ4725B,
+	JZ_MMC_JZ4760,
 	JZ_MMC_JZ4780,
 };
 
@@ -935,6 +936,7 @@ static const struct mmc_host_ops jz4740_mmc_ops = {
 static const struct of_device_id jz4740_mmc_of_match[] = {
 	{ .compatible = "ingenic,jz4740-mmc", .data = (void *) JZ_MMC_JZ4740 },
 	{ .compatible = "ingenic,jz4725b-mmc", .data = (void *)JZ_MMC_JZ4725B },
+	{ .compatible = "ingenic,jz4760-mmc", .data = (void *) JZ_MMC_JZ4760 },
 	{ .compatible = "ingenic,jz4780-mmc", .data = (void *) JZ_MMC_JZ4780 },
 	{},
 };
-- 
2.7.4


