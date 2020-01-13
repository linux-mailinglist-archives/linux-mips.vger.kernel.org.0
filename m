Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8564138EA3
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 11:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbgAMKNR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 05:13:17 -0500
Received: from forward103j.mail.yandex.net ([5.45.198.246]:42177 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725978AbgAMKNR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 05:13:17 -0500
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id D3D456741291;
        Mon, 13 Jan 2020 13:13:13 +0300 (MSK)
Received: from mxback3q.mail.yandex.net (mxback3q.mail.yandex.net [IPv6:2a02:6b8:c0e:39:0:640:4545:437c])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id CF6D97F2001F;
        Mon, 13 Jan 2020 13:13:13 +0300 (MSK)
Received: from vla3-4c649d03f525.qloud-c.yandex.net (vla3-4c649d03f525.qloud-c.yandex.net [2a02:6b8:c15:2584:0:640:4c64:9d03])
        by mxback3q.mail.yandex.net (mxback/Yandex) with ESMTP id MlyymQRMBT-DDkChGdu;
        Mon, 13 Jan 2020 13:13:13 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578910393;
        bh=W0LouJHxhJ8X0NqqqQzaJDVH6qHFyXTB5zG8KPXgID4=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=K4EqHH7FRdthdu1mQFTuNH0tqlMArF4/YrXBetuY56mT5APBCkP3cufdKPCDNUDE5
         ttURaS/F0BmJC1ZKF40w5QlJVfDL18FRuLLHHiWDepTdga0CSp/77C0mf8licrE8vy
         OUSrbrYe1g62TO0yyBxjRBaVrR7ataPr7/wPHeSw=
Authentication-Results: mxback3q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla3-4c649d03f525.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id ATtQsIjGG0-D4VCMcx1;
        Mon, 13 Jan 2020 13:13:11 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] irqchip: mips-cpu: Remove eoi operation
Date:   Mon, 13 Jan 2020 18:12:51 +0800
Message-Id: <20200113101251.37471-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The eoi opreation in mips_cpu_irq_controller caused chained_irq_enter
falsely consider CPU IP interrupt as a FastEOI type IRQ. So the interrupt
won't be masked during in handler. Which might lead to spurious interrupt.

Thus we simply remove eoi operation for mips_cpu_irq_controller,

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-mips-cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 95d4fd8f7a96..0ad7f1f9a58b 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -55,7 +55,6 @@ static struct irq_chip mips_cpu_irq_controller = {
 	.irq_mask	= mask_mips_irq,
 	.irq_mask_ack	= mask_mips_irq,
 	.irq_unmask	= unmask_mips_irq,
-	.irq_eoi	= unmask_mips_irq,
 	.irq_disable	= mask_mips_irq,
 	.irq_enable	= unmask_mips_irq,
 };
-- 
2.24.1

