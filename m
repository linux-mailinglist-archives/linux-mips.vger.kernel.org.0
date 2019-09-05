Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8049A9C0B
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 09:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbfIEHjS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 03:39:18 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25461 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbfIEHjS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 03:39:18 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1567669116; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=TlFcqFBhTxkXFm+qZD2KmWorCV1Q995Frdh/169tde8AvUxfGyll78ONAE+W/T1spGsd4f3k6dn8JmsKz0qn4Vz0kIK2SFlmgfqxPoivyjPyuNLRweZMSu/JNC/QQSmHstUP0H1M5BikZkfyRK2bVJxMJCCV9nSTMd+XKg7XPNc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567669116; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=no85iaJ0HmXEGz1jZcuzTck29a5rHbtxXoVG0kJSZfk=; 
        b=jgr6OOi9C5oSZElvpTiQhWaHO5r3zCPwN7YOu4gSbUCkLR7YW+xfjJIA4QPCFDNlhWsTsQewe+Sj8lWQOGaRwXOsRnz21hpSIVnFcO9dfYLqhzrNhy1B7K4+xAkelpiXRMQMJKCA+p26vnmiqvq5chWO/axDD9arKKK6aTD2YU8=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=iILQy9qJtg8BR1p8ai3nvXG+HInP2Q+AnD8DKMPFaK4wiCGHaEBdzx6qzmaqSBIqCz4oA9BqebaZ
    g39VXCqxKJ4fiokxmKhYhmFBoRHk8XJ49OIwa4LNfR2XAVT1cGYj  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1567669116;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=3100; bh=no85iaJ0HmXEGz1jZcuzTck29a5rHbtxXoVG0kJSZfk=;
        b=Z2UiLHs+5XZxY00bTJNE7UKyyiBbLUSkqIOEcvHTMNCSEy32mqBePScQM8cTF8ok
        mhnJWK5ff12hiVp0oeV2PYZ2DW3YLZ7ECytYU+472pE21GJbsLYYhv571qbDEwCglBn
        5OI4+LIg7UQGrTBx+sbiuDJ+FFSdRbKPpG+IXqlA=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1567669114862143.77120560367462; Thu, 5 Sep 2019 00:38:34 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, ulf.hansson@linaro.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, malat@debian.org, yuehaibing@huawei.com,
        ezequiel@collabora.com, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org, jiaxun.yang@flygoat.com
Subject: [PATCH 1/4] MMC: Ingenic: Adjust the macro definition name.
Date:   Thu,  5 Sep 2019 15:38:06 +0800
Message-Id: <1567669089-88693-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
References: <1567669089-88693-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adjust the macro definition name to match the corresponding
register name in the datasheet.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/mmc/host/jz4740_mmc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index ffdbfaa..1b1fcb7 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -28,7 +28,7 @@
 #include <asm/mach-jz4740/dma.h>
 
 #define JZ_REG_MMC_STRPCL	0x00
-#define JZ_REG_MMC_STATUS	0x04
+#define JZ_REG_MMC_STAT		0x04
 #define JZ_REG_MMC_CLKRT	0x08
 #define JZ_REG_MMC_CMDAT	0x0C
 #define JZ_REG_MMC_RESTO	0x10
@@ -40,7 +40,7 @@
 #define JZ_REG_MMC_IREG		0x28
 #define JZ_REG_MMC_CMD		0x2C
 #define JZ_REG_MMC_ARG		0x30
-#define JZ_REG_MMC_RESP_FIFO	0x34
+#define JZ_REG_MMC_RES		0x34
 #define JZ_REG_MMC_RXFIFO	0x38
 #define JZ_REG_MMC_TXFIFO	0x3C
 #define JZ_REG_MMC_DMAC		0x44
@@ -391,7 +391,7 @@ static void jz4740_mmc_clock_disable(struct jz4740_mmc_host *host)
 
 	writew(JZ_MMC_STRPCL_CLOCK_STOP, host->base + JZ_REG_MMC_STRPCL);
 	do {
-		status = readl(host->base + JZ_REG_MMC_STATUS);
+		status = readl(host->base + JZ_REG_MMC_STAT);
 	} while (status & JZ_MMC_STATUS_CLK_EN && --timeout);
 }
 
@@ -403,7 +403,7 @@ static void jz4740_mmc_reset(struct jz4740_mmc_host *host)
 	writew(JZ_MMC_STRPCL_RESET, host->base + JZ_REG_MMC_STRPCL);
 	udelay(10);
 	do {
-		status = readl(host->base + JZ_REG_MMC_STATUS);
+		status = readl(host->base + JZ_REG_MMC_STAT);
 	} while (status & JZ_MMC_STATUS_IS_RESETTING && --timeout);
 }
 
@@ -446,7 +446,7 @@ static void jz4740_mmc_transfer_check_state(struct jz4740_mmc_host *host,
 {
 	int status;
 
-	status = readl(host->base + JZ_REG_MMC_STATUS);
+	status = readl(host->base + JZ_REG_MMC_STAT);
 	if (status & JZ_MMC_STATUS_WRITE_ERROR_MASK) {
 		if (status & (JZ_MMC_STATUS_TIMEOUT_WRITE)) {
 			host->req->cmd->error = -ETIMEDOUT;
@@ -580,10 +580,10 @@ static bool jz4740_mmc_read_data(struct jz4740_mmc_host *host,
 	/* For whatever reason there is sometime one word more in the fifo then
 	 * requested */
 	timeout = 1000;
-	status = readl(host->base + JZ_REG_MMC_STATUS);
+	status = readl(host->base + JZ_REG_MMC_STAT);
 	while (!(status & JZ_MMC_STATUS_DATA_FIFO_EMPTY) && --timeout) {
 		d = readl(fifo_addr);
-		status = readl(host->base + JZ_REG_MMC_STATUS);
+		status = readl(host->base + JZ_REG_MMC_STAT);
 	}
 
 	return false;
@@ -614,7 +614,7 @@ static void jz4740_mmc_read_response(struct jz4740_mmc_host *host,
 {
 	int i;
 	uint16_t tmp;
-	void __iomem *fifo_addr = host->base + JZ_REG_MMC_RESP_FIFO;
+	void __iomem *fifo_addr = host->base + JZ_REG_MMC_RES;
 
 	if (cmd->flags & MMC_RSP_136) {
 		tmp = readw(fifo_addr);
@@ -797,7 +797,7 @@ static irqreturn_t jz_mmc_irq(int irq, void *devid)
 	struct mmc_command *cmd = host->cmd;
 	uint32_t irq_reg, status, tmp;
 
-	status = readl(host->base + JZ_REG_MMC_STATUS);
+	status = readl(host->base + JZ_REG_MMC_STAT);
 	irq_reg = jz4740_mmc_read_irq_reg(host);
 
 	tmp = irq_reg;
-- 
2.7.4


