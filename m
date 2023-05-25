Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF27F710C81
	for <lists+linux-mips@lfdr.de>; Thu, 25 May 2023 14:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjEYM4b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 May 2023 08:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240404AbjEYM43 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 25 May 2023 08:56:29 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 080C3E44;
        Thu, 25 May 2023 05:55:55 -0700 (PDT)
Received: from loongson.cn (unknown [223.106.25.146])
        by gateway (Coremail) with SMTP id _____8AxrevIWm9kS_8AAA--.2362S3;
        Thu, 25 May 2023 20:55:36 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFLXFWm9kdYR3AA--.1778S2;
        Thu, 25 May 2023 20:55:34 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V4 0/5] rtc: Add rtc driver for the Loongson family chips
Date:   Thu, 25 May 2023 20:55:22 +0800
Message-Id: <cover.1684983279.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxFLXFWm9kdYR3AA--.1778S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGFWDXFy7Gry7tr1fZr1rXrb_yoW5Cr1xpa
        1ak3sxGrn5tr47Arn3Ary8uFy5Aa4fJryDCF4xX34S9FZ5C3WUXrWfKay0yrZxCryrGFy2
        qr1kGr45WF45AFJanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
        e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
        kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
        1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
        6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr
        0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU8loGPUUUUU==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
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
2. Add rtc alarm/walarm related functions;
3. Merge LS1X rtc and LS2X rtc into a unified rtc-loongson driver.

I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA,
Loongson-2K0500 and Loongson-2K2000(ACPI/DT).

Thanks to everyone for reviewing and testing the code.

-------
v4:
- Rebase on the top of rtc-next;
- Drop defconfig-related patches;
patch(1/5)
  - New patch, Loongson RTC bindings have been rewritten and we have
    dropped the wildcard (ls2x) in compatible.
    Thanks to Krzysztof for your comments;
patch(2/5)
  - New patch, drop the ls1x rtc driver;
patch(3/5)
  - Clear RTC_FEATURE_UPDATE_INTERRUPT bit, for the rtc does not support
    UIE;
  - Add LS2K2000 support(DT/ACPI);
  - Merge ls1x support and name the driver rtc-loongson;
    Thanks to Jiaxun for his comments and Keguang for his assistance in
testing.

v3:
https://lore.kernel.org/linux-rtc/cover.1681370153.git.zhoubinbin@loongson.cn/
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
 - Remove some inexact CONFIG_ACPI.

v2:
1. Rebased on top of latest loongarch-next;
2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
errors when the driver gets the IRQ number, Thanks to Qing Zhang for
testing;
3. Remove some inexact CONFIG_ACPI.

Thanks.

Binbin Zhou (5):
  dt-bindings: rtc: Remove the LS2X from the trivial RTCs
  rtc: Remove the Loongson-1 RTC driver
  rtc: Add rtc driver for the Loongson family chips
  MIPS: Loongson64: DTS: Add RTC support to LS7A PCH
  MIPS: Loongson64: DTS: Add RTC support to Loongson-2K1000

 .../devicetree/bindings/rtc/loongson,rtc.yaml |  47 +++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 -
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
 drivers/rtc/Kconfig                           |  23 +-
 drivers/rtc/Makefile                          |   2 +-
 drivers/rtc/rtc-loongson.c                    | 390 ++++++++++++++++++
 drivers/rtc/rtc-ls1x.c                        | 192 ---------
 8 files changed, 465 insertions(+), 205 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
 create mode 100644 drivers/rtc/rtc-loongson.c
 delete mode 100644 drivers/rtc/rtc-ls1x.c

-- 
2.39.1

