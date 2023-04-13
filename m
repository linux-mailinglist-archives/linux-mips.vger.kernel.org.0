Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB806E0866
	for <lists+linux-mips@lfdr.de>; Thu, 13 Apr 2023 09:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjDMH6O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Apr 2023 03:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbjDMH6M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Apr 2023 03:58:12 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C03A076AD;
        Thu, 13 Apr 2023 00:58:00 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.110.113])
        by gateway (Coremail) with SMTP id _____8DxUOUHtjdkH7obAA--.42985S3;
        Thu, 13 Apr 2023 15:57:59 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.110.113])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxHuQDtjdk7BciAA--.6706S2;
        Thu, 13 Apr 2023 15:57:56 +0800 (CST)
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
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V3 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
Date:   Thu, 13 Apr 2023 15:57:32 +0800
Message-Id: <cover.1681370153.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxHuQDtjdk7BciAA--.6706S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFW5JrWxAryUCryrZw47Jwb_yoW5JF4kpa
        y3CwnxKr1ktr13Ars3Jrykurn3ZrW3JryDAa17J3y3urZ3Ca4UZa4SyFWFyrsxCr95CFyj
        qryrGF43Way5CrJanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxV
        Aaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
        O2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
        YxBIdaVFxhVjvjDU0xZFpf9x07j5o7tUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
As LS1X does not support DT, we will merge LS2X and LS1X after keguang
has completed DT support for LS1X.

-------
Changes since v2:
- Rebase on the top of rtc-next.
patch(1/7):
 - The new patch.
patch(2/7):
 - Check patchset with "checkpatch.pl --strict";
 - Drop static inline functions which are used only once, such as
   ls2x_rtc_regs_to_time;
 - Remove the suruct ls2x_rtc_regs and regmap_bulk_xxx() is used to read
   and write rtc registers;
 - Clear the RTC wakeup interrupt manually;
 - Enable the RTC in set_time() and check in read_time();
 - device_get_match_data() is used to get ls2x_pm_offset, for LS2k1000
   has the different value;
 - Remove some inexact CONFIG_ACPI;
 - remove()->remove_new().

Changes since v1:
1. Rebased on top of latest loongarch-next;
2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
errors when the driver gets the IRQ number, Thanks to Qing Zhang for
testing;
3. Remove some inexact CONFIG_ACPI.

Thanks.

Binbin Zhou (7):
  dt-bindings: rtc: Subdivision of LS2X RTC compatible
  rtc: Add support for the Loongson-2K/LS7A RTC
  LoongArch: Enable LS2X RTC in loongson3_defconfig
  MIPS: Loongson64: DTS: Add RTC support to LS7A
  MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
  MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
  MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   7 +-
 arch/loongarch/configs/loongson3_defconfig    |   1 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
 arch/mips/configs/loongson2k_defconfig        |   1 +
 arch/mips/configs/loongson3_defconfig         |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-ls2x.c                        | 345 ++++++++++++++++++
 9 files changed, 379 insertions(+), 2 deletions(-)
 create mode 100644 drivers/rtc/rtc-ls2x.c

-- 
2.39.1

