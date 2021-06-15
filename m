Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7612B3A7D96
	for <lists+linux-mips@lfdr.de>; Tue, 15 Jun 2021 13:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhFOLxO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Jun 2021 07:53:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:60620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230272AbhFOLxN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Jun 2021 07:53:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AB1D6145E;
        Tue, 15 Jun 2021 11:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623757868;
        bh=18Sl95eWw5Us05rnuI+PZmJU2hNTtQ1BsO22IqalpZo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=knmZSI0pcHQljLqACrotSpTJM7iFFI78Ir/Z15+GqBcDY+ZTQTWBq4G9ObxD/GR2q
         s+4xn5IdsmGcJP+O0VSC52jg1uX33Y/klj9dKaJDTu7Irz4BKHyHili8Us2yo/yI4G
         4u7LYUtQHNRJY0WxE6u5E4hBLcADcqw/X4TClBHI=
Date:   Tue, 15 Jun 2021 13:51:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-staging@lists.linux.dev, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: Re: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
Message-ID: <YMiUKkYL7B7qTU/X@kroah.com>
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
 <20210614100617.28753-2-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210614100617.28753-2-sergio.paracuellos@gmail.com>
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
> 
> 

I really can't take a change outside of drivers/staging/ for a staging
driver.

So unless you can get a MIPS maintainer to ACK this, I can't accept
this change, sorry.

greg k-h
