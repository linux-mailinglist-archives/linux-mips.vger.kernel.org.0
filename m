Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87B75BEC07
	for <lists+linux-mips@lfdr.de>; Tue, 20 Sep 2022 19:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbiITRau (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Sep 2022 13:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiITRad (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Sep 2022 13:30:33 -0400
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356227199D
        for <linux-mips@vger.kernel.org>; Tue, 20 Sep 2022 10:30:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663694866; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=SXs2NNty6nAHGNb82MGcdFDT9tph4cnz0xB0CTD4tBMylQpe4l04b0xJtHhdiH2+1fdQ/quuNm/FgNW8oXhjmoeRwQ+bXGn1rWSd+r6ihXjha73i6Vg9KAuPXgh4QaRMcKusBqXqFaApyZiSghs4XRT/xjme+VNuCHU+x1pyO2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1663694866; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=8AjFH1BLUb+TXyGp2qTPrkMzOdVeStVDjagqGC2aBMo=; 
        b=Sw1PseK+KmPrwX1AQ8dc6oOr/0M4HUVO17hk49JrmZA/7w0rZgxEIxV/HbC2xXmzN7u87ZkeCPtyhKuwqu5gQufo9sBoX+FTC+6KcGJYipe3tmp2sYt2cy9n+76DT/eE1jVnVf8Yf3a4IN6QxjV2yqLPeSIbmRZ/MTSmnUI9x94=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663694866;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=8AjFH1BLUb+TXyGp2qTPrkMzOdVeStVDjagqGC2aBMo=;
        b=jLxb9ZGQDFo5AEsXVm/Qi+zoRrLLAGO8eYMrpSIdFKislJMVYN3SkdvolhR5jUwq
        bEsPBHbK1lvICO2xBrHrVoO+t87QFKvSjV8FeN5JiVTSd2yGYEuSIbFKKi1wIQb6O51
        qDS2mOGJjRu9It83qg61kpwuT2LSNM//Kdqo1gzk=
Received: from arinc9-Xeront.fusolab.local (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
        with SMTPS id 1663694864308155.8970139669667; Tue, 20 Sep 2022 10:27:44 -0700 (PDT)
From:   =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        erkin.bozoglu@xeront.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Petr Louda <petr.louda@outlook.cz>
Subject: [PATCH v4 net-next 10/10] mips: dts: ralink: mt7621: add GB-PC2 LEDs
Date:   Tue, 20 Sep 2022 20:25:56 +0300
Message-Id: <20220920172556.16557-11-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920172556.16557-1-arinc.unal@arinc9.com>
References: <20220920172556.16557-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the missing LEDs for GB-PC2. The ethblack-green, ethblue-green, power
and system LEDs weren't added previously, because they don't exist on the
device schematics. Tests on a GB-PC2 by me and Petr proved otherwise.

The i2c bus cannot be used on GB-PC2 as its pins are wired to LEDs instead,
and GB-PC1 does not use it. Therefore, do not enable it on both devices.

Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/GB-PC2_V1.1_schematic.pdf
Tested-by: Petr Louda <petr.louda@outlook.cz>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  |  6 ---
 .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  | 42 ++++++++++++++++---
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
index 6ecb8165efe8..0128bd8fa7ed 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts
@@ -20,12 +20,6 @@ chosen {
 		bootargs = "console=ttyS0,57600";
 	};
 
-	palmbus: palmbus@1e000000 {
-		i2c@900 {
-			status = "okay";
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index 5f52193a4c37..7515555388ae 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -20,12 +20,6 @@ chosen {
 		bootargs = "console=ttyS0,57600";
 	};
 
-	palmbus: palmbus@1e000000 {
-		i2c@900 {
-			status = "okay";
-		};
-	};
-
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -35,6 +29,42 @@ key-reset {
 			linux,code = <KEY_RESTART>;
 		};
 	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		ethblack-green {
+			label = "green:ethblack";
+			gpios = <&gpio 3 GPIO_ACTIVE_LOW>;
+		};
+
+		ethblue-green {
+			label = "green:ethblue";
+			gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+		};
+
+		ethyellow-green {
+			label = "green:ethyellow";
+			gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
+		};
+
+		ethyellow-orange {
+			label = "orange:ethyellow";
+			gpios = <&gpio 13 GPIO_ACTIVE_LOW>;
+		};
+
+		power {
+			label = "green:power";
+			gpios = <&gpio 6 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-on";
+		};
+
+		system {
+			label = "green:system";
+			gpios = <&gpio 8 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "disk-activity";
+		};
+	};
 };
 
 &mmc {
-- 
2.34.1

