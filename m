Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA2CA36D6F9
	for <lists+linux-mips@lfdr.de>; Wed, 28 Apr 2021 14:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhD1MHg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Apr 2021 08:07:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:37774 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229645AbhD1MHg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Apr 2021 08:07:36 -0400
Received: from localhost.localdomain (unknown [58.249.121.165])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxCcrST4lgjv8OAA--.2615S2;
        Wed, 28 Apr 2021 20:06:43 +0800 (CST)
From:   Xiaochuan Mao <maoxiaochuan@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Qing Zhang <zhangqing@loongson.cn>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Xiaochuan Mao <maoxiaochuan@loongson.cn>
Subject: [PATCH v2] MIPS:DTS:Correct device id of pcie for Loongnon-2K
Date:   Wed, 28 Apr 2021 20:06:28 +0800
Message-Id: <20210428120628.21041-1-maoxiaochuan@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9CxCcrST4lgjv8OAA--.2615S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF18KrWfXFWDuFy7Jw4DCFg_yoW8XFWxpF
        1akayDKr1ruF1S9w4rCFyv9F47GFZxJa98tF47tryjyFWqqayUur1fJFZ3JF45XF4rJayF
        vry0gFy8GFs7CrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5JwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjsjjDUUUUU==
X-CM-SenderInfo: xpdr5xxdrfx3ldqnw6o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

from Loongson-2K user manual know that Loongson-2K have two
pcie controller pcie0 and pcie1, pcie0 have four port named port0~port3
and pcie1 have 2 port named port0~port1. the device id of port0 is 7a19
in each pcie controller and others are 7a09.

Signed-off-by: Xiaochuan Mao <maoxiaochuan@loongson.cn>
---
v1:
revert class code
---
 .../boot/dts/loongson/loongson64-2k1000.dtsi     | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index 569e814def83..912dcad361ef 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -163,8 +163,8 @@
 			};
 
 			pci_bridge@a,0 {
-				compatible = "pci0014,7a19.0",
-						   "pci0014,7a19",
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
 						   "pciclass060400",
 						   "pciclass0604";
 
@@ -178,8 +178,8 @@
 			};
 
 			pci_bridge@b,0 {
-				compatible = "pci0014,7a19.0",
-						   "pci0014,7a19",
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
 						   "pciclass060400",
 						   "pciclass0604";
 
@@ -193,8 +193,8 @@
 			};
 
 			pci_bridge@c,0 {
-				compatible = "pci0014,7a19.0",
-						   "pci0014,7a19",
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
 						   "pciclass060400",
 						   "pciclass0604";
 
@@ -223,8 +223,8 @@
 			};
 
 			pci_bridge@e,0 {
-				compatible = "pci0014,7a19.0",
-						   "pci0014,7a19",
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
 						   "pciclass060400",
 						   "pciclass0604";
 
-- 
2.17.1

