Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC8F2EA8CE
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 11:34:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbhAEKcT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 05:32:19 -0500
Received: from elvis.franken.de ([193.175.24.41]:59098 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728462AbhAEKcT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Jan 2021 05:32:19 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kwjcm-0004XL-00; Tue, 05 Jan 2021 11:31:36 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5A3EFC0808; Tue,  5 Jan 2021 11:20:30 +0100 (CET)
Date:   Tue, 5 Jan 2021 11:20:30 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bert Vermeulen <bert@biot.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] MIPS: Add Realtek RTL838x/RTL839x support as
 generic MIPS system
Message-ID: <20210105102030.GA7323@alpha.franken.de>
References: <20201230212205.2605383-1-bert@biot.com>
 <20201230212205.2605383-2-bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201230212205.2605383-2-bert@biot.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 30, 2020 at 10:22:03PM +0100, Bert Vermeulen wrote:
> This is just enough system to boot the kernel with earlycon working.
> 
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> Signed-off-by: Sander Vanheule <sander@svanheule.net>
> ---
>  arch/mips/Kconfig                       | 21 ++++++++++++++++++
>  arch/mips/generic/Platform              |  1 +
>  arch/mips/include/asm/realtek/ioremap.h | 29 +++++++++++++++++++++++++
>  3 files changed, 51 insertions(+)
>  create mode 100644 arch/mips/include/asm/realtek/ioremap.h
> [..]
> diff --git a/arch/mips/include/asm/realtek/ioremap.h b/arch/mips/include/asm/realtek/ioremap.h
> new file mode 100644
> index 000000000000..ea51af023e26
> --- /dev/null
> +++ b/arch/mips/include/asm/realtek/ioremap.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _REALTEK_RTL_IOREMAP_H_
> +#define _REALTEK_RTL_IOREMAP_H_
> +
> +static inline int is_rtl8380_internal_registers(phys_addr_t offset)
> +{
> +	/* IO Block */
> +	if (offset >= 0xb8000000 && offset < 0xb9000000)
> +		return 1;
> +	/* Switch block */
> +	if (offset >= 0xbb000000 && offset < 0xbc000000)
> +		return 1;
> +	return 0;
> +}
> +
> +static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned long size,
> +					 unsigned long flags)
> +{
> +	if (is_rtl8380_internal_registers(offset))
> +		return (void __iomem *)offset;
> +	return NULL;
> +}
> +
> +static inline int plat_iounmap(const volatile void __iomem *addr)
> +{
> +	return is_rtl8380_internal_registers((unsigned long)addr);
> +}
> +
> +#endif /* _REALTEK_RTL_IOREMAP_H_ */

this looks like papering over using KSEG1 addresses instead of
physical addresses in your DT. You should be able to drop this file
and use 0x18000000/0x1B000000 instead of 0xb8000000/0xbb000000
in the DT file.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
