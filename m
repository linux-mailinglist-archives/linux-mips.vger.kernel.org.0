Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609133691F6
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 14:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242366AbhDWMXM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Apr 2021 08:23:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:38492 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231315AbhDWMXK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Apr 2021 08:23:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lZupM-00019R-00; Fri, 23 Apr 2021 14:22:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 93878C0AC8; Fri, 23 Apr 2021 13:47:28 +0200 (CEST)
Date:   Fri, 23 Apr 2021 13:47:28 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     xiaochuan mao <maoxiaochuan@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Qing Zhang <zhangqing@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS:DTS:Fix label name and interrupt number of ohci for
 Loongson-2K
Message-ID: <20210423114728.GA8582@alpha.franken.de>
References: <20210423015234.23870-1-maoxiaochuan@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423015234.23870-1-maoxiaochuan@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 23, 2021 at 09:52:34AM +0800, xiaochuan mao wrote:
> from Loongson-2K1000 user manual know that under pci bus
> the device num is 4, function number is 2 and register is 0x2200
> is ohci. the ohci interrupt number is 51. because Loongson-2K1000 has
> 64 interrupt sources, 0-31 correspond to the device tree liointc0 device
>  node, and the other correspond to liointc1 node. so it should be
> number 19 correspon to liointc1.
> 
> Signed-off-by: xiaochuan mao <maoxiaochuan@loongson.cn>
> ---
>  arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
