Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC712C7166
	for <lists+linux-mips@lfdr.de>; Sat, 28 Nov 2020 22:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387428AbgK1V5g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Nov 2020 16:57:36 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:49501 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391339AbgK1V5f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 28 Nov 2020 16:57:35 -0500
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWiYo-1kgvGg011s-00X6B6; Sat, 28 Nov 2020 22:54:46 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kj8B0-000288-DU; Sat, 28 Nov 2020 22:54:44 +0100
Received: (nullmailer pid 4111 invoked by uid 2001);
        Sat, 28 Nov 2020 21:54:42 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org,
        Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v8 2/5] ARM: dts: berlin: Fix schema warnings for pwm-leds
Date:   Sat, 28 Nov 2020 22:53:50 +0100
Message-Id: <20201128215353.3991-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 467395612c70a9d75b41506b3ac52c2b
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:yLxbQe4fLlXjVIaFuag2S2PxaFAqe3BTGyh1CJ6YB9L6+GIZdAz
 SFmE94IzR094e/EdVMhrwcx7BUeFyUtjXwpE9KlI/WtZJG2V8lU4H2gMeA+zHaSPVabwvQX
 IU04uuFDKF3HKybmoNvlRalIKPSH6n8T0wNwhvAxisGg+2T1MWOLEiXyg5oapanB3SVFD3B
 Tz/I/ipnH1jMBIWuaGlPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VoId4h40b8E=:NvSURxE0qdKPIEw05FiB/W
 l/ch44701hupU0PgW3Pa0l3SMKOBB0kAgiNrVUbSvleykRjPTMlQUw2irN2rlGPwBXwf5LRuE
 XhILhZ1Ko2oGVUCBu/XjOmHCPcHNIRpg8juJIhUoLT2iQuNMpTdr1qpBZth3SG5wvZstmo32s
 k7nI1x5cfP/+b01nhAlfrGsEpUsgencXoLF89/95RO3v1LORM8oEyKwq7TyxzWUHcI509p5Xo
 o4o9njOqr4SFtraNOVe+x6V8+twLdrvji+QrvbcndJ9Jg6uQKfJVdzGz0Z0QBHWGZ7csUYM2o
 0Sj72o42CwSJ6yMi7HmaENumcy0J3ms05q0900ScH6tk7G1QsSWRVvvDt/2uEINo7mOY9TBQm
 hbTLRp91Zeoeo3gjwaPBH5Kwv6mvTVhhxQNYADbQcZ7Jfkaytkn0KDtWTUQQMkNWtHTNAJYJR
 1zG2QhmTbw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
  CHECK   arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
index 56fa951bc86f..c1d91424e658 100644
--- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
+++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
@@ -34,19 +34,19 @@
 		linux,usable-memory = <0x00000000 0x20000000>; /* 512 MB */
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
 		pinctrl-0 = <&ledpwm_pmux>;
 		pinctrl-names = "default";
 
-		white {
+		led-1 {
 			label = "white";
 			pwms = <&pwm 0 600000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		red {
+		led-2 {
 			label = "red";
 			pwms = <&pwm 1 600000 0>;
 			max-brightness = <255>;
-- 
2.20.1

