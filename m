Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA1C21AA93
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgGIWbo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbgGIWbm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:31:42 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DCBC08C5CE;
        Thu,  9 Jul 2020 15:31:42 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o2so3576371wmh.2;
        Thu, 09 Jul 2020 15:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X9gWmqsXdUhwD0HyUl/ux1LMEd24Rft7ZzqjMMlxbUY=;
        b=SQSfSuuM8twuL89S8ohqlE1svQU17lbRPJyAl5NvB45JztZm07t1GyUzvPfcKoJeH6
         K26Po9+HzKl0hCAESOwXSIEq8Y3JFdk0zVFqqx9Hb8At75p3HrcRsSxlMv3btmEPY3lc
         OGuD/P3saKrP7Ul90jEVKE0IpI0UIQ/XSXBuju7SX/E1IzFm4lrM4/HuZFS3GRvm/Ivr
         owNj8nxEIAMjZmnFB//kq+CuVc+G5ykcRG9ot47y/kGPvlYc4Bcy77bfNARUVPMahJNA
         PmFkagL/4FAJKV4El0XZlSLq7NImGrR8fA4Hr851fxfmQp/WsvXxniGVCCyJJpYCpjx6
         GvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=X9gWmqsXdUhwD0HyUl/ux1LMEd24Rft7ZzqjMMlxbUY=;
        b=YKwBSlxHJI/L85KVQeYfbLcVYHKWZJvgjLwpEF5tovhuHMKR1z+S2P2R4r3nf8LsfZ
         yev9/33DCOSJcbjF0NEgrsoM0N+eMHejXezY1BdH4q13IWhwLzVfPcab028p5kvAqGfq
         Kc7MskUeUhrqvTakE6EFP7Ch42l2n+88512FMvsL8sZ5YbXCKiP/p6cf1/MmsfURKJqu
         fWLyLNozRqXGbjwWkUrXqdZdXXIBFPHUUMZWCoQl5L1YpLZiyX0rEFORkPqTC1PsThrd
         QXTlJ+NfsowxS2Woy3qxXIAgAa3Xx6HGwkWpEMHDDmfKYd7qsKxBpEo63CHglVlFt6yk
         Z3ag==
X-Gm-Message-State: AOAM5309CrmsIaovjEh5pkHzh3qL2UNnXcukruJ+g4RJIcN+ZrERFA5c
        3pok0Uq2iYtiWIy3JPSX58XYB2DP
X-Google-Smtp-Source: ABdhPJwYOOAzElN12jW2twg2CIIJJmtKgZRtbfjX9DxUtACEx89dUTfhcMHdvvd+5YctS5W3Zv9jSw==
X-Received: by 2002:a1c:81c8:: with SMTP id c191mr2006334wmd.23.1594333900692;
        Thu, 09 Jul 2020 15:31:40 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10sm7375267wru.4.2020.07.09.15.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:31:40 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: [PATCH 6/6] irqchip/brcmstb-l2: Match UPG_AUX_AON_INTR2 compatible
Date:   Thu,  9 Jul 2020 15:30:16 -0700
Message-Id: <20200709223016.989-7-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709223016.989-1-f.fainelli@gmail.com>
References: <20200709223016.989-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The UPG_AUX_AON_INTR2 Level 2 interrupt controller node is defined with
the "brcm,upg-aux-aon-l2-intc" compatible string in Device Tree and
behaves as an edge triggered standard Broadcom STB L2 interrupt
controller.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/irqchip/irq-brcmstb-l2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index b10fe5042a2f..cdd6a42d4efa 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -278,6 +278,8 @@ static int __init brcmstb_l2_edge_intc_of_init(struct device_node *np,
 IRQCHIP_DECLARE(brcmstb_l2_intc, "brcm,l2-intc", brcmstb_l2_edge_intc_of_init);
 IRQCHIP_DECLARE(brcmstb_hif_spi_l2_intc, "brcm,hif-spi-l2-intc",
 		brcmstb_l2_edge_intc_of_init);
+IRQCHIP_DECLARE(brcmstb_upg_aux_aon_l2_intc, "brcm,upg-aux-aon-l2-intc",
+		brcmstb_l2_edge_intc_of_init);
 
 static int __init brcmstb_l2_lvl_intc_of_init(struct device_node *np,
 	struct device_node *parent)
-- 
2.17.1

