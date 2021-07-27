Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303A33D7A91
	for <lists+linux-mips@lfdr.de>; Tue, 27 Jul 2021 18:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhG0QKr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Jul 2021 12:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhG0QKq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 27 Jul 2021 12:10:46 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88391C061760
        for <linux-mips@vger.kernel.org>; Tue, 27 Jul 2021 09:10:46 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b0a9:7e88:5ca4:551a])
        by albert.telenet-ops.be with bizsmtp
        id aGAk2500G1fSPfK06GAkik; Tue, 27 Jul 2021 18:10:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m8PfI-001S4y-1d; Tue, 27 Jul 2021 18:10:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m8PfH-00Fr8E-Lg; Tue, 27 Jul 2021 18:10:43 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] dt-bindings: auxdisplay: img-ascii-lcd: Convert to json-schema
Date:   Tue, 27 Jul 2021 18:10:34 +0200
Message-Id: <6e74aa466d39ddc9abe502e054d04e8cc7b76b40.1627402094.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert the Device Tree binding documentation for ASCII LCD displays on
Imagination Technologies boards to json-schema.

Drop bogus regmap property.
Add example.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 .../bindings/auxdisplay/img,ascii-lcd.yaml    | 54 +++++++++++++++++++
 .../bindings/auxdisplay/img-ascii-lcd.txt     | 17 ------
 MAINTAINERS                                   |  2 +-
 3 files changed, 55 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/auxdisplay/img,ascii-lcd.yaml
 delete mode 100644 Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt

diff --git a/Documentation/devicetree/bindings/auxdisplay/img,ascii-lcd.yaml b/Documentation/devicetree/bindings/auxdisplay/img,ascii-lcd.yaml
new file mode 100644
index 0000000000000000..66e54f12f40f2f78
--- /dev/null
+++ b/Documentation/devicetree/bindings/auxdisplay/img,ascii-lcd.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/auxdisplay/img,ascii-lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ASCII LCD displays on Imagination Technologies boards
+
+maintainers:
+  - Paul Burton <paulburton@kernel.org>
+
+properties:
+  compatible:
+    enum:
+      - img,boston-lcd
+      - mti,malta-lcd
+      - mti,sead3-lcd
+
+  reg:
+    maxItems: 1
+
+  offset:
+    description:
+      Offset in bytes to the LCD registers within the system controller
+
+required:
+  - compatible
+
+oneOf:
+  - required:
+      - reg
+  - required:
+      - offset
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: img,boston-lcd
+then:
+  required:
+    - reg
+else:
+  required:
+    - offset
+
+additionalProperties: false
+
+examples:
+  - |
+    lcd: lcd@17fff000 {
+            compatible = "img,boston-lcd";
+            reg = <0x17fff000 0x8>;
+    };
diff --git a/Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt b/Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
deleted file mode 100644
index b69bb68992fdf2a7..0000000000000000
--- a/Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Binding for ASCII LCD displays on Imagination Technologies boards
-
-Required properties:
-- compatible : should be one of:
-    "img,boston-lcd"
-    "mti,malta-lcd"
-    "mti,sead3-lcd"
-
-Required properties for "img,boston-lcd":
-- reg : memory region locating the device registers
-
-Required properties for "mti,malta-lcd" or "mti,sead3-lcd":
-- regmap: phandle of the system controller containing the LCD registers
-- offset: offset in bytes to the LCD registers within the system controller
-
-The layout of the registers & properties of the display are determined
-from the compatible string, making this binding somewhat trivial.
diff --git a/MAINTAINERS b/MAINTAINERS
index 7c2ca9c3809f0104..a8afc9238fd8e164 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9063,7 +9063,7 @@ F:	drivers/usb/atm/ueagle-atm.c
 IMGTEC ASCII LCD DRIVER
 M:	Paul Burton <paulburton@kernel.org>
 S:	Maintained
-F:	Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
+F:	Documentation/devicetree/bindings/auxdisplay/img,ascii-lcd.yaml
 F:	drivers/auxdisplay/img-ascii-lcd.c
 
 IMGTEC IR DECODER DRIVER
-- 
2.25.1

