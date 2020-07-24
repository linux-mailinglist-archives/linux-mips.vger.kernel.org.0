Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF5D22CDEF
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jul 2020 20:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbgGXSmc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 14:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgGXSmc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jul 2020 14:42:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADB0C0619D3;
        Fri, 24 Jul 2020 11:42:31 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id f1so8621742wro.2;
        Fri, 24 Jul 2020 11:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cJWPebvtfVQ4yMs95Aqk9HAmQuQ6TAMDSj0SSlM6Zyw=;
        b=tchdv+uxYUIl91/+iKeAO23o2+daCsLjEzFBzBJ6nYL8WWL7/6shYVFUMrLlJ57wB0
         YXrNyajSU8JqBrP6bd+yTRO9rEkoDlLTzPxgzYMilO/l3tsETh3tS2xRvlFnGBUOrG36
         VwxueDDXHJj8AuaM78U+5YBM1chgmtCQnKrAcheq8CY74N7c78l9MXj0hLsJzeC+L4rn
         9sPI9aDHFx222TxGJhTwKjLW5lK5T9nTl2UAOUIVwwKVmV1h8obiE2qr6BMles7cP9dA
         EFZTy3q/SfOTNJfk7cKp4O78CMkJsQJ3Vw1jhcG2FiU3MsH0NNISBjddLadgeZw+IW++
         97wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cJWPebvtfVQ4yMs95Aqk9HAmQuQ6TAMDSj0SSlM6Zyw=;
        b=l8IGwpfeGTApepR6xe8AHDQAC/EEJNACvzYfgGrS+F6rJXXpCjZSBB600htsov2IIt
         lyADwh2fG4ydB8pW1fTplqn8pfBsJ84ZviSf8pf0q3d4I7jsJoB5+nlPKAv3QvxEbqd5
         aPSyorxXo6Gc8fBKLDBb0p4VLocxHYN2GOnPzEFeP5m+cbiGEdXqAbPUWKRD8kg3SvbL
         wjXiPRZNP20k7/yY4G4Z1UrpZ/JdcCzBaWPzPwPl0SnTNqNu7xc+6oQMUqQpAyyIokSx
         1mLUGm3MnVrfYRlX2vff2n6wTJR83tEYqLiweHU1lOgg/taN2F+lxzzs+RzLzN2QVuJG
         oN6Q==
X-Gm-Message-State: AOAM530xvc8j3tMJj+IdlGxM53hoohGaTG/hbRM/jsor23+hqt7kK1tS
        WStOj/Akx0f5FJfrqyMSMQ0T+ado
X-Google-Smtp-Source: ABdhPJxqhvPctvXXdP0cG+tS9quJNro8PhQnOhAKWyWR68ZFJCc5uDLpM661JfE8Tgg5Mymb3EexZw==
X-Received: by 2002:adf:c981:: with SMTP id f1mr9684667wrh.14.1595616150183;
        Fri, 24 Jul 2020 11:42:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id s205sm2248948wme.7.2020.07.24.11.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 11:42:29 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE)
Subject: [PATCH] irqchip/irq-bcm7038-l1: Guard uses of cpu_logical_map
Date:   Fri, 24 Jul 2020 11:41:56 -0700
Message-Id: <20200724184157.29150-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

cpu_logical_map is only defined for CONFIG_SMP builds, when we are in an
UP configuration, the boot CPU is 0.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 6468fc18b006 ("irqchip/irq-bcm7038-l1: Add PM support")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index fd7c537fb42a..4127eeab10af 100644
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
2.17.1

