Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5399C51F340
	for <lists+linux-mips@lfdr.de>; Mon,  9 May 2022 06:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiEIEPj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 May 2022 00:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiEIEKl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 May 2022 00:10:41 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5FE98F5C
        for <linux-mips@vger.kernel.org>; Sun,  8 May 2022 21:06:48 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n18so12714137plg.5
        for <linux-mips@vger.kernel.org>; Sun, 08 May 2022 21:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i8fTOca+12ZBwL8GFn68r89tRt5Zov30Zcvy0gFIx3s=;
        b=7oatG6weF86vW9pYog/WbnQv4ca5m77rm6XTxoXr1wXD+MeQ64n02aa13Lj0IMGWDh
         0jcAZ1/E8rhHmjwEiLH/wurqHwo7x7/oZPYnCacuSWGecYOh1cK7FR/f3ATgGUHe2XoH
         alZRF5CLU74LfUYGYSIuPW6xCoE9yhYrt5aPGmZHPMFjbnAa5HGvTb+BGlG1lzOEp7hA
         36hA/3+gDs89H4Ko4WXpK9eOIJ7FvaCtE+d5TzIwgk5OffyCSOeBgBkeqs8WGQvukk6n
         Rziui08UqLz3/L11wKnIDNIsOSawBpoleO3JIuQk/5rZjNynFDwVMrI47wZqmUxCKfmZ
         bBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i8fTOca+12ZBwL8GFn68r89tRt5Zov30Zcvy0gFIx3s=;
        b=EnfFyh2oeWVM9w0A0YxKofu7wWeM2+6VrOFNUia2/UQiLjzCnilmYrZ2+lssy3Z1PT
         GeO6+Y2HIFsUuRTzcc0OEOE3FHH4BTNPpmfAP0B9JsoenoJAFRBX+0rm9Cg2+xBZ/zsB
         A6QsN8D3Ia3Oa/ifiOPikI6uYi5jmJubhY8vR6lG4UsHqz02VhtK0KPRroEtpnWTqB1d
         YfMCnOK5IkSyyVRyIg3yEgikoLGTeLjZ7xprcCgRXVbbpqTy993dDnWgJpKiesmocNnZ
         jGKqfgbEwuiFzIj7Rug3jzV/u/d6B1Z9pylYtuSzee7btDXn6JUd7OW5S/E9MnH4vvF3
         YbLA==
X-Gm-Message-State: AOAM530Va7XZWndOiF9IlbygRW5gHP3xP7UBHtgFRjniLC3hOUWrKp0S
        5EV7LcbMZtY5n/plNpiT+RMZ2Q==
X-Google-Smtp-Source: ABdhPJzXNNNMoKGLlNS0rEzt5xQj0NLF+6rNIW0g3Nng1UFaP6z9LjY7xwl48st6GzktvUM1QgACdw==
X-Received: by 2002:a17:902:758a:b0:15e:ef4f:fed5 with SMTP id j10-20020a170902758a00b0015eef4ffed5mr12919922pll.1.1652069208384;
        Sun, 08 May 2022 21:06:48 -0700 (PDT)
Received: from localhost ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ab8400b0015e8d4eb1f8sm5831321plr.66.2022.05.08.21.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 21:06:47 -0700 (PDT)
Date:   Mon, 9 May 2022 12:06:43 +0800
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
Message-ID: <YniTU+iT/pV5j/41@FVFYT0MHHV2J.usts.net>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
 <Ynek+b3k6PVN3x7J@FVFYT0MHHV2J.usts.net>
 <bf627d1a-42f8-77f3-6ac2-67edde2feb8a@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf627d1a-42f8-77f3-6ac2-67edde2feb8a@linux.alibaba.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 08, 2022 at 09:09:55PM +0800, Baolin Wang wrote:
> 
> 
> On 5/8/2022 7:09 PM, Muchun Song wrote:
> > On Sun, May 08, 2022 at 05:36:39PM +0800, Baolin Wang wrote:
> > > It is incorrect to use ptep_clear_flush() to nuke a hugetlb page
> > > table when unmapping or migrating a hugetlb page, and will change
> > > to use huge_ptep_clear_flush() instead in the following patches.
> > > 
> > > So this is a preparation patch, which changes the huge_ptep_clear_flush()
> > > to return the original pte to help to nuke a hugetlb page table.
> > > 
> > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> > 
> > Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> Thanks for reviewing.
> 
> > 
> > But one nit below:
> > 
> > [...]
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index 8605d7e..61a21af 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -5342,7 +5342,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
> > >   		ClearHPageRestoreReserve(new_page);
> > >   		/* Break COW or unshare */
> > > -		huge_ptep_clear_flush(vma, haddr, ptep);
> > > +		(void)huge_ptep_clear_flush(vma, haddr, ptep);
> > 
> > Why add a "(void)" here? Is there any warning if no "(void)"?
> > IIUC, I think we can remove this, right?
> 
> I did not meet any warning without the casting, but this is per Mike's
> comment[1] to make the code consistent with other functions casting to void
> type explicitly in hugetlb.c file.
>

Got it. I see hugetlb.c per this rule, while others do not.
 
> [1]
> https://lore.kernel.org/all/495c4ebe-a5b4-afb6-4cb0-956c1b18d0cc@oracle.com/
> 
