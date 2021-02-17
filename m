Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDA9131D89E
	for <lists+linux-mips@lfdr.de>; Wed, 17 Feb 2021 12:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhBQLnO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Feb 2021 06:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbhBQLkw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Feb 2021 06:40:52 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09658C0613D6;
        Wed, 17 Feb 2021 03:40:07 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id t15so16976271wrx.13;
        Wed, 17 Feb 2021 03:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P2+9ZW2sRGm5fV3POd9uic+HKJNg6UuQ8+N4DBVvEOI=;
        b=Z4nUm3t3RKH1M16liPd8pxxnbr9w+hzq8lFpbtGdBH9BwqTH7blN+xQvoZlbePzgmi
         ewEZBWuw0PHDTWJtCjmLG8/JmSBRdUDSuxgrjIo5/GWjXKq4ySFO/Mg4rpdjV2P9DE4A
         sjcD3jpxrlBrzAv2OxsTYn+wrg6bU4SxcXbExtkrFi1sJ4QL+XHGsLk3+JyjJIjarj3a
         JZiWsK5O8lq1iro+XKcs3CWfa/7ZWX4kgCp5YA2v9u69UxTVSJ8JFs+Rg9oJYlPQjWX6
         OaQbioKYd5Vsw18TTXmgCwuBvYlWVA43hGBYftpxU3H/+xH0XiJNVJu1JO78itlOQ9Kz
         C5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P2+9ZW2sRGm5fV3POd9uic+HKJNg6UuQ8+N4DBVvEOI=;
        b=nvSS5A7spzSXOsfgwGxmUCPDP9l1YN2F/O/WGLvP+RXmy3OX9jj6id4MSYQ/rjB21f
         l/TvmO+Ol7SO+9iU1HSGQKe2f3ctGTQeS6jihDy4Lo75MVrAHqMt4P24o6NVSIRMajDy
         8FcxQtGYQF//tneNXGwyDEhmxySYkF4i0L4VTpy6tyoKljM6MBmUBPbu7Y4erN0EdeUR
         JExVTOBg/4C3fsxNrcuqu9w7W6jMXGH3x5Fq3d2t9/PWLspWYDwftxrOu5qkEmsV754v
         /dH56AbXujHjKTXHv2Deu+6M+0FKrX1KJtnk/vzeCvWbHjmSEhWR5nfYwsomlhFSrZP7
         tFJw==
X-Gm-Message-State: AOAM530sF633whVlKj1dstG8pB560l/Mdoshenf1v8holFO+jgv16M4s
        /T9JrYlWpO9NpPwpjiw1ZBc=
X-Google-Smtp-Source: ABdhPJwguJLYBfn5zzQLtUWS1q02A4AdbZTRw5rmi4BN0o6C5hA/QYnlKo+zo+ZN5X4KHAxfax+Zaw==
X-Received: by 2002:a5d:6602:: with SMTP id n2mr28359513wru.150.1613562005813;
        Wed, 17 Feb 2021 03:40:05 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id q140sm3600813wme.0.2021.02.17.03.40.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Feb 2021 03:40:05 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        neil@brown.name
Subject: [PATCH v7 2/6] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Wed, 17 Feb 2021 12:39:56 +0100
Message-Id: <20210217114000.19571-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217114000.19571-1-sergio.paracuellos@gmail.com>
References: <20210217114000.19571-1-sergio.paracuellos@gmail.com>
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

