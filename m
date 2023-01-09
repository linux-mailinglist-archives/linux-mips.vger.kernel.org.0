Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A912661BE9
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jan 2023 02:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233920AbjAIBfB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Jan 2023 20:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbjAIBfB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Jan 2023 20:35:01 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B249B86F;
        Sun,  8 Jan 2023 17:34:59 -0800 (PST)
Received: from loongson.cn (unknown [112.20.112.33])
        by gateway (Coremail) with SMTP id _____8Bx7epBb7tjqWkAAA--.1141S3;
        Mon, 09 Jan 2023 09:34:57 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.33])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxsOQ_b7tjZ3gWAA--.3588S2;
        Mon, 09 Jan 2023 09:34:56 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>
Cc:     linux-rtc@vger.kernel.org, linux-mips@vger.kernel.org,
        loongarch@lists.linux.dev, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V2 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Date:   Mon,  9 Jan 2023 09:35:10 +0800
Message-Id: <cover.1673227292.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxsOQ_b7tjZ3gWAA--.3588S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFW5JrWxAryUCryrAF4Utwb_yoW8ZFWkpa
        1akwnxKrsrtr47Ars3ArykGF1rArWfJ3srAa13J34xurZ5Ca4UZ347tFWFy3y7Cr98G340
        vFyrKF42gF45A3DanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1ln4kS
        14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
        1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
        67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2
        AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
        xVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
        C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
        Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
        WUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBI
        daVFxhVjvjDU0xZFpf9x07j5o7tUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all:

The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
released five versions of patchset before, and all related mail records
are shown below if you are interested:

https://lore.kernel.org/all/?q=ls2x-rtc

In this series of patches, based on the code above, I have added the
following support:

1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
   by default under LoongArch architecture;
2. Add rtc alarm/walarm related functions.

I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
and Loongson-2K0500.

BTW:
There have been discussions about merging the rtc drivers of ls1x and
ls2x, but the following reasons made the merger difficult to achieve:

1. ls1x does not support ACPI, for it is only on MIPS-based system;
2. ls1x does not support alarm function.

Thanks.

-------
Changes since v1:
1. Rebased on top of latest loongarch-next;
2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
errors when the driver gets the IRQ number, Thanks to Qing Zhang for
testing;
3. Remove some inexact CONFIG_ACPI.

Binbin Zhou (4):
  rtc: Add support for the Loongson-2K/LS7A RTC
  LoongArch: Enable LS2X RTC in loongson3_defconfig
  MIPS: Loongson64: DTS: Add RTC support to LS7A
  MIPS: Loongson64: DTS: Add RTC support to Loongson-2K

WANG Xuerui (3):
  dt-bindings: rtc: Add Loongson LS2X RTC support
  MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
  MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 arch/loongarch/configs/loongson3_defconfig    |   1 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
 arch/mips/configs/loongson2k_defconfig        |   1 +
 arch/mips/configs/loongson3_defconfig         |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-ls2x.c                        | 379 ++++++++++++++++++
 9 files changed, 410 insertions(+)
 create mode 100644 drivers/rtc/rtc-ls2x.c

-- 
2.31.1

