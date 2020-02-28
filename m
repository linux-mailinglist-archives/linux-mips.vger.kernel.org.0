Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF02F173C69
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 17:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbgB1QBD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 11:01:03 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103]:33668 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727173AbgB1QBC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 11:01:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582905660;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gbizeSabj1SA3R/yYEBCTuuOG7bMiftKSlGUj+fFwyY=;
        b=WlxMPV0ImmhxV2wlP9v+eCctIi14LDAECsmXnNMg+P37NefcgwjMROnDwCiLgciIQ6
        hv4aH45xJ4VPkeftrb3x010LNmOcUIsxbFFm7jgdX1oRRbJnp553yf2W1/BSTN+CdKVj
        cDlo/7Zha1Dpisa/uoeph6pAEZK/mXKhZuJ1362+VPiht89Ty0IfI2CWMTIqAL+zILp+
        v903J6rRfqr4pSVVDd6S8YnfLt7JWpju9c4ugnwkB33QrtdfhTlcAgC4dkqU86pzdiK9
        YXOnA5SSZ2/qqjEbLV5Q0ymt2RoPjysKbKzEjVFs0qeD1UpdxaMP7YD3eS/J6UbHYEXS
        LHmw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SG0u1l9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 17:00:56 +0100 (CET)
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
Subject: [PATCH v8 3/7] Bindings: nvmem: add bindings for JZ4780 efuse
Date:   Fri, 28 Feb 2020 17:00:49 +0100
Message-Id: <37d3b9e4c60692215fff0e75a78ac1e7792aaf75.1582905653.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582905653.git.hns@goldelico.com>
References: <cover.1582905653.git.hns@goldelico.com>
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
 .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
new file mode 100644
index 000000000000..1485d3fbabfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
@@ -0,0 +1,45 @@
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
+required:
+  - compatible
+  - reg
+  - clocks
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
+    };
+
+...
-- 
2.23.0

