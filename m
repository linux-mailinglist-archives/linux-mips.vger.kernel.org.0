Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E599F21AA94
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgGIWbd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgGIWbc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:31:32 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBDD1C08C5CE;
        Thu,  9 Jul 2020 15:31:31 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f7so3968187wrw.1;
        Thu, 09 Jul 2020 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zY9V6Q3cp9Ejuq5yzEe1CvgO+fVEi0Px3E1AXVo2FFI=;
        b=cImLMlFIrLsWw3MsnnRCbl5JSMoGQLUAnCOBtrACG0arSWgMpoHcYBk1XXy21aNTCP
         r3PzU643A+XXC8xCdhoDhRKkQo2gStV0YQeiCMkY3uRqRlZjNfXY8MnQ6zO9Rv/0SY+j
         ZtGTdbNbbo20/60kQlR+uV1n750ymmvAlu/yzanlG6aXOiOUFMs1k51BFYDEQY//4E1I
         iqho+Dp0CFyVuu4Q8CGt/qPOi4T4EU1n4SjhxBMXzfG+5innydYvEuZItdopApuJErOm
         hpmCbfqy2odI8xIi5Aof0b6C+yZHaRHVIqz67gfB1Ict+1J/JDlWLbYGsKY64dwzJeXy
         /4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zY9V6Q3cp9Ejuq5yzEe1CvgO+fVEi0Px3E1AXVo2FFI=;
        b=AoQH0WXVlw6q0Qq3dne4Y8/2gFimW79pFvrTLGreKa6Jo8vq5F7iy0EpKYKjtRl5v1
         sEW0sKcmZDOaFBHJDH4ygnl+Ex0n2L2e4SXB5M81GK4ApRYbpoR6O5CMNiC1JKMFkDS2
         WnlPuHr/gCIyVfxD6lTWyYhS6ARx2i5XADmqBh+pGbJrpVhw8iqC3PNEuNIfP3qqTm0w
         pftg82mFMboKTVZemUONraNcgb4ZvmazCRawxiFQwvydZDRxtHINnRsQVwJm9tiaDfSI
         Egrijdno4FMssWcrG0suddczVoDVdgP4mHHv9iLyqD5wzQS+jg/aiATM5Dcu9yyzxTmy
         3ZOw==
X-Gm-Message-State: AOAM532W+zi9UHU4ZfQFAxHSW/DKmUaA7WqyYUp9awbhIJGnnCGLbx3r
        Mu3YJATrdDkiwUiTmWedHhAWqR6v
X-Google-Smtp-Source: ABdhPJxkPZr8PeEfJzsYSRoQlSstk4vRE7fKzuYOZp8dMuLReXXilJ+NrEtS1+0E57/V1+ix2/15zg==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr67047291wrg.205.1594333890142;
        Thu, 09 Jul 2020 15:31:30 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10sm7375267wru.4.2020.07.09.15.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:31:29 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Justin Chen <justinpopo6@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE)
Subject: [PATCH 2/6] irqchip/brcmstb-l2: Set controller as wake-up source
Date:   Thu,  9 Jul 2020 15:30:12 -0700
Message-Id: <20200709223016.989-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709223016.989-1-f.fainelli@gmail.com>
References: <20200709223016.989-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Justin Chen <justinpopo6@gmail.com>

Utilize the Broadcom interrupt controller standard property
"brcm,irq-can-wake" to flag whether this particular interrupt controller
instance is wake-up capable.

Since we do not know what type of parent interrupt controller we are
interfaced with, ensure that enable_irq_wake() is called early on.

Signed-off-by: Justin Chen <justinpopo6@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-brcmstb-l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index 0298ede67e51..157fad184bdc 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -254,6 +254,7 @@ static int __init brcmstb_l2_intc_of_init(struct device_node *np,
 		 */
 		data->gc->wake_enabled = 0xffffffff;
 		ct->chip.irq_set_wake = irq_gc_set_wake;
+		enable_irq_wake(parent_irq);
 	}
 
 	pr_info("registered L2 intc (%pOF, parent irq: %d)\n", np, parent_irq);
-- 
2.17.1

