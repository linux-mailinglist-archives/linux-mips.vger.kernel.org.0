Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31D11C8B92
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 14:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgEGM6t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 08:58:49 -0400
Received: from elvis.franken.de ([193.175.24.41]:43717 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725903AbgEGM6t (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 08:58:49 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jWg6w-0000LB-00; Thu, 07 May 2020 14:58:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0E921C0409; Thu,  7 May 2020 14:44:53 +0200 (CEST)
Date:   Thu, 7 May 2020 14:44:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: asm: Rename some macros to avoid build errors
Message-ID: <20200507124452.GA14593@alpha.franken.de>
References: <1588844958-23077-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588844958-23077-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 07, 2020 at 05:49:18PM +0800, Huacai Chen wrote:
> Use ASM_ prefix to rename some macros (PANIC and PRINT), in order to
> avoid build errors (all users are updated as well):
> 
> 1, PANIC conflicts with drivers/scsi/smartpqi/smartpqi_init.c
> 2, PRINT conflicts with net/netfilter/nf_conntrack_h323_asn1.c and net/
>    mac80211/debugfs_sta.c
> 
> Fixes: d339cd02b888eb8 ("MIPS: Move unaligned load/store helpers to inst.h")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/dec/int-handler.S    |  4 ++--
>  arch/mips/include/asm/asm.h    | 20 ++++++++++----------
>  arch/mips/kernel/genex.S       |  6 +++---
>  arch/mips/kernel/scall64-o32.S |  2 +-
>  4 files changed, 16 insertions(+), 16 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
