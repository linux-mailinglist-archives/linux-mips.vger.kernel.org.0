Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8F2347556
	for <lists+linux-mips@lfdr.de>; Wed, 24 Mar 2021 11:09:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235396AbhCXKIw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Mar 2021 06:08:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:55087 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233249AbhCXKIo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Mar 2021 06:08:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lP0RM-0008Sw-00; Wed, 24 Mar 2021 11:08:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9EF6AC0D03; Wed, 24 Mar 2021 10:58:13 +0100 (CET)
Date:   Wed, 24 Mar 2021 10:58:13 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Qing Zhang <zhangqing@loongson.cn>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Ming Wang <wangming01@loongson.cn>
Subject: Re: [PATCH v5 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
Message-ID: <20210324095813.GA2378@alpha.franken.de>
References: <20210315075004.15465-1-zhangqing@loongson.cn>
 <20210315075004.15465-6-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315075004.15465-6-zhangqing@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 15, 2021 at 03:50:02PM +0800, Qing Zhang wrote:
> Add IO interrupt controller support for Loongson-2K1000, different
> from the Loongson-3A series is that Loongson-2K1000 has 64 interrupt
> sources, 0-31 correspond to the device tree liointc0 device node, and
> the other correspond to liointc1 node.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> Tested-by: Ming Wang <wangming01@loongson.cn>
> ---
> 
> v4-v5:
> - No change
> 
>  drivers/irqchip/irq-loongson-liointc.c | 58 ++++++++++++++++++++++----
>  1 file changed, 49 insertions(+), 9 deletions(-)

Marc, if you are ok with this change, I'd like to apply the series
to mips-next...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
