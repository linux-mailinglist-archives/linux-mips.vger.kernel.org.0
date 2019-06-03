Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1D6C329ED
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2019 09:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbfFCHos (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Jun 2019 03:44:48 -0400
Received: from verein.lst.de ([213.95.11.211]:55214 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfFCHos (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Jun 2019 03:44:48 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 74D3067358; Mon,  3 Jun 2019 09:44:21 +0200 (CEST)
Date:   Mon, 3 Jun 2019 09:44:21 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Christoph Hellwig <hch@lst.de>, Paul Burton <paul.burton@mips.com>,
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
        linux-mips@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Linux-MM <linux-mm@kvack.org>,
        the arch/x86 maintainers <x86@kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/16] sparc64: add the missing pgd_page definition
Message-ID: <20190603074421.GB22920@lst.de>
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-9-hch@lst.de> <CAHk-=wj9w5NxTcJsqpvYUiL3OBOH-J3=4-vXcc3GaG_U8H-gJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj9w5NxTcJsqpvYUiL3OBOH-J3=4-vXcc3GaG_U8H-gJw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 01, 2019 at 09:28:54AM -0700, Linus Torvalds wrote:
> Both sparc64 and sh had this pattern, but now that I look at it more
> closely, I think your version is wrong, or at least nonoptimal.

I bet it is.  Then again these symbols are just required for the code
to compile, as neither sparc64 nor sh actually use the particular
variant of huge pages we need it for.  Then again even actually dead
code should better be not too buggy if it isn't just a stub.

> So I thgink this would be better done with
> 
>      #define pgd_page(pgd)    pfn_to_page(pgd_pfn(pgd))
> 
> where that "pgd_pfn()" would need to be a new (but likely very
> trivial) function. That's what we do for pte_pfn().
> 
> IOW, it would likely end up something like
> 
>   #define pgd_to_pfn(pgd) (pgd_val(x) >> PFN_PGD_SHIFT)

True.  I guess it would be best if we could get most if not all
architectures to use common versions of these macros so that we have
the issue settled once.
