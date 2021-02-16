Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D14631CB30
	for <lists+linux-mips@lfdr.de>; Tue, 16 Feb 2021 14:37:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhBPNhJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Feb 2021 08:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhBPNhE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 16 Feb 2021 08:37:04 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98E73C061756;
        Tue, 16 Feb 2021 05:36:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id v15so13032771wrx.4;
        Tue, 16 Feb 2021 05:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P2+9ZW2sRGm5fV3POd9uic+HKJNg6UuQ8+N4DBVvEOI=;
        b=HWGwatIq07hbW+612HXdGOayFHLa4+dDZmbtxGlTxFr6jylJun5MeTM0GYVLKNlRbf
         9tDGXoz6MxOpxl0lYEwDziLavZqBpWEWy2HJTgCVv5ZV4syYf3lR+E22kG5wik7mLKy1
         +Zs19Ex8gueXOuQHq98RoIIONFFzNkGJuubUDzBkT3gU8AbBWG+3KBq/Rde4qnGSos65
         zecY/t/hdgCguaAutO4oXuDLPL1/V02kPIV8l2QNOHvHfRHnks1FYyREADc3jJTeYZOi
         ppzrPu90eUxthkowwO17xqxz2HI1bjnY2aN/nOiN8ykr19baJnukP+hzmPkZONYwxfKk
         IClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P2+9ZW2sRGm5fV3POd9uic+HKJNg6UuQ8+N4DBVvEOI=;
        b=JaZ5GgR0465NXUr9RSiM+h6MuwmMdTuUPMePq74+KCsP+sCvJ8Wy27UsdY8EPprH1n
         pl3ffmZuhbGO4hwIOw4iOZRwuPXsrQIetxbs/xHAB7vKa/oKqnZlvd0WYrMssWSfim7g
         MvvG0840M/QN0J2Limf2aervFd/3R1q51TyQ9d3vBEcUODMpdZN3lDKJFHFVnWgVKMoi
         4ord439aRpSBzBQnmAF+yO/RrvOVdhzEz7QmCxMeZe1O68kY5etaFlM4guecrkJc4tk7
         umZtxH3nSWAN4D6jxoK6G5f0A39KsieNa3YHYEqIlixWGFGHigm4ZOtF26FejDBVY5Zc
         NQdw==
X-Gm-Message-State: AOAM531BJ9th4RG9Ki47t3ylpvlIg7rqpgD33QL50Bk4C2u7RslwQbWN
        6zW1CBIsop+pwrTjL/Swutc=
X-Google-Smtp-Source: ABdhPJw2ZXHFEIaznBcIjuST4+li3pvgdRs6vwuEzrjnTjN+SA8U267FxiwV0OzQw05MRRTUS54IZg==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr9192500wrt.359.1613482581393;
        Tue, 16 Feb 2021 05:36:21 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id l7sm28032530wrn.11.2021.02.16.05.36.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Feb 2021 05:36:21 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Tue, 16 Feb 2021 14:36:13 +0100
Message-Id: <20210216133617.22333-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210216133617.22333-1-sergio.paracuellos@gmail.com>
References: <20210216133617.22333-1-sergio.paracuellos@gmail.com>
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

