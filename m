Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 874A5B25EA
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390065AbfIMTPz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:15:55 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34891 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389943AbfIMTPy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:15:54 -0400
Received: by mail-pl1-f194.google.com with SMTP id s17so8728237plp.2;
        Fri, 13 Sep 2019 12:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/Zfca3eBC3FxQ0Lu1bAKtyRgZM7bqDEwWR5lS4SRkXc=;
        b=oPqAd1bZ9afcNGvYlxRMM4uWGpi0g1bhxAHxvFePweLp2haJiogBCM3WuhEvnYaumy
         LcFEbcSraSU8NhFsbn6VKL7rSILgsSi2YNvZqF0Lpm426xZr6+/42tzntDowaibwlP7R
         C/LbHY8971oDmCujauKxw/gGg7xcCHu1pl0/zEGTIZv3TIvn6bTFgcnmvFRqUV0cl/9n
         ztG8K6TuoGp8Q+qb7zFGEL+9IyAeryBCTnw3jw3nPKOCxSATJM9lzZ5JDWvKTG5o1Dw8
         pNtI9aa3H29XJcUodQRQ/ePEIbQWMxR66ZsX/ugPHPiFaEgOemMRMoIlmWjHbhruvuUI
         VkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/Zfca3eBC3FxQ0Lu1bAKtyRgZM7bqDEwWR5lS4SRkXc=;
        b=rXuG+N5Vofh7DhZkWCa9v/iTlt9g4Lq/ntPYKeXbPDCnDK3AvsmKZOJc+hCA3TRXyb
         I6M4YwzMkmVEPqloKDBTpZRoSTb0JOpTrSSXkzN3Mv+Tr46rYQdIiM8R7u7lH5OK4IW3
         s3hV/b1wOZTic1r6C8itGNDEd72oEsuLy/jUtjKB9WQ2LQv+IWS+MvvAx2qQtK/xoqMx
         MKF6+d/LhwZMGk+Qqhhko80QQJoplKGhb0gI+YpQOTA07y3jvL5dmlp4EPHPogp648IZ
         N42/Nxl+eQ6jLSZXOm6y0MCxBF0/Sj8P7I4crNTxuQJPmb1rzY0rzg6kJvI13c0zVJs4
         829g==
X-Gm-Message-State: APjAAAXjvL7bSnwEDgxW/Xle2+Z7iWkRqd8X5VfduoEwCsYltIgkpwU7
        gKJjePfEvjFPa0IBE6wDhFylyT6Qmh4=
X-Google-Smtp-Source: APXvYqz+ZgP+flHaC+BWiwysROcvCYvBhri3cq7zXr4ymxgx1DaoHjR89HAO73VBs5LiW2QPqBaAzA==
X-Received: by 2002:a17:902:8c98:: with SMTP id t24mr27538384plo.230.1568402153383;
        Fri, 13 Sep 2019 12:15:53 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m24sm6988149pgj.71.2019.09.13.12.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:15:52 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE)
Subject: [PATCH v2 5/5] irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask
Date:   Fri, 13 Sep 2019 12:15:42 -0700
Message-Id: <20190913191542.9908-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191542.9908-1-f.fainelli@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On some specific chips like 7211 we need to leave some interrupts
untouched/forwarded to the VPU which is another agent in the system
making use of that interrupt controller hardware (goes to both ARM GIC
and VPU L1 interrupt controller). Make that possible by using the
existing brcm,int-fwd-mask property.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 0673a44bbdc2..811a34201dd4 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -44,6 +44,7 @@ struct bcm7038_l1_chip {
 	struct list_head	list;
 	u32			wake_mask[MAX_WORDS];
 #endif
+	u32			irq_fwd_mask[MAX_WORDS];
 	u8			affinity[MAX_WORDS * IRQS_PER_WORD];
 };
 
@@ -265,6 +266,7 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
 	resource_size_t sz;
 	struct bcm7038_l1_cpu *cpu;
 	unsigned int i, n_words, parent_irq;
+	int ret;
 
 	if (of_address_to_resource(dn, idx, &res))
 		return -EINVAL;
@@ -278,6 +280,14 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
 	else if (intc->n_words != n_words)
 		return -EINVAL;
 
+	ret = of_property_read_u32_array(dn , "brcm,int-fwd-mask",
+					 intc->irq_fwd_mask, n_words);
+	if (ret != 0 && ret != -EINVAL) {
+		/* property exists but has the wrong number of words */
+		pr_err("invalid brcm,int-fwd-mask property\n");
+		return -EINVAL;
+	}
+
 	cpu = intc->cpus[idx] = kzalloc(sizeof(*cpu) + n_words * sizeof(u32),
 					GFP_KERNEL);
 	if (!cpu)
@@ -288,8 +298,9 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
 		return -ENOMEM;
 
 	for (i = 0; i < n_words; i++) {
-		l1_writel(0xffffffff, cpu->map_base + reg_mask_set(intc, i));
-		cpu->mask_cache[i] = 0xffffffff;
+		l1_writel(0xffffffff & ~intc->irq_fwd_mask[i],
+			  cpu->map_base + reg_mask_set(intc, i));
+		cpu->mask_cache[i] = 0xffffffff & ~intc->irq_fwd_mask[i];
 	}
 
 	parent_irq = irq_of_parse_and_map(dn, idx);
-- 
2.17.1

