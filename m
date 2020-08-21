Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F2B24CFF0
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 09:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgHUHuW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 03:50:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:54252 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728010AbgHUHuS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 03:50:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k91oP-00079q-02; Fri, 21 Aug 2020 09:50:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EC7FBC0D89; Fri, 21 Aug 2020 09:47:05 +0200 (CEST)
Date:   Fri, 21 Aug 2020 09:47:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@linux-mips.org, Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Mike Rapoport <rppt@kernel.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH mips-fixes 0/2] MIPS: BMIPS: couple of fixes
Message-ID: <20200821074705.GC8336@alpha.franken.de>
References: <20200819182645.30132-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819182645.30132-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 19, 2020 at 11:26:43AM -0700, Florian Fainelli wrote:
> Hi Thomas,
> 
> These two patches are fixes for the BMIPS5000/5200 CPU cores which were
> missing an inclusive physical cache setting from the cpuinfo structure
> and we would not be calling CPU specific initialization for secondarey
> cores on the second hardware thread.
> 
> Thanks!
> 
> Florian Fainelli (2):
>   MIPS: mm: BMIPS5000 has inclusive physical caches
>   MIPS: BMIPS: Also call bmips_cpu_setup() for secondary cores
> 
>  arch/mips/kernel/smp-bmips.c | 2 ++
>  arch/mips/mm/c-r4k.c         | 4 ++++
>  2 files changed, 6 insertions(+)

series applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
