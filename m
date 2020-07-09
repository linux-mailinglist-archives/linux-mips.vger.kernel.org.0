Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5D121AA96
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgGIWbg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgGIWbe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:31:34 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D81C08C5CE;
        Thu,  9 Jul 2020 15:31:34 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f2so3922657wrp.7;
        Thu, 09 Jul 2020 15:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lvQE+VFsC6LNvwy3huxAyom+Rgt1Ot1U4TqXHE1rJjc=;
        b=i5CR0eishX3JfFU4E3EM3t0j787D7B4xrjVEfsoiGO+JaZMDT/sD4nYrw5z2aLglou
         izLavaKD6S/f6y4MHlIzmBvkdGhe3k0K/Sdye+57LmkTl3vAjLY4QUwmhBJR7O1Q5PhK
         lIzup+y1LnzFzva7Z6HN3PCyI7IQOKsr60f7FWGQeRgwkqnbTLrigBOJOm2iwtZd09W+
         FLN38Jwn8gMLZ2FiQzLuZyACvJdLLMzwB9Yi8B2FqAx+UG49/AGZbxFWDqOz8tmkYq8N
         WnuGgvyb6PbLPnCp7MiBCq5ixAQv7o6g965F9fGcor/DdizRtd15pPrLoJ0MqlvuNC4d
         PlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lvQE+VFsC6LNvwy3huxAyom+Rgt1Ot1U4TqXHE1rJjc=;
        b=Ki0BYNbyab9DtUIOD/I8/IzvzXMGI2l6T6HR8uWs12ZXMdfwcbXbBdQDR/0NiyNlml
         JDXhSdPd7R/p3zaCZ49hgQRlpu8THKke5JXQdb/yq6C0nnbf/R6IUCiZ0pcpDNM9mzPO
         /zL5nQMfEVzs4L+Nbud59TE2PcBSmmVtxEeh+SQCsSJ718whU6ToiWkFqLxmbK83gf87
         ueWrJVXMJ//b8MQw6ZGs1bQI7kqP0abD3Z0m2cwszDQdPD7L/2jSoJjtRbfnGBzh+/2y
         ldTOQV9KadioOv0j7nFRrPXAIlK37m1CcNNVKjNeXG7UO3hbcDyQjLtTmhJ+hwN+A+WH
         EI7g==
X-Gm-Message-State: AOAM5337Dqu8r/CNpH4yV+RuBHEWJzuwxc2ctnfvohgE1wYh30v3ofTP
        y0XrJQCy8/0YsuIXkmluCvVvzHKZ
X-Google-Smtp-Source: ABdhPJxOEjVwHyvR5mLFNPeVDv5z2YnAu8R83Tgq4U6L0jXN2pvx9ZpLrCb99I180NTLQdfNLx0ysQ==
X-Received: by 2002:a5d:670d:: with SMTP id o13mr62099560wru.307.1594333892724;
        Thu, 09 Jul 2020 15:31:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10sm7375267wru.4.2020.07.09.15.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:31:32 -0700 (PDT)
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
Subject: [PATCH 3/6] dt-bindings: interrupt-controller: Document Broadcom STB HIF L2
Date:   Thu,  9 Jul 2020 15:30:13 -0700
Message-Id: <20200709223016.989-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709223016.989-1-f.fainelli@gmail.com>
References: <20200709223016.989-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add documentation for the brcm,hif-spi-l2-intc compatible string to the
brcm,l2-intc.txt binding document.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/brcm,l2-intc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
index d514ec060a4a..98602f1d1e91 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
@@ -2,7 +2,9 @@ Broadcom Generic Level 2 Interrupt Controller
 
 Required properties:
 
-- compatible: should be "brcm,l2-intc" for latched interrupt controllers
+- compatible: should be one of:
+	      "brcm,hif-spi-l2-intc" or
+	      "brcm,l2-intc" for latched interrupt controllers
               should be "brcm,bcm7271-l2-intc" for level interrupt controllers
 - reg: specifies the base physical address and size of the registers
 - interrupt-controller: identifies the node as an interrupt controller
-- 
2.17.1

