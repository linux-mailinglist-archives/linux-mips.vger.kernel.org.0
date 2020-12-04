Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4232CEDBA
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 13:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgLDMKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 07:10:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:48099 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728666AbgLDMKy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Dec 2020 07:10:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kl9ud-0005Nb-03; Fri, 04 Dec 2020 13:10:11 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 21ACDC02E5; Fri,  4 Dec 2020 13:08:37 +0100 (CET)
Date:   Fri, 4 Dec 2020 13:08:37 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wei Li <liwei391@huawei.com>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, yangyingliang@huawei.com,
        guohanjun@huawei.com
Subject: Re: [PATCH] MIPS: SMP-CPS: Add support for irq migration when CPU
 offline
Message-ID: <20201204120837.GD10011@alpha.franken.de>
References: <20201203065443.11263-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203065443.11263-1-liwei391@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 02:54:43PM +0800, Wei Li wrote:
> Currently we won't migrate irqs when offline CPUs, which has been
> implemented on most architectures. That will lead to some devices work
> incorrectly if the bound cores are offline.
> 
> While that can be easily supported by enabling GENERIC_IRQ_MIGRATION.
> But i don't pretty known the reason it was not supported on all MIPS
> platforms.
> 
> This patch add the support for irq migration on MIPS CPS platform, and
> it's tested on the interAptiv processor.
> 
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  arch/mips/Kconfig          | 1 +
>  arch/mips/kernel/smp-cps.c | 2 ++
>  2 files changed, 3 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
