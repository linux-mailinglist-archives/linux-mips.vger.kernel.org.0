Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A9271FE43
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jun 2023 11:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbjFBJur (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Jun 2023 05:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234552AbjFBJup (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Jun 2023 05:50:45 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AD4B21B6;
        Fri,  2 Jun 2023 02:50:39 -0700 (PDT)
Received: from loongson.cn (unknown [223.106.25.146])
        by gateway (Coremail) with SMTP id _____8CxjOtuu3lk5pYDAA--.4700S3;
        Fri, 02 Jun 2023 17:50:38 +0800 (CST)
Received: from localhost.localdomain (unknown [223.106.25.146])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_7Nqu3lkzrqFAA--.20150S2;
        Fri, 02 Jun 2023 17:50:35 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Binbin Zhou <zhoubb.aaron@gmail.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>,
        loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org,
        Keguang Zhang <keguang.zhang@gmail.com>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V5 0/5] Add rtc driver for the Loongson family chips
Date:   Fri,  2 Jun 2023 17:50:19 +0800
Message-Id: <cover.1685693501.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_7Nqu3lkzrqFAA--.20150S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGFWDXFy7GryfuFWkWF48JFb_yoWrJr13pa
        1ak3sxGrn5tr47Arn3Jry8uFyrZ393JrWDCF4xJ34S9FZ5C3WUXrWfKa1FyrZxur95WFy2
        qrn5Gr15WF45AFJanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
        kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
        CVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07jr9NsUUUUU=
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
v5:
patch(1/5)
  - The reason why ls2x can be removed directly is explained in the
    commit message;
  - Use fallback compatible;
    Thanks to all who participated in the fallback compatible discussion.
patch(3/5)
  - Since ls1b and ls1c have different register definitions, we'd better
    distinguish them with different
    configurations(ls1b_rtc_config/ls1c_rtc_config);
  - Due to the use of fallback compatible, the redundant compatible is
    removed. We can see the full list of supported chips in dt-binding..

v4:
https://lore.kernel.org/linux-rtc/cover.1684983279.git.zhoubinbin@loongson.cn/

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

 .../devicetree/bindings/rtc/loongson,rtc.yaml |  57 +++
 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 -
 .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
 drivers/rtc/Kconfig                           |  23 +-
 drivers/rtc/Makefile                          |   2 +-
 drivers/rtc/rtc-loongson.c                    | 397 ++++++++++++++++++
 drivers/rtc/rtc-ls1x.c                        | 192 ---------
 8 files changed, 482 insertions(+), 205 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/loongson,rtc.yaml
 create mode 100644 drivers/rtc/rtc-loongson.c
 delete mode 100644 drivers/rtc/rtc-ls1x.c

-- 
2.39.1

