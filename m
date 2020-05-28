Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C3951E54C4
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 05:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgE1DrB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 23:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgE1DrA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 23:47:00 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66458C05BD1E
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 20:47:00 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id y85so23673844oie.11
        for <linux-mips@vger.kernel.org>; Wed, 27 May 2020 20:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=2qx91aVPuFO0vUiP0/I7F3TMnsxZODsCo0wW/nZA/Ek=;
        b=PL6zETkbGU9mqzrGsocE1HBzwqKl3IMV7yV8wFZbGm4wHOwRBD8OMMG+y5JKGvCgPi
         vm5n3+sf1eGzsQmqX4L8++JRmCX3DzLApuWLh2lFuHx1IPNt0zVceXBi8JMZm08yMjJi
         dgTLtqCBs6olHY2rqJsuK9NL5GyMjlA9kP/Cz6nR6Si2xwGFFoE603kc/Dr53G3rQp6S
         gFBb+PddTEBGiaWOuBvRGs40Im9zVq8VTNmoIb/MzDf19j1pLiqnHKik2BuMsIkBrRbh
         TYnm6OVvmQUcyWzw/IOjcAS7zNs0Q98eBrYT94efLyjDduG9AxjlXGJtnrsATHUpOImZ
         HIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=2qx91aVPuFO0vUiP0/I7F3TMnsxZODsCo0wW/nZA/Ek=;
        b=Y/DmyI10ORG/0j8GXtZ2OcKNCdlPcvCLqCloFnFoWHsPMntoE4PGZwjCZthEuTL8cl
         mLEf6vKTd34s/koH627ik0FCaTdYj5wg/1OVg4H+4ivWukRmBSG7KSkSLWAmV+ddMThi
         2flwnddGic5zgnLL8mTkaAUU3nXMcWOmoVbZuOy39Np0ARnmuqsO22L/jgcjbbs/Wt62
         dOa4R1uirp7ysaL9ZYAehGgzLwB+FwBTyhc4oVhATyvkW/U8GEe+tTIHwy0Iv6REUX3Z
         2xFtPwLnX6bOlOce2RCfRnwtC34aph7SKaw2dlmHNzF9aCa5kA+X6BcZTyMJN0lTspEs
         wy2A==
X-Gm-Message-State: AOAM533Kj5VuptC1pHhGX1pfGDeuTTq099jg68FondzE7rjQkb2aS2Qu
        ZZQi5Mov4AwijXB7dN95JVRIxA==
X-Google-Smtp-Source: ABdhPJyOlEQNd0DWG0KMQ3iclWevL0B8TV/DHISOzSWHCezO7ksCSIPPniMHO6dFdL8N85bmZfl1CA==
X-Received: by 2002:aca:d856:: with SMTP id p83mr958723oig.38.1590637619384;
        Wed, 27 May 2020 20:46:59 -0700 (PDT)
Received: from eggly.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id v10sm1036334oov.15.2020.05.27.20.46.55
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 27 May 2020 20:46:58 -0700 (PDT)
Date:   Wed, 27 May 2020 20:46:22 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@eggly.anvils
To:     Jerome Glisse <jglisse@redhat.com>
cc:     linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        Huang Ying <ying.huang@intel.com>,
        linux-kernel@vger.kernel.org,
        Steven Capper <steve.capper@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Rabin Vincent <rabinv@axis.com>,
        linux-arm-kernel@lists.infradead.org, rmk+kernel@arm.linux.org.uk,
        Guo Ren <guoren@kernel.org>, linux-mips@vger.kernel.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        nios2-dev@lists.rocketboards.org, linux-parisc@vger.kernel.org,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        sparclinux@vger.kernel.org, Guan Xuetao <gxt@pku.edu.cn>,
        linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>,
        Chris Zankel <chris@zankel.net>
Subject: Re: Cache flush issue with page_mapping_file() and swap back shmem
 page ?
In-Reply-To: <20200528002033.GB1992500@redhat.com>
Message-ID: <alpine.LSU.2.11.2005272021220.3857@eggly.anvils>
References: <20200528002033.GB1992500@redhat.com>
User-Agent: Alpine 2.11 (LSU 23 2013-08-11)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jerome,

On Wed, 27 May 2020, Jerome Glisse wrote:
> So any arch code which uses page_mapping_file() might get the wrong
> answer, this function will return NULL for a swap backed page which
> can be a shmem pages. But shmem pages can still be shared among
> multiple process (and possibly at different virtual addresses if
> mremap was use).
> 
> Attached is a patch that changes page_mapping_file() to return the
> shmem mapping for swap backed shmem page. I have not tested it (no
> way for me to test all those architecture) and i spotted this while
> working on something else. So i hope someone can take a closer look.

I'm certainly no expert on flush_dcache_page() and friends, but I'd
be very surprised if such a problem exists, yet has gone unnoticed
for so long.  page_mapping_file() itself is fairly new, added when
a risk of crashing on a race with swapoff came in: but the previous
use of page_mapping() would have suffered equally if there were such
a cache flushinhg problem here.

And I'm afraid your patch won't do anything to help if there is a
problem: very soon after shmem calls add_to_swap_cache(), it calls
shmem_delete_from_page_cache(), which sets page->mapping to NULL.

But I can assure you that a shmem page (unlike an anon page) is never
put into swap cache while it is mapped into userspace, and never
mapped into userspace while it is still in swap cache: does that help?

Hugh

> This might be a shmem page that is in a sense a file that
> can be mapped multiple times in different processes at
> possibly different virtual addresses (fork + mremap). So
> return the shmem mapping that will allow any arch code to
> find all mappings of the page.
> 
> Note that even if page is not anonymous then the page might
> have a NULL page->mapping field if it is being truncated,
> but then it is fine as each pte poiting to the page will be
> remove and cache flushing should be handled properly by that
> part of the code.
> 
> Signed-off-by: Jerome Glisse <jglisse@redhat.com>
> Cc: "Huang, Ying" <ying.huang@intel.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
> ---
>  mm/util.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/util.c b/mm/util.c
> index 988d11e6c17c..ec8739ab0cc3 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -685,8 +685,24 @@ EXPORT_SYMBOL(page_mapping);
>   */
>  struct address_space *page_mapping_file(struct page *page)
>  {
> -	if (unlikely(PageSwapCache(page)))
> +	if (unlikely(PageSwapCache(page))) {
> +		/*
> +		 * This might be a shmem page that is in a sense a file that
> +		 * can be mapped multiple times in different processes at
> +		 * possibly different virtual addresses (fork + mremap). So
> +		 * return the shmem mapping that will allow any arch code to
> +		 * find all mappings of the page.
> +		 *
> +		 * Note that even if page is not anonymous then the page might
> +		 * have a NULL page->mapping field if it is being truncated,
> +		 * but then it is fine as each pte poiting to the page will be
> +		 * remove and cache flushing should be handled properly by that
> +		 * part of the code.
> +		 */
> +		if (!PageAnon(page))
> +			return page->mapping;
>  		return NULL;
> +	}
>  	return page_mapping(page);
>  }
>  
> -- 
> 2.26.2
