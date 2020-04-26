Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEE51B90B9
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 15:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgDZNqz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 09:46:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:55774 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbgDZNqy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 09:46:54 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jShcS-0000jA-00; Sun, 26 Apr 2020 15:46:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 28010C02FB; Sun, 26 Apr 2020 15:45:04 +0200 (CEST)
Date:   Sun, 26 Apr 2020 15:45:04 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] MIPS: Rename the "Fill" cache ops to avoid build failure
Message-ID: <20200426134504.GA8299@alpha.franken.de>
References: <1587899392-10579-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587899392-10579-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 07:09:52PM +0800, Huacai Chen wrote:
> MIPS define a "Fill" macro as a cache operation in cacheops.h, this
> will cause build failure under some special configurations because in
> seq_file.c there is a "Fill" label. To avoid this failure we rename the
> "Fill" macro to "Fill_I" which has the same coding style as other cache
> operations in cacheops.h (we think renaming the "Fill" macro is more
> reasonable than renaming the "Fill" label).
> 
> Callers of "Fill" macro is also updated.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/include/asm/cacheops.h   | 2 +-
>  arch/mips/mm/c-r4k.c               | 2 +-
>  arch/mips/pmcs-msp71xx/msp_setup.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
