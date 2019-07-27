Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 622C077AEB
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 19:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388016AbfG0Rxb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 13:53:31 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46972 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387840AbfG0Rxb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Jul 2019 13:53:31 -0400
Received: by mail-wr1-f67.google.com with SMTP id z1so57531510wru.13;
        Sat, 27 Jul 2019 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=By8TP6giR4pWhilktKOTKpkB+nfEhS2+xgHNdzGt500=;
        b=iFoZnGiGLpzpNa+K5qaoRYisA06ySjd6qu7+h7FmQs4E52ZWhwQ+AwLvWMkDq8DZUX
         tGXliOXEcfoUhezsmSNvSjOl5p3N/HiwpWeoPy3vnKxQ5UcZyHfKl+/Gmm2+Zm7BlQ9B
         UuGUhgUWqO92g7mBagg3VxHeg1IYgaoMK8b8zcFADU0zeIszTzWxDe4eXv5DInCL/GMd
         RT5d8QFko2hSQutqPK6+fgwDkiKDXpKyCaXA0MyKVHLTc/Kn0SfQl9e+btLF0zuT3Qpe
         M6I7t5na2i/bnWZBpmmP49U1J9BKCmUMA1o76/vsOq12Stq/ZtqoEJLz1/H/KsDdcsNS
         zJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=By8TP6giR4pWhilktKOTKpkB+nfEhS2+xgHNdzGt500=;
        b=OVezQ11B6WbRofCW4xaIv1Jrw2qDQuOajocuVA2eDQyq7wDyYjYmVglVBTcP2FEo09
         P8zY+zAR5ZT50h2QHBdVJsEl8FwOyroYV3t8yBKoZucrlSXgMp1E/fAqONj0UYLDIYBI
         VkHctPFl/tjaHfOneL5uIJitVIaBsFdde3zSOUxFjQIutYiCaPCVstMISo2uXbvK/kM8
         xSlXvoKMfGEj/fjgu7Eiqg6GW8Mhibv1E5dwBVjqmvxdTBJGn5mlas24V3NSmO2lu1zf
         vohewPE/tlGse/QzWNe7Um3mzd4A+UKqqk3Z4lfm/GbuxdyPNOCCRXstDR9zvCsSNzUT
         RMbQ==
X-Gm-Message-State: APjAAAUcxEUKZqW48+SjXKXj33lW6PDdZx2MWscVjDV66ZNWfiLrmy0K
        I59ufHszDC9HxkqaRkZDaRU=
X-Google-Smtp-Source: APXvYqyx695l2tD/ObfBdCfZUvzSENjlzV6X/8HeuSLmnOpEJiEsJBm24UbYkLm71bT8FetwZ0sPVg==
X-Received: by 2002:adf:c003:: with SMTP id z3mr24377452wre.243.1564250009029;
        Sat, 27 Jul 2019 10:53:29 -0700 (PDT)
Received: from blackbox.darklights.net (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de. [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
        by smtp.googlemail.com with ESMTPSA id t1sm67705423wra.74.2019.07.27.10.53.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 10:53:28 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        john@phrozen.org, hauke@hauke-m.de,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/5] dt-bindings: MIPS: lantiq: Add documentation for the External Bus Unit
Date:   Sat, 27 Jul 2019 19:53:11 +0200
Message-Id: <20190727175315.28834-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
References: <20190727175315.28834-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Lantiq SoCs contain a so-called External Bus Unit.

It attaches PCI memory as well as NAND and NOR flash. Additioanlly it
contains an interrupt-controller for the PCI_INTA interrupt line.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/mips/lantiq/lantiq,ebu.yaml      | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
new file mode 100644
index 000000000000..0b0b27d0b64b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,ebu.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,ebu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq External Bus Unit (EBU) bindings
+
+maintainers:
+  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+
+properties:
+  compatible:
+    enum:
+      - lantiq,falcon-ebu
+      - lantiq,xway-ebu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The EBU module clock
+
+  interrupt-controller:
+    type: boolean
+
+  interrupt-cells:
+    const: 2
+
+  interrupts:
+    items:
+      - description: The EBU module interrupt line
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    memory-controller@e105300 {
+        compatible = "lantiq,xway-ebu";
+        reg = <0xe105300 0x100>;
+        clocks = <&pmu 10>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupt-parent = <&icu0>;
+        interrupts = <30>;
+    };
+...
-- 
2.22.0

