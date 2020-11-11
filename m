Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 931042AF679
	for <lists+linux-mips@lfdr.de>; Wed, 11 Nov 2020 17:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbgKKQaZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Nov 2020 11:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726903AbgKKQaU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 11:30:20 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB9EC0613D4;
        Wed, 11 Nov 2020 08:30:20 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id 23so3106584wrc.8;
        Wed, 11 Nov 2020 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s54TsY1LaGkKl+iAkFm8rVjUJWbXIQClRD94uBdawis=;
        b=HrfamzINIDhydwxTILAVucMQTnrMpO95GK+SRfXRXl7RxY4tblv7s0KdRJ5f09CBZf
         vROi1bBPnGzDU8K95jh5ZwsHI0WtFw9S1RyWhe6z+bGeFe/w0TL29JtMu4eBb3c8vkZn
         YwVBVBbpcmeRgfPra0BM+uwuGFMGgrRdkwfiOdsCa6ZlQ+E4LQ32Kw/3yjbAkmS1b7N6
         3EhvJlbL2jlg4SkyeY0LRBHD1vKoP9K6DBSlulOSqaZ4HfNJ2FihwLLtHMzposNebmCk
         v5yP2/YDUNBG8Nn+kPiKFydTPLsZ6ncdPq+NeC6dQQ5WWeGDR/s7JLXtCf8+9LpsOGCY
         6QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s54TsY1LaGkKl+iAkFm8rVjUJWbXIQClRD94uBdawis=;
        b=qysX6liX0tNbecpRp/D/xABygFDSp8+rdZhvfR3kvHkQvSKwkYBTtZAsKr8yKVsBNa
         4dqejv2rcoVVuGxAEMaO3Q4htzvpBkFY0aO3ywJHHbyH63HIkX080QUW6Mom1sqotzPl
         EaBL7RL1tumiZwJ5L5zJMDSMN/gJZzNHAM68Ztls7ODBfMPNi3PftUY01QnkRx6VZlOJ
         1v85RkE+mXfKPuDj2Qj2SzegpEhZOrHW/QjZ6he/ou06I345UMNXqLXkuElfMjroheWE
         levxeHgsKImMjR3JD10Oka026L3pYcFMVmY0Gs3lVAVBk5bcF4OZhJjcZNl3UmUaAFLL
         Bc6Q==
X-Gm-Message-State: AOAM533N/ksvNHXt3y4A/SrNoy86zah3BoNi95/kuQWVXAmJTi8aGycF
        thLtBBFroxTrUJF98uHhbiBZySKhrT2f1gPi
X-Google-Smtp-Source: ABdhPJxEcRMWJCADMRQEBlXjs4QVD7mwmyZ3wUn94hAGyBlW/rEl7Ua/wu3z47I2GwcvL0pBVUkmDA==
X-Received: by 2002:adf:cd8d:: with SMTP id q13mr18630041wrj.61.1605112219106;
        Wed, 11 Nov 2020 08:30:19 -0800 (PST)
Received: from localhost.localdomain (245.red-79-158-78.dynamicip.rima-tde.net. [79.158.78.245])
        by smtp.gmail.com with ESMTPSA id w186sm3196753wmb.26.2020.11.11.08.30.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 08:30:18 -0800 (PST)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     mturquette@baylibre.com
Cc:     sboyd@kernel.org, robh+dt@kernel.org, tsbogend@alpha.franken.de,
        john@phrozen.org, gregkh@linuxfoundation.org, gch981213@gmail.com,
        hackpascal@gmail.com, jiaxun.yang@flygoat.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH 2/7] dt: bindings: add mt7621-pll device tree binding documentation
Date:   Wed, 11 Nov 2020 17:30:08 +0100
Message-Id: <20201111163013.29412-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adds device tree binding documentation for PLL controller in
the MT7621 SOC.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../bindings/clock/mediatek,mt7621-pll.yaml   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.yaml
new file mode 100644
index 000000000000..ef58411065e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mediatek,mt7621-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT7621 PLL Controller Device Tree Bindings
+
+maintainers:
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+
+description: |
+  The PLL Controller provides the cpu clock as well as derived
+  clock for the bus and the peripherals.
+
+  Each clock is assigned an identifier and client nodes use this identifier
+  to specify the clock which they consume.
+
+  All these identifiers could be found in:
+  [1]: <include/dt-bindings/clock/mt7621-clk.h>.
+
+properties:
+  compatible:
+    const: mediatek,mt7621-pll
+
+  "#clock-cells":
+    description:
+      The first cell indicates the clock number, see [1] for available
+      clocks.
+    const: 1
+
+  clock-output-names:
+    maxItems: 3
+
+required:
+  - compatible
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
+      compatible = "mediatek,mt7621-pll";
+      #clock-cells = <1>;
+      clock-output-names = "cpu", "ahb", "apb";
+    };
-- 
2.25.1

