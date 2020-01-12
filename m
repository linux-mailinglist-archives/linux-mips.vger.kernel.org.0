Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2315B13858A
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732380AbgALIWu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:22:50 -0500
Received: from forward106p.mail.yandex.net ([77.88.28.109]:36450 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732371AbgALIWu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:22:50 -0500
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id 430F51C808D4;
        Sun, 12 Jan 2020 11:15:28 +0300 (MSK)
Received: from mxback12q.mail.yandex.net (mxback12q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b3:0:640:3818:d096])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id 3DF337F20010;
        Sun, 12 Jan 2020 11:15:28 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback12q.mail.yandex.net (mxback/Yandex) with ESMTP id b9DzCgWqde-FSh42AqG;
        Sun, 12 Jan 2020 11:15:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816928;
        bh=A5zaPJqEAMlFziZ2sTS5vB1EZSkHWnI9Py/AyzLK/MY=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=R3VW93AzT3g7Yp9wuEHfhj0q58Zg+LPbTkd8BMYzS/ZE6GqgWlncbpA1DjW9x032f
         cbGBlNgfKWO+pJds6/AdUq4XslN88OlwVoOikKBFuOnCBvYG1NpwZSS7VBlG1LSBoX
         /x4u9aY4nbAFA28wX08Ek+Fmxbe4TK8DBaA7NQfA=
Authentication-Results: mxback12q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-FLV4hR7o;
        Sun, 12 Jan 2020 11:15:26 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 06/10] irqchip: mips-cpu: Convert to simple domain
Date:   Sun, 12 Jan 2020 16:14:12 +0800
Message-Id: <20200112081416.722218-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
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
2.24.1

