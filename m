Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61195A2E80
	for <lists+linux-mips@lfdr.de>; Fri, 30 Aug 2019 06:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfH3EeD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Aug 2019 00:34:03 -0400
Received: from forward104o.mail.yandex.net ([37.140.190.179]:41190 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726236AbfH3EeD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 30 Aug 2019 00:34:03 -0400
Received: from mxback30g.mail.yandex.net (mxback30g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:330])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 393B4940BE1;
        Fri, 30 Aug 2019 07:33:59 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback30g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id aoMsNdSviV-XwFG9X8f;
        Fri, 30 Aug 2019 07:33:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567139639;
        bh=1wA0RivgWt4iFC4/HQ9Vbdnus6VesHHOMA3MK/kN4kM=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=Qk1t3lIJpVwkJgxldpO6hUx5bDRYkurfZbdBCTQZle5oT1bdSdEzkWwuONe6o51Ar
         3uldG2aT8vPWuag43K/Ko7WAgKyjUg9p7+scDljhBUaAZ2nswNDtJjYU6jIzMcyw3z
         vaPPFHUpAy4sy03289XSysTspm1ys3g3OCAQmc/8=
Authentication-Results: mxback30g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id vFuwVxmDwr-XoDG0YYA;
        Fri, 30 Aug 2019 07:33:57 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v1 12/18] dt-bindings: mips: Add loongson cpus & boards
Date:   Fri, 30 Aug 2019 12:32:26 +0800
Message-Id: <20190830043232.20191-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Prepare for later dts.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../bindings/mips/loongson/cpus.yaml          | 38 +++++++++++
 .../bindings/mips/loongson/devices.yaml       | 64 +++++++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/cpus.yaml
 create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml

diff --git a/Documentation/devicetree/bindings/mips/loongson/cpus.yaml b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
new file mode 100644
index 000000000000..dc6dd5114d5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/loongson/cpus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson CPUs bindings
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |+
+  The device tree allows to describe the layout of CPUs in a system through
+  the "cpus" node, which in turn contains a number of subnodes (ie "cpu")
+  defining properties for every cpu.
+
+  Bindings for CPU nodes follow the Devicetree Specification, available from:
+
+  https://www.devicetree.org/specifications/
+
+properties:
+  reg:
+    maxItems: 1
+    description: |
+      Physical ID of a CPU, Can be read from CP0 EBase.CPUNum.
+
+  compatible:
+    enum:
+      - loongson,gs464
+      - loongson,gs464e
+      - loongson,gs264
+      - loongson,gs464v
+
+required:
+  - device_type
+  - reg
+  - compatible
+...
diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
new file mode 100644
index 000000000000..aa6c42013d2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson based Platforms Device Tree Bindings
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+description: |
+  Devices with a Loongson CPU shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Loongson 3A1000 + RS780E 1Way
+        items:
+          - const: loongson,ls3a1000-780e-1way
+
+      - description: Loongson 3A1000 + RS780E 2Way
+        items:
+          - const: loongson,ls3a1000-780e-2way
+
+      - description: Loongson 3A1000 + RS780E 4Way
+        items:
+          - const: loongson,ls3a1000-780e-4way
+
+      - description: Loongson 3B1000/1500 + RS780E 1Way
+        items:
+          - const: loongson,ls3b-780e-1way
+
+      - description: Loongson 3B1000/1500 + RS780E 2Way
+        items:
+          - const: loongson,ls3b-780e-2way
+
+      - description: Loongson 3A2000 + RS780E 1Way
+        items:
+          - const: loongson,ls3a2000-780e-1way
+
+      - description: Loongson 3A2000 + RS780E 2Way
+        items:
+          - const: loongson,ls3a2000-780e-2way
+
+      - description: Loongson 3A2000 + RS780E 4Way
+        items:
+          - const: loongson,ls3a2000-780e-4way
+
+      - description: Loongson 3A3000 + RS780E 1Way
+        items:
+          - const: loongson,ls3a3000-780e-1way
+
+      - description: Loongson 3A3000 + RS780E 2Way
+        items:
+          - const: loongson,ls3a3000-780e-2way
+
+      - description: Loongson 3A3000 + RS780E 4Way
+        items:
+          - const: loongson,ls3a3000-780e-4way
+
+...
-- 
2.22.0

