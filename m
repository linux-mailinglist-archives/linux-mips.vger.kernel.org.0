Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9CEF1F59FA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 19:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbgFJRRV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 13:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729552AbgFJRQh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 13:16:37 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 303E9C03E96F;
        Wed, 10 Jun 2020 10:16:36 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id r15so2537408wmh.5;
        Wed, 10 Jun 2020 10:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Dc1Zbs/UvZLNdvEMBHUTsPwZekjiKQ0YRNWi77yGkVc=;
        b=AWmOfhw9HottV+Ca6INhRNzpFJ13Z0pf30XXXOn4PfH8i7+aVCXscF6PxrPNlwu6XT
         5ZJBRYYYGAKWyr9jF9k5cptkXh3Oh0Uu7FLAvP1oWxYuyQCWHGRqEM9DcZPlCCptL6ww
         mV+DoJCobdHFO44kcZPscDRc2iZZd9UcSEpWWKUSmZ6QIC4e53buer2YW86arSA1ApMI
         NRQghwSlGBw1GPF2hWTB1VYOUUibLHORDnqeEI8PO6NA7l88g4AGBL3wtTrkxh6cZ7he
         EZ3xUlj3Q21INd5XtT+W9XSO9ZqWQTABAyM5riT9NgtMf4OW7xKswq0NzCmrrMIeFgqC
         0xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Dc1Zbs/UvZLNdvEMBHUTsPwZekjiKQ0YRNWi77yGkVc=;
        b=gSuYJu8NgpXCEXgZsYeeb5GVpTHUn37KhKTSU3O2jRIkL4b77yXmrxkwX31Z2Jzh1E
         OurnjbkNikBV219HhB4tIsgZJ/c3aqYCl8gjJd63g1TILAa6aeYI92qO4eWc33tClxL6
         l7V3XIpwi/IdpS1vv90e9TIqlwcFGp+N1rnZJNp2flwZwzTpsYqGqYkswDWMDIec03+q
         ZRRtddM0nc3SS5uNI9G9Nys54IB9iCIupAi3TizvWtbTWi8xEzqCZtFWGKDjiCWHWMIo
         Ld7kqGWHDNTcfux0UsQQiAyTqyhVa+n1T7LTLG3Tqo6DjSaG8tbpjOA+19GhBjZ3xkC9
         ZdqA==
X-Gm-Message-State: AOAM532L31abtm4wh9DE1SJRUR+g6QBBAHeyI8rAYQmGgpqDD9OP9GnG
        lRn19Too3najTUwKhTu67QY=
X-Google-Smtp-Source: ABdhPJycrzAMfB0vxrFxVvpOhXYMC0RMkbGEkRVDk5VK+mN1qbqi2WlqcF+cXXAyHgyqr3sURHoazg==
X-Received: by 2002:a1c:4887:: with SMTP id v129mr3963166wma.184.1591809393675;
        Wed, 10 Jun 2020 10:16:33 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id f11sm589048wrm.13.2020.06.10.10.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 10:16:33 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 1/9] dt-bindings: soc: brcm: add BCM63xx power domain binding
Date:   Wed, 10 Jun 2020 19:16:22 +0200
Message-Id: <20200610171630.465579-2-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610171630.465579-1-noltari@gmail.com>
References: <20200610163301.461160-1-noltari@gmail.com>
 <20200610171630.465579-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
to enable/disable certain components in order to save power.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v3: fix reg maxItems and quote #power-domain-cells.
 v2: Add separate YAML file.

 .../bindings/soc/bcm/brcm,bcm63xx-power.yaml  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml

diff --git a/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
new file mode 100644
index 000000000000..fd4204d9aaf6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/bcm/brcm,bcm63xx-power.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/brcm/brcm,bcm63xx-power.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: BCM63xx power domain driver
+
+maintainers:
+  - Álvaro Fernández Rojas <noltari@gmail.com>
+
+description: |
+  BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
+  to enable/disable certain components in order to save power.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - brcm,bcm6318-power-controller
+          - brcm,bcm6328-power-controller
+          - brcm,bcm6362-power-controller
+          - brcm,bcm63268-power-controller
+
+  reg:
+    maxItems: 2
+
+  "#power-domain-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    periph_pwr: power-controller@10001848 {
+        compatible = "brcm,bcm6328-power-controller";
+        reg = <0x10001848 0x4>;
+        #power-domain-cells = <1>;
+    };
-- 
2.26.2

