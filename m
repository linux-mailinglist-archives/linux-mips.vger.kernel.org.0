Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80A343E725
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 19:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhJ1RZ4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 13:25:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhJ1RZz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 13:25:55 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B2D1C061570;
        Thu, 28 Oct 2021 10:23:28 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so8475845pjl.2;
        Thu, 28 Oct 2021 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x6CcrGnAIUO86k4JvsETidnT2oJD2Ax7sYMvakl7+vg=;
        b=RNmF3JlBGuVTIicTq9xI6lzCKKK02n3g6cpk//EF4IQUzMfOwY6ZAj1c+F1sQ+0tbx
         M7HrUxQgBUUaOomkLbQBs34pt+gM3blxgLrIgRVtovzlqm+pIAKpxf15MgmOPxEp2icz
         mzpvtKvhPHprGFii7r87WvuKMOjaK1y7Y6ZYpsA4wplwPt1cvAzJZ8eL8X9QyfD6Qski
         YBmmBhkbNATJ50/5+aW/7wSNEET8ymzKxqMALSXRSoL3mYvpQ4X+YA+XWiKW8DFQLJmn
         h4nxAtByr33Wo0pKrdbvNp1uYs3MXy7HI/q3MnVyNdaKSCs0/xn2ZvaSe7H5yZsMRKu6
         vrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x6CcrGnAIUO86k4JvsETidnT2oJD2Ax7sYMvakl7+vg=;
        b=J4eURdLxNxQQA7eFpH3udAWLEZolgMywU6Cx2R3UL4YrgJaFRPDBjDX55bec0aR4jE
         eIiSvgjALngor2APleZKkCXVniH7Z9TbktXAbvmH2kfRe38bilqc20Z6DThkSwXd5AXB
         EsfR2JAOpB5MKO7TUprx7BS94oMauguf/RengFz0jtKr8DuC2QpDfR64ggvejUTElGCP
         OtRr8AH2GGGQr7ofoW3EYs15IUDYVvKBqMcAc2nMvmsv4JlXvj7FmEJrFvKqXuDUJ3CT
         e9jIqIHoPZVb7i1Ux5OgJrfnD+lyGxnAWLIdQDupD7U1NXEaL64XqAX9qduJ25+vKPf0
         9wGw==
X-Gm-Message-State: AOAM530xrIEReG53wJtAjwZTUO3oS3OCN/R4HcNwyk2vjG4KRbfGugcj
        2DCMwTL/WmGvY02dXqAvLLfdEaoSjS0=
X-Google-Smtp-Source: ABdhPJxYbB3QHalfH2EOgZdQwpMD+ezo8LkDds+tGlI6VQrAhFzhQlgiTBVrBtwhiy9CtzcYfZrvfw==
X-Received: by 2002:a17:902:7e84:b0:13e:d793:20d8 with SMTP id z4-20020a1709027e8400b0013ed79320d8mr5065243pla.67.1635441807758;
        Thu, 28 Oct 2021 10:23:27 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l20sm3222499pgo.67.2021.10.28.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 10:23:27 -0700 (PDT)
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
Subject: [PATCH 2/7] dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding
Date:   Thu, 28 Oct 2021 10:23:17 -0700
Message-Id: <20211028172322.4021440-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028172322.4021440-1-f.fainelli@gmail.com>
References: <20211028172322.4021440-1-f.fainelli@gmail.com>
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
 .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index bbf2e91f9db7..cab3a8ff7bab 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: BCM7038 watchdog timer
+title: BCM63xx and BCM7038 watchdog timer
 
 allOf:
   - $ref: "watchdog.yaml#"
@@ -15,6 +15,7 @@ maintainers:
 
 properties:
   compatible:
+    const: brcm,bcm6345-wdt
     const: brcm,bcm7038-wdt
 
   reg:
-- 
2.25.1

