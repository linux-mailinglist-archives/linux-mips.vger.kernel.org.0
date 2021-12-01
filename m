Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C167F464D07
	for <lists+linux-mips@lfdr.de>; Wed,  1 Dec 2021 12:35:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbhLALip (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Dec 2021 06:38:45 -0500
Received: from ptr.189.cn ([183.61.185.103]:11453 "EHLO 189.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237771AbhLALin (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 1 Dec 2021 06:38:43 -0500
HMM_SOURCE_IP: 10.64.8.41:58200.40093229
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
        by 189.cn (HERMES) with SMTP id 9DC6D100203;
        Wed,  1 Dec 2021 19:35:19 +0800 (CST)
Received: from  ([14.17.101.176])
        by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id 55c58fdc2ed14dde9497c04f6c6389e1 for l.stach@pengutronix.de;
        Wed, 01 Dec 2021 19:35:21 CST
X-Transaction-ID: 55c58fdc2ed14dde9497c04f6c6389e1
X-Real-From: 15330273260@189.cn
X-Receive-IP: 14.17.101.176
X-MEDUSA-Status: 0
Sender: 15330273260@189.cn
From:   Sui Jingfeng <15330273260@189.cn>
To:     Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Qing Zhang <zhangqing@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Xiaochuan Mao <maoxiaochuan@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>,
        suijingfeng <suijingfeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: ls2k1000: add gpu device node
Date:   Wed,  1 Dec 2021 19:35:00 +0800
Message-Id: <20211201113502.3168-1-15330273260@189.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: suijingfeng <suijingfeng@loongson.cn>

There is a vivante gpu (GC1000 V5037) in ls2k1000,
but it is pci device not platform device.

ls2k1000 is dual-core mips64 cpu made by loongson.

Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index bfc3d3243ee7..f1feffac78a6 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -193,6 +193,17 @@
 				interrupt-parent = <&liointc0>;
 			};
 
+			gpu@5,0 {
+				compatible = "pci0014,7a05.0",
+						   "pci0014,7a05",
+						   "pciclass030200",
+						   "pciclass0302";
+
+				reg = <0x2800 0x0 0x0 0x0 0x0>;
+				interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc0>;
+			};
+
 			pci_bridge@9,0 {
 				compatible = "pci0014,7a19.0",
 						   "pci0014,7a19",
-- 
2.20.1

