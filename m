Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC2211D72D2
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 10:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgERIUl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 04:20:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:57600 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726292AbgERIUk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 04:20:40 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jab0k-0002ih-00; Mon, 18 May 2020 10:20:34 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 804ADC00F7; Mon, 18 May 2020 09:50:17 +0200 (CEST)
Date:   Mon, 18 May 2020 09:50:17 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2] MIPS: Loongson: Enable devicetree based probing for
 8250 ports in defconfig
Message-ID: <20200518075017.GA7697@alpha.franken.de>
References: <1589767861-9784-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589767861-9784-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 18, 2020 at 10:11:01AM +0800, Tiezhu Yang wrote:
> After commit 87fcfa7b7fe6 ("MIPS: Loongson64: Add generic dts"),
> there already exists the node and property of Loongson CPU UART0
> in loongson3-package.dtsi:
> 
> cpu_uart0: serial@1fe001e0 {
>         compatible = "ns16550a";
>         reg = <0 0x1fe001e0 0x8>;
>         clock-frequency = <33000000>;
>         interrupt-parent = <&liointc>;
>         interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
>         no-loopback-test;
> };
> 
> In order to support for serial console on the Loongson platform,
> add CONFIG_SERIAL_OF_PLATFORM=y to loongson3_defconfig.
> 
> With this patch, we can see the following boot messages:
> 
> [    1.877745] printk: console [ttyS0] disabled
> [    1.881979] 1fe001e0.serial: ttyS0 at MMIO 0x1fe001e0 (irq = 16, base_baud = 2062500) is a 16550A
> [    1.890838] printk: console [ttyS0] enabled
> 
> And also, we can login normally from the serial console.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> 
> v2:
>   - Modify the patch subject
> 
>  arch/mips/configs/loongson3_defconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
