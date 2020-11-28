Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A222C7160
	for <lists+linux-mips@lfdr.de>; Sat, 28 Nov 2020 22:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391390AbgK1V5Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Nov 2020 16:57:24 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:43677 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387418AbgK1V5U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Nov 2020 16:57:20 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mbzdn-1kCp1h3pip-00dVpA; Sat, 28 Nov 2020 22:54:35 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kj8Ap-00027n-QE; Sat, 28 Nov 2020 22:54:33 +0100
Received: (nullmailer pid 4098 invoked by uid 2001);
        Sat, 28 Nov 2020 21:54:31 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v8 1/5] dt-bindings: mfd: Fix schema warnings for pwm-leds
Date:   Sat, 28 Nov 2020 22:53:49 +0100
Message-Id: <20201128215353.3991-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 53f17ed7acf4619e77ac9411375ac493
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:EV7J6yS0bGPfutnvWVxMCCVlSgPwiskXwos5S6beCfiCo9yItBc
 VP7B501UjpYvDbqaI2nyNkcHkzh61wxAc9T6vG6yPKDIogjV5FQGR5Cuz5hqkLY1WwnXh+S
 SrLCNFf7dWlqZ3etQu8AuAe3VYnmp3Z7wt55/0Z9hb5Y0+C/2KTJTpxFdAIxYw5bdKgBvv9
 K4zjotGQiLPn+HdjITW8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ELxZVikg6TI=:PmypatW+rzOMpdxBmlAY1n
 EdFBUyFl74PH/aQCYuElzcbYc/o1pIlryiqJ/lRB9OEjdGS6ahQosWWII4CanGexPuhY79yDa
 /kCCTAHMK9v5s++x3s/ssR/w+WeIGiOHE7FoA5m8bueMTcEJWDnXYxjKDe5ArWKU/f5Am5qzc
 8/EoNSfStwQQI7EStFPMBEqyuTqf7S4n/4NHWqC9O+iyCE8ged/Ek4Vg9OAR1pYiuukqi6wNp
 fNM5SdUFIw6s/P0DPbMXRYLsjCypIi74xl9ohS87pwHygZ4/dbNR4IDdWYy/Ciu78w38tCCZv
 US86sU16i4I5Vx/952629q+pUPXPoSTGalk4qR+WUXPCSOhzenFmhcm+Uw8DbOSO5Jpilxnu9
 36kxQU4emB3a9Y+fck8F/eg7Id66dJgFm263GeC60oCEl3YzzWct7mLmzgGRKZsshSeILowJP
 N9PyGKn/yQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
/home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
      * added Acked-by (Rob Herring)
    
    v6 -> v7:
      * added warning message to commit message (Krzysztof Kozlowski)
    
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

