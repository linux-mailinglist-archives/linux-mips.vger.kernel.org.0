Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F5244EF9A
	for <lists+linux-mips@lfdr.de>; Fri, 12 Nov 2021 23:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbhKLWti (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Nov 2021 17:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236041AbhKLWte (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Nov 2021 17:49:34 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B2FC06127A;
        Fri, 12 Nov 2021 14:46:43 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id q126so9189487pgq.13;
        Fri, 12 Nov 2021 14:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1c795j380kZ2wYLseY0gdjj5PsNSwOyZ6nJ1Ad2m/6g=;
        b=qW+Fea4G9NfmZxOGPrvv6fKH5ff1X+on5yuhOunROkcXG7l5Vyx31JbV1SYfZGx8cN
         w9TrFHcE6LyEu12fwpitGv01gYjaxlJxdh7Ypd3Z2uhDPj4EFpo9HtLXUbqsbgzcWhlo
         eRNFNfDE6JZr99nTxrrwniJRwgGMDoAXy6P/tsaeDYCf6hXhNPBo68WVf6Xdmx8E2Hgk
         uUtzoDKhnfeaHU12YvMMtTQ1WUoJvcv1EczbBGSCjC0z38WR+4hVP7x9+gEF6cSE3JfR
         D1OANVlPMULXtS9Z+8NfMuU7EAv/ndXBSl7hlK0h1FklbozIgAneiTcXTr6tHjv5RUT0
         9Ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1c795j380kZ2wYLseY0gdjj5PsNSwOyZ6nJ1Ad2m/6g=;
        b=kKIlRY1hx20qIKeyDLcyPoLGaSI2otsjTRaHiK7MsD0cVezrENeEJFdMtrZMw3p+0E
         tb3WCvG91qyYSjYUBbsH454qbtalP6GBZhrfbf8TLnEHLgCLUf6sQ7jVLtkTzlwFFpuY
         IgdG7IbO4/gbox5p5YNTZWhHZj+daHE4E85EXSoZPfPj38vrzSt0X0UWYHrYN0LVHFoZ
         9AG98cx4w+7xFy9NlBJsdNqgtyhPZrsalWRccNGsIebOISg23ahzrbx4gpSUzzkY8e9L
         lzjSzY49PCQEgFVH8DIeH4WfkC4I4EtpP+Npf6m/ggbyy++kJaM9B0yw3H9yMGRLljOd
         395w==
X-Gm-Message-State: AOAM532c4rfh8/wUtoVXr2uwYT+TDzUgwryVcyw5R1KRAcbeD+5jPEST
        VamZ20vmah/9HnLWmDAWw0EVFoRV9ws=
X-Google-Smtp-Source: ABdhPJzUIqbZItv1cmwzdCt08tSuD//eH9SAXd8pvgW1AmYBDjs3rKZD7VTSQt5Tb5E0uMXjupbY0Q==
X-Received: by 2002:aa7:93c4:0:b0:49f:a7f5:7f5a with SMTP id y4-20020aa793c4000000b0049fa7f57f5amr17333001pff.8.1636757202235;
        Fri, 12 Nov 2021 14:46:42 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k14sm5647004pga.65.2021.11.12.14.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 14:46:41 -0800 (PST)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v5 2/7] dt-bindings: watchdog: Add BCM6345 compatible to BCM7038 binding
Date:   Fri, 12 Nov 2021 14:46:31 -0800
Message-Id: <20211112224636.395101-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112224636.395101-1-f.fainelli@gmail.com>
References: <20211112224636.395101-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The BCM7038 watchdog binding is updated to include a "brcm,bcm6345-wdt"
compatible string which is the first instance of a DSL (BCM63xx) SoC
seeing the integration of such a watchdog timer block.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
index ed6210666ead..a926809352b8 100644
--- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/watchdog/brcm,bcm7038-wdt.yaml#
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

