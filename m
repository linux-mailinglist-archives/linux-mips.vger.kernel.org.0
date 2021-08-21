Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9953F39D7
	for <lists+linux-mips@lfdr.de>; Sat, 21 Aug 2021 11:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbhHUJZ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 21 Aug 2021 05:25:59 -0400
Received: from elvis.franken.de ([193.175.24.41]:41928 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233296AbhHUJZ7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 21 Aug 2021 05:25:59 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mHNFe-0005Uw-01; Sat, 21 Aug 2021 11:25:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 369D5C086C; Sat, 21 Aug 2021 10:41:24 +0200 (CEST)
Date:   Sat, 21 Aug 2021 10:41:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rahul Bedarkar <rahulbedarkar89@gmail.com>,
        linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: adjust PISTACHIO SOC SUPPORT after its
 retirement
Message-ID: <20210821084124.GB3555@alpha.franken.de>
References: <20210816105326.8050-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816105326.8050-1-lukas.bulwahn@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 16, 2021 at 12:53:26PM +0200, Lukas Bulwahn wrote:
> Commit 104f942b2832 ("MIPS: Retire MACH_PISTACHIO") removes
> ./arch/mips/pistachio/ and ./arch/mips/configs/pistachio_defconfig, but
> misses to adjust the corresponding section PISTACHIO SOC SUPPORT
> in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    arch/mips/configs/pistachio*_defconfig
>   warning: no file matches    F:    arch/mips/pistachio/
> 
> As James Hartley is not reachable with the provided email address, the
> remaining dtsi file, arch/mips/boot/dts/img/pistachio.dtsi, must be
> maintained by its only user pistachio_marduk.dts, which is part of MARDUK
> (CREATOR CI40) DEVICE TREE SUPPORT.
> 
> Add maintenance of pistachio.dtsi to that section and drop the PISTACHIO
> SOC SUPPORT after its retirement.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210816
> 
> Jiaxun, Rahul, please ack. 
> Thomas, please pick this minor non-urgent clean-up patch on mips-next.
> 
>  MAINTAINERS | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
