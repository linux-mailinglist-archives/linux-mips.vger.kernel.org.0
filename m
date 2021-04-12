Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F49435C98B
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 17:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242742AbhDLPRJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 11:17:09 -0400
Received: from elvis.franken.de ([193.175.24.41]:45485 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239508AbhDLPRI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 11:17:08 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lVyIy-0006wH-00; Mon, 12 Apr 2021 17:16:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 80B45C029E; Mon, 12 Apr 2021 17:03:24 +0200 (CEST)
Date:   Mon, 12 Apr 2021 17:03:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     macro@orcam.me.uk, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, liwei391@huawei.com, nbd@nbd.name,
        yangtiezhu@loongson.cn
Subject: Re: [PATCH v3] MIPS: add support for buggy MT7621S core detection
Message-ID: <20210412150324.GA23632@alpha.franken.de>
References: <alpine.DEB.2.21.2104071549560.65251@angie.orcam.me.uk>
 <20210407200738.149207-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407200738.149207-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Apr 07, 2021 at 01:07:38PM -0700, Ilya Lipnitskiy wrote:
> Most MT7621 SoCs have 2 cores, which is detected and supported properly
> by CPS.
> 
> Unfortunately, MT7621 SoC has a less common S variant with only one core.
> On MT7621S, GCR_CONFIG still reports 2 cores, which leads to hangs when
> starting SMP. CPULAUNCH registers can be used in that case to detect the
> absence of the second core and override the GCR_CONFIG PCORES field.
> 
> Rework a long-standing OpenWrt patch to override the value of
> mips_cps_numcores on single-core MT7621 systems.
> 
> Tested on a dual-core MT7621 device (Ubiquiti ER-X) and a single-core
> MT7621 device (Netgear R6220).
> 
> Original 4.14 OpenWrt patch:
> Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=4cdbc90a376dd0555201c1434a2081e055e9ceb7
> Current 5.10 OpenWrt patch:
> Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/ramips/patches-5.10/320-mt7621-core-detect-hack.patch;h=c63f0f4c1ec742e24d8480e80553863744b58f6a;hb=10267e17299806f9885d086147878f6c492cb904
> 
> Suggested-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/include/asm/mips-cps.h | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
