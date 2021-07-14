Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFB13C86F0
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jul 2021 17:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239851AbhGNPOv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Jul 2021 11:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239785AbhGNPOm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Jul 2021 11:14:42 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9DCC0613AE
        for <linux-mips@vger.kernel.org>; Wed, 14 Jul 2021 08:11:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
        by xavier.telenet-ops.be with bizsmtp
        id V3Be2500S4sai0K013Be50; Wed, 14 Jul 2021 17:11:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXy-001ARb-Kq; Wed, 14 Jul 2021 17:11:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXx-00AchF-Sn; Wed, 14 Jul 2021 17:11:37 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 18/19] dt-bindings: auxdisplay: ht16k33: Document LED subnode
Date:   Wed, 14 Jul 2021 17:11:29 +0200
Message-Id: <20210714151130.2531831-19-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714151130.2531831-1-geert@linux-m68k.org>
References: <20210714151130.2531831-1-geert@linux-m68k.org>
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
---
v3:
  - New.
---
 .../bindings/auxdisplay/holtek,ht16k33.yaml           | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
index 2a58f883a08cb199..c750c1a915bdbecb 100644
--- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
+++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
@@ -50,6 +50,11 @@ properties:
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
@@ -68,6 +73,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/input/input.h>
+    #include <dt-bindings/leds/common.h>
     i2c1 {
             #address-cells = <1>;
             #size-cells = <0>;
@@ -89,5 +95,10 @@ examples:
                                    <MATRIX_KEY(4, 1, KEY_F9)>,
                                    <MATRIX_KEY(5, 1, KEY_F3)>,
                                    <MATRIX_KEY(6, 1, KEY_F1)>;
+
+                    led {
+                            color = <LED_COLOR_ID_RED>;
+                            function = LED_FUNCTION_BACKLIGHT;
+                    };
             };
       };
-- 
2.25.1

