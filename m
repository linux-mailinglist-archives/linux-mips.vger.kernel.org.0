Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398C94EF825
	for <lists+linux-mips@lfdr.de>; Fri,  1 Apr 2022 18:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243864AbiDAQmf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Apr 2022 12:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241230AbiDAQmQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Apr 2022 12:42:16 -0400
Received: from 189.cn (ptr.189.cn [183.61.185.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 62DBA13A;
        Fri,  1 Apr 2022 09:23:21 -0700 (PDT)
HMM_SOURCE_IP: 10.64.8.43:38814.38631177
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id 8E6641002B4;
        Sat,  2 Apr 2022 00:23:08 +0800 (CST)
Received: from  ([172.27.8.53])
        by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id c082e2cc7bdf470492cdf6aced5d02f7 for mripard@kernel.org;
        Sat, 02 Apr 2022 00:23:20 CST
X-Transaction-ID: c082e2cc7bdf470492cdf6aced5d02f7
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
From:   Sui Jingfeng <15330273260@189.cn>
To:     Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        "David S . Miller" <davem@davemloft.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Ilia Mirkin <imirkin@alum.mit.edu>,
        Qing Zhang <zhangqing@loongson.cn>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v14 1/6] MIPS: Loongson64: dts: update the display controller device node
Date:   Sat,  2 Apr 2022 00:22:46 +0800
Message-Id: <20220401162251.1665081-2-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401162251.1665081-1-15330273260@189.cn>
References: <20220401162251.1665081-1-15330273260@189.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
        FROM_LOCAL_HEX,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The display controller is a pci device, it is used in ls2k1000 SoC and
LS7A1000 bridge. Its PCI vendor id is 0x0014, its PCI device id is 0x7a06.
In order to let the driver to know which chip the DC is contained in,
the compatible of the display controller is named according to the chip's
name.

For LS7A1000, there are 4 dedicated GPIOs whose control register is
located at the DC register space. They are used to emulate i2c for reading
edid from the monitor. One for DVO0, another for DVO1.

LS2K1000 and LS2K0500 SoC don't have such GPIOs, they grab i2c adapter
from other module, either general purpose GPIO emulated i2c or hardware
i2c adapter.

This patch add common part of the DC property only, it does not contain
ports property note. As it is for the generic boards which using
transparent encoder only.

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |  8 +++++++
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 22 ++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 8143a61111e3..2ecb5a232f22 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -198,6 +198,14 @@ sata@8,0 {
 				interrupt-parent = <&liointc0>;
 			};
 
+			lsdc: display-controller@6,0 {
+				compatible = "loongson,ls2k1000-dc";
+
+				reg = <0x3000 0x0 0x0 0x0 0x0>;
+				interrupts = <28 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc0>;
+			};
+
 			pci_bridge@9,0 {
 				compatible = "pci0014,7a19.0",
 						   "pci0014,7a19",
diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 2f45fce2cdc4..fcae7b20c5a2 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -160,15 +160,27 @@ gpu@6,0 {
 				interrupt-parent = <&pic>;
 			};
 
-			dc@6,1 {
-				compatible = "pci0014,7a06.0",
-						   "pci0014,7a06",
-						   "pciclass030000",
-						   "pciclass0300";
+			lsdc: display-controller@6,1 {
+				compatible = "loongson,ls7a1000-dc";
 
 				reg = <0x3100 0x0 0x0 0x0 0x0>;
 				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				i2c6: i2c@6 {
+					compatible = "loongson,gpio-i2c";
+					loongson,sda = <0>;
+					loongson,scl = <1>;
+				};
+
+				i2c7: i2c@7 {
+					compatible = "loongson,gpio-i2c";
+					loongson,sda = <2>;
+					loongson,scl = <3>;
+				};
 			};
 
 			hda@7,0 {
-- 
2.25.1

