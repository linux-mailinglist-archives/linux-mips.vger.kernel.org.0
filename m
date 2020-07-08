Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4F421859D
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2020 13:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728701AbgGHLJx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 07:09:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:54231 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728735AbgGHLJw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Jul 2020 07:09:52 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jt7xR-0008Fx-02; Wed, 08 Jul 2020 13:09:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A9202C07D4; Wed,  8 Jul 2020 11:34:42 +0200 (CEST)
Date:   Wed, 8 Jul 2020 11:34:42 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V2] MIPS: Unify naming style of vendor CP0.Config6 bits
Message-ID: <20200708093442.GC9458@alpha.franken.de>
References: <1592397282-14433-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592397282-14433-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 17, 2020 at 08:34:42PM +0800, Huacai Chen wrote:
> Other vendor-defined registers use the vendor name as a prefix, not an
> infix, so unify the naming style of CP0.Config6 bits.
> 
> Suggested-by: Maciej W. Rozycki" <macro@linux-mips.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
> V2: modify kvm code as well.
> 
>  arch/mips/include/asm/mipsregs.h   | 28 ++++++++++++++--------------
>  arch/mips/kernel/cpu-probe.c       | 12 ++++++------
>  arch/mips/kvm/vz.c                 |  4 ++--
>  arch/mips/loongson64/cpucfg-emul.c |  6 +++---
>  arch/mips/mm/c-r4k.c               |  4 ++--
>  5 files changed, 27 insertions(+), 27 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
