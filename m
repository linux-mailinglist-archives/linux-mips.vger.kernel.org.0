Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14AE348D9A
	for <lists+linux-mips@lfdr.de>; Thu, 25 Mar 2021 11:02:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhCYKBb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Mar 2021 06:01:31 -0400
Received: from elvis.franken.de ([193.175.24.41]:58863 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229581AbhCYKBM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Mar 2021 06:01:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lPMnd-00074f-02; Thu, 25 Mar 2021 11:01:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D9DE4C1C81; Thu, 25 Mar 2021 10:58:51 +0100 (CET)
Date:   Thu, 25 Mar 2021 10:58:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/7] Add basic support for Loongson-2K1000
Message-ID: <20210325095851.GC5775@alpha.franken.de>
References: <20210315075004.15465-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315075004.15465-1-zhangqing@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 15, 2021 at 03:49:57PM +0800, Qing Zhang wrote:
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
>   MIPS: Loongson64: DeviceTree for Loongson-2K1000
>   MIPS: Loongson64: Distinguish firmware dependencies DTB/LEFI
>   MIPS: Loongson64: Add support for the Loongson-2K1000 to get
>     cpu_clock_freq
>   MIPS: Loongson64: Add Loongson-2K1000 early_printk_port
>   irqchip/loongson-liointc: irqchip add 2.0 version
>   dt-bindings: interrupt-controller: Add Loongson-2K1000 LIOINTC
>   MIPS: Loongson64: Add a Loongson-2K1000 default config file
> 
>  .../loongson,liointc.yaml                     |  36 +-
>  arch/mips/boot/dts/loongson/Makefile          |   1 +
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  | 243 ++++++++++++
>  .../dts/loongson/loongson64_2core_2k1000.dts  |  10 +
>  arch/mips/configs/loongson2k_defconfig        | 353 ++++++++++++++++++
>  .../asm/mach-loongson64/builtin_dtbs.h        |   1 +
>  .../include/asm/mach-loongson64/loongson.h    |   9 +-
>  arch/mips/loongson64/env.c                    |  13 +-
>  arch/mips/loongson64/init.c                   |  21 +-
>  arch/mips/loongson64/time.c                   |  24 ++
>  drivers/irqchip/irq-loongson-liointc.c        |  58 ++-
>  11 files changed, 751 insertions(+), 18 deletions(-)
>  create mode 100644 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
>  create mode 100644 arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
>  create mode 100644 arch/mips/configs/loongson2k_defconfig

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
