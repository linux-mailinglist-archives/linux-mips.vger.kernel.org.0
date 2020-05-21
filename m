Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2FC31DC510
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 04:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgEUCPX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 22:15:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46672 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726833AbgEUCPW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 22:15:22 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP94s5MVeMjc3AA--.590S2;
        Thu, 21 May 2020 10:15:08 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: DTS: Only build subdir of current platform
Date:   Thu, 21 May 2020 10:15:06 +0800
Message-Id: <1590027306-2137-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxP94s5MVeMjc3AA--.590S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF45ZryUuw48KF18GF1UAwb_yoW5ZF1Dp3
        y3Aa1DWFWxWF1Syr1fAryDWr93Aw45CFZ7uFs8Gr1UAFZ29a4jyr1ftrsayr1UZr9Yya1S
        grWfWrW7AF1vyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8
        JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUseOJUUU
        UU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add config check in Makefile to only build the subdir of current platform.

E.g. without this patch:

  AR      arch/mips/built-in.a
  AR      arch/mips/boot/dts/brcm/built-in.a
  AR      arch/mips/boot/dts/cavium-octeon/built-in.a
  AR      arch/mips/boot/dts/img/built-in.a
  AR      arch/mips/boot/dts/ingenic/built-in.a
  AR      arch/mips/boot/dts/lantiq/built-in.a
  DTC     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb
  DTB     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.S
  AS      arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.o
  DTC     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb
  DTB     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.S
  AS      arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.o
  AR      arch/mips/boot/dts/loongson/built-in.a
  AR      arch/mips/boot/dts/mscc/built-in.a
  AR      arch/mips/boot/dts/mti/built-in.a
  AR      arch/mips/boot/dts/netlogic/built-in.a
  AR      arch/mips/boot/dts/ni/built-in.a
  AR      arch/mips/boot/dts/pic32/built-in.a
  AR      arch/mips/boot/dts/qca/built-in.a
  AR      arch/mips/boot/dts/ralink/built-in.a
  AR      arch/mips/boot/dts/xilfpga/built-in.a
  AR      arch/mips/boot/dts/built-in.a

With this patch:

  AR      arch/mips/built-in.a
  DTC     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb
  DTB     arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.S
  AS      arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dtb.o
  DTC     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb
  DTB     arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.S
  AS      arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dtb.o
  AR      arch/mips/boot/dts/loongson/built-in.a
  AR      arch/mips/boot/dts/built-in.a

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/boot/dts/Makefile | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index d429a69..dce32d1 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
-subdir-y	+= brcm
-subdir-y	+= cavium-octeon
-subdir-y	+= img
-subdir-y	+= ingenic
-subdir-y	+= lantiq
-subdir-y	+= loongson
-subdir-y	+= mscc
-subdir-y	+= mti
-subdir-y	+= netlogic
-subdir-y	+= ni
-subdir-y	+= pic32
-subdir-y	+= qca
-subdir-y	+= ralink
-subdir-y	+= xilfpga
+subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
+subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
+subdir-$(CONFIG_MACH_PISTACHIO)		+= img
+subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
+subdir-$(CONFIG_LANTIQ)			+= lantiq
+subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
+subdir-$(CONFIG_MSCC_OCELOT)		+= mscc
+subdir-$(CONFIG_MIPS_MALTA)		+= mti
+subdir-$(CONFIG_NLM_XLP_BOARD)		+= netlogic
+subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
+subdir-$(CONFIG_MACH_PIC32)		+= pic32
+subdir-$(CONFIG_ATH79)			+= qca
+subdir-$(CONFIG_RALINK)			+= ralink
+subdir-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= xilfpga
 
 obj-$(CONFIG_BUILTIN_DTB)	:= $(addsuffix /, $(subdir-y))
-- 
2.1.0

