Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD8E2C716C
	for <lists+linux-mips@lfdr.de>; Sat, 28 Nov 2020 22:57:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391405AbgK1V5o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Nov 2020 16:57:44 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:43275 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391339AbgK1V5m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Nov 2020 16:57:42 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M5fZ4-1kpCim2lxa-007CJv; Sat, 28 Nov 2020 22:54:50 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kj8B5-00028I-NS; Sat, 28 Nov 2020 22:54:48 +0100
Received: (nullmailer pid 4125 invoked by uid 2001);
        Sat, 28 Nov 2020 21:54:47 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH v8 3/5] ARM: dts: stm32: Fix schema warnings for pwm-leds
Date:   Sat, 28 Nov 2020 22:53:51 +0100
Message-Id: <20201128215353.3991-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: b8844dc5d654d495a7d706217a0e2c12
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:FlCDQkEi3tojBhZ6dJIeoMgPtn78ZGf5wr8Ko/avsnHZJq4p1IC
 IE9YE1Z9C2johS1RteZrR4nd12BKi46txMgnRLCBeeO95SIxxlxu1Ta+70tFG+yIrb61ChT
 y3q2Rkj8zuCjtaFbrGNVQ4LWnHKjtNg9ko/WM/ARG0zXLlHI7JGAFl/LlQhMJz5kfg5IGeV
 veu9ah73k+2AawmzZan1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tmzo1QhOPc0=:4DnXuAtSDLCQxrFLG9qEUS
 9SwB2A6+hgoBUsKhDST9tApq3bb4MI1Tx/nAkNtogLoaJWMudXkZBQWKmU6CFGqK7vXbHZi/t
 f2GjbAOJ54K8W0JSTYnEkZAsrVVVYr/aQ+4xSTRtl1W7ScBrlhWkXttDk55E3feZL70jVJ7J+
 YlK3RIvahhMrOta62iSo1HJhKib/Pn6VKcOcH2VWReuiAr/7dg+ihDapQm4wiECyQd7oK7v1g
 tDr+npEVbvz+O/Ejugbj+fUk9l+V1ui/bFWNcn+anVwLqmXS7itzIqpuFPT7d0UqzuhmqX+So
 4CZMnz3rjE/x0U2LYZ4vINWAha8O4eFw4/mnD2aKBqu54B1MyFCATZCLpCDaW+7wjWOS2uAs3
 x3ZBQ11O2eAqy5aZh1B6kZhYZFcYSiK44aHCFJZSbevVKteDtVH+gy+8SHT/sRZvBzDEWOYWL
 9QXkksN6AA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
  CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
      * updated indexes and added comment (Ahmad Fatoum)
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index 1e5333fd437f..5ed58110d963 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -36,34 +36,35 @@
 		stdout-path = &uart4;
 	};
 
-	led-act {
+	led-controller-0 {
 		compatible = "gpio-leds";
 
-		led-green {
+		led-0 {
 			label = "mc1:green:act";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	led-rgb {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		led-red {
+		/* led-1 to led-3 are part of a single RGB led */
+		led-1 {
 			label = "mc1:red:rgb";
 			pwms = <&leds_pwm 1 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-green {
+		led-2 {
 			label = "mc1:green:rgb";
 			pwms = <&leds_pwm 2 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-blue {
+		led-3 {
 			label = "mc1:blue:rgb";
 			pwms = <&leds_pwm 3 1000000 0>;
 			max-brightness = <255>;
-- 
2.20.1

