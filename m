Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF7231D607D
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 13:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgEPLJT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 07:09:19 -0400
Received: from [115.28.160.31] ([115.28.160.31]:54554 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbgEPLJS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 May 2020 07:09:18 -0400
Received: from [192.168.9.172] (unknown [220.196.60.58])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 982B16012C;
        Sat, 16 May 2020 19:09:15 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1589627355; bh=4gI8QTkfc0FypidOlx2nl9vtLB55CUSTqHLnKI7O0BI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=c4WrpXhn0qomU+aO//sTSR5tEdSRCqhWqzkdz6EliV8P8+CTm71FAaU347s07W91k
         pQMm9IOQ4CFz9pyahA5ezOyWFwKYuiAfhnEaWbj5NidCAhJ/AweKNKZPidbg55Qnel
         YnmzcsDvGHqLUPCMHo/UjpeVGsJR6qJvR1a5zsao=
Subject: Re: [PATCH] MIPS: Loongson: Add support for serial console
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1589612588-29196-1-git-send-email-yangtiezhu@loongson.cn>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <5aadf1a7-51c7-453e-beaa-3df6ceca5354@xen0n.name>
Date:   Sat, 16 May 2020 19:09:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <1589612588-29196-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/16/20 3:03 PM, Tiezhu Yang wrote:

> After commit 87fcfa7b7fe6 ("MIPS: Loongson64: Add generic dts"),
> there already exists the node and property of Loongson CPU UART0
> in loongson3-package.dtsi:
>
> cpu_uart0: serial@1fe001e0 {
>          compatible = "ns16550a";
>          reg = <0 0x1fe001e0 0x8>;
>          clock-frequency = <33000000>;
>          interrupt-parent = <&liointc>;
>          interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
>          no-loopback-test;
> };
>
> In order to support for serial console on the Loongson platform,
> add CONFIG_SERIAL_OF_PLATFORM=y to loongson3_defconfig.
>
> With this patch, we can see the following boot message:
>
> [    1.877745] printk: console [ttyS0] disabled
> [    1.881979] 1fe001e0.serial: ttyS0 at MMIO 0x1fe001e0 (irq = 16, base_baud = 2062500) is a 16550A
> [    1.890838] printk: console [ttyS0] enabled
>
> And also, we can login normally from the serial console.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
> Hi Jiaxun,
>
> Thank you very much for your suggestion.
>
>   arch/mips/configs/loongson3_defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
> index 6768c16..cd95f08 100644
> --- a/arch/mips/configs/loongson3_defconfig
> +++ b/arch/mips/configs/loongson3_defconfig
> @@ -217,6 +217,7 @@ CONFIG_SERIAL_8250_EXTENDED=y
>   CONFIG_SERIAL_8250_MANY_PORTS=y
>   CONFIG_SERIAL_8250_SHARE_IRQ=y
>   CONFIG_SERIAL_8250_RSA=y
> +CONFIG_SERIAL_OF_PLATFORM=y
>   CONFIG_HW_RANDOM=y
>   CONFIG_RAW_DRIVER=m
>   CONFIG_I2C_CHARDEV=y

Hi,

The patch title is again exaggerating things. This is a defconfig 
change, so please refer to `git log` output of `arch/mips/configs` and 
use something like "MIPS: Loongson: loongson3_defconfig: enable serial 
console" or "MIPS: Loongson: enable serial console in defconfig". The 
current title reads as if Loongson kernels never were able to use a 
serial console in the past.

