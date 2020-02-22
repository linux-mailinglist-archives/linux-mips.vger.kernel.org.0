Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68DF3168E31
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2020 11:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbgBVK0F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Feb 2020 05:26:05 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.169]:32110 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgBVK0B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Feb 2020 05:26:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582367157;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FSCakIJ7lik565E7xYsWBWIgKVoOYG25iccTR4ReXm8=;
        b=W9+y84etZ6JrAoUyuKFFfKbxmDlKEOSNtZMaMmALc4ZCDDeoUy+txu7fUk/HwW4Y8J
        iDCyH73ldHBh8IAxvvnaJYyB8lzHMHT6MIRMVe0vPsFBQV/UsBtO6YJg5tRu+6KaTr6U
        TPGrjWQQswWKnmviDo8sgo92wj4OdrvAEgneWONZyp+5jl2mAWgrUae1irOlxanqPo9A
        VFOO1nhbybGwcxFBhpEq704eDxbLZBxdXGME83JR74tLL6/5Q9j1/K/T3EHNIvbYm2Hu
        xnhuHkNczITSLVntzFXt4hICOtB1w4Nd++K/K/lik/wtn5gWl1ohz7m3ffisNeVmRAyX
        GKqw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAz7pC6Q5M"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1MAPjjMb
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 22 Feb 2020 11:25:45 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH v5 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
Date:   Sat, 22 Feb 2020 11:25:37 +0100
Message-Id: <51642368a064073ab99bb3110863b5fadc382f82.1582367141.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582367141.git.hns@goldelico.com>
References: <cover.1582367141.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>

This patch brings support for the JZ4780 efuse. Currently it only exposes
a read only access to the entire 8K bits efuse memory.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
[converted to yaml]
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
new file mode 100644
index 000000000000..09a8ef937750
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/ingenic,jz4780-efuse.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic JZ EFUSE driver bindings
+
+maintainers:
+  - PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - ingenic,jz4780-efuse
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    # Handle for the ahb for the efuse.
+    maxItems: 1
+
+  clock-names:
+   items:
+     - const:  ahb2
+
+required:
+  - compatible
+  - reg
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
+    efuse@134100d0 {
+        compatible = "ingenic,jz4780-efuse";
+        reg = <0x134100d0 0x2c>;
+
+        clocks = <&cgu JZ4780_CLK_AHB2>;
+        clock-names = "ahb2";
+    };
+
+...
-- 
2.23.0

