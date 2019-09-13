Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D41B25C0
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389107AbfIMTKf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:10:35 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38700 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388321AbfIMTKe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:10:34 -0400
Received: by mail-pf1-f196.google.com with SMTP id h195so18664881pfe.5;
        Fri, 13 Sep 2019 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iEP53jXE1H7ai299FkwmfDyKSeiJcsObnQa2nVkj7GM=;
        b=RmTU+XQhLlb77l+u6rtOMoxnjiC4sUe9yqmMLEoWDQpaVJWSGUnNkGUZLHwo0wggVs
         j2oI6XkqFsOc7YGifwwBDLX+v4ftQFWjFOU5xX09feO1DH4K0h9SHDcVBBPXDuAvHfFi
         o0SBM7dOTwL8hmns8bawZ9R7As9D19uePMMA8yoBwjw9R3ZuJ7Zj8rl9NzICa5QCyl0b
         9zXTg8ykarZj0dbFBSNbu+sVHXdrzJlxMh0gr7ICtNlnoJps46lvBVPm3I1pn4Kq11WJ
         rrW1Qw6HVKqGa77aUw9YeqHBzpmROGVLhR4OAdXu3f+5Ec/Y05pjhpPXIsw7n1Ec47Ch
         fi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iEP53jXE1H7ai299FkwmfDyKSeiJcsObnQa2nVkj7GM=;
        b=Pv1WD0RdinSfj7paZLeJl+trV2PpgcT+OvWAk820p0YZMFg1KUFPN5MAJ3fqpHqpqB
         jWdaYoHTo/DV1iX2yYAe2lNPSHyqBx6Nl7fpXomujwujOdjj3jJ5L4LCzY7obCrCclj7
         Nl23Is/UxcHJvNl2NV8api3FjGAv8nbTO9rSzsUgIeKd5/E3CVmUuN1a4YiBWow+SkhM
         QplBa/avD3czUNYQTa6bhNcf+rTpAQtZ72c4ydw4Rdt7Lx9UxQBk0ZI0puC6BK1wt+HK
         dKExyUTjuLO3ZwD8kf9WCJXPGmeP+O0vUaPCCwsudo5IItaBegODBWJmxjgWZXShm/4f
         Nw0Q==
X-Gm-Message-State: APjAAAXay2wd/kCCRxI7gTK1c98bMVRjtBR9ndVudAC799Cwv8siiDJd
        cRsOzFXC8uA2Ntmg7aGv29sXaZDrnsc=
X-Google-Smtp-Source: APXvYqwZiwo1tQoW5TA31J5VMCx37dKX/0t8zB3TPFBw/T8fvXEn6i2sWUrClMrwhVWgjCOH0YFDug==
X-Received: by 2002:a65:41c6:: with SMTP id b6mr44482007pgq.269.1568401833576;
        Fri, 13 Sep 2019 12:10:33 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r18sm27273779pfc.3.2019.09.13.12.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:10:33 -0700 (PDT)
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
Subject: [PATCH 3/6] irqchip/irq-bcm7038-l1: Enable parent IRQ if necessary
Date:   Fri, 13 Sep 2019 12:10:23 -0700
Message-Id: <20190913191026.8801-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191026.8801-1-f.fainelli@gmail.com>
References: <20190913191026.8801-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If the 'brcm,irq-can-wake' property is specified, make sure we also
enable the corresponding parent interrupt we are attached to.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-bcm7038-l1.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index c7e37eefec6d..0ad473249f16 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -297,6 +297,10 @@ static int __init bcm7038_l1_init_one(struct device_node *dn,
 		pr_err("failed to map parent interrupt %d\n", parent_irq);
 		return -EINVAL;
 	}
+
+	if (of_property_read_bool(dn, "brcm,irq-can-wake"))
+		enable_irq_wake(parent_irq);
+
 	irq_set_chained_handler_and_data(parent_irq, bcm7038_l1_irq_handle,
 					 intc);
 
-- 
2.17.1

