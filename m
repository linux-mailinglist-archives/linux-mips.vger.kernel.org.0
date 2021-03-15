Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B557F33B337
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 14:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhCONEB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 09:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhCONDx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Mar 2021 09:03:53 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1ECEC061763
        for <linux-mips@vger.kernel.org>; Mon, 15 Mar 2021 06:03:52 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z25so16109717lja.3
        for <linux-mips@vger.kernel.org>; Mon, 15 Mar 2021 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/qOUfo30PmDfy59I8NSJRneNR2Umpzy9YtVUdna4m5M=;
        b=qIqESwX8UcVPz/tRxKsCHl4esn02ZSSAlHCPzPZLxv99wXfXzlp6VFAza1Vy0JT2/L
         Wt138+S5W3UxXpRTA7+owK6XaBvAnSHZGkNuqj8v+ZQQ8/RPH+hOTMGuZTDqWwwssYVM
         mx5UQuIqmmb5Cbf8/Ne/bE11VLMvw65g4YajJvAq4NytDSWbYPoQASv7w/tSsieTjPfQ
         g2PHlQjquIIbXarHbYwFIxvM9rQ6X0eC7E1GT3Y6OafGhvguqHdT/tcj01G/Wu7EKjiX
         ChIrinG5Dt3i2OU8UpS6sID56lC72dTJdnz0V+6y/2j7PL4/T+6W4so0usK7fVpYnlhu
         JWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/qOUfo30PmDfy59I8NSJRneNR2Umpzy9YtVUdna4m5M=;
        b=AJjZ8zdiAYbTBwJDpl434HFVSTVgkaU3iFX4xzwfzI2Luhnx5XU4aVbmFgdjTFd8ka
         ycqn5qlQFZq/ABE6CpbYlz/YGWwjONdaDDGjPHQBZ812rZnU0ZzoT5l0yjSJcQ4P2r4W
         BYG2uXeBMAk57ZrTYq7Z2xTtUxTbWKRi6PR83JDjvoPJBvAE/UJxg1Qqc/NkVTNE15GV
         WmVmSpWVfwKLiU4jiJcps6gbrwPFGTt8uhgZiLnw8F7VuJUsa5aYBgCipgtpP1VcefRZ
         T5kn4NZqleO6QVxwa9yZuSmzkPzN0zrS2EvAmofC7SUdJYUp0S7xLEVuTFfQSWwjqKUg
         jvcA==
X-Gm-Message-State: AOAM5324PGi8fDOL3su4rsFd0GION+9glO7bbjkIa++0JVRnIOJ7/JAi
        47H1u4lbw0ZWXuayIZ0gj3wZFQ==
X-Google-Smtp-Source: ABdhPJxEDfiWnL0bsJmjqgGw1L2I1bSYjlSd5sFV7BIVlK0Jo8Vgmws3GfPCG9Ng9wnj9nKM4zVG/Q==
X-Received: by 2002:a2e:9a97:: with SMTP id p23mr10233046lji.375.1615813431310;
        Mon, 15 Mar 2021 06:03:51 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id v23sm2674810lfd.259.2021.03.15.06.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 06:03:49 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 7CCE710246E; Mon, 15 Mar 2021 16:03:53 +0300 (+03)
Date:   Mon, 15 Mar 2021 16:03:53 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dave Hansen <dave.hansen@intel.com>,
        Hugh Dickins <hughd@google.com>,
        Rik van Riel <riel@surriel.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Peter Xu <peterx@redhat.com>,
        Rolf Eike Beer <eike-kernel@sf-tec.de>,
        linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org, Linux API <linux-api@vger.kernel.org>
Subject: Re: [PATCH RFCv2] mm/madvise: introduce MADV_POPULATE_(READ|WRITE)
 to prefault/prealloc memory
Message-ID: <20210315130353.iqnwsnp2c2wpt4y2@box>
References: <20210308164520.18323-1-david@redhat.com>
 <20210315122213.k52wtlbbhsw42pks@box>
 <7d607d1c-efd5-3888-39bb-9e5f8bc08185@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d607d1c-efd5-3888-39bb-9e5f8bc08185@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 15, 2021 at 01:25:40PM +0100, David Hildenbrand wrote:
> On 15.03.21 13:22, Kirill A. Shutemov wrote:
> > On Mon, Mar 08, 2021 at 05:45:20PM +0100, David Hildenbrand wrote:
> > > +			case -EHWPOISON: /* Skip over any poisoned pages. */
> > > +				start += PAGE_SIZE;
> > > +				continue;
> > 
> > Why is it good approach? It's not abvious to me.
> 
> My main motivation was to simplify return code handling. I don't want to
> return -EHWPOISON to user space

Why? Hiding the problem under the rug doesn't help anybody. SIGBUS later
is not better than an error upfront.

-- 
 Kirill A. Shutemov
