Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F352C342BEA
	for <lists+linux-mips@lfdr.de>; Sat, 20 Mar 2021 12:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhCTLQN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Mar 2021 07:16:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42910 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230079AbhCTLQB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 20 Mar 2021 07:16:01 -0400
Received: from [10.130.0.65] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Bxs+VOwFVgOXMDAA--.9919S3;
        Sat, 20 Mar 2021 17:28:47 +0800 (CST)
Subject: Re: [PATCH v5 0/7] Add basic support for Loongson-2K1000
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>
References: <20210315075004.15465-1-zhangqing@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
From:   zhangqing <zhangqing@loongson.cn>
Message-ID: <6756d6e3-2fc4-36db-3aed-173e016ca657@loongson.cn>
Date:   Sat, 20 Mar 2021 17:28:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20210315075004.15465-1-zhangqing@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Bxs+VOwFVgOXMDAA--.9919S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFyUurW7CF45Jw1xWw18Grg_yoW8AF4rpw
        43C3Z8Kr45uFy7Crn3Jry8Wr15ArWrJrZrWF43Xr13Gasaqa4Yvr13JFs5JrsFvryIya4j
        vryrWrW7GFnrCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY
        02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
        Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
        6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
        kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU0eVb3UUUUU==
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ping

On 03/15/2021 03:49 PM, Qing Zhang wrote:
> These patches support single-core DTS boot to the serial port login
> interface, which can be operated using conventional commands.
>
> I have successfully tested it on the Loongson 2K1000 machine.
> pmon: http://cgit.loongnix.org/cgit/pmon-loongson3/
>
> Note:
> After the basic support is merged,
> I will commit SMP and other driver support in the future.
>
> Qing Zhang (7):
>    MIPS: Loongson64: DeviceTree for Loongson-2K1000
>    MIPS: Loongson64: Distinguish firmware dependencies DTB/LEFI
>    MIPS: Loongson64: Add support for the Loongson-2K1000 to get
>      cpu_clock_freq
>    MIPS: Loongson64: Add Loongson-2K1000 early_printk_port
>    irqchip/loongson-liointc: irqchip add 2.0 version
>    dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
>    MIPS: Loongson64: Add a Loongson-2K1000 default config file
>
>   .../loongson,liointc.yaml                     |  36 +-
>   arch/mips/boot/dts/loongson/Makefile          |   1 +
>   .../boot/dts/loongson/loongson64-2k1000.dtsi  | 243 ++++++++++++
>   .../dts/loongson/loongson64_2core_2k1000.dts  |  10 +
>   arch/mips/configs/loongson2k_defconfig        | 353 ++++++++++++++++++
>   .../asm/mach-loongson64/builtin_dtbs.h        |   1 +
>   .../include/asm/mach-loongson64/loongson.h    |   9 +-
>   arch/mips/loongson64/env.c                    |  13 +-
>   arch/mips/loongson64/init.c                   |  21 +-
>   arch/mips/loongson64/time.c                   |  24 ++
>   drivers/irqchip/irq-loongson-liointc.c        |  58 ++-
>   11 files changed, 751 insertions(+), 18 deletions(-)
>   create mode 100644 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
>   create mode 100644 arch/mips/configs/loongson2k_defconfig
>

