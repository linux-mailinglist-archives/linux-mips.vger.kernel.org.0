Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7B1440207
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 20:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhJ2ShL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 14:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbhJ2ShG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 14:37:06 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45BE2C061570;
        Fri, 29 Oct 2021 11:34:37 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id n11-20020a17090a2bcb00b001a1e7a0a6a6so11294769pje.0;
        Fri, 29 Oct 2021 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VjKVm2pl9yDsl4HKclxfy/9nLeyRiZ7xb5K2rv3ZVsE=;
        b=HHs0hBlkoFz3ofmeHm0GE8rSmDG57jq5UoQFTqRvPVQIJ1ywMPNI9nceCLYa+7OpHS
         V8p91aP5hOLRbkw0sUK/GZvZr3+dqVo7SuYFpZmYWrCm2DwHS/1tji8JSVzugh09aYH1
         oWsxSKMWgcN+iN13ZlxTIRCrDqFZFWV9h3YkMKMygJtY8M/u6tn0EIW1YT7c6knQn3/j
         aR8APZ9z2cF0m4FEfziT66TB3XD7reGwrmLUNA7EDHQJN9hUxFiOx1pTi13ZIZb7tYxi
         WnVv/6J9/LCTrWGCQZuBUrCPueru8gmQTlNS/ZFsxCJWBoFuzfEATyomlPGkwVVfZSQi
         2WOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VjKVm2pl9yDsl4HKclxfy/9nLeyRiZ7xb5K2rv3ZVsE=;
        b=cmLrXOj8HDiVeZ6ZF+DXUUpWiWd362UFWA6dJb6ODK5cASGKluFOQkjf79dAdc4I+P
         4BlNHXCZGygWfv/bIR7NrxsOGmC6EfC9C9sCVPKIZlUbcTlWq+ujtQfd5aa1mV/QiqJg
         CKwlA715q8irU9588t37npufA6un59cgZAE/c3Mp3AHiqkCtm9yyL4cYpMwOGj57mZG6
         O+eXK1jjhPV/xEvSEraCjvuFBRo5unt1/iBk7++98CaEP6PTE3JvUeCZeJtrJKu6mWw0
         uNDRFQTn8JFyg3EMuslQrqolDIRFgM3+Du77z9X+LdWe8moXejJgZZ1/7JX1xbzw6tEh
         6Udg==
X-Gm-Message-State: AOAM5308rOVHFQN/O9yCPhCabrxmiKHiU9CiUTtrWUSM826U0NZLD+1X
        b2X7MNH7YtdwqvadoU2rWZuE9Nrpi0Q=
X-Google-Smtp-Source: ABdhPJzpoPIoyRcNbB2j68YYdpZUaAngKLdezqOME+2CUJOIHfePduFzN2ucvDl3pZQDPa1sJCbTKA==
X-Received: by 2002:a17:902:6b0c:b0:13f:aaf4:3db4 with SMTP id o12-20020a1709026b0c00b0013faaf43db4mr11118737plk.46.1635532476436;
        Fri, 29 Oct 2021 11:34:36 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j15sm7730868pfh.35.2021.10.29.11.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 11:34:35 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     rafal@milecki.pl, Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM63XX ARM
        ARCHITECTURE), Justin Chen <justinpopo6@gmail.com>,
        linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:MIPS),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM63XX
        ARM ARCHITECTURE)
Subject: [PATCH v2 2/7] dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding
Date:   Fri, 29 Oct 2021 11:34:25 -0700
Message-Id: <20211029183430.4086765-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029183430.4086765-1-f.fainelli@gmail.com>
References: <20211029183430.4086765-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The BCM7038 watchdog binding is updated to include a "brcm,bcm6345-wdt"
compatible string which is the first instance of a DSL (BCM63xx) SoC
seeing the integration of such a watchdog timer block.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index bbf2e91f9db7..72cce0a046a6 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: BCM7038 watchdog timer
+title: BCM63xx and BCM7038 watchdog timer
 
 allOf:
   - $ref: "watchdog.yaml#"
@@ -15,7 +15,9 @@ maintainers:
 
 properties:
   compatible:
-    const: brcm,bcm7038-wdt
+    enum:
+      - brcm,bcm6345-wdt
+      - brcm,bcm7038-wdt
 
   reg:
     maxItems: 1
-- 
2.25.1

