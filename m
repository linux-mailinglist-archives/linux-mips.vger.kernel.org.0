Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF882B121F
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 23:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgKLWuV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 17:50:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:57145 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727558AbgKLWuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 17:50:20 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kdLQ2-0005gc-01; Thu, 12 Nov 2020 23:50:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9B8E3C4DE1; Thu, 12 Nov 2020 23:38:39 +0100 (CET)
Date:   Thu, 12 Nov 2020 23:38:39 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc:     hauke@hauke-m.de, szajec5@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@pgazz.com, jeho@cs.utexas.edu
Subject: Re: [PATCH] MIPS: BMC47xx: fix kconfig dependency bug for BCM47XX_SSB
Message-ID: <20201112223839.GB19695@alpha.franken.de>
References: <20201104164126.36399-1-fazilyildiran@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104164126.36399-1-fazilyildiran@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 04, 2020 at 07:41:27PM +0300, Necip Fazil Yildiran wrote:
> When BCM47XX_SSB is enabled and SSB_PCIHOST is disabled, it results in the
> following Kbuild warning:
> 
> WARNING: unmet direct dependencies detected for SSB_B43_PCI_BRIDGE
>   Depends on [n]: SSB [=y] && SSB_PCIHOST [=n]
>   Selected by [y]:
>   - BCM47XX_SSB [=y] && BCM47XX [=y] && PCI [=y]
> 
> The reason is that BCM47XX_SSB selects SSB_B43_PCI_BRIDGE without
> depending on or selecting SSB_PCIHOST while SSB_B43_PCI_BRIDGE depends on
> SSB_PCIHOST. This can also fail building the kernel as demonstrated in a
> bug report.
> 
> Honor the kconfig dependency to remove unmet direct dependency warnings
> and avoid any potential build failures.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=210051
> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
> ---
>  arch/mips/bcm47xx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
