Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A177828413E
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgJEUgY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:36:24 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:57977 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgJEUgT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:19 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N3sNa-1kYIcK2VtY-00zkKZ; Mon, 05 Oct 2020 22:35:44 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXCu-0004VK-1I; Mon, 05 Oct 2020 22:35:41 +0200
Received: (nullmailer pid 10319 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:37 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH v7 02/12] dt-bindings: leds: Convert pwm to yaml
Date:   Mon,  5 Oct 2020 22:34:41 +0200
Message-Id: <20201005203451.9985-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 3918240c492f27c9e5cce722baaeb3bb
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:uUbDr4x43FG38Zz0fjLwH2IQt4p0wE46E58Rl3s24Pb3SyqjwYB
 UDVp5EZgSrZjuqraSxM88IgkOS1Ry5WVuHbj5/fbgPc70b0+NSo5vbe1+8qFTb0MU/UsHHM
 CRcvI96gjEhTpEd2rde1sGu2rBB1opIhUL/Ck0pN+ddM/+BoRnCrX9Ns8suLjLgJjwugnIA
 SzkXJPUITAfqmhpktNYqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R4p8HGwMF6g=:OUKffrAsTKFVFJyvemQHaL
 MY1IiQrUSmx30hTmN/VkOpUMPlobmnENF0AyxdgXwByLywySaMxWR0Bjayn4ayndcTQoFmuQW
 TtERGNEwCal6h/1muEDy1e0HwbfqMvcW0iZ3yOVmCd2t1P+Ba2fGHZzxd54k1JwhklgNwF9Am
 6nkxN396X1ThBM6RxJzBCB30wC5+3PA3L8HJJwNMuo6L+ue+dfw0Cc3XwYmecTXy3V+UFlA5h
 mmE92UQF+9DtphqVWgTI1T0RArhk+IWHS1PqACLCo2h8O4we+sx4HcxzTTKCCqhR0izDMcMB0
 TfE3aFyBYZgCWJv4DU1K8P7asS+FAlizD4Gmz77YyV7N5hzaLemrGywXkC4nfjwdzoHllqgR9
 vvim6YSTK3XHSC6e96YTKaCv/R+FqI2lPaetbKkyYxjNpamb6A0fBk/1V34PSx5VZ+9PXW6YI
 v7b52uH/7Lkl/5aSYxIOVvc75UA8DL9eV528QZe5XujM69a7L7XTO6ZYsWsGT1Fy5JpGXCbyu
 oaIIX9Wj2OFvxB9RFADoMkTsROiC8T1nP1vG329ll/PQx64E694Q9Srd/mmyyRgTusbMKQZg1
 KakbvTy9OF/ZaVPcYGYCnM2xU75rnzxP37nxWmOnGaQm8u9fkP49pijWZzuUeO9CNS/J+vDFG
 XpcvJt5Gma3/Di8ShKuE3pNfxwu9JsFkG4q6rNKx1S+T6KKBUUwXegowDABFbJRII3Sswlwqa
 66wxOjqHpzgJHK6nXF2OOzPqNLNVWXv8YyN33OHwD0fEzsWUh/DohKbj/hU0O4EO6kADYSp4/
 3/TDWkfWuxliYsbiIJGgG1llM5jbh0XtFecMU/mXjQteOIIjBqKD5QBeHyZk1MUc09NvkYB
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The example was adapted in the following ways:

- make use of the now supported 'function' and 'color' properties
- remove pwm nodes, those are documented elsewhere
- align node names to new dt schema rules and dt recommendations

License was not explicitly set before.  The license set now is
recommended by DT project.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Alexander Dahl <post@lespocky.de>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Russell King <linux@armlinux.org.uk>
---

Notes:
    NOTE: Due to license set/change this needs Acked-by or Signed-off-by from:
      * Peter Ujfalusi
      * Russell King
    
    That was discussed already with Peter (original author), still waiting
    for Acked-by though …
    
    Changelog
    ---------
    v6 -> v7:
      * added Reviewed-by (Krzysztof Kozlowski)
      * reworded commit message (suggested by Krzysztof)
      * added Reviewed-by (Rob Herring)
    
    v5 -> v6:
      * removed pwm nodes from example (Rob)
      * renamed led-controller node in example (Rob)
    
    v4 -> v5:
      * updated based on feedback by Rob Herring
      * removed Acked-by
    
    v3 -> v4:
      * added Cc to original author of the binding
    
    v2 -> v3:
      * changed license identifier to recommended one
      * added Acked-by
    
    v2:
      * added this patch to series (Suggested-by: Jacek Anaszewski)

 .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
 .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
 2 files changed, 70 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Documentation/devicetree/bindings/leds/leds-pwm.txt
deleted file mode 100644
index 6c6583c35f2f..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-LED connected to PWM
-
-Required properties:
-- compatible : should be "pwm-leds".
-
-Each LED is represented as a sub-node of the pwm-leds device.  Each
-node's name represents the name of the corresponding LED.
-
-LED sub-node properties:
-- pwms : PWM property to point to the PWM device (phandle)/port (id) and to
-  specify the period time to be used: <&phandle id period_ns>;
-- pwm-names : (optional) Name to be used by the PWM subsystem for the PWM device
-  For the pwms and pwm-names property please refer to:
-  Documentation/devicetree/bindings/pwm/pwm.txt
-- max-brightness : Maximum brightness possible for the LED
-- active-low : (optional) For PWMs where the LED is wired to supply
-  rather than ground.
-- label :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger :  (optional)
-  see Documentation/devicetree/bindings/leds/common.txt
-
-Example:
-
-twl_pwm: pwm {
-	/* provides two PWMs (id 0, 1 for PWM1 and PWM2) */
-	compatible = "ti,twl6030-pwm";
-	#pwm-cells = <2>;
-};
-
-twl_pwmled: pwmled {
-	/* provides one PWM (id 0 for Charing indicator LED) */
-	compatible = "ti,twl6030-pwmled";
-	#pwm-cells = <2>;
-};
-
-pwmleds {
-	compatible = "pwm-leds";
-	kpad {
-		label = "omap4::keypad";
-		pwms = <&twl_pwm 0 7812500>;
-		max-brightness = <127>;
-	};
-
-	charging {
-		label = "omap4:green:chrg";
-		pwms = <&twl_pwmled 0 7812500>;
-		max-brightness = <255>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
new file mode 100644
index 000000000000..fe4d5fd25913
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/leds-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LEDs connected to PWM
+
+maintainers:
+  - Pavel Machek <pavel@ucw.cz>
+
+description:
+  Each LED is represented as a sub-node of the pwm-leds device.  Each
+  node's name represents the name of the corresponding LED.
+
+properties:
+  compatible:
+    const: pwm-leds
+
+patternProperties:
+  "^led(-[0-9a-f]+)?$":
+    type: object
+
+    $ref: common.yaml#
+
+    properties:
+      pwms:
+        maxItems: 1
+
+      pwm-names: true
+
+      max-brightness:
+        description:
+          Maximum brightness possible for the LED
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      active-low:
+        description:
+          For PWMs where the LED is wired to supply rather than ground.
+        type: boolean
+
+    required:
+      - pwms
+      - max-brightness
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/leds/common.h>
+
+    led-controller {
+        compatible = "pwm-leds";
+
+        led-1 {
+            label = "omap4::keypad";
+            pwms = <&twl_pwm 0 7812500>;
+            max-brightness = <127>;
+        };
+
+        led-2 {
+            color = <LED_COLOR_ID_GREEN>;
+            function = LED_FUNCTION_CHARGING;
+            pwms = <&twl_pwmled 0 7812500>;
+            max-brightness = <255>;
+        };
+    };
+
+...
-- 
2.20.1

