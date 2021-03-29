Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B495534CD10
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 11:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhC2Jap (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 05:30:45 -0400
Received: from elvis.franken.de ([193.175.24.41]:33838 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231332AbhC2JaX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 05:30:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQoE1-0003qb-03; Mon, 29 Mar 2021 11:30:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E333FC1D90; Mon, 29 Mar 2021 11:25:20 +0200 (CEST)
Date:   Mon, 29 Mar 2021 11:25:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Julian Braha <julianbraha@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        fazilyildiran@gmail.com
Subject: Re: [PATCH] arch: mips: fix unmet dependency for MTD_COMPLEX_MAPPINGS
Message-ID: <20210329092520.GC8484@alpha.franken.de>
References: <20210326053456.42020-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326053456.42020-1-julianbraha@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 26, 2021 at 01:34:56AM -0400, Julian Braha wrote:
> When CAVIUM_OCTEON_SOC is enabled, and MTD is disabled,
> Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for MTD_COMPLEX_MAPPINGS
>   Depends on [n]: MTD [=n] && HAS_IOMEM [=y]
>   Selected by [y]:
>   - CAVIUM_OCTEON_SOC [=y] && <choice>
> 
> This is because CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS,
> without selecting or depending on MTD, despite MTD_COMPLEX_MAPPINGS
> depending on MTD.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
