Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE408457C6A
	for <lists+linux-mips@lfdr.de>; Sat, 20 Nov 2021 08:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235798AbhKTICt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Nov 2021 03:02:49 -0500
Received: from ptr.189.cn ([183.61.185.103]:11438 "EHLO 189.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229823AbhKTICt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 20 Nov 2021 03:02:49 -0500
HMM_SOURCE_IP: 10.64.8.43:38516.358279549
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
        by 189.cn (HERMES) with SMTP id A5ED51001F4;
        Sat, 20 Nov 2021 15:59:35 +0800 (CST)
Received: from  ([14.17.101.177])
        by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id 7f33e5aebf2c409491132af08a45f51f for l.stach@pengutronix.de;
        Sat, 20 Nov 2021 15:59:37 CST
X-Transaction-ID: 7f33e5aebf2c409491132af08a45f51f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 14.17.101.177
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
Subject: [PATCH 1/4] dt-bindings: ls2k1000: add gpu device node
Date:   Sat, 20 Nov 2021 15:59:23 +0800
Message-Id: <20211120075926.2671-2-15330273260@189.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211120075926.2671-1-15330273260@189.cn>
References: <20211120075926.2671-1-15330273260@189.cn>
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

