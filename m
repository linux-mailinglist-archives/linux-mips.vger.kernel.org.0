Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0452ED45A
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 17:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbhAGQ36 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 11:29:58 -0500
Received: from elvis.franken.de ([193.175.24.41]:34759 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728362AbhAGQ3q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxY9o-0000Mi-04; Thu, 07 Jan 2021 17:29:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D4290C080E; Thu,  7 Jan 2021 17:27:40 +0100 (CET)
Date:   Thu, 7 Jan 2021 17:27:40 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Paul Burton <paulburton@kernel.org>,
        John Crispin <john@phrozen.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        James Hartley <james.hartley@sondrel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MIPS: Remove empty prom_free_prom_memory functions
Message-ID: <20210107162740.GE11882@alpha.franken.de>
References: <20210105213633.76912-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105213633.76912-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 05, 2021 at 10:36:31PM +0100, Thomas Bogendoerfer wrote:
> Most of the prom_free_prom_memory functions are empty. With
> a new weak prom_free_prom_memory() we can remove all of them.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/alchemy/common/prom.c     | 4 ----
>  arch/mips/ar7/memory.c              | 5 -----
>  arch/mips/ath25/prom.c              | 4 ----
>  arch/mips/ath79/prom.c              | 5 -----
>  arch/mips/bcm47xx/prom.c            | 4 ----
>  arch/mips/bcm63xx/prom.c            | 4 ----
>  arch/mips/bmips/setup.c             | 4 ----
>  arch/mips/cobalt/setup.c            | 5 -----
>  arch/mips/fw/arc/memory.c           | 2 +-
>  arch/mips/fw/sni/sniprom.c          | 4 ----
>  arch/mips/generic/init.c            | 4 ----
>  arch/mips/lantiq/prom.c             | 4 ----
>  arch/mips/loongson2ef/common/init.c | 4 ----
>  arch/mips/loongson32/common/prom.c  | 4 ----
>  arch/mips/loongson64/init.c         | 4 ----
>  arch/mips/mm/init.c                 | 5 +++++
>  arch/mips/mti-malta/malta-memory.c  | 4 ----
>  arch/mips/netlogic/xlp/setup.c      | 5 -----
>  arch/mips/netlogic/xlr/setup.c      | 5 -----
>  arch/mips/pic32/pic32mzda/init.c    | 4 ----
>  arch/mips/pistachio/init.c          | 4 ----
>  arch/mips/ralink/prom.c             | 4 ----
>  arch/mips/rb532/prom.c              | 5 -----
>  arch/mips/sgi-ip27/ip27-memory.c    | 5 -----
>  arch/mips/sgi-ip32/ip32-memory.c    | 5 -----
>  arch/mips/sibyte/common/cfe.c       | 5 -----
>  arch/mips/txx9/generic/setup.c      | 4 ----
>  arch/mips/vr41xx/common/init.c      | 4 ----
>  28 files changed, 6 insertions(+), 114 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
