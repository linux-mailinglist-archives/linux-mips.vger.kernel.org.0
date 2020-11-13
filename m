Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 084402B17E5
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 10:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgKMJLO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 04:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgKMJKy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Nov 2020 04:10:54 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DACC0617A6;
        Fri, 13 Nov 2020 01:10:53 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id s8so8904540wrw.10;
        Fri, 13 Nov 2020 01:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uXUhRC0bzFN/HRAL+GRqiPIYgHVbUUJIYHsBN5DjgE0=;
        b=p+wo7/Nh9m0XD80r2XzZFAO2DoBlDI3I3Gwa5Wa0yeFs/dYULZfgxHkx6cgHdxgI2+
         5Kr82F3xNySOQNZ8mKdMrXrEkjKrvsj7e0tXRB63cdKKLUi84f5rCmp0Y6h7TtrIwPT9
         77/hGyVSIeKTBqnfZ5ss6df4CgeksOHY661OwCO8+8+fMKHFRqbGCskSIe0f9CC8FlnF
         7h11lYiuhKZmV9VbaLu3IPCaVymRZijU6PVxd+Fqkat5bzZ6v4yHn3bBYmdPZysQJBjV
         PnVOX+35Y4aEUSynuQsu3/oxnUKkSAMM+G7k+8qu51loTdPFhqNkc5jVSSuXsTIquY7+
         9BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uXUhRC0bzFN/HRAL+GRqiPIYgHVbUUJIYHsBN5DjgE0=;
        b=C+f2/44puF1dXrqGXx+Y9ZIZTV1V5no0YgutQOXaqg2Nzd+ckoTS17IwLiHAhwa4gP
         d3vi6giOwKd9vxQUoeoSwWfjz1ssBpipSkBE1Dq9JdDPbfT8hv8h0qB6RmA4AuKi4hvX
         Ypwt3eNYNyBmGzvNtJqxe1/k3/IAo6iIsgmTzVbfM9sZ5aJ3Mrwao1eqt88oIOGy+0o9
         fbGtty0bfTGfHEkWnBjO8RM16MNKbAZDFD99ltGGNygN5aA815Mbdf28yVWuCqYtBr24
         wLPIRqYnKlm7hj1LDUWG90VCEMT/5kStqHPRkcCsxRPmX1fiXzFBVspCAdy405KXwk7O
         sKfw==
X-Gm-Message-State: AOAM532zIKjcIBo3SQWXyU9oHevLao0/oI0se1Tn/kh1+hCKZ03Mi1Um
        kgcGWj175pj0vFUzk5MJmrs=
X-Google-Smtp-Source: ABdhPJy78tIVcu9O8hPMJPNHMHhf81xjTO9shxwjozOIdS3Zfp89GDfAFI3eGuTojYv6UjeLyBwBbA==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr2226862wrk.71.1605258652025;
        Fri, 13 Nov 2020 01:10:52 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id 15sm9266183wmg.1.2020.11.13.01.10.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 01:10:51 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org, neil@brown.name
Subject: [PATCH v2 2/5] dt: bindings: add mt7621-clk device tree binding documentation
Date:   Fri, 13 Nov 2020 10:10:43 +0100
Message-Id: <20201113091046.30964-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
References: <20201113091046.30964-1-sergio.paracuellos@gmail.com>
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
+                           "225m", "250m";
+    };
-- 
2.25.1

