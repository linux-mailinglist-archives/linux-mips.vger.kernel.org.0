Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51C82D787
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 10:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfE2IUJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 04:20:09 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41290 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2IUJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 May 2019 04:20:09 -0400
Received: by mail-pl1-f194.google.com with SMTP id s24so608186plr.8;
        Wed, 29 May 2019 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vv80Z7VGeE+yY87s35ZtbvL9SuF+bx88wizFFl2ddXk=;
        b=cfjTgrmeffoPCrJhI+97W6QXKk6Oei6h+EWkEb+bEn4yMKwe1KRVmiSAlBitS3OzO/
         c/tyEKG5QaY9H27ocjqX9ClL17ehovMVcUt7YhQ8kf3rHXp6B9XpCCN0CcU6Si2UD4Nx
         WTLuuegGgJAghoxgukLP6Y9Wo0E6kJgeW38YPyxyZyjfe338LiEpC3p45UFWQN4O+BvI
         P8+xUi1O2II741hiIEFGS/WMLl/cV3IqvAqIQUVDdyV/KjU3XqOhV1WuYOFjyQW8PnY/
         amayHly2wRjC94U3jpS4czeAB54sIQF3S61+sOcP7srQnXtmIyeJXkceyyWrL1wlHCJt
         tFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vv80Z7VGeE+yY87s35ZtbvL9SuF+bx88wizFFl2ddXk=;
        b=TKtqwnpygz5kqP/kUJIUCd8soTgCCN2+gYD8aio6uIfWn8e1uNdpjKExL69cJJACQm
         pzAYPivclS5hUgTzUktsutSBXl41f2CFEV6T/YBWaSL6YBs/F0Bu2tm6LQkEJ9kEJiKw
         5mWiG7cN2PAa0RNlGHdf5zX2F7sbDSb5mgJn3QkxglsfLTnxDvlrcJlM+EHNBWsJ50hB
         SmNbEFa79wzU8x+LCtgJ4ZKdU9ePGw0XcnL8NIOGmlXetrPQ8borpm/hT37Xx8Pi597V
         N7nga34fmH3GdDPdqbCHXFBw6HPh+LQKPMuhsghOgvn5saMDA7q0VU9KraXn0hT0jMbK
         s9DQ==
X-Gm-Message-State: APjAAAXfXJJEByxwaFr+QADho8HPIXphP11fSSvr5j7HVpMPW6qPG7Af
        DM7CWErhvSPSk6aPN3EoaKyZQyaeTmE2PsPvfpg=
X-Google-Smtp-Source: APXvYqyfzUdsfOOybUfGF3T6xUuaMylLIfCMpBmv0G9MpnimsL2Jd8Uf2ws2u/OjSpGvnVZhNKSbhFpqsv/52XGO+Xg=
X-Received: by 2002:a17:902:f212:: with SMTP id gn18mr78134706plb.106.1559118008568;
 Wed, 29 May 2019 01:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190525133203.25853-1-hch@lst.de> <20190525133203.25853-5-hch@lst.de>
In-Reply-To: <20190525133203.25853-5-hch@lst.de>
From:   Catalin Marinas <catalin.marinas@arm.com>
Date:   Wed, 29 May 2019 09:19:56 +0100
Message-ID: <CAHkRjk5ChgbYGXCRG3ob3iCuggC3MVYqeJNNm+nnt6rCqo+b0Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] mm: add a gup_fixup_start_addr hook
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

On Sat, 25 May 2019 at 14:33, Christoph Hellwig <hch@lst.de> wrote:
> diff --git a/mm/gup.c b/mm/gup.c
> index f173fcbaf1b2..1c21ecfbf38b 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2117,6 +2117,10 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
>         } while (pgdp++, addr = next, addr != end);
>  }
>
> +#ifndef gup_fixup_start_addr
> +#define gup_fixup_start_addr(start)    (start)
> +#endif

As you pointed out in a subsequent reply, we could use the
untagged_addr() macro from Andrey (or a shorter "untag_addr" if you
want it to look like a verb).

>  #ifndef gup_fast_permitted
>  /*
>   * Check if it's allowed to use __get_user_pages_fast() for the range, or
> @@ -2145,7 +2149,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
>         unsigned long flags;
>         int nr = 0;
>
> -       start &= PAGE_MASK;
> +       start = gup_fixup_start_addr(start) & PAGE_MASK;
>         len = (unsigned long) nr_pages << PAGE_SHIFT;
>         end = start + len;
>
> @@ -2218,7 +2222,7 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
>         unsigned long addr, len, end;
>         int nr = 0, ret = 0;
>
> -       start &= PAGE_MASK;
> +       start = gup_fixup_start_addr(start) & PAGE_MASK;
>         addr = start;
>         len = (unsigned long) nr_pages << PAGE_SHIFT;
>         end = start + len;

In Andrey's patch [1] we don't fix __get_user_pages_fast(), only
__get_user_pages() as it needs to do a find_vma() search. I wonder
whether this is actually necessary for the *_fast() versions. If the
top byte is non-zero (i.e. tagged address), 'end' would also have the
same tag. The page table macros like pgd_index() and pgd_addr_end()
already take care of masking out the top bits (at least for arm64)
since they need to work on kernel address with the top bits all 1. So
gup_pgd_range() should cope with tagged addresses already.

[1] https://lore.kernel.org/lkml/d234cd71774f35229bdfc0a793c34d6712b73093.1557160186.git.andreyknvl@google.com/

-- 
Catalin
