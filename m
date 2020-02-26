Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBC716FD3D
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2020 12:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgBZLQv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Feb 2020 06:16:51 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.174]:29860 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728279AbgBZLQR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Feb 2020 06:16:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582715771;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=OorRicA6O0BqMUCCjYWxKu7Ba8UJ22PVgP64SgMW0Uk=;
        b=WYq47klYpL7Tt/e0bSuhwnCSZko7n2qq16CJUAPLm2hLNFt+nqFvumI1vCWiDmNtOm
        ZfYbMRgM3jjvISFMa3wlD9SLXOqAez7lHaPN/IeUcVxsZ2srHzyRRmcDRCCKJFZuhPdq
        w34ds3OG/jB4PIRcAupCajFyA7cnSh6pC2s0qnYkYv0JsvEfzz2kwM+HkVFPK8hPC6VG
        n3axyTgQ+ztPoi1e/JiwCB6YIDKu2AJJAFEtfvBL+lsJFwwS6mNIobpx9uwVyWLDD73s
        oLCLi+Lo/+eacQtSV10rVV+e8qcVB5Buk+VLubecAepGOj+NVLSnqWGVeDmwgzYL62nS
        ducg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzoz/Oc2x"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1QBG34Cf
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 12:16:03 +0100 (CET)
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
Subject: [PATCH v6 2/6] Bindings: nvmem: add bindings for JZ4780 efuse
Date:   Wed, 26 Feb 2020 12:15:57 +0100
Message-Id: <4b243cc120ca6f9a23e217d070e7f6a42f11f8b4.1582715761.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582715761.git.hns@goldelico.com>
References: <cover.1582715761.git.hns@goldelico.com>
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
index 000000000000..b9c0ea09b335
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
+    items:
+      - const: ahb2
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
+        clock-names = "ahb2";
+    };
+
+...
-- 
2.23.0

