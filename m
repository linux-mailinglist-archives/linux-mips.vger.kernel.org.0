Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F38B01400B4
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 01:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbgAQARm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 19:17:42 -0500
Received: from forward103j.mail.yandex.net ([5.45.198.246]:51180 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726088AbgAQARl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 19:17:41 -0500
Received: from mxback27g.mail.yandex.net (mxback27g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:327])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id EA2126741080;
        Fri, 17 Jan 2020 03:17:37 +0300 (MSK)
Received: from sas2-e7f6fb703652.qloud-c.yandex.net (sas2-e7f6fb703652.qloud-c.yandex.net [2a02:6b8:c14:4fa6:0:640:e7f6:fb70])
        by mxback27g.mail.yandex.net (mxback/Yandex) with ESMTP id sTNzLI5Hrd-HbTWLDDs;
        Fri, 17 Jan 2020 03:17:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1579220257;
        bh=+aaQgBQSYE47tOKJqdEtCJIfGUciBhJDtUzb/AsDCOA=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=hIiFMcbgryfUnRwuE3FK6NkoiK/BqT63MVaxLj8yb5maMLPo7B5YWP1ExF8xzKolc
         ct+4rvl6GGLWMJnXxDKb0BdjXYyNYZSXeQVIuaVOcH1t0lccQ5E5mbM6Y6Iul1Mio9
         +9uk/7DxjF1AGZkY7VgmbSBwMkGdUIlFPvcWPQ70=
Authentication-Results: mxback27g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas2-e7f6fb703652.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id g2NDK8KfXv-HVVOf8j8;
        Fri, 17 Jan 2020 03:17:35 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, maz@kernel.org, tglx@linutronix.de,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 2/2] irqchip: mips-cpu: Drop unnecessary ack/eoi operations
Date:   Fri, 17 Jan 2020 08:17:06 +0800
Message-Id: <20200117001706.40620-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117001706.40620-1-jiaxun.yang@flygoat.com>
References: <20200113101251.37471-1-jiaxun.yang@flygoat.com>
 <20200117001706.40620-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Actually, all MIPS processor interrupt lines are level triggered.
So providing ack/eoi operation could lead to some unexpected results,
Like chained IRQ handeler failed to mask upstream CPU IRQ.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-mips-cpu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 95d4fd8f7a96..e34f4317bb88 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -51,11 +51,9 @@ static inline void mask_mips_irq(struct irq_data *d)
 
 static struct irq_chip mips_cpu_irq_controller = {
 	.name		= "MIPS",
-	.irq_ack	= mask_mips_irq,
 	.irq_mask	= mask_mips_irq,
 	.irq_mask_ack	= mask_mips_irq,
 	.irq_unmask	= unmask_mips_irq,
-	.irq_eoi	= unmask_mips_irq,
 	.irq_disable	= mask_mips_irq,
 	.irq_enable	= unmask_mips_irq,
 };
@@ -112,11 +110,9 @@ static void mips_mt_send_ipi(struct irq_data *d, unsigned int cpu)
 static struct irq_chip mips_mt_cpu_irq_controller = {
 	.name		= "MIPS",
 	.irq_startup	= mips_mt_cpu_irq_startup,
-	.irq_ack	= mips_mt_cpu_irq_ack,
 	.irq_mask	= mask_mips_irq,
 	.irq_mask_ack	= mips_mt_cpu_irq_ack,
 	.irq_unmask	= unmask_mips_irq,
-	.irq_eoi	= unmask_mips_irq,
 	.irq_disable	= mask_mips_irq,
 	.irq_enable	= unmask_mips_irq,
 #ifdef CONFIG_GENERIC_IRQ_IPI
-- 
2.24.1

