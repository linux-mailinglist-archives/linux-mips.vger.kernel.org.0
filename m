Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C874319AC6
	for <lists+linux-mips@lfdr.de>; Fri, 12 Feb 2021 08:47:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhBLHob (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Feb 2021 02:44:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhBLHoP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Feb 2021 02:44:15 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5A6C061786;
        Thu, 11 Feb 2021 23:43:34 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id u14so1969wmq.4;
        Thu, 11 Feb 2021 23:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X+SuGnfm8KuEL3MmKGWRH3pg5zw3d6V8+weRIPXIPeI=;
        b=uIQglflg121e6PdeRtfgLPiqrAb7Uieak7T8qRRD/+vi4ksCAinkIyfj/St8EmCYiF
         6ZTBLqIOLUDpq9I9aLiVKS+srscu19Q+WAdh8ZD8qvv1Js4awW2iRImvvhbZeTlMQyL9
         6puQgNcWzLZziHGtioTm2/eXcLmu/TX7v4GkcqsmZletCUJmYApSOleMD0Cvs9BzL42K
         9Lvuxz0QhSAZ6XWAvFHXsMz9UeeOps7Ka+92EiuhDyhfr77ZEIvR+l1D4UxopY8XM0j1
         V/2L44bt9iUYHoZ+Ubu8FlinVac1zkESSD/rmiRp6qI4fzBHnn1YI0LMlXTsI5DGXqyE
         Mvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X+SuGnfm8KuEL3MmKGWRH3pg5zw3d6V8+weRIPXIPeI=;
        b=DiYdYL4O0hwrZzeseyUPjO12w+pnYaB2LrUMazukW2iR3ECTlvFyHiOrP+rorPwQwD
         BMCBwlgMIOcm0/HJrhSmyxzeQpti3VALzK2fd2W5kooQ8rNMFkQVMlmcuQPwVlPyhzYh
         MNK9Nr9Si3io77eJ2NfxVcsmLOFUZjV0R4dRONpPX2y2YHR2Jwc1CRfZdGW+7Z2jocP1
         7a/sJUxGdlKhG1qm+9A/U8BhOyRxH7fLSNApXDmiqmRB/5VtqYFjpLDYPjxMThc2J+gD
         fgLwcLo9EZT3h+k92Nr9mUKPjgc91pj693HuqyjRZidvb0VsPfGXng91YNGsp6OvHtuy
         DM2A==
X-Gm-Message-State: AOAM533z7YAEVhzFBK7mk1u2DXTGRuXHyLJV5jhGeWyrOEpj41hqsVTb
        av6VuRER1mdJahXJY3h7HPyZpxZHlWDGlw==
X-Google-Smtp-Source: ABdhPJzVXfqQtkFhOhfy2TcSkMB4/6oofQEtIj4afNLjM0Gw5y8H4WXCoBrN4JqYF24BjmgmvmDsJA==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr1452370wmj.126.1613115813011;
        Thu, 11 Feb 2021 23:43:33 -0800 (PST)
Received: from localhost.localdomain (67.red-83-54-30.dynamicip.rima-tde.net. [83.54.30.67])
        by smtp.gmail.com with ESMTPSA id a17sm9663858wrx.63.2021.02.11.23.43.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Feb 2021 23:43:32 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     sboyd@kernel.org
Cc:     robh+dt@kernel.org, john@phrozen.org, tsbogend@alpha.franken.de,
        gregkh@linuxfoundation.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [RESEND PATCH v5 2/6] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Fri, 12 Feb 2021 08:43:26 +0100
Message-Id: <20210212074330.4650-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
References: <20210212074330.4650-1-sergio.paracuellos@gmail.com>
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

