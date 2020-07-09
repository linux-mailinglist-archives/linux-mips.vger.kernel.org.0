Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0AB021AA98
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgGIWbh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgGIWbh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:31:37 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0EBEC08C5CE;
        Thu,  9 Jul 2020 15:31:36 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id q15so3724743wmj.2;
        Thu, 09 Jul 2020 15:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DliZIcoXzI+6ly7KFzRGlecf9YwGdKgmjNk3Hj1yRPs=;
        b=fXUXIaVZR8X7DaYwvzSPOxlhVKhGMy1eRwiAtmMYOo5GKaqcqhXX8RDeti8eYjWMDv
         /6PQJalf592YMkdG6cShE0cJSrdfwwQlnvGJvrlp/6xBBa7df7nSWR01GVEmQc9eQcPj
         W6b5+KGLQ9kII8nizf8gRLtNXXzpPr2UJD4CToa89mAAuSYYKNPdmhKSs89Sdg3YnJom
         oQwtOfXRHZ7IrSmQ7uz9cLq3b2Q5BBQ4Om4/+BBRMaAVZBHEwPgr8SCN9c86EvKslsgq
         /SW4fy22FK66GVoT72oP8jSGmbxHh7Xo4AYM75+jZJTSfA/0LYbLy2iLVR2BCAe5fiPb
         Wleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DliZIcoXzI+6ly7KFzRGlecf9YwGdKgmjNk3Hj1yRPs=;
        b=RzPICdXkjulfQ5Y9LixExqTSHV7nNiK8pw5HOPcpiB4CG9aE7zabLRfy+WdsMuFBys
         IP6oR9HcecEHVN6tmd56ZaAUSrrkfFQ9/BQGdtfm+QJSZlGQIAMycVKXv63dggZ5e0C3
         LYRoxAJsunbrpkxCpeQ6ADusl5/o0KZCxE00g1FQl7zNt9qGrgrjtRLxEhqujIvXJYwR
         63Ldvohd/zn2PkDj0UmeMJQ6tivN09p/f7sqxSXOGPhA98q0oJwKZ3gcJOKTh/rFnHNg
         pyvFxvBm0Bs433Wz0Y5IBRrv+IaVaV8AeOqgB1OqniofXX27cWjeN4L9Eyz090yoSh6a
         Y3sg==
X-Gm-Message-State: AOAM533hf5p+Oy4dqDr/yg0PcwVWTVrbfxiFxgBZviqgAiW6zfVsFMLp
        7l0zmVWN8nC03U2lzzpCcpbCOwNU
X-Google-Smtp-Source: ABdhPJzo0CuYk9C899rrqgyQmdB995xf5FWbg1WZ740dihxr1tYQ7+MpxaCPFkyTZ2TQF80qy3Xr8Q==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr1995282wmk.175.1594333895452;
        Thu, 09 Jul 2020 15:31:35 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10sm7375267wru.4.2020.07.09.15.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:31:34 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
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
Subject: [PATCH 4/6] irqchip/brcmstb-l2: Match HIF_SPI_INTR2 compatible
Date:   Thu,  9 Jul 2020 15:30:14 -0700
Message-Id: <20200709223016.989-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709223016.989-1-f.fainelli@gmail.com>
References: <20200709223016.989-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kamal Dasu <kdasu.kdev@gmail.com>

The HIF_SPI_INTR2 Level 2 interrupt controller node is defined with the
"brcm,hif-spi-l2-intc" compatible string in Device Tree and behaves as
an edge triggered standard Broadcom STB L2 interrupt controller.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-brcmstb-l2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index 157fad184bdc..b10fe5042a2f 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -276,6 +276,8 @@ static int __init brcmstb_l2_edge_intc_of_init(struct device_node *np,
 	return brcmstb_l2_intc_of_init(np, parent, &l2_edge_intc_init);
 }
 IRQCHIP_DECLARE(brcmstb_l2_intc, "brcm,l2-intc", brcmstb_l2_edge_intc_of_init);
+IRQCHIP_DECLARE(brcmstb_hif_spi_l2_intc, "brcm,hif-spi-l2-intc",
+		brcmstb_l2_edge_intc_of_init);
 
 static int __init brcmstb_l2_lvl_intc_of_init(struct device_node *np,
 	struct device_node *parent)
-- 
2.17.1

