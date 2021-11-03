Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA2A444B4E
	for <lists+linux-mips@lfdr.de>; Thu,  4 Nov 2021 00:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhKCXQ5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Nov 2021 19:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhKCXQ4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Nov 2021 19:16:56 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DE3C061714;
        Wed,  3 Nov 2021 16:14:19 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id m26so3962512pff.3;
        Wed, 03 Nov 2021 16:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xWNHzDke48KqNNwTsf3sswBb6ctIv7kyGu4hU5wmmqQ=;
        b=RWslXcYj9EY6rOiqALEDbPClbjgf/umc7mgbfa3N1kwHHlVSj/UR9iKcDMr7gfcCqw
         SMTC97+mtV65cfAjGLKdHDU5qNn2voefnR2U5Bab7M/N2DL/Xa+nbLcGMVhn/9ilZgVP
         edxLcs/SMYCRS3Ds21xX8NinfZpVg+YmSaZ6LWvqYltD/gPTqJXxUlkJoopYOnE24Pif
         AJzBa4XNAUDvVhtojnFQcKp4TQNif0vWAE0mvRWtsc8lonlt5C/vugigooWG0S9g7G58
         FsxweNrG8mL59WDJV5Cq860a/XTAWpT+TT+ERyNZmKkwq5ocPcoxb0TORjoJdiVso4f/
         UrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xWNHzDke48KqNNwTsf3sswBb6ctIv7kyGu4hU5wmmqQ=;
        b=3PtNrGHSStsE5sLFc75WW28z17PmANLwXclcItT0vcscgI39Ie3WAtKB2UGCun1sOX
         0ZRJ+C59H8RedTsiXFegGaLrrhFHaEP4H0oIqSpEHV0m3FkODEXQyD3kZWusG1FV/5tE
         cDCQgwg2N2RN8pLxWotbOd155pDAu/U1DMh33auMfN7ACWF+Pgq80Bei7TYjumbmXKUZ
         mKzjZ1vF9iqxzEoTlZKadnBGBNUZuWkykg985rOPMl5ocRkuFDsglCoOfBNtHj+nSIJh
         lT5kaN3aYKbxigTvhAOqnW/LX8UC0wltBPCq2J+ebNjQWvo+EBLDJp8MeU+Z1qjHoPQe
         ec2Q==
X-Gm-Message-State: AOAM532u1j4JRbOfmODn0bIRAdiilt+ECx9GPQ4gfej1uXjo4BbU/fw/
        g8rW5FbwLJzDdqkhyjAE4pZyzSWutcU=
X-Google-Smtp-Source: ABdhPJza7kBUgxzop/h22Iu3/rblAMo93lhJN1ukdY/J90FrJzZSMxA4GqiZ3YnK7Xxb6kfvPDhFGQ==
X-Received: by 2002:aa7:9208:0:b0:44d:3044:baf0 with SMTP id 8-20020aa79208000000b0044d3044baf0mr47291369pfo.73.1635981258339;
        Wed, 03 Nov 2021 16:14:18 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id p7sm2613549pgn.52.2021.11.03.16.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 16:14:17 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
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
Subject: [PATCH v3 2/7] dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding
Date:   Wed,  3 Nov 2021 16:13:22 -0700
Message-Id: <20211103231327.385186-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103231327.385186-1-f.fainelli@gmail.com>
References: <20211103231327.385186-1-f.fainelli@gmail.com>
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
index 69e5a1ef6a1f..12d64d4c719e 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/watchdog/brcm,bcm63xx-wdt.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: BCM7038 watchdog timer
+title: BCM63xx and BCM7038 watchdog timer
 
 allOf:
   - $ref: "watchdog.yaml#"
@@ -16,7 +16,9 @@ maintainers:
 
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

