Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C2B32F8E2
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 09:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhCFIG7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 03:06:59 -0500
Received: from elvis.franken.de ([193.175.24.41]:48058 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229701AbhCFIGV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 6 Mar 2021 03:06:21 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lIRx3-0004K9-02; Sat, 06 Mar 2021 09:06:17 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 76B49C112A; Sat,  6 Mar 2021 09:03:37 +0100 (CET)
Date:   Sat, 6 Mar 2021 09:03:37 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
Message-ID: <20210306080337.GC4744@alpha.franken.de>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304110057.22144-3-zhangqing@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 04, 2021 at 07:00:57PM +0800, Qing Zhang wrote:
> The purpose of separating loongson_system_configuration from boot_param.h
> is to keep the other structure consistent with the firmware.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>  .../include/asm/mach-loongson64/boot_param.h   | 18 ------------------
>  .../include/asm/mach-loongson64/loongson.h     | 18 ++++++++++++++++++

as you are already touching mach-loongson64 files...

Is there a chance you clean up that up even further ? My goal is to
have only files in mach-<platform> files, which have an mach-generic
counterpart. Everything else should go to its own directory. So in
case of loongson something

like

arch/mips/include/asm/loongson		for common stuff
arch/mips/include/asm/loongson/32
arch/mips/include/asm/loongson/64

Comments ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
