Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC7040B11C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Sep 2021 16:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbhINOkE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Sep 2021 10:40:04 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:45360 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233870AbhINOkC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Sep 2021 10:40:02 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4H85ZC1LT1zMr03k
        for <linux-mips@vger.kernel.org>; Tue, 14 Sep 2021 16:38:43 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d46f:7eb5:4a37:9d14])
        by baptiste.telenet-ops.be with bizsmtp
        id tqef2500L2aSKa101qefh3; Tue, 14 Sep 2021 16:38:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a2-004VGe-TF; Tue, 14 Sep 2021 16:38:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a2-0028y1-Dm; Tue, 14 Sep 2021 16:38:38 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 02/19] dt-bindings: auxdisplay: ht16k33: Document Adafruit segment displays
Date:   Tue, 14 Sep 2021 16:38:18 +0200
Message-Id: <20210914143835.511051-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914143835.511051-1-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Holtek HT16K33 LED controller is not only used for driving
dot-matrix displays, but also for driving segment displays.

Document compatible values for the Adafruit 7-segment[1] and
14-segment[2] FeatherWing expansion boards with red displays.  According
to the schematics, all other Adafruit 7-segment and 14-segment display
backpack and FeatherWing expansion boards (including bare boards and
boards fitted with displays) are compatible with these two boards.

[1] https://www.adafruit.com/product/3108
[2] https://www.adafruit.com/product/3130

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v6:
  - No changes,

v5:
  - Add Reviewed-by,

v4:
  - Combine compatible values for 7/14 segment displays into an enum,

v3:
  - Drop color property,

v2:
  - Fix type of color to uint32,
  - "refresh-rate-hz" is still required for dot-matrix displays.

Alternatives I considered:
  1. Document the attached display type in a child node.
     I.e. specify segment type, number of characters, and wiring.
     Especially the latter would become really complex, due to the sheer
     amount of possible wiring combinations.
     Using this method, you also loose the ability to just connect a
     display to an i2c bus, and instantiate the device from sysfs,
     without using DT:

	echo adafruit,3130 0x70 > /sys/class/i2c/i2c-adapter/.../new_device

  2. Document all Adafruit 7-segment and 14-segment display backpack and
     FeatherWing expansion boards.
     This would lead to a myriad of compatible values:

      - items:
	  - enum:
	      - adafruit,878      # 0.56" 4-Digit 7-Segment Display Backpack (Red)
	      - adafruit,879      # 0.56" 4-Digit 7-Segment Display Backpack (Yellow)
	      - adafruit,880      # 0.56" 4-Digit 7-Segment Display Backpack (Green)
	      - adafruit,881      # 0.56" 4-Digit 7-Segment Display Backpack (Blue)
	      - adafruit,1002     # 0.56" 4-Digit 7-Segment Display Backpack (White)
	  - const: adafruit,877   # 0.56" 4-Digit 7-Segment Backpack
	  - const: holtek,ht16k33

      - items:
	  - enum:
	      - adafruit,1268     # 1.2" 4-Digit 7-Segment Display Backpack (Green)
	      - adafruit,1269     # 1.2" 4-Digit 7-Segment Display Backpack (Yellow)
	      - adafruit,1270     # 1.2" 4-Digit 7-Segment Display Backpack (Red)
	  - const: adafruit,1271  # 1.2" 4-Digit 7-Segment Backpack
	  - const: holtek,ht16k33

      - items:
	  - enum:
	      - adafruit,1911     # 0.54" Quad Alphanumeric Display Backpack (Red)
	      - adafruit,1912     # 0.54" Quad Alphanumeric Display Backpack (Blue)
	      - adafruit,2157     # 0.54" Quad Alphanumeric Display Backpack (White)
	      - adafruit,2158     # 0.54" Quad Alphanumeric Display Backpack (Yellow)
	      - adafruit,2159     # 0.54" Quad Alphanumeric Display Backpack (Yellow-Green)
	      - adafruit,2160     # 0.54" Quad Alphanumeric Display Backpack (Green)
	  - const: adafruit,1910  # 0.54" Quad 14-segment Alphanumeric Backpack
	  - const: holtek,ht16k33

      - items:
	  - enum:
	      - adafruit,3106     # 0.56" 4-Digit 7-Segment FeatherWing Display (Blue)
	      - adafruit,3107     # 0.56" 4-Digit 7-Segment FeatherWing Display (Green)
	      - adafruit,3108     # 0.56" 4-Digit 7-Segment FeatherWing Display (Red)
	      - adafruit,3109     # 0.56" 4-Digit 7-Segment FeatherWing Display (White)
	      - adafruit,3110     # 0.56" 4-Digit 7-Segment FeatherWing Display (Yellow)
	  - const: adafruit,3088  # 0.56" 4-Digit 7-Segment FeatherWing
	  - const: holtek,ht16k33

      - items:
	  - enum:
	      - adafruit,3127     # 0.54" Quad Alphanumeric FeatherWing Display (White)
	      - adafruit,3128     # 0.54" Quad Alphanumeric FeatherWing Display (Blue)
	      - adafruit,3129     # 0.54" Quad Alphanumeric FeatherWing Display (Green)
	      - adafruit,3130     # 0.54" Quad Alphanumeric FeatherWing Display (Red)
	      - adafruit,3131     # 0.54" Quad Alphanumeric FeatherWing Display (Yellow)
	      - adafruit,3132     # 0.54" Quad Alphanumeric FeatherWing Display (Yellow-Green)
	  - const: adafruit,3089  # 0.54" Quad 14-segment Alphanumeric FeatherWing
	  - const: holtek,ht16k33
---
 .../bindings/auxdisplay/holtek,ht16k33.yaml   | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
index 64ffff460026040f..6baf1200c9d8488e 100644
--- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
+++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
@@ -14,14 +14,21 @@ allOf:
 
 properties:
   compatible:
-    const: holtek,ht16k33
+    oneOf:
+      - items:
+          - enum:
+              - adafruit,3108  # 0.56" 4-Digit 7-Segment FeatherWing Display (Red)
+              - adafruit,3130  # 0.54" Quad Alphanumeric FeatherWing Display (Red)
+          - const: holtek,ht16k33
+
+      - const: holtek,ht16k33     # Generic 16*8 LED controller with dot-matrix display
 
   reg:
     maxItems: 1
 
   refresh-rate-hz:
     maxItems: 1
-    description: Display update interval in Hertz
+    description: Display update interval in Hertz for dot-matrix displays
 
   interrupts:
     maxItems: 1
@@ -44,7 +51,14 @@ properties:
 required:
   - compatible
   - reg
-  - refresh-rate-hz
+
+if:
+  properties:
+    compatible:
+      const: holtek,ht16k33
+then:
+  required:
+    - refresh-rate-hz
 
 additionalProperties: false
 
-- 
2.25.1

