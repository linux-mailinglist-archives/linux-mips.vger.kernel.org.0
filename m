Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 054B9301E4F
	for <lists+linux-mips@lfdr.de>; Sun, 24 Jan 2021 20:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbhAXTCh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 Jan 2021 14:02:37 -0500
Received: from elvis.franken.de ([193.175.24.41]:36786 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbhAXTCf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 Jan 2021 14:02:35 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l3kdz-0001qW-01; Sun, 24 Jan 2021 20:01:51 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3180FC0C0E; Fri, 22 Jan 2021 14:06:09 +0100 (CET)
Date:   Fri, 22 Jan 2021 14:06:09 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: make kgdb depend on FPU support
Message-ID: <20210122130608.GB10580@alpha.franken.de>
References: <20210122110307.934543-1-arnd@kernel.org>
 <20210122110307.934543-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122110307.934543-2-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jan 22, 2021 at 12:02:51PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> kgdb fails to build when the FPU support is disabled:
> 
> arch/mips/kernel/kgdb.c: In function 'dbg_set_reg':
> arch/mips/kernel/kgdb.c:147:35: error: 'struct thread_struct' has no member named 'fpu'
>   147 |    memcpy((void *)&current->thread.fpu.fcr31, mem,
>       |                                   ^
> arch/mips/kernel/kgdb.c:155:34: error: 'struct thread_struct' has no member named 'fpu'
>   155 |   memcpy((void *)&current->thread.fpu.fpr[fp_reg], mem,
> 
> This is only relevant for CONFIG_EXPERT=y, so disallowing it
> in Kconfig is an easier workaround than fixing it properly.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/mips/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
