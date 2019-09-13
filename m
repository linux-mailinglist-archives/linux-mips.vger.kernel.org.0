Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88759B25C9
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389023AbfIMTKj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:10:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40278 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388321AbfIMTKh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:10:37 -0400
Received: by mail-pl1-f195.google.com with SMTP id y10so13613072pll.7;
        Fri, 13 Sep 2019 12:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NJmtMt3lb+Jh7/54C7Wh0cgNaZ6kTY930vy6CWOqbNM=;
        b=TEWPOXwVcUd7n6YYM5iomHZyHlfGoSxzv3E5JnerXffYw4STAqBc8HMmijJobQPA2Z
         4NtDgId3CLS7rpRGMGMaUqEQCyP4wHYq7HDqMn2KogQCa/AURCCRyK5QrUXOZAuHsu97
         g6DzY/4wEO/kT252VFiT1UactJaeR1RQ4YzOG0WbFQHIBPvMzmaFbRj/glNNkMl9vCKK
         i3WJXgvfQF6nuxMer6sQZ9h774FzV9uxMv+zlupv/bc1H4JL3ly6zsEatuNfCKVxNghB
         I6QT7/Tid7WQbpdhiVq76C8X90lCIZm3gA7kkVAXvCFEXXart11tRBjCysY+uBHFxoUp
         j6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NJmtMt3lb+Jh7/54C7Wh0cgNaZ6kTY930vy6CWOqbNM=;
        b=Mu//BgrWWmYlEE0VuUZ/0u/2wHwR3IVc4uhefqF88IfwT9OeS5CKfOtuaNlzQsbMzF
         jiuT4VTysydOUp0GifykvRb4bX/qOZ5LEvT183qlbvnzv5Ht6R3FzdMr7jIls/AqDXyG
         HMSDAo9fn1qZRaaLJajZuEhdbd6pY4c0V7l7awyV2DTS5NjHk8CQTp/u0VutsZ0Xd0Ex
         mhKpZRlnpxEics5yvnJ67EVHZcRJdHHEt6RiGR90uNj19Evo0puiWgdom2ueiDZFet2x
         FpAy0liuLY1NlINuBFWbQzIl+pIpR+FwAaazFZNC5llgXTteftX3JawCdsMWC/ebV3IG
         NpPg==
X-Gm-Message-State: APjAAAV9qY0pds8TynayoBsWYKx5g0RELwzKYGLLwhzIxVBDj8jIA9NF
        yaffD7+9Jyiefrjwaiwsu4RqmvSvT/o=
X-Google-Smtp-Source: APXvYqztzVVNlRy0nky8YRo5TuTahQ8JI+kV2G8JwUejG+nnQlSeGUCXtMtjo5k1K5m/ZZx9s7yJwA==
X-Received: by 2002:a17:902:8302:: with SMTP id bd2mr51910587plb.9.1568401835804;
        Fri, 13 Sep 2019 12:10:35 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r18sm27273779pfc.3.2019.09.13.12.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:10:35 -0700 (PDT)
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
Subject: [PATCH 5/6] irqchip/irq-bcm7038-l1: Support brcm,int-fwd-mask
Date:   Fri, 13 Sep 2019 12:10:25 -0700
Message-Id: <20190913191026.8801-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191026.8801-1-f.fainelli@gmail.com>
References: <20190913191026.8801-1-f.fainelli@gmail.com>
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
index 0ad473249f16..5e8f0fbc5f20 100644
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

