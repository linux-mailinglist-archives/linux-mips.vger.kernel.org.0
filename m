Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED9C34CD17
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 11:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbhC2Jar (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 05:30:47 -0400
Received: from elvis.franken.de ([193.175.24.41]:33849 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231862AbhC2JaX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 05:30:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQoE1-0003qb-07; Mon, 29 Mar 2021 11:30:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 75349C1D90; Mon, 29 Mar 2021 11:27:07 +0200 (CEST)
Date:   Mon, 29 Mar 2021 11:27:07 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: enable CONFIG_USB_SERIAL_PL2303
Message-ID: <20210329092707.GG8484@alpha.franken.de>
References: <20210329071558.3492-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329071558.3492-1-zhangqing@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 29, 2021 at 03:15:58PM +0800, Qing Zhang wrote:
> When using the Loongson-3A4000 machine for serial port debugging,
> there is no /dev/ttyUSB* output, which makes the serial port unavailable,
> For convenience, we open this configuration.
> 
> zhangqing@loongson-pc:~$ cat /sys/firmware/lefi/boardinfo
> Board Info
> Manufacturer		: THTF
> Board Name		: THTF-LS3A4000-7A1000-ML4A
> Family			: LOONGSON3
> 
> BIOS Info
> Vendor			: ZD tech
> Version			: ZD tech-V2.1.1
> ROM Size		: 4 KB
> Release Date		: 2020-06-29
> 
> zhangqing@loongson-pc:~$ lsusb
> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 005 Device 003: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
> Bus 005 Device 002: ID 0c45:760b Microdia USB Keyboard
> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 003: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port
> Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  arch/mips/configs/loongson3_defconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
