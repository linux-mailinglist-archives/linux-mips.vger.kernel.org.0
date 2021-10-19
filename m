Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DF04338EB
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 16:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbhJSOst (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 10:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233533AbhJSOsR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 10:48:17 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C7BC0617BE
        for <linux-mips@vger.kernel.org>; Tue, 19 Oct 2021 07:45:33 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by andre.telenet-ops.be with bizsmtp
        id 7qlU2600G12AN0U01qlUcJ; Tue, 19 Oct 2021 16:45:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMp-006B4k-UH; Tue, 19 Oct 2021 16:45:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMn-00FACN-VM; Tue, 19 Oct 2021 16:45:25 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 19/21] dt-bindings: auxdisplay: ht16k33: Document LED subnode
Date:   Tue, 19 Oct 2021 16:45:18 +0200
Message-Id: <20211019144520.3613926-20-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019144520.3613926-1-geert@linux-m68k.org>
References: <20211019144520.3613926-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Extend the Holtek HT16K33 LED controller Device Tree bindings with an
LED subnode, conforming to the standard LED bindings.

This allows the user to exert more control, like specifying LED color,
function, and/or trigger, to extend LED functionality beyond a simple
display backlight.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v8:
  - No changes,

v7:
  - Add linux,default-trigger to example,

v6:
  - No changes,

v5:
  - No changes,

v4:
  - Add Reviewed-by,

v3:
  - New.
---
 .../bindings/auxdisplay/holtek,ht16k33.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
index 6baf1200c9d8488e..fc4873deb76f3190 100644
--- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
+++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
@@ -48,6 +48,11 @@ properties:
     default: 16
     description: Initial brightness level
 
+  led:
+    type: object
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
@@ -66,6 +71,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/input/input.h>
+    #include <dt-bindings/leds/common.h>
     i2c1 {
             #address-cells = <1>;
             #size-cells = <0>;
@@ -87,5 +93,11 @@ examples:
                                    <MATRIX_KEY(4, 1, KEY_F9)>,
                                    <MATRIX_KEY(5, 1, KEY_F3)>,
                                    <MATRIX_KEY(6, 1, KEY_F1)>;
+
+                    led {
+                            color = <LED_COLOR_ID_RED>;
+                            function = LED_FUNCTION_BACKLIGHT;
+                            linux,default-trigger = "backlight";
+                    };
             };
       };
-- 
2.25.1

