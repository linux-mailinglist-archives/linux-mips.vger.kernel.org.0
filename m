Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9556B2CEDB9
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 13:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729968AbgLDMKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 07:10:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:48103 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728773AbgLDMKy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Dec 2020 07:10:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kl9ue-0005Nb-01; Fri, 04 Dec 2020 13:10:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E1ACFC02E5; Fri,  4 Dec 2020 13:09:47 +0100 (CET)
Date:   Fri, 4 Dec 2020 13:09:47 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander A Sverdlin <alexander.sverdlin@nokia.com>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Leonid Rosenboim <lrosenboim@caviumnetworks.com>,
        Corey Minyard <cminyard@mvista.com>,
        linux-kernel@vger.kernel.org,
        Serge Semin <fancer.lancer@gmail.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/2] MIPS: OCTEON: Don't add kernel sections into
 memblock allocator
Message-ID: <20201204120947.GG10011@alpha.franken.de>
References: <20201203123649.44046-1-alexander.sverdlin@nokia.com>
 <20201203123649.44046-2-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203123649.44046-2-alexander.sverdlin@nokia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 01:36:49PM +0100, Alexander A Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Because check_kernel_sections_mem() does exactly this for all platforms.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  arch/mips/cavium-octeon/setup.c | 9 ---------
>  1 file changed, 9 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
