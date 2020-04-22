Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912A01B4746
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 16:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbgDVO0d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 10:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbgDVO0c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Apr 2020 10:26:32 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A06C03C1AB;
        Wed, 22 Apr 2020 07:26:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 668AF20CD7;
        Wed, 22 Apr 2020 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587565581; bh=gcBrZURzLy/c5DPtKSgJCdkUrE3/EqglvJnTdGdPgH4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dPXjey7/mdk02sxR96S858sGLPIpYm95W28rnBKvRIRdM9zOnYkFaJoU12l6UfZuW
         wDW8Tc+1oGwn9cVrljvpuqycRA7H0CTaWLd5HONZ7g4j2CekUXO/DCH76ERZvzyFCo
         yWIK7a8wSgrZ9xilBySDYUIWntUGCd5pvqQR8NT9nR+iGviQoBd3toV0bbmOeHlGSo
         H021jhwF97+qz+EgYhu3fQUdYf+JA2M5hZ5hceYYXCtcxFo7Enj2WhygBl4Sd1zMug
         FasvYpNCI4ptNkH9MQMHGauz5zGOatG1HM0OzbswbLDSoIXEHh5Ex8WJ/XijohXHVS
         8LuG6ufhSRCVw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org, maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: interrupt-controller: Add Loongson PCH PIC
Date:   Wed, 22 Apr 2020 22:24:24 +0800
Message-Id: <20200422142428.1249684-5-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add binding for Loongson PCH PIC Controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../loongson,pch-pic.yaml                     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
new file mode 100644
index 000000000000..afc0c924e477
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson PCH PIC Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+description: |
+  This interrupt controller is found in the Loongson-7A family of PCH for
+  transforming interrupts from on-chip devices into HyperTransport vectorized
+  interrupts.
+
+properties:
+  compatible:
+    const: loongson,pch-pic-1.0
+
+  reg:
+    maxItems: 1
+
+  loongson,pic-base-vec:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: |
+      u32 value of the base of parent HyperTransport vector allocated
+      to PCH PIC.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pic: interrupt-controller@10000000 {
+      compatible = "loongson,pch-pic-1.0";
+      reg = <0x10000000 0x400>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      loongson,pic-base-vec = <64>;
+      interrupt-parent = <&htvec>;
+    };
+...
-- 
2.26.0.rc2

