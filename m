Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA03C27F64F
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 01:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgI3XxH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 19:53:07 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:58995 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730357AbgI3XxH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 19:53:07 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7sQ6-1kJuCR17Ok-0050dZ; Thu, 01 Oct 2020 01:47:37 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNlos-0007ZT-EL; Thu, 01 Oct 2020 01:47:35 +0200
Received: (nullmailer pid 7769 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:34 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v6 3/7] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date:   Thu,  1 Oct 2020 01:46:33 +0200
Message-Id: <20200930234637.7573-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 2beb02607f6eb8f9cf7f14ab96a8f994
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:bP90eXR+w48aTn1ppXN+URCgE4TjDapabKR3j+t/0oN2he6UhS4
 m6ghKbSHJkVGW+jQn/1s17fu0hH++ewc1KAf1hb8c6rbXVTMJqhqGfghejlKAXTk2KnVt4u
 h8COnj2ZoHZ2irrHbvClLgCbfgW76zmIICkfLfSaLRqsttzfOoomDwOmdDJ9wQS0PwVO3A7
 j4ZxtfGDHC5halIijwdXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DlcMYV5VYds=:10vdboy6PnCfFJq7wZQzSm
 f0ZLoOgVBG050WlA+PLFaTkro1D2DXYN3bS4LBCmbgy2p5CGFluJylKzlytGK/pnD6NYxD0sW
 d/aPq78f4aE0f391Ie2ULhmUzTN3W4Hyatzzusq1lfzwn4B0WsPgp5LoZHhT2KyHT6LHiGIPB
 EJLBtTUggGztxXhrECdga/uW+vG2gWrnUif1rSj3eVhuxoI2BRCK8J/IZGGDDHL2ePp0XsPjM
 /JaAgLwEnVBkJTb0cbR0iWtWp2DyJp202ub3oYU4HEE9IdQizHZR3sZo5ZMkfAaWnJMCKbXQP
 LizVnnnTVRAYTN8bhZufaET6OkY+C+SNfuKBhe282B8vWe4L+PXZhzvbHp4xg0+eF1N6YdfoK
 rGrg+VN1BeqjUtJPJbULlRmMFR5G7o+mP/7xFnhyREHo0s2iT55NgssxPKsYNlu3J3mhid2yQ
 Ma/BP17CaVURbYT3IUfgNLF/9073tAsMi+L+20MKipAjseYjnsfVorWL1j8GCFoF3vbALkY1p
 xYCMn0l5ke+Sgl/HB4Ay+KgzxhAWf8w+GXAM+56CmhwlW8P+XiPVsE1WWWPpy6+N7b1aVNp8k
 5hvPH9+nmjfx5Qld+W2eZhT6IGB9Kz0c4BUiwERc9N+OGv8/h/HNPtKlJW+A9xXdrDYKGpEBl
 hRncGEFKQSWsdZrh+Q3RyeNOwjwBnzpwcKA2E6v+NPUsevgqX6xbjC1LW+vLJiql5QXNnY2/p
 mwDE4QQbeXi76zof+U2y6yJ82jvgQflRfAOqzOqdFdygEm1AjTT77t5sVolri6fM1sSYguJeE
 Yh4ItbpV6VpK4hwymbeq3AEmlxuILf+xi5Cb/MA1LsevTPsqjwnZwGuEaVf+D/noPSwpL1hSW
 b3Q+Cc7by1opZ0MOHOZV9isHXsW6Oqw+GXCtlkIIvCy6y+lJH/GBsXGWRLoOaj9HV3rzJTfqg
 a5szImwmcLWVTAjpfyAI3jdgD4mDbtHL9bQ0YP6Dr6hPpZT7yaPYpQbVqgzFNrcBBGzAqullF
 jWzAEgaLniw31tdx4SsDieq+gvB/fONZo/n2Shkyh1Lo
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6:
      * added this patch to series

 Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/iqs62x.yaml b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
index 541b06d80e73..92dc48a8dfa7 100644
--- a/Documentation/devicetree/bindings/mfd/iqs62x.yaml
+++ b/Documentation/devicetree/bindings/mfd/iqs62x.yaml
@@ -90,10 +90,11 @@ examples:
             };
     };
 
-    pwmleds {
+    led-controller {
             compatible = "pwm-leds";
 
-            panel {
+            led-1 {
+                    label = "panel";
                     pwms = <&iqs620a_pwm 0 1000000>;
                     max-brightness = <255>;
             };
-- 
2.20.1

