Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A27332FF5B
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 08:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhCGHE6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 02:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbhCGHEc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 7 Mar 2021 02:04:32 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD1D0C06174A;
        Sat,  6 Mar 2021 23:04:31 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id b18so7835503wrn.6;
        Sat, 06 Mar 2021 23:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+4put77zvWkbAq7p9W7RkFBT+N9LdQEWztn2bykM+dQ=;
        b=j0zWpsa/gayzQcRkqn1TPbYerYny+Qaq2VBhPEsUdG6qG9WgmeFw+7BOF8VysbRacY
         lwObp4O0qamLO6g7qQL4qV7YVm2AOjefupQo/5vNxp29lg8oT/9t5IewZcTRZgHSfWh+
         GKjPPBRAeHB0iGzXlUUOE2bBbtd4+unecFBSUqJUih1Dq5ey4feOCOlwETRQ7a2RxFYC
         KU1uqR56BQtxLjzjf3fxh+Fq1yHjTiPY5/gNyf3feMouq42kZFxJB3638k4iq0xim6zR
         +oPr321O41jU8mGHFETTX543z+Fh7MAENfAbc00p4HeZriKMXAnekYSWmPIVARu/G+Pk
         F3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+4put77zvWkbAq7p9W7RkFBT+N9LdQEWztn2bykM+dQ=;
        b=Tz1+vwJ3TPRSUb+4tVb07i41HpzjdwPdG7xbpEe4IEd8QQ223Ol9ZC/TZ1lRrgUmjl
         SvkYaWP35u3uMQsN+MVHM8j1WC1f3B0S011sEbDFA/jbRo5N/HNFtin1dKJ3Lz0uF28M
         D+Fg7w+z7eimaNOgrBpf0WTKFAeUzCEkUtE1p1H8mH4LQYayOHaevA+Dtf688GodX6l9
         UKHvlc8wPhNg3ZyZPBbGbGo1bwtg0e3V+pM7Ft9sVdq2QowsKn79CuvG0BHbSKQfu4LJ
         BszfhNGxlmbRiAUBeDPhU88whF2axDPsi1WmyV9/hUwuIKbwu+c8+XGVFbc8bqvOhbmh
         hKCA==
X-Gm-Message-State: AOAM531GoUAJo6Tiy4kITp4bkTTfC9kUiXImofi9eyxi7ujS27/WmEFe
        xmgP9IPkFm3i4z72NdA1D+8=
X-Google-Smtp-Source: ABdhPJx5anhLHtuwZJ35GutGutDkvSApUcSdd+GOoolyFWaE52xNkXpmslTdGPbaj8STtRoE+IpWHg==
X-Received: by 2002:adf:e603:: with SMTP id p3mr17312337wrm.360.1615100670672;
        Sat, 06 Mar 2021 23:04:30 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id j9sm12162533wmi.24.2021.03.06.23.04.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 06 Mar 2021 23:04:30 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/6] dt: bindings: add mt7621-sysc device tree binding documentation
Date:   Sun,  7 Mar 2021 08:04:22 +0100
Message-Id: <20210307070426.15933-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
References: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds device tree binding documentation for clocks in the
MT7621 SOC.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-sysc.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
new file mode 100644
index 000000000000..ef2d71b23ba0
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt7621-sysc.yaml#
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
+  The clocks are provided inside a system controller node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt7621-sysc
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    description:
+      The first cell indicates the clock number, see [1] for available
+      clocks.
+    const: 1
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
+  - reg
+  - '#clock-cells'
+  - ralink,memctl
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
+      #clock-cells = <1>;
+      ralink,memctl = <&memc>;
+      clock-output-names = "xtal", "cpu", "bus",
+                           "50m", "125m", "150m",
+                           "250m", "270m";
+    };
-- 
2.25.1

