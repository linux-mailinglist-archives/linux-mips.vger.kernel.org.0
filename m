Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E722DF4CD
	for <lists+linux-mips@lfdr.de>; Sun, 20 Dec 2020 10:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbgLTJiX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Dec 2020 04:38:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727426AbgLTJiP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Dec 2020 04:38:15 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B79C061282;
        Sun, 20 Dec 2020 01:37:31 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id a12so7638930wrv.8;
        Sun, 20 Dec 2020 01:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X+SuGnfm8KuEL3MmKGWRH3pg5zw3d6V8+weRIPXIPeI=;
        b=LirrIytB7W7VNvHndDWY3cdEn44X+cqA2F68fSWKCMG3YY8oywv3mFOHfAeIXt/bPH
         XtJikm7rRFXUFPRfXv5Y0wkPygjS1696kEaUKQMKsMSI67ziZNpaf4JDFYWRMj9nTeG0
         aatWgDgZAxqsBdokpxcoOQAY4mA/cD2nhzpJTl1GX5Zs8kVNKVzff/hF2ioUGNyqLfmm
         rAPcYPu3+v8bfiZQuwAOGSR45GkJeIuyIjUIIa6STxn7+5u0ri/R8e30urwk5XqEM2Lz
         Qrp9MCEcsGilNtI+lnjZEMsR8wRi1JEYy0O0E56HCYHi9JFeYu917oE3sj9490Bec0hR
         bqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X+SuGnfm8KuEL3MmKGWRH3pg5zw3d6V8+weRIPXIPeI=;
        b=Bd7am0Zsu8z+frFZxfj6WXhTDEbmo4TxfzareRsXRTzKoIGkjNhenzq8LX5eppAjNX
         aE1ZYjwVCZCxpHLEzJem5JQCjdABrhgbemVWA97bRmXGDJtQ3yLYel0yNol5PMY1w/Vl
         +r8kY+idJufAyDZVWkz9YLEE/dd7HC5uu/lnNVFgp3o5a8RNau4WGw1vpEZuXQt5Nt1X
         T5HkDGLGZgxIEj770FRAq1vOxiCmFHSZ8GTAnjN1BHRHXqCA+GRigJmBFaMYEXKoBNfm
         Pv+f1q0dpyUMJfumSv32UyOZeBU48K88faCyFfLJ5C3VhRCp7JrJFJ7/RJVHqE/sgSv/
         iHzQ==
X-Gm-Message-State: AOAM531d7hPOEXHVOoO5J6stlaPpLKcMo4QbcafH7Xw5Hys0w7brqpQO
        +1PMwhLierrMgfsIZFbTHDQ=
X-Google-Smtp-Source: ABdhPJzSbt6WFpS+wBWdUgM6Zb7Gd10SXsarCg2wrvoxnkbmTQME/IDWiuN5VbSiOB+QtO5kQv8wTA==
X-Received: by 2002:a5d:6206:: with SMTP id y6mr5582001wru.413.1608457049815;
        Sun, 20 Dec 2020 01:37:29 -0800 (PST)
Received: from localhost.localdomain (188.red-81-44-87.dynamicip.rima-tde.net. [81.44.87.188])
        by smtp.gmail.com with ESMTPSA id o8sm21288819wrm.17.2020.12.20.01.37.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Dec 2020 01:37:29 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, devel@driverdev.osuosl.org,
        neil@brown.name
Subject: [PATCH v5 2/6] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Sun, 20 Dec 2020 10:37:20 +0100
Message-Id: <20201220093724.4906-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
References: <20201220093724.4906-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds device tree binding documentation for clocks in the
MT7621 SOC.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-clk.yaml   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
new file mode 100644
index 000000000000..f58d01bdc82c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-clk.yaml
@@ -0,0 +1,52 @@
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
+  clock-output-names:
+    maxItems: 8
+
+required:
+  - compatible
+  - '#clock-cells'
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
+      clock-output-names = "xtal", "cpu", "bus",
+                           "50m", "125m", "150m",
+                           "250m", "270m";
+    };
-- 
2.25.1

