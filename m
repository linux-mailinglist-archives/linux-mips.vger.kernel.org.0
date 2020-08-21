Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDD4A24CFEF
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 09:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgHUHuW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 03:50:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:54254 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725908AbgHUHuV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 03:50:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k91oP-00079q-01; Fri, 21 Aug 2020 09:50:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D4FA1C0D89; Fri, 21 Aug 2020 09:46:46 +0200 (CEST)
Date:   Fri, 21 Aug 2020 09:46:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     WANG Xuerui <git@xen0n.name>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Youling Tang <tangyouling@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Remove unnecessary inclusion of
 boot_param.h
Message-ID: <20200821074646.GB8336@alpha.franken.de>
References: <20200819060722.2267677-1-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819060722.2267677-1-git@xen0n.name>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 19, 2020 at 02:07:22PM +0800, WANG Xuerui wrote:
> The couple of #includes are unused by now; remove to prevent namespace
> pollution.
> 
> This fixes e.g. build of dm_thin, which has a VIRTUAL symbol that
> conflicted with the newly-introduced one in mach-loongson64/boot_param.h.
> 
> Fixes: 39c1485c8baa ("MIPS: KVM: Add kvm guest support for Loongson-3")
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>  arch/mips/include/asm/mach-loongson64/irq.h    | 2 --
>  arch/mips/include/asm/mach-loongson64/mmzone.h | 1 -
>  2 files changed, 3 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
