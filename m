Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12E840B160
	for <lists+linux-mips@lfdr.de>; Tue, 14 Sep 2021 16:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234298AbhINOku (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Sep 2021 10:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234038AbhINOkT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Sep 2021 10:40:19 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA95C0613B6
        for <linux-mips@vger.kernel.org>; Tue, 14 Sep 2021 07:38:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d46f:7eb5:4a37:9d14])
        by xavier.telenet-ops.be with bizsmtp
        id tqeg2500H2aSKa101qeg6N; Tue, 14 Sep 2021 16:38:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a3-004VHK-Mz; Tue, 14 Sep 2021 16:38:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a3-00290R-0u; Tue, 14 Sep 2021 16:38:39 +0200
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
Subject: [PATCH v6 18/19] dt-bindings: auxdisplay: ht16k33: Document LED subnode
Date:   Tue, 14 Sep 2021 16:38:34 +0200
Message-Id: <20210914143835.511051-19-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914143835.511051-1-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
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
v6:
  - No changes,

v5:
  - No changes,

v4:
  - Add Reviewed-by,

v3:
  - New.
---
 .../bindings/auxdisplay/holtek,ht16k33.yaml           | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
index 6baf1200c9d8488e..0f1414185fefc1a9 100644
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
@@ -87,5 +93,10 @@ examples:
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

