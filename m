Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCC4E31E6CD
	for <lists+linux-mips@lfdr.de>; Thu, 18 Feb 2021 08:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhBRHQZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Feb 2021 02:16:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbhBRHH4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Feb 2021 02:07:56 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C83C061786;
        Wed, 17 Feb 2021 23:07:15 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id a207so1965344wmd.1;
        Wed, 17 Feb 2021 23:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P2+9ZW2sRGm5fV3POd9uic+HKJNg6UuQ8+N4DBVvEOI=;
        b=pkFzBtTeTnxQlITLuz6mnfQ27IxxK0qw5kMApVRb/TGKWFJ+wtMOjIfFV5YASwP3CC
         Qr16NOobBMkfjqDa8Fs/2+pHUaTiuFo/k1mZoCVqVKXqveE2VqSURpu8NqLXYzwFvZS/
         Q/h0tkpmjQw/8/9gYcDQd5Z7mlxUDrptS21c189m8NFA6OFnrXYsuc07NZqmsooup/PW
         5cmhL+G8emqi62qc2TzLZ7najYAkdNoO/l4eCLcEmOyiMnEP70fi7F+WXanoqVEnKER/
         pkbRjw54B6bCGuleqGtxgf0Zg/g57+Ub6ivUnbyDJhZWXy9wt/Hh7VOqHFidZYXnefJs
         wM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P2+9ZW2sRGm5fV3POd9uic+HKJNg6UuQ8+N4DBVvEOI=;
        b=SIiarofb2PWhFmRl9EN6QWb8MGlRfyerh5a6pfzeezpju5nHcBT1pTuvlSwQWmAI8h
         x9N6SoTVgMCaI+mk4C1DWobtwqWIjoeicTNK9Rbpk8WNeImHMdqlng0aUH8cnIt9ZaaZ
         43W6cjSAR7A3V270eATPNZnofiVlLwdsY0pfJbZdp9sG03pLswqencxLJtf2N/P/GjHE
         yhei3EaRMf3GosqlOikHWHJwiLfThnmxgSIq1tjhQRyhNXq/VWAfZpT/8NexeK5ani8m
         IgN0DJ769LMC4MWmSxfXIyLfcPwik2C7vp60JdnVIRz2UxcQ09oEHQP1EnpYgxHaauu8
         Ivlg==
X-Gm-Message-State: AOAM5326J59L9+b8XGqPZCgO6eAv/Oo2AkICcSougYyHiDIUSpHI7MA3
        Bz9Vh/08kpiRGrIvHOFdfZsyG7SRCNZ03w==
X-Google-Smtp-Source: ABdhPJyX9/ZBcd+qPkrTAr0ZIHxMg4zvfhUiOQOccVDIx2j1+SHz9XGGlPoCQKroXghKO7wSegNKvg==
X-Received: by 2002:a05:600c:4314:: with SMTP id p20mr2219604wme.52.1613632034683;
        Wed, 17 Feb 2021 23:07:14 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id 4sm6136555wma.0.2021.02.17.23.07.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 23:07:14 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 2/6] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Thu, 18 Feb 2021 08:07:05 +0100
Message-Id: <20210218070709.11932-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
References: <20210218070709.11932-1-sergio.paracuellos@gmail.com>
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

