Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C2531DB29
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 15:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233329AbhBQOIn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 09:08:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232699AbhBQOIj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 09:08:39 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF03CC0613D6;
        Wed, 17 Feb 2021 06:07:58 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u14so17552534wri.3;
        Wed, 17 Feb 2021 06:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P2+9ZW2sRGm5fV3POd9uic+HKJNg6UuQ8+N4DBVvEOI=;
        b=VckTydYm9JcLdv75A42D6KuT3/8v+2AnWg7GP+tYf2th5v1hV8dLCj9KxCNOdLLEwT
         w71uhrYf42i3NV6cesonTpWrqSK9rSxcSj10USENOtnmxiHoxiEBa0XZqKBDLI9eRGrO
         1U/KyMnF6YiiZGk9ECMwCtoC+soxRd2wwG+eLWPfL/dXB4tvhz/r8PCNRehQVJkMiJTS
         4jztECEDe/M6mtFZpbaX6C1E993hBOqfZQ3rYeE2y2CV2FwIhZhzv7q+iATtmAyMtXTw
         83acPsSi7TzTKOzER/rsCm/z4Wr0mgW1pUoUlmIVrzdBpf11IQ6CPTVNcOyvX9OGj6dp
         W+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P2+9ZW2sRGm5fV3POd9uic+HKJNg6UuQ8+N4DBVvEOI=;
        b=oeZC9NI0AnFM77a0bCvEAICzhKjYvLXFL8Jesomni4sXjq4nKN3nt1XA04r7UGfSa3
         3S9zLaiXZnQYNxPYOUkNu1NL40p3H7jfqfw1CS2a5xVrv/PsRy0+8PZtzK4LsbZLCl6T
         4Rbifr0cq7uKCiU7Y4Jrhht6CSm0afi0OYsbDAGJrBEBmIEzESJApU0FmIjGvQB4//VT
         i9UQ31g/v6ny45NSFfSOV2LI4iYuM5uUEoSrL1qm6u/0iYtENLHFvCW1FrA4oUaHToAS
         DRUi7uiruJfHjQBG44mPCosXSomvRCydT9s4JszJoSlMKImCCgHSq5fAj2z2yrMvLAXv
         wLzQ==
X-Gm-Message-State: AOAM53196TfHZ82dvr6VJUhjAy9OtadBExxMZghvyAaURm7CVOgtsbUa
        +za14QlJpCPFeOf3D2mVaUVyWWjyQJ2ZXQ==
X-Google-Smtp-Source: ABdhPJwIqCWTFCsWRjzWrd3XN57A6TZjgPOEFGdHZtCDDUSbV5Ditwo6DdDqdmIj+QkMfDXF3gtVwQ==
X-Received: by 2002:a05:6000:18a3:: with SMTP id b3mr29163985wri.373.1613570877488;
        Wed, 17 Feb 2021 06:07:57 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id n66sm3274099wmn.25.2021.02.17.06.07.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 06:07:56 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 2/6] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Wed, 17 Feb 2021 15:07:48 +0100
Message-Id: <20210217140752.15712-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217140752.15712-1-sergio.paracuellos@gmail.com>
References: <20210217140752.15712-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds device tree binding documentation for clocks in the
MT7621 SOC.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-clk.yaml   | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
new file mode 100644
index 000000000000..842a0f2c9d40
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
@@ -0,0 +1,66 @@
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
+properties:
+  compatible:
+    const: mediatek,mt7621-clk
+
+  "#clock-cells":
+    description:
+      The first cell indicates the clock number, see [1] for available
+      clocks.
+    const: 1
+
+  ralink,sysctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of syscon used to control system registers
+
+  ralink,memctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle of syscon used to control memory registers
+
+  clock-output-names:
+    maxItems: 8
+
+required:
+  - compatible
+  - '#clock-cells'
+  - ralink,sysctl
+  - ralink,memctl
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt7621-clk.h>
+
+    pll {
+      compatible = "mediatek,mt7621-clk";
+      #clock-cells = <1>;
+      ralink,sysctl = <&sysc>;
+      ralink,memctl = <&memc>;
+      clock-output-names = "xtal", "cpu", "bus",
+                           "50m", "125m", "150m",
+                           "250m", "270m";
+    };
-- 
2.25.1

