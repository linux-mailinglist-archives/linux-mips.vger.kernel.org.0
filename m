Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59DC02B1F15
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 16:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgKMPqo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 10:46:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgKMPqo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 10:46:44 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82173C0613D1;
        Fri, 13 Nov 2020 07:46:43 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id j7so10410205wrp.3;
        Fri, 13 Nov 2020 07:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=csOKEFHRH0Te1kmdg6xDndYUHjPk3Yh9dx8SurjnBm4=;
        b=qjFZ2qWsq3TDCG80bODVXHsLsdapYWYdOa27kANuwfxrqx+y/YNafv/kuXjDagc27d
         aoR3GHkdYVcLDHWM9bQxYNfA+7YrORRD3xF/qcO7vuCZpWYKQSEZ3MOrTnUkcg3EEki+
         tG5q1jM3E83ziR59nlFHtEJzYP6nwF9QuShcDGj1hDxQZZ927KfKQtI0a3aq3M5XYji/
         8tklpE53NP9DhQQNiPT/rVFy2P6aAMlLBwATNm0L0Hdpq9+OQiGFe660HW64PW0WZz4U
         KtGv/C5QTLjhZgHhvW5xwcpfh7+M4A02kGiydrx+cnwzxToJRzBDaYkyGrUotthniEgG
         lbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=csOKEFHRH0Te1kmdg6xDndYUHjPk3Yh9dx8SurjnBm4=;
        b=lcK7PayLCo00FKEWdkA5RT9IJsDNV2gPcQhFK7hKgpN0mVNi8F3+C2xd7w/DMITyoq
         oUjKRK+ZkBfTKVP8PUkB77FcaCa5lj5uv6oYao8GMHNnQbASuZdl5h1qKU9OiTlAOjde
         tKMnflrpievGiR6S0BpBn4R3AA+AfdzMUmvl/XbCrXD07gtN5YkWQ8cJLKV5EijBNhf1
         x/QYdnBNWcHE08JpEwPV/43WG9coZJaXRC3pJQJFTMQMSDCwNOtxEPmIbBWKfyybSEoP
         8ssnFI/ShHUp7Tg1AtaMjTdj3zN6jME/enLvuvGpg7HlyLYKFrxZAcKUWCLx3sQ4pEWE
         yNEg==
X-Gm-Message-State: AOAM5301acA4RcMveoiFiR/Oi0TCAaiRjw+A5DaDK7Nd3KOFkvfrmwxk
        n99zV46C0FzE65J5XZN7uV8=
X-Google-Smtp-Source: ABdhPJyiJkojSPKjNORRuSzMdBGQUNDMpsrcccgumSWq1oQPyDiW56jvQrBd6/H6JLeoI2wD4fudGg==
X-Received: by 2002:a5d:6689:: with SMTP id l9mr4078146wru.134.1605282397382;
        Fri, 13 Nov 2020 07:46:37 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id n15sm11727978wrq.48.2020.11.13.07.46.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 07:46:36 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v3 2/5] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Fri, 13 Nov 2020 16:46:29 +0100
Message-Id: <20201113154632.24973-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
References: <20201113154632.24973-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds device tree binding documentation for clocks in the
MT7621 SOC.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-clk.yaml   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
new file mode 100644
index 000000000000..363bd9880e29
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
@@ -0,0 +1,61 @@
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
+  ralink,sysctl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the syscon which is in the same address area with syscon
+      device.
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
+  - ralink,sysctl
+  - '#clock-cells'
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt7621-clk.h>
+
+    pll {
+      compatible = "mediatek,mt7621-clk";
+      ralink,sysctl = <&sysc>;
+      #clock-cells = <1>;
+      clock-output-names = "xtal", "cpu", "bus",
+                           "50m", "125m", "150m",
+                           "250m", "270m";
+    };
-- 
2.25.1

