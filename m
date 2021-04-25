Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F210F36A4EC
	for <lists+linux-mips@lfdr.de>; Sun, 25 Apr 2021 07:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhDYF3g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Apr 2021 01:29:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59954 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229466AbhDYF3g (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 25 Apr 2021 01:29:36 -0400
Received: from localhost.localdomain (unknown [58.249.121.165])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP+8M_oRg5Z0NAA--.6147S2;
        Sun, 25 Apr 2021 13:28:45 +0800 (CST)
From:   Xiaochuan Mao <maoxiaochuan@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Qing Zhang <zhangqing@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Xiaochuan Mao <maoxiaochuan@loongson.cn>
Subject: [PATCH] MIPS:DTS:Correct device id and class code of pcie for Loongnon-2K
Date:   Sun, 25 Apr 2021 13:28:17 +0800
Message-Id: <20210425052817.27373-1-maoxiaochuan@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9DxP+8M_oRg5Z0NAA--.6147S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF18KrykWw1fuF15uFy3Jwb_yoW8Kw4fpF
        1ak398Cr409F1Syr4rCFZ2vF47GFZ8Ga98t3W3GF10krWqq3yj9r45JF4fJrn8JFWrJw4S
        9FZ5Wr18tFWIyaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VCY1x0262k0Y48FwI0_Jr0_Gr1lYx0Ex4A2jsIE14v26r
        1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAq
        YI8I648v4I1lc2xSY4AK67AK6r4rMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWI
        evJa73UjIFyTuYvjfU50eHDUUUU
X-CM-SenderInfo: xpdr5xxdrfx3ldqnw6o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

from Loongson-2K user manual know that Loongson-2K have two
pcie controller pcie0 and pcie1, pcie0 have four port named port0~port3
and pcie1 have 2 port named port0~port1. the device id of port0 is 7a19
in each pcie controller and others are 7a09. and their class code is 0b0300.

Signed-off-by: Xiaochuan Mao <maoxiaochuan@loongson.cn>
---
 .../boot/dts/loongson/loongson64-2k1000.dtsi  | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 569e814def83..a95121359080 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -150,8 +150,8 @@
 			pci_bridge@9,0 {
 				compatible = "pci0014,7a19.0",
 						   "pci0014,7a19",
-						   "pciclass060400",
-						   "pciclass0604";
+						   "pciclass0b0300",
+						   "pciclass0b03";
 
 				reg = <0x4800 0x0 0x0 0x0 0x0>;
 				#interrupt-cells = <1>;
@@ -163,10 +163,10 @@
 			};
 
 			pci_bridge@a,0 {
-				compatible = "pci0014,7a19.0",
-						   "pci0014,7a19",
-						   "pciclass060400",
-						   "pciclass0604";
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
+						   "pciclass0b0300",
+						   "pciclass0b03";
 
 				reg = <0x5000 0x0 0x0 0x0 0x0>;
 				#interrupt-cells = <1>;
@@ -178,10 +178,10 @@
 			};
 
 			pci_bridge@b,0 {
-				compatible = "pci0014,7a19.0",
-						   "pci0014,7a19",
-						   "pciclass060400",
-						   "pciclass0604";
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
+						   "pciclass0b0300",
+						   "pciclass0b03";
 
 				reg = <0x5800 0x0 0x0 0x0 0x0>;
 				#interrupt-cells = <1>;
@@ -193,10 +193,10 @@
 			};
 
 			pci_bridge@c,0 {
-				compatible = "pci0014,7a19.0",
-						   "pci0014,7a19",
-						   "pciclass060400",
-						   "pciclass0604";
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
+						   "pciclass0b0300",
+						   "pciclass0b03";
 
 				reg = <0x6000 0x0 0x0 0x0 0x0>;
 				#interrupt-cells = <1>;
@@ -210,8 +210,8 @@
 			pci_bridge@d,0 {
 				compatible = "pci0014,7a19.0",
 						   "pci0014,7a19",
-						   "pciclass060400",
-						   "pciclass0604";
+						   "pciclass0b0300",
+						   "pciclass0b03";
 
 				reg = <0x6800 0x0 0x0 0x0 0x0>;
 				#interrupt-cells = <1>;
@@ -223,10 +223,10 @@
 			};
 
 			pci_bridge@e,0 {
-				compatible = "pci0014,7a19.0",
-						   "pci0014,7a19",
-						   "pciclass060400",
-						   "pciclass0604";
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
+						   "pciclass0b0300",
+						   "pciclass0b03";
 
 				reg = <0x7000 0x0 0x0 0x0 0x0>;
 				#interrupt-cells = <1>;
-- 
2.17.1

