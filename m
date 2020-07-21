Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1FE227AE9
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 10:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728196AbgGUIk2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 04:40:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:44076 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbgGUIk1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Jul 2020 04:40:27 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jxnp2-0007dy-01; Tue, 21 Jul 2020 10:40:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BCDCEC0884; Tue, 21 Jul 2020 10:32:15 +0200 (CEST)
Date:   Tue, 21 Jul 2020 10:32:15 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2] MIPS: Loongson64: Reserve legacy MMIO space according
 to bridge type
Message-ID: <20200721083215.GB9399@alpha.franken.de>
References: <1594977035-27899-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594977035-27899-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 17, 2020 at 05:10:35PM +0800, Huacai Chen wrote:
> Define MMIO_LOWER_RESERVED as a constant is incorrect, because different
> PCHs (bridge types) have different legacy MMIO space size. According to
> the datasheets, the legacy MMIO space size of LS7A is 0x20000, and which
> of other PCHs is 0x4000. So it is necessary to reserve legacy MMIO space
> according to the bridge type.
> 
> Currently IO_SPACE_LIMIT is defined as 0xffff which is too small for the
> LS7A bridge, so increase it to 0xfffff for LOONGSON64.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/io.h                     |  2 --
>  arch/mips/include/asm/mach-generic/spaces.h    |  4 ++++
>  arch/mips/include/asm/mach-loongson64/spaces.h |  3 +--
>  arch/mips/loongson64/init.c                    | 18 ++++++++++++++----
>  4 files changed, 19 insertions(+), 8 deletions(-)

thank you for the changes. With the new patchset from Jiaxun I'm wondering
which way you want to go ? Should I apply this patch or should I wait
until the new patchset is finalized ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
