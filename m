Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9D0C9E352
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 10:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbfH0IzG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 04:55:06 -0400
Received: from forward106p.mail.yandex.net ([77.88.28.109]:39006 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725912AbfH0IzG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 04:55:06 -0400
Received: from mxback28o.mail.yandex.net (mxback28o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::79])
        by forward106p.mail.yandex.net (Yandex) with ESMTP id E9A541C81A15;
        Tue, 27 Aug 2019 11:55:00 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback28o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id Hptl9zhHrY-t08a4aTr;
        Tue, 27 Aug 2019 11:55:00 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566896100;
        bh=Y6sfZ58nj6HzDrvBbI59ncoDg0LgIEFsSAJSPkb15cQ=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=ItpLCNRMQorxM6o/rJmNmiJGruMvcws/t4qnRv6ynhTh/uMXaXRHsMYaoYLDtmHNe
         tzh+VRvOcyqqsoxaqfnTvn49nEVkDbXuJX2k9SGw6awt1LImS2sx90UVGyiNCEos7P
         7R8Zw2OpkT6CLzwcS5Q9ZvCUITw2QwY7MkWDbAxw=
Authentication-Results: mxback28o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id JOqUfE8LDO-sttCsrGB;
        Tue, 27 Aug 2019 11:54:59 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 11/13] dt-bindings: mips: Add loongson cpus & boards
Date:   Tue, 27 Aug 2019 16:53:00 +0800
Message-Id: <20190827085302.5197-12-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
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
index 000000000000..410d896a0078
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/cpus.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
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
index 000000000000..181881a9f4a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/loongson/devices.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoC based Platforms Device Tree Bindings
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

