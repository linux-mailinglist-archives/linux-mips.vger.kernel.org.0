Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B0A452D3E
	for <lists+linux-mips@lfdr.de>; Tue, 16 Nov 2021 09:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhKPI6B (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Nov 2021 03:58:01 -0500
Received: from elvis.franken.de ([193.175.24.41]:52940 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232490AbhKPI55 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Nov 2021 03:57:57 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mmuF0-0006gG-00; Tue, 16 Nov 2021 09:54:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E2328C2D9B; Tue, 16 Nov 2021 09:45:46 +0100 (CET)
Date:   Tue, 16 Nov 2021 09:45:46 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Colin Ian King <colin.i.king@googlemail.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2] MIPS: generic/yamon-dt: fix uninitialized variable
 error
Message-ID: <20211116084546.GA21168@alpha.franken.de>
References: <20211110232824.1372368-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110232824.1372368-1-colin.i.king@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 10, 2021 at 11:28:24PM +0000, Colin Ian King wrote:
> In the case where fw_getenv returns an error when fetching values
> for ememsizea and memsize then variable phys_memsize is not assigned
> a variable and will be uninitialized on a zero check of phys_memsize.
> Fix this by initializing phys_memsize to zero.
> 
> Cleans up cppcheck error:
> arch/mips/generic/yamon-dt.c:100:7: error: Uninitialized variable: phys_memsize [uninitvar]
> 
> Fixes: f41d2430bbd6 ("MIPS: generic/yamon-dt: Support > 256MB of RAM")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> V2: Use correct email address in SoB.
> ---
>  arch/mips/generic/yamon-dt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/generic/yamon-dt.c b/arch/mips/generic/yamon-dt.c
> index a3aa22c77cad..a07a5edbcda7 100644
> --- a/arch/mips/generic/yamon-dt.c
> +++ b/arch/mips/generic/yamon-dt.c
> @@ -75,7 +75,7 @@ static unsigned int __init gen_fdt_mem_array(
>  __init int yamon_dt_append_memory(void *fdt,
>  				  const struct yamon_mem_region *regions)
>  {
> -	unsigned long phys_memsize, memsize;
> +	unsigned long phys_memsize = 0, memsize;
>  	__be32 mem_array[2 * MAX_MEM_ARRAY_ENTRIES];
>  	unsigned int mem_entries;
>  	int i, err, mem_off;
> -- 
> 2.32.0

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
