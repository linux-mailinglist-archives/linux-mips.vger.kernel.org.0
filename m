Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0D5151ED2D
	for <lists+linux-mips@lfdr.de>; Sun,  8 May 2022 13:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiEHLNj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 May 2022 07:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbiEHLNi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 May 2022 07:13:38 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345FBDF31
        for <linux-mips@vger.kernel.org>; Sun,  8 May 2022 04:09:48 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y41so5144087pfw.12
        for <linux-mips@vger.kernel.org>; Sun, 08 May 2022 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OWmWFuKURN4UwCDRPsgR9Re+rOOqJePNgFLKfmRbPyI=;
        b=UlTfZYFJ8cQvbSFvJYR0MNjIVNnz94wcIJy7bmyHAq3K7dhExqiXwQ6GlaTqAWyxzy
         /Z/UihrYn4PiXbZkL0LHCX2s5FoaTSEdl9xmTkNYPq7h9HiO+occ9eYuqUW2zt7FKqmt
         b3PN1o5ZoZJqlKw9pM5JrZNOlSwE6WvfVuInjWEAmfTWiOCutIUTw8vwaC1o1YFjwp9f
         +xjwh/8BPP6aVzOrMhkxbxgpxLomJCpFhrQhBvrcVb/DbwLhuEyhNqWHYVVFWiB/5sZZ
         2U9B/tv5Pzx5HC7lG5vZPP5nVcDqOI8s7xA4xdRGTcVQxNcgXyFbsuZyVPlp5azgbVRy
         VmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OWmWFuKURN4UwCDRPsgR9Re+rOOqJePNgFLKfmRbPyI=;
        b=LA2YAkFfj4M2MxGMMzKEEAmlUvJeyJPjiVxu7lEETrBS+Xpd70lKnQFiWruekxurBk
         khpUEhs676JIQ9snZKnX7KRjaUZ5eyYLmNZpWX2a7ITKCbq3sWwNduIY8sRPr9oO1b7Z
         AnYFsASb7TYGVDbCq0drykVTjNKH3CLI+nKOUvcDYh23xb47lB37vIiX7Ht4PwSl3/PQ
         B0FIQcO4IFXWHDotFqvCHtozisZo19fC3xF8IwBgQXxjNUcpI/r/KSLuH0ITTQ1x1HxT
         kjFbwJ2cJIc6p4/27aSzVcjOBOHWG3fwcEX545Q4B0AY0tmsQ29Lq6oVdEnUiEZhI8fM
         TcZQ==
X-Gm-Message-State: AOAM532JyBvRVJZ+/fbouep/mRtS3kAlwPiPrRAtLrq9GuVGx6dBlXez
        f+eEY7Pp16TZQBFfHsVOaUS+jA==
X-Google-Smtp-Source: ABdhPJxZzyOA/OXdDbOTRosPq5K5546OioeGuvjfL98xly+cJSbCFdY7/mzCWxYx8HhR8kOEcFz1eQ==
X-Received: by 2002:a62:b60f:0:b0:508:2a61:2c8b with SMTP id j15-20020a62b60f000000b005082a612c8bmr11424511pff.2.1652008187667;
        Sun, 08 May 2022 04:09:47 -0700 (PDT)
Received: from localhost ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902e9d100b0015ea8b4b8f3sm4943158plk.263.2022.05.08.04.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 04:09:47 -0700 (PDT)
Date:   Sun, 8 May 2022 19:09:45 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Baolin Wang <baolin.wang@linux.alibaba.com>
Cc:     akpm@linux-foundation.org, mike.kravetz@oracle.com,
        catalin.marinas@arm.com, will@kernel.org,
        tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
        deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, hca@linux.ibm.com, gor@linux.ibm.com,
        agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
        svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
        davem@davemloft.net, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2 1/3] mm: change huge_ptep_clear_flush() to return the
 original pte
Message-ID: <Ynek+b3k6PVN3x7J@FVFYT0MHHV2J.usts.net>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 08, 2022 at 05:36:39PM +0800, Baolin Wang wrote:
> It is incorrect to use ptep_clear_flush() to nuke a hugetlb page
> table when unmapping or migrating a hugetlb page, and will change
> to use huge_ptep_clear_flush() instead in the following patches.
> 
> So this is a preparation patch, which changes the huge_ptep_clear_flush()
> to return the original pte to help to nuke a hugetlb page table.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

But one nit below:

[...]
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 8605d7e..61a21af 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5342,7 +5342,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
>  		ClearHPageRestoreReserve(new_page);
>  
>  		/* Break COW or unshare */
> -		huge_ptep_clear_flush(vma, haddr, ptep);
> +		(void)huge_ptep_clear_flush(vma, haddr, ptep);

Why add a "(void)" here? Is there any warning if no "(void)"?
IIUC, I think we can remove this, right?

>  		mmu_notifier_invalidate_range(mm, range.start, range.end);
>  		page_remove_rmap(old_page, vma, true);
>  		hugepage_add_new_anon_rmap(new_page, vma, haddr);
> -- 
> 1.8.3.1
> 
> 
