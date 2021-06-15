Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3D2A3A7EB4
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 15:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhFONLX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 09:11:23 -0400
Received: from elvis.franken.de ([193.175.24.41]:57845 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229943AbhFONLW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Jun 2021 09:11:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lt8oe-0005Yz-00; Tue, 15 Jun 2021 15:09:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F22BBC1C0A; Tue, 15 Jun 2021 15:08:30 +0200 (CEST)
Date:   Tue, 15 Jun 2021 15:08:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
        neil@brown.name, linux-mips@vger.kernel.org,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: Re: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
Message-ID: <20210615130830.GA7029@alpha.franken.de>
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614100617.28753-2-sergio.paracuellos@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 14, 2021 at 12:06:15PM +0200, Sergio Paracuellos wrote:
> PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
> required by generic PCI drivers to make memory mapped I/O range
> work. Hence define it for ralink architectures to be able to
> avoid parsing manually IO ranges in PCI generic driver code.
> Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
> call using '0xa0000000' as address, so use the same address in
> the definition to align things.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h
> 
> diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
> new file mode 100644
> index 000000000000..87d085c9ad61
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-ralink/spaces.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_MACH_RALINK_SPACES_H_
> +#define __ASM_MACH_RALINK_SPACES_H_
> +
> +#define PCI_IOBASE	_AC(0xa0000000, UL)
> +#define PCI_IOSIZE	SZ_16M
> +#define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
> +
> +#include <asm/mach-generic/spaces.h>
> +#endif
> -- 
> 2.25.1

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
