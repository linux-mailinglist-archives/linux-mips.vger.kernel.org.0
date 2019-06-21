Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1B4B4EC9B
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 17:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfFUPyR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 11:54:17 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35725 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfFUPyR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 11:54:17 -0400
Received: by mail-qt1-f193.google.com with SMTP id d23so7433432qto.2
        for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2019 08:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mLgah8hWTBbEh5+bUoBbV4cO6mlCq84wOyEco/eLAZk=;
        b=bLoA8VtprCwV9w7tPcg86jZ1rpAS3H8PKijh78PfsPQTzI+nU5oul0zgXMeLaRiXRt
         0wFPKH9U615gCpHD+L5Yv8W5lvde3UkjewCNuhwBu5S0CsDeI4/UcCMqeCIrj/KG+8Zb
         l3QD277Vy5HfhTuZfxzL2AOHsfaHAVgllOoulaRVcrlIq1FSXlq3gNYiB0wHGCzm7t/H
         qWTA1oANgEuyafWGY7DXvPIkRaLh51XuTMrMh/wGGhVgrxJRSu7jTVC4lvw3CGowryz4
         kFxWUuoYC16OKmvczWftpSNQDTxxycyKDXLzpSxXkmqILfG31DDx+kT4wcJhilA/snBo
         PXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mLgah8hWTBbEh5+bUoBbV4cO6mlCq84wOyEco/eLAZk=;
        b=GlBKEBsMAwMQOFgfj+vxCdSxY71pORfWRdD5n+st4XshBjPoclLkr5XlNyUAEyksRA
         ejj9aUda23iwT/IYtuaA1UptU+qs/Zh3pHYc4m7SrdRicpiCjzIhy2wfB+eCRt8/dlLK
         mi7FcVuOOVMGBzT7ulqUK2dvpnO9Ck7SUaOsLSoBThuWCcQen19Vemj25/2hoG6Gv7HV
         q0kB7K19li6S0Mg8OUvxYa1WxqtDz6oxMneutnWbMNI9USixIv9fmDjx94o9EGkFzVX7
         d1LigyFxESMyHcJw62olquCd4dPzUIATUc6G4pCGP7+rzC68zb/a2G4R8tAWh6r4sZuK
         fRvA==
X-Gm-Message-State: APjAAAXTnwEEiTHPFbAvDd7qi6lqd7epbYnIAVgZg9COazASECVuuVZE
        +6G4416oGafx2o43MT5mjcIxyw==
X-Google-Smtp-Source: APXvYqzhkQgyWFPdC17pHjyc6apgZlhrLfru3XQYo7Lqsq6E89yDvd3j/NnDUqHTzZE/tzkJFdAVuQ==
X-Received: by 2002:a0c:8885:: with SMTP id 5mr46203792qvn.137.1561132456162;
        Fri, 21 Jun 2019 08:54:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id 15sm1699745qtf.2.2019.06.21.08.54.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 08:54:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heLrj-0001oa-5A; Fri, 21 Jun 2019 12:54:15 -0300
Date:   Fri, 21 Jun 2019 12:54:15 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Khalid Aziz <khalid.aziz@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] mm: use untagged_addr() for get_user_pages_fast
 addresses
Message-ID: <20190621155415.GU19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-2-hch@lst.de>
 <20190621133911.GL19891@ziepe.ca>
 <9a4e1485-4683-92b0-3d26-73f26896d646@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a4e1485-4683-92b0-3d26-73f26896d646@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 21, 2019 at 09:35:11AM -0600, Khalid Aziz wrote:
> On 6/21/19 7:39 AM, Jason Gunthorpe wrote:
> > On Tue, Jun 11, 2019 at 04:40:47PM +0200, Christoph Hellwig wrote:
> >> This will allow sparc64 to override its ADI tags for
> >> get_user_pages and get_user_pages_fast.
> >>
> >> Signed-off-by: Christoph Hellwig <hch@lst.de>
> >>  mm/gup.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/mm/gup.c b/mm/gup.c
> >> index ddde097cf9e4..6bb521db67ec 100644
> >> +++ b/mm/gup.c
> >> @@ -2146,7 +2146,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
> >>  	unsigned long flags;
> >>  	int nr = 0;
> >>  
> >> -	start &= PAGE_MASK;
> >> +	start = untagged_addr(start) & PAGE_MASK;
> >>  	len = (unsigned long) nr_pages << PAGE_SHIFT;
> >>  	end = start + len;
> > 
> > Hmm, this function, and the other, goes on to do:
> > 
> >         if (unlikely(!access_ok((void __user *)start, len)))
> >                 return 0;
> > 
> > and I thought that access_ok takes in the tagged pointer?
> > 
> > How about re-order it a bit?
> 
> access_ok() can handle tagged or untagged pointers. It just strips the
> tag bits from the top bits. Current order doesn't really matter from
> functionality point of view. There might be minor gain in delaying
> untagging in __get_user_pages_fast() but I could go either way.

I understand the current ARM and SPARC implementations don't do much
with the tags, but it feels like a really big assumption for the core
code that all future uses of tags will be fine to have them stripped
out of 'void __user *' pointers. IMHO that is something we should not
be doing in the core kernel..

Jason
