Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BFC933E412
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 02:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbhCQA6g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 20:58:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231685AbhCQA5b (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Mar 2021 20:57:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57EC664F8F;
        Wed, 17 Mar 2021 00:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615942651;
        bh=06AdV+JkCI79bqE8VrXjJjhz6t24lXG9Wq7P9wAxE/M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hiu0QVDIXB6Zk4tYqAZ/Wf/VWDnXMBqiLm54n+wXP006vH9LQSHec9AhWdVYigmzv
         poIuoIyUt3YYCZqKbGjYBE1FICpD0siFSbF1jytohMhNv2sTE1iccS5gMoySh738p1
         NynY3lBaTGUcX0zKZGkhB4aI6YZAF0+wLzf1kKtKblf6NZonkkEGzBFl9cywWMAFmk
         Vq9NGgWpn6mJDGdOIB+7yZFa7rotvhnICjgmtjsAMcPcr7HQJHpusM/TEqxKcwmpGj
         235iE4tHxGjWunr9hfAZ9fpZC++/XnC6Od6GZxEm0JIVtxlywFDmN39GZrCrlEUFI1
         H3aZEzNyCqydQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Marc Zyngier <maz@kernel.org>, Sasha Levin <sashal@kernel.org>,
        linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 29/54] irqchip/ingenic: Add support for the JZ4760
Date:   Tue, 16 Mar 2021 20:56:28 -0400
Message-Id: <20210317005654.724862-29-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005654.724862-1-sashal@kernel.org>
References: <20210317005654.724862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

[ Upstream commit 5fbecd2389f48e1415799c63130d0cdce1cf3f60 ]

Add support for the interrupt controller found in the JZ4760 SoC, which
works exactly like the one in the JZ4770.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20210307172014.73481-2-paul@crapouillou.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/irq-ingenic-tcu.c | 1 +
 drivers/irqchip/irq-ingenic.c     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-tcu.c
index 7a7222d4c19c..b938d1d04d96 100644
--- a/drivers/irqchip/irq-ingenic-tcu.c
+++ b/drivers/irqchip/irq-ingenic-tcu.c
@@ -179,5 +179,6 @@ static int __init ingenic_tcu_irq_init(struct device_node *np,
 }
 IRQCHIP_DECLARE(jz4740_tcu_irq, "ingenic,jz4740-tcu", ingenic_tcu_irq_init);
 IRQCHIP_DECLARE(jz4725b_tcu_irq, "ingenic,jz4725b-tcu", ingenic_tcu_irq_init);
+IRQCHIP_DECLARE(jz4760_tcu_irq, "ingenic,jz4760-tcu", ingenic_tcu_irq_init);
 IRQCHIP_DECLARE(jz4770_tcu_irq, "ingenic,jz4770-tcu", ingenic_tcu_irq_init);
 IRQCHIP_DECLARE(x1000_tcu_irq, "ingenic,x1000-tcu", ingenic_tcu_irq_init);
diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index b61a8901ef72..ea36bb00be80 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -155,6 +155,7 @@ static int __init intc_2chip_of_init(struct device_node *node,
 {
 	return ingenic_intc_of_init(node, 2);
 }
+IRQCHIP_DECLARE(jz4760_intc, "ingenic,jz4760-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init);
-- 
2.30.1

