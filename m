Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFB68B25ED
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390124AbfIMTQC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:16:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44080 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389998AbfIMTPw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:15:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id q21so18655391pfn.11;
        Fri, 13 Sep 2019 12:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=INAHQPZxPjASPWSXn6L1a3UYoeuWNtidHTqQgxidBgw=;
        b=VrmwgEjjU7805jbM2dL5NG1Kj2azuVNCpIxjTIErUdeGZhB0x+hh5Wh1G6EgbvLEV0
         9uHVXgKYiZ/XmiQKLzH7flBZTi3cg9Jsj48uN8CZUFghOrNLjpVUkU36FYQ+abkA2b3t
         zhrZSUzQfeT5GDh9Iq9kXTenViJU5A87H+hbz5RA303fhcJnTq08cAUMAprpUmL8Kv8m
         MTuU/cJ7ZYZccxxWw/UkffhFjkgsLjfbfMhIm52nl3Jvr9ElfFaef3VRRYsAUHOD/nYb
         nv8BbT8waeSzCAB1X+YrV81sJQMUGvN623ox07Yof1IoyaKx/G0jFvMJeNM840H0TmwM
         mDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=INAHQPZxPjASPWSXn6L1a3UYoeuWNtidHTqQgxidBgw=;
        b=gpIQ+sskXhwfFXP1YH5bsBnjtZzf0FmRp0yCwLaAKomqsMtJ7gREAlZf6xrxo8fdYE
         RNIjPz+Y0nB/gzfVG5JxJHDuC9fVTt9bPAEgg0whJG8GYX/zzGVp16h8Pr4FR+BgcQJn
         luUkUiY97RZwPsmuHR+kMYUSdvU77gW9+pYa0HyYnoff8YMI8Qat2ccfdQklgg+qld9+
         Ytn4Wu8WKOcaWjv2j/aV9myMWzZ4YgQ3Mz99VWg0K9509axSNsPVsDQ67jmlBwAEdibs
         n2teFZ7Wh+ywRtr4gJyy78KJ+XeeEZ4OzFA6GTHUtX8/3FcCvUq1pxAXugkxmNygynkP
         Vkqg==
X-Gm-Message-State: APjAAAVMv8Oaey2kOdlnG8j3yi1OgiplsOuebsxBUn3V3XaodIeFWPNL
        RayYMlR2hCozORRUlrLRVgWGTUqaaSk=
X-Google-Smtp-Source: APXvYqwcrJruIpEGc0fXRvhfKOwYQ1EUjtJ6xCZVKpmVC1AHVhs+dIZX2Fd1SicTBEvpMS1t9Dt+IA==
X-Received: by 2002:a63:1d2:: with SMTP id 201mr45910616pgb.307.1568402150967;
        Fri, 13 Sep 2019 12:15:50 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m24sm6988149pgj.71.2019.09.13.12.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:15:50 -0700 (PDT)
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
Subject: [PATCH v2 3/5] irqchip/irq-bcm7038-l1: Enable parent IRQ if necessary
Date:   Fri, 13 Sep 2019 12:15:40 -0700
Message-Id: <20190913191542.9908-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191542.9908-1-f.fainelli@gmail.com>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
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
index f5e4ff5251ab..0673a44bbdc2 100644
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

