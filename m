Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAF523FB6E
	for <lists+linux-mips@lfdr.de>; Sun,  9 Aug 2020 01:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbgHHXs5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Aug 2020 19:48:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727888AbgHHXhP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 8 Aug 2020 19:37:15 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A609520825;
        Sat,  8 Aug 2020 23:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596929834;
        bh=x2EdT82fe7GeAYl9x+JFtiof54LVZjz/+2qJUuXzK6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=POxEnQl47KqTB1BryCZ85LRpRWdQJxmBWk1o0pfJTVJH/OS3iKbqTr4cEwUNGoUFp
         1q3oQPGN8QUfUNPMCUVcRHp1kvaWZ9yz10d8ywlL0l29bmPSYX+OsIsnvcni2+JTWA
         Rqkv/i9NFijamnHngsrcZFJykvF71xcfSkUjC2Z8=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        kernel test robot <lkp@intel.com>,
        Marc Zyngier <maz@kernel.org>, Sasha Levin <sashal@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 65/72] irqchip/irq-bcm7038-l1: Guard uses of cpu_logical_map
Date:   Sat,  8 Aug 2020 19:35:34 -0400
Message-Id: <20200808233542.3617339-65-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200808233542.3617339-1-sashal@kernel.org>
References: <20200808233542.3617339-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Florian Fainelli <f.fainelli@gmail.com>

[ Upstream commit 9808357ff2e5bfe1e0dcafef5e78cc5b617a7078 ]

cpu_logical_map is only defined for CONFIG_SMP builds, when we are in an
UP configuration, the boot CPU is 0.

Fixes: 6468fc18b006 ("irqchip/irq-bcm7038-l1: Add PM support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20200724184157.29150-1-f.fainelli@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/irq-bcm7038-l1.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index fd7c537fb42ac..4127eeab10af1 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -327,7 +327,11 @@ static int bcm7038_l1_suspend(void)
 	u32 val;
 
 	/* Wakeup interrupt should only come from the boot cpu */
+#ifdef CONFIG_SMP
 	boot_cpu = cpu_logical_map(0);
+#else
+	boot_cpu = 0;
+#endif
 
 	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
 		for (word = 0; word < intc->n_words; word++) {
@@ -347,7 +351,11 @@ static void bcm7038_l1_resume(void)
 	struct bcm7038_l1_chip *intc;
 	int boot_cpu, word;
 
+#ifdef CONFIG_SMP
 	boot_cpu = cpu_logical_map(0);
+#else
+	boot_cpu = 0;
+#endif
 
 	list_for_each_entry(intc, &bcm7038_l1_intcs_list, list) {
 		for (word = 0; word < intc->n_words; word++) {
-- 
2.25.1

