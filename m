Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB55AA2E7A
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbfH3Edi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:33:38 -0400
Received: from forward102o.mail.yandex.net ([37.140.190.182]:42400 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726510AbfH3Edi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:33:38 -0400
Received: from mxback10j.mail.yandex.net (mxback10j.mail.yandex.net [IPv6:2a02:6b8:0:1619::113])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 828266681208;
        Fri, 30 Aug 2019 07:33:35 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback10j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id WttFCfbAvP-XZQm3GJ6;
        Fri, 30 Aug 2019 07:33:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139615;
        bh=lGWrm07yEb+iDYbXl6MNXFFYrFAuttvAedBfbL1LKfs=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=ZApguL0DbnmD8amq5tlJ+XxxwARSvb0QUn9AypJZSPlM1sS9VYeyUbYU1N62/KObk
         EJ7md1pMDy2PMqxv7YDpNU77X1ff5/KW17mNscbXH7wPRPIGd6MYthnTj8YAqsVhZL
         AL6mCSssaQFSDnYRDDF2u1+awCBhijInob4V9tI8=
Authentication-Results: mxback10j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-XQDG0QFh;
        Fri, 30 Aug 2019 07:33:33 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 10/18] irqchip: mips-cpu: Convert to simple domain
Date:   Fri, 30 Aug 2019 12:32:24 +0800
Message-Id: <20190830043232.20191-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The old code is using legacy domain to setup irq_domain for CPU interrupts
which requires irq_desc being preallocated.

However, when MIPS_CPU_IRQ_BASE >= 16, irq_desc for CPU IRQs may end up
unallocated and lead to incorrect behavior.

Thus we convert the legacy domain to simple domain which can allocate irq_desc
during initialization.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/irqchip/irq-mips-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mips-cpu.c b/drivers/irqchip/irq-mips-cpu.c
index 95d4fd8f7a96..c3cf7fa76424 100644
--- a/drivers/irqchip/irq-mips-cpu.c
+++ b/drivers/irqchip/irq-mips-cpu.c
@@ -251,7 +251,7 @@ static void __init __mips_cpu_irq_init(struct device_node *of_node)
 	clear_c0_status(ST0_IM);
 	clear_c0_cause(CAUSEF_IP);
 
-	irq_domain = irq_domain_add_legacy(of_node, 8, MIPS_CPU_IRQ_BASE, 0,
+	irq_domain = irq_domain_add_simple(of_node, 8, MIPS_CPU_IRQ_BASE,
 					   &mips_cpu_intc_irq_domain_ops,
 					   NULL);
 	if (!irq_domain)
-- 
2.22.0

