Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23C654EA31
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 16:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfFUOFo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 10:05:44 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33040 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfFUOFo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 10:05:44 -0400
Received: by mail-qt1-f193.google.com with SMTP id x2so7053464qtr.0
        for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2019 07:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DkOzjPryuxAAZ6jj5aW+vqBCJ/xdXKjWwEy6q7BhjEk=;
        b=aWygfjPxOlEI1tnMPH+ZEg4lwdm35MlZ9FC2Sv9mNYz1TXYg7zMy65oynguhqHPLHD
         5poTOWoehn2uMjooUllCl96WCJBItvfeaEybY0ihx7Fxw7kb42coN1wbRqEsylbfnfz5
         poQ9cLzRruP/gaTS5r2ivimvPxFxF10jIh6a1t8bY1c5/8nfCSLTPHFwmVvqBcrvoeSR
         IrRjd3ExmNKIoqdYb4sME5daBw+7RTgROqdSMT/mhe4d+vGey9AkE/rEcyeRljT6dNfy
         FwbLskfpDrkSyt1xncxh/ARyaZyhUUMnPNBaOl1L9cqI8FBxyq6cZOpH+4o3AamW6xDj
         GPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DkOzjPryuxAAZ6jj5aW+vqBCJ/xdXKjWwEy6q7BhjEk=;
        b=ETrNmT0IERy8zJW1zNtf2OV2woQxz2dwc5iofb9DmtX1V5bGstG8YxQO9v9/0zOjWE
         n+SESqQ546jMAmrtlAR76R/zEJ3dGw2ySvAkJ/DcM2UJXd85PRWDA8x2CMDWuU9DxXv5
         uJlD+DggC/j6ODNKkDBNw1r5x/x3R85NwqdjVooKdfRtdws9dhvfx04a14AVzpROsQmD
         bYK1+zvrDtL/schJIvLPOh9L3f+tYgTpgujnvsau1BjJZdqbdMWc7HWz6htXYdxQolCh
         L3+xo6ZigN5dQe+m0u+2uP3mAtc6b5babxcEUT7vtK9M7ieqnay4PNheeasqHnumaN1b
         U67w==
X-Gm-Message-State: APjAAAXpIkqNwI6UDSUbvQjwStw6yX1FpKdRsTnyzRGapF3gBwkq5rIX
        eXeVJ+ZyQl+HFHBBuIcdVRF7mw==
X-Google-Smtp-Source: APXvYqzN1Bctip/8rcU9u7A4vdGN+f0/Jibs65Z8bT+DlW7GOUgigVYUV0gNRYHBistcmEEvwVki5g==
X-Received: by 2002:a0c:d610:: with SMTP id c16mr45427150qvj.22.1561125943463;
        Fri, 21 Jun 2019 07:05:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id i17sm1269594qkl.71.2019.06.21.07.05.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 07:05:42 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heKAg-0000Jr-7W; Fri, 21 Jun 2019 11:05:42 -0300
Date:   Fri, 21 Jun 2019 11:05:42 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Christoph Hellwig <hch@lst.de>, Kamal Dasu <kdasu.kdev@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/16] MIPS: use the generic get_user_pages_fast code
Message-ID: <20190621140542.GO19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-5-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 11, 2019 at 04:40:50PM +0200, Christoph Hellwig wrote:
> diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
> index 4ccb465ef3f2..7d27194e3b45 100644
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -20,6 +20,7 @@
>  #include <asm/cmpxchg.h>
>  #include <asm/io.h>
>  #include <asm/pgtable-bits.h>
> +#include <asm/cpu-features.h>
>  
>  struct mm_struct;
>  struct vm_area_struct;
> @@ -626,6 +627,8 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>  
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +#define gup_fast_permitted(start, end)	(!cpu_has_dc_aliases)
> +

Today this check is only being done on the get_user_pages_fast() -
after this patch it is also done for __get_user_pages_fast().

Which means __get_user_pages_fast is now non-functional on a range of
MIPS CPUs, but that seems OK as far as I can tell, so:

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

However, looks to me like this patch is also a bug fix for this:

commit 5b167c123b3c3582f62cf1896465019bc40fe526
Author: Kamal Dasu <kdasu.kdev@gmail.com>
Date:   Fri Jun 14 17:10:03 2013 +0000

    MIPS: Fix get_user_page_fast() for mips with cache alias
    
    get_user_pages_fast() is missing cache flushes for MIPS platforms with
    cache aliases.  Filesystem failures observed with DirectIO operations due
    to missing flush_anon_page() that use page coloring logic to work with
    cache aliases. This fix falls through to take slow_irqon path that calls
    get_user_pages() that has required logic for platforms where
    cpu_has_dc_aliases is true.

> -	pgdp = pgd_offset(mm, addr);
> -	do {
> -		pgd_t pgd = *pgdp;
> -
> -		next = pgd_addr_end(addr, end);
> -		if (pgd_none(pgd))
> -			goto slow;
> -		if (!gup_pud_range(pgd, addr, next, gup_flags & FOLL_WRITE,
> -				   pages, &nr))

This is different too, the core code has a p4d layer, but I see that
whole thing gets NOP'd by the compiler as mips uses pgtable-nop4d.h -
right?

Jason
