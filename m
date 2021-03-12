Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361CA338A3C
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 11:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbhCLKeq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 05:34:46 -0500
Received: from elvis.franken.de ([193.175.24.41]:52603 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233399AbhCLKel (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 12 Mar 2021 05:34:41 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lKf7u-0007WV-04; Fri, 12 Mar 2021 11:34:38 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 246D4C1E4A; Fri, 12 Mar 2021 11:28:23 +0100 (CET)
Date:   Fri, 12 Mar 2021 11:28:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
Message-ID: <20210312102823.GE7027@alpha.franken.de>
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
>  drivers/irqchip/irq-loongson-liointc.c         |  2 +-
>  3 files changed, 19 insertions(+), 19 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
