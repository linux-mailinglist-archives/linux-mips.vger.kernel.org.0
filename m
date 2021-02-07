Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09F031230A
	for <lists+linux-mips@lfdr.de>; Sun,  7 Feb 2021 10:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhBGJTc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Feb 2021 04:19:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:35408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhBGJTb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Feb 2021 04:19:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A91D64E22;
        Sun,  7 Feb 2021 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612689530;
        bh=OygoctvNrqCv3+yqvOUhM5F9TdXP26wbyygyZSDx/ME=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X9lHKJWOTcXLEeVJj92+4bOk5plpSBCiUD1AypE5r32Qmh5QsMZIOJbBLHDaT+6HA
         65APmYOmRlcQFMUwUFN56Zm8pqjfFjF6kTIylEQCqvE4k3S7AclrMV97kTBTgpU31Q
         u78Oh2yiQzNdaSEg9UozwxOTChRWdLJC+qt+4iRxBbUSBLER233XM299k35/a3f0VM
         1zWxdnHdyiZyTJGWbQBpe4vdQ2Y6xv37G24qsZWjib2JNuPmWBSyu1aPEkgUUGtBTW
         cJu0Hir6ci80a3QQg9y5BnvFvCXiJ53IsbUy1P4+xbhmw8kesm6oKn960M4W5JoY4s
         sWLfjzEwnuGgA==
Date:   Sun, 7 Feb 2021 11:18:42 +0200
From:   Mike Rapoport <rppt@kernel.org>
To:     Ivan Khoronzhuk <ikhoronz@cisco.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-kernel@vger.kernel.org, yangtiezhu@loongson.cn,
        ivan.khoronzhuk@gmail.com
Subject: Re: [PATCH] mips: kernel: setup: fix crash kernel resource allocation
Message-ID: <20210207091842.GU242749@kernel.org>
References: <20210206125940.111766-1-ikhoronz@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210206125940.111766-1-ikhoronz@cisco.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 06, 2021 at 12:59:40PM +0000, Ivan Khoronzhuk wrote:
> In order to avoid crash kernel corruption, its memory is reserved
> early in memblock and as result, in time when resources are inited
> it's not present in memblock.memory, so crash kernel memory is out
> of ranges listed with for_each_mem_range(). To avoid it and still
> keep memory reserved lets reseve it out of loop by inserting it in
> iomem_resource.

Unless I misread the code, the crash kernel memory is actually allocated
from memblock (memblock_find_in_range + memblock_reserve), but for some
reason memblock_reserve(<crash kernel>) is called outside
mips_parse_crashkernel(). So the crash kernel memory is surely in both
memblock.memory and memblock.reserved and it will be covered by
for_each_mem_range().

The mips_parse_crashkernel() function and the following reservation of
crash kernel memory should be merged, IMO, and this can be further
simplified with memblock_alloc() helpers.

Is there a particular issue you are trying to fix?
 
> Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Ivan Khoronzhuk <ikhoronz@cisco.com>
> ---
> Based on linux-next/master
> 
>  arch/mips/kernel/setup.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 3785c72bc3bc..25e376ef2f2a 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -473,14 +473,15 @@ static void __init mips_parse_crashkernel(void)
>  	crashk_res.end	 = crash_base + crash_size - 1;
>  }
>  
> -static void __init request_crashkernel(struct resource *res)
> +static void __init request_crashkernel(void)
>  {
>  	int ret;
>  
>  	if (crashk_res.start == crashk_res.end)
>  		return;
>  
> -	ret = request_resource(res, &crashk_res);
> +	/* The crashk resource shoud be located in normal mem */
> +	ret = insert_resource(&iomem_resource, &crashk_res);
>  	if (!ret)
>  		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
>  			(unsigned long)(resource_size(&crashk_res) >> 20),
> @@ -734,8 +735,9 @@ static void __init resource_init(void)
>  		request_resource(res, &code_resource);
>  		request_resource(res, &data_resource);
>  		request_resource(res, &bss_resource);
> -		request_crashkernel(res);
>  	}
> +
> +	request_crashkernel();
>  }
>  
>  #ifdef CONFIG_SMP
> -- 
> 2.23.1
> 

-- 
Sincerely yours,
Mike.
