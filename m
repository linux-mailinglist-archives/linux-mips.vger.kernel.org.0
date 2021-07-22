Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729F53D21CC
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jul 2021 12:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbhGVJ3y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 05:29:54 -0400
Received: from elvis.franken.de ([193.175.24.41]:45355 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231488AbhGVJ3x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 05:29:53 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m6Ves-0007ey-00; Thu, 22 Jul 2021 12:10:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8271EC116F; Thu, 22 Jul 2021 12:07:24 +0200 (CEST)
Date:   Thu, 22 Jul 2021 12:07:24 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        David Daney <ddaney@caviumnetworks.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: cavium-octeon: clean up kernel-doc in
 cvmx-interrupt-decodes.c
Message-ID: <20210722100724.GA7340@alpha.franken.de>
References: <20210720041617.30942-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720041617.30942-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 19, 2021 at 09:16:17PM -0700, Randy Dunlap wrote:
> Fix kernel-doc warnings reported by kernel test robot:
> 
> arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:49: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * __cvmx_interrupt_gmxx_rxx_int_en_enable enables all interrupt bits in cvmx_gmxx_rxx_int_en_t
>    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:230: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * __cvmx_interrupt_pcsx_intx_en_reg_enable enables all interrupt bits in cvmx_pcsx_intx_en_reg_t
>    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:271: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * __cvmx_interrupt_pcsxx_int_en_reg_enable enables all interrupt bits in cvmx_pcsxx_int_en_reg_t
>    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:301: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * __cvmx_interrupt_spxx_int_msk_enable enables all interrupt bits in cvmx_spxx_int_msk_t
>    arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c:340: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * __cvmx_interrupt_stxx_int_msk_enable enables all interrupt bits in cvmx_stxx_int_msk_t
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Aditya Srivastava <yashsri421@gmail.com>
> Cc: David Daney <ddaney@caviumnetworks.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
> Thomas: There are also 2 warnings in cvmx-l2c.c but that file also says:
>  * This file is part of the OCTEON SDK
> 
> arch/mips/cavium-octeon/executive/cvmx-l2c.c:768: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Return log base 2 of the number of sets in the L2 cache
>    arch/mips/cavium-octeon/executive/cvmx-l2c.c:861: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>     * Flush a line from the L2 cache
> 
> so does it make sense to send a patch for these 2 warnings also?

sure, I haven't seen SDK updates for years, so we are on are own anyway.

>  arch/mips/cavium-octeon/executive/cvmx-interrupt-decodes.c |   17 +++++++---
>  1 file changed, 12 insertions(+), 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
