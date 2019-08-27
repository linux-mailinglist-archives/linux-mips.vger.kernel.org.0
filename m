Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B95089E349
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 10:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729896AbfH0IyZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 04:54:25 -0400
Received: from forward100p.mail.yandex.net ([77.88.28.100]:45072 "EHLO
        forward100p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729783AbfH0IyY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 04:54:24 -0400
Received: from mxback2j.mail.yandex.net (mxback2j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10b])
        by forward100p.mail.yandex.net (Yandex) with ESMTP id 918BB5981FA3;
        Tue, 27 Aug 2019 11:54:21 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback2j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 7n65irLtrN-sK9WrAcr;
        Tue, 27 Aug 2019 11:54:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566896061;
        bh=7Gyq+LBu6iHiMYMJuTsTZ0ECsLRbcZFOSDdNe3Heffo=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=i5Cfkf1b94Rz7e0/qo7TYEPNGrgu0mQC6awkryJJh/k69Ffwe3Ky0TEgEgnomgCKR
         ErAgY9yt4ODZkZiRZQ2A6d9jspbjgbgYIAtQMmLFUN5U7BLIBt/h9eSs0YLUY+vzlW
         pKApYZx5/bLKWlSaZy9oi2QmTA3z1hkyh11WwGs4=
Authentication-Results: mxback2j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id JOqUfE8LDO-sEtCfvQg;
        Tue, 27 Aug 2019 11:54:19 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 05/13] dt-bindings: interrupt-controller: Add Loongson-3 IOINTC
Date:   Tue, 27 Aug 2019 16:52:54 +0800
Message-Id: <20190827085302.5197-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson-3 I/O Interrupt controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../loongson,ls3-iointc.yaml                  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
new file mode 100644
index 000000000000..cc6ac8b2cd7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,ls3-iointc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,ls3-iointc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson-3 I/O Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips as the primary
+  package interrupt source which can route interrupt to interrupt line of cores.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - loongson,ls3-iointc
+
+  reg:
+    maxItems: 1
+
+  'loongson,map-ip':
+    description:
+      The interrupt line it's going to map to.
+    allOf:
+      - maximum: 5
+        minimum: 0
+        
+  'loongson,map-core':
+    description:
+      The core it's going to map to.
+    allOf:
+      - maximum: 5
+        minimum: 0
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    iointc: interrupt-controller@3ff01400 {
+        compatible = "loongson,ls3-io-intc";
+        reg = <0x3ff01400 0x60>;
+        interrupts = <2>;
+        loongson,map-ip = <0>;
+        loongson,map-core = <0>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.22.0

