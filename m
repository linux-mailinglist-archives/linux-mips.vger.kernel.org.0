Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28ACE6E3BB5
	for <lists+linux-mips@lfdr.de>; Sun, 16 Apr 2023 21:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDPTvS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Apr 2023 15:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDPTvR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Apr 2023 15:51:17 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92523A8;
        Sun, 16 Apr 2023 12:51:15 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2B0E8E0008;
        Sun, 16 Apr 2023 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1681674674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vDCHYtatRNGqqSMam8YDqpPpEGtjwBwQpRGk26Gg1NM=;
        b=KULaQ71ufRwVMmKh27NIndxXTkYIBFk1u48LFxSWEcOWF3p3U1sSCjZVJ9plH7iI49yj8B
        tbiI2kvvxlpEt7tL/JmvWbHvxUM43DL7X00zlBG+ke4ILtgiKTu0nloCxCJsfFWFYZ4bT9
        0iLXv2BXLwcCFbT1EKYuoa5Vyfv1je71Ax5pRVERQwtWIKudyPkJrlmlyKYRhLVNncmcKR
        3Yk4hg4mEXgUFKvp7a6rl1EvmYqAkT2GM/FMXApN34bhgInEJkDxUP4iF5DsN1Pss1SgIy
        c1cyXAcpvjC+0ZScHw/ZHOUJ91ZBbxZcgbw51IXkxEaFh7utJOD/Q/pST8TXcQ==
Date:   Sun, 16 Apr 2023 21:51:08 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, linux-rtc@vger.kernel.org,
        linux-mips@vger.kernel.org, loongarch@lists.linux.dev,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Qing Zhang <zhangqing@loongson.cn>,
        zhaoxiao <zhaoxiao@uniontech.com>, keguang.zhang@gmail.com
Subject: Re: [PATCH V3 0/7] rtc: ls2x: Add support for the Loongson-2K/LS7A
 RTC
Message-ID: <202304161951080f60b5e2@mail.local>
References: <cover.1681370153.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1681370153.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/04/2023 15:57:32+0800, Binbin Zhou wrote:
> Hi all:
> 
> The initial DT-base ls2x rtc driver was written by Wang Xuerui, He has
> released five versions of patchset before, and all related mail records
> are shown below if you are interested:
> 
> https://lore.kernel.org/all/?q=ls2x-rtc
> 
> In this series of patches, based on the code above, I have added the
> following support:
> 
> 1. Add ACPI-related support, as Loongson-3A5000 + LS7A is now ACPI-base
>    by default under LoongArch architecture;
> 2. Add rtc alarm/walarm related functions.
> 
> I have tested on Loongson-3A5000LA+LS7A1000/LS7A2000, Loongson-2K1000LA
> and Loongson-2K0500.
> 
> BTW:
> As LS1X does not support DT, we will merge LS2X and LS1X after keguang
> has completed DT support for LS1X.

Stop waiting and simply add it.

> 
> -------
> Changes since v2:
> - Rebase on the top of rtc-next.
> patch(1/7):
>  - The new patch.
> patch(2/7):
>  - Check patchset with "checkpatch.pl --strict";
>  - Drop static inline functions which are used only once, such as
>    ls2x_rtc_regs_to_time;
>  - Remove the suruct ls2x_rtc_regs and regmap_bulk_xxx() is used to read
>    and write rtc registers;
>  - Clear the RTC wakeup interrupt manually;
>  - Enable the RTC in set_time() and check in read_time();
>  - device_get_match_data() is used to get ls2x_pm_offset, for LS2k1000
>    has the different value;
>  - Remove some inexact CONFIG_ACPI;
>  - remove()->remove_new().
> 
> Changes since v1:
> 1. Rebased on top of latest loongarch-next;
> 2. Add interrupt descriptions to the ls2k and ls7a DTS files to avoid
> errors when the driver gets the IRQ number, Thanks to Qing Zhang for
> testing;
> 3. Remove some inexact CONFIG_ACPI.
> 
> Thanks.
> 
> Binbin Zhou (7):
>   dt-bindings: rtc: Subdivision of LS2X RTC compatible
>   rtc: Add support for the Loongson-2K/LS7A RTC
>   LoongArch: Enable LS2X RTC in loongson3_defconfig
>   MIPS: Loongson64: DTS: Add RTC support to LS7A
>   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
>   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
>   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> 
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   7 +-
>  arch/loongarch/configs/loongson3_defconfig    |   1 +
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   7 +
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   7 +
>  arch/mips/configs/loongson2k_defconfig        |   1 +
>  arch/mips/configs/loongson3_defconfig         |   1 +
>  drivers/rtc/Kconfig                           |  11 +
>  drivers/rtc/Makefile                          |   1 +
>  drivers/rtc/rtc-ls2x.c                        | 345 ++++++++++++++++++
>  9 files changed, 379 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/rtc/rtc-ls2x.c
> 
> -- 
> 2.39.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
