Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50E92BC4D9
	for <lists+linux-mips@lfdr.de>; Sun, 22 Nov 2020 10:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbgKVJ4E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 Nov 2020 04:56:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgKVJ4D (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 Nov 2020 04:56:03 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0C1C0613D2;
        Sun, 22 Nov 2020 01:56:02 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id r17so15494906wrw.1;
        Sun, 22 Nov 2020 01:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T+KDk+GBhmbsGEu60u7jvpaynFthMi6GIe7Bnot8k+o=;
        b=Uh+whNe3cPPIgIIpgy9BIHV68Nwaqi3YqAy+wWNN3dB7/Ol31eg5Nm0DXKa2zJflb8
         BT3nDDxSAtAoWV1Ana/QMeCYVyBcNdS1JH/lKGuRi63E22SJI0qkXzCvBTpwG9yRFJR8
         bQyscJkHZwHVUJVdmtOrtUD8J2S0rwJKTy20+YFXbnAeDcXlf9UKMLgax6T+i7nIVOdt
         iu3uEfpPWXlIbZAxxOgu12Fv8zuQxPC9931cVQNqvVTEwchIsALeeh2eFpfT0n9qXxn5
         CSBpEtKm1gBKAITztqMkfJksdVoJFNx80i7VBUo/F1CKNnmEkUIdqfs1RXTQ9uddNZTT
         QSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+KDk+GBhmbsGEu60u7jvpaynFthMi6GIe7Bnot8k+o=;
        b=JKcfl+6b6nHTC8Q6mQNssrztqH0jWvjZa/utyTFdDrweiCGumN0np1w/tA0k8hUTMa
         GIfxsccRxsofCTtsj//1HLihDXUTfbT8QMEcyUiGFZ5doR5u5M7VQR2rDsSrl21Tox/O
         m7DYwm1tZxGPT2T9NGGx5vE6qNcnCxlYu0q9lq+PrcD2tpqyNnQfqwL/PnOKnvEJaNbR
         IHmY57T9tGAMUiOmejaTcgcQm+C0IcXVZe9U2TBl3BUnKix+7ja88bCUblGC5RwA7lyo
         KZOWEkmVZ1SPCVYWZ07N1oHUdzr0F6MCo9W5BXxdbP7J2PWaODHZO/rJUS8a/DZyBLDB
         2AeA==
X-Gm-Message-State: AOAM531Ok41Bu4r6khfuS6CEWn2bp1zTHNdPfTZAKtosIYKn3+8lBZUd
        jNGp9XngH3X2WAEIXKv8VFo=
X-Google-Smtp-Source: ABdhPJxJKmmkqIMRwUYglxlRGgGbnPcX99HF0yMNKqjzuc0XukFjSUbDrTc4gvqq7AbheWWoaAScow==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr24027157wrp.186.1606038961510;
        Sun, 22 Nov 2020 01:56:01 -0800 (PST)
Received: from localhost.localdomain (196.red-83-40-48.dynamicip.rima-tde.net. [83.40.48.196])
        by smtp.gmail.com with ESMTPSA id p21sm10593570wma.41.2020.11.22.01.56.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 01:56:01 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, john@phrozen.org,
        tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
        gch981213@gmail.com, hackpascal@gmail.com,
        linux-clk@vger.kernel.org, evicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v4 2/6] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Sun, 22 Nov 2020 10:55:52 +0100
Message-Id: <20201122095556.21597-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
References: <20201122095556.21597-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds device tree binding documentation for clocks in the
MT7621 SOC.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-clk.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
new file mode 100644
index 000000000000..6aca4c1a4a46
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt7621-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT7621 Clock Device Tree Bindings
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description: |
+  The MT7621 has a PLL controller from where the cpu clock is provided
+  as well as derived clocks for the bus and the peripherals. It also
+  can gate SoC device clocks.
+
+  Each clock is assigned an identifier and client nodes use this identifier
+  to specify the clock which they consume.
+
+  All these identifiers could be found in:
+  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
+
+  The mt7621 clock node should be the child of a syscon node with the
+  required property:
+
+  - compatible: Should be one of the following:
+                "mediatek,mt7621-sysc", "syscon"
+
+  Refer to the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.yaml
+
+properties:
+  compatible:
+    const: mediatek,mt7621-clk
+
+  "#clock-cells":
+    description:
+      The first cell indicates the clock gate number, see [1] for available
+      clocks.
+    const: 1
+
+  clock-output-names:
+    maxItems: 8
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt7621-clk.h>
+
+    sysc: sysc@0 {
+      compatible = "mediatek,mt7621-sysc", "syscon";
+      reg = <0x0 0x100>;
+
+      pll {
+        compatible = "mediatek,mt7621-clk";
+        #clock-cells = <1>;
+        clock-output-names = "xtal", "cpu", "bus",
+                             "50m", "125m", "150m",
+                             "250m", "270m";
+      };
+    };
-- 
2.25.1

