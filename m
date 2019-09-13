Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17231B25C1
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2019 21:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389056AbfIMTKf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Sep 2019 15:10:35 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44432 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388137AbfIMTKe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Sep 2019 15:10:34 -0400
Received: by mail-pl1-f195.google.com with SMTP id k1so13634138pls.11;
        Fri, 13 Sep 2019 12:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=x/1eUyWPGFj2wULry4fSJWpBPwqBU21SfxLgwHYAjPg=;
        b=QstRlW775vvOVJVfZz7iCtaSLdg66Gin98n43zICC+nHzLfM/2ZAbPjljpPVfx6/Bt
         go96ZGHkVzitEnA6q+IpZraEE2vuj6R0Z3ue539b7MPA0JBBG24S/4ylwAQbmVcv8con
         TQjexMZWApRv755LY1MzxYGnf2bnhLHjTfGw/3lKrcotAxD3O9OkMHbL1nW+2Ipe5YMJ
         lVXVGyxIugrR34ZzQ/oaaNQQfur69bpC1P+VuHkwPaIp5kpjf9Vrn3gsRUOMnk+eW3iT
         ZAMUvHpjhPx6hwwlGvdZ5Bc0IV0cisUhu5d9X6oEXSpPmS5CgsXyyJtk9Uhynna1BuyF
         Yv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=x/1eUyWPGFj2wULry4fSJWpBPwqBU21SfxLgwHYAjPg=;
        b=MqWIKCkvlgcerWzYggDTwxrC6uWrcCjCnjzGb4kR7bYCWduuCT3T/AARHgGHE+lnUH
         La4ghpmH8M0S0T82eFJnL5E6XUI+SInhIctkF3hgeBwEz+YuDbU1HBPCSNk+qMP34TMW
         QApRm2mOJqeLThmpg0euewso0PCcewVkHYaiVy1yLPBbZ+zpNRWhyFoYXhUemKMBaOe9
         SBaIAWNqE0SCD9zYkUFWJL1MI5UhDtzhCBj01GCkJF40E6Qs7K0PTw1fpMk/NWtq2fKk
         hpWd3vDkCN9BCXcpGSHGMS9Hz5XbF8dfhcwvg2V3uyhen5Z6y1+gP8m85n/+6s55Su6g
         MKnA==
X-Gm-Message-State: APjAAAUqCOLGmYJvDGpPlBe81qysxxKn/+uTKY+t0A1sx2DRKtCPrbv2
        fu2KUvGN8KKDZmpt4R/NVuON13FJd+s=
X-Google-Smtp-Source: APXvYqyqsS5ErT7gDpycm5ZyrTOzbE895ZvKruoe0+qutF0aSLx892M0dPTbeMUVh++tKodZBfikQQ==
X-Received: by 2002:a17:902:b404:: with SMTP id x4mr48613412plr.76.1568401832506;
        Fri, 13 Sep 2019 12:10:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r18sm27273779pfc.3.2019.09.13.12.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 12:10:31 -0700 (PDT)
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
Subject: [PATCH 2/6] dt-bindings: Document brcm,irq-can-wake for brcm,bcm7038-l1-intc.txt
Date:   Fri, 13 Sep 2019 12:10:22 -0700
Message-Id: <20190913191026.8801-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913191026.8801-1-f.fainelli@gmail.com>
References: <20190913191026.8801-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The BCM7038 L1 interrupt controller can be used as a wake-up interrupt
controller on MIPS and ARM-based systems, document the brcm,irq-can-wake
which has been "standardized" across Broadcom interrupt controllers.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
index 2117d4ac1ae5..4eb043270f5b 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt
@@ -31,6 +31,11 @@ Required properties:
 - interrupts: specifies the interrupt line(s) in the interrupt-parent controller
   node; valid values depend on the type of parent interrupt controller
 
+Optional properties:
+
+- brcm,irq-can-wake: If present, this means the L1 controller can be used as a
+  wakeup source for system suspend/resume.
+
 If multiple reg ranges and interrupt-parent entries are present on an SMP
 system, the driver will allow IRQ SMP affinity to be set up through the
 /proc/irq/ interface.  In the simplest possible configuration, only one
-- 
2.17.1

