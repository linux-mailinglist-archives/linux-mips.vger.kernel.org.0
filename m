Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7630F331E59
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 06:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhCIFXG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 00:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhCIFWd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 00:22:33 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA00C06174A;
        Mon,  8 Mar 2021 21:22:33 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id l12so13818603wry.2;
        Mon, 08 Mar 2021 21:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mHNdz7wiYLAaKp9tiPgIXb93/c7+pySo7q7uYWDN7Ww=;
        b=glKHc/3GDe12dfQPlUheb+PEOpoI7QcdBK6XMSZU42PcAZrL0+1bs3TNe8seW7rUA5
         rLgu0zWk9bUTBF3oqEm/w766GdDiuTsEv0O8reRzONZkWM+Nd8OVk+RSah3nQetzF6oT
         kEFaXg3afvhijFo8JE0QTq62hiihcwA7L5WnHfPoIZFbM77+vlRj51phPOzUgvVQHXTh
         donntP5ERhXqcA7S9KVULsTENYC38+5GBozlcPvcE2lLtZZTOepY8HopqLaFixQOHzRj
         sGgoADyWo7n93S6EjzqkkbtaLhNGKRDX27kgvdb/d9cIxTmqjxFOZ+CMIKOoL5kNxtd0
         iEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mHNdz7wiYLAaKp9tiPgIXb93/c7+pySo7q7uYWDN7Ww=;
        b=e1UuDRGRpuTAp7vfw5XMV51bh3ZFRiI9+0bexX5ruUo9v5rOlUrbYdSRJX3fx0Zf8i
         KjNRXCVwBu9aN61X/Z4LdzUDY4Hioll18BwI3OdhL5vJkQ/sFdx1fMcv8kLRnbQBWLnu
         xKOGP/DOWLvNbk58wG4iJ/xb6/soZcF9abU0yEhHiFCpz3hFNCAf1VGnA9G79l9oWmxd
         rKPFCpEdoRwHMfkNSHxM2F4s6lY7Y3dibPeZaSqDw6TDGkBMJX6KqsurQNRFwgYMKYkC
         AMwWfjkN7RwC+WMPSFD4umczGKBTc6kuXSBMwzJnLXsR6mAFr1FTpxknFcmcu2G6xGlP
         wAxg==
X-Gm-Message-State: AOAM532dIcWDo4L4CoajIx3FYFA6yLu99z5/Pdg3q4fUqAeNQZEL2VB3
        Q687mUgnLJ1qjXi/d04WQAM=
X-Google-Smtp-Source: ABdhPJxE7fLtfygneQFdky3FAeBtoVDsuoNVTpIuTmTFAmGi7hT2E24WpclEXHSBS1C+V3RuZdyazg==
X-Received: by 2002:adf:f587:: with SMTP id f7mr26394681wro.147.1615267352124;
        Mon, 08 Mar 2021 21:22:32 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id c11sm23450743wrm.67.2021.03.08.21.22.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 21:22:31 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v11 2/6] dt: bindings: add mt7621-sysc device tree binding documentation
Date:   Tue,  9 Mar 2021 06:22:22 +0100
Message-Id: <20210309052226.29531-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
References: <20210309052226.29531-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds device tree binding documentation for clocks in the
MT7621 SOC.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-sysc.yaml  | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
new file mode 100644
index 000000000000..915f84efd763
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

