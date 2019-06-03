Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3426329F3
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2019 09:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfFCHpW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Jun 2019 03:45:22 -0400
Received: from verein.lst.de ([213.95.11.211]:55235 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbfFCHpW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 3 Jun 2019 03:45:22 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 2E3F867358; Mon,  3 Jun 2019 09:44:56 +0200 (CEST)
Date:   Mon, 3 Jun 2019 09:44:55 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Hillf Danton <hdanton@sina.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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
Subject: Re: [PATCH 10/16] sparc64: use the generic get_user_pages_fast code
Message-ID: <20190603074455.GC22920@lst.de>
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-11-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190601074959.14036-11-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Jun 02, 2019 at 03:39:48PM +0800, Hillf Danton wrote:
> 
> Hi Christoph 
> 
> On Sat,  1 Jun 2019 09:49:53 +0200 Christoph Hellwig wrote:
> > 
> > diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> > index a93eca29e85a..2301ab5250e4 100644
> > --- a/arch/sparc/include/asm/pgtable_64.h
> > +++ b/arch/sparc/include/asm/pgtable_64.h
> > @@ -1098,6 +1098,24 @@ static inline unsigned long untagged_addr(unsigned long start)
> >  }
> >  #define untagged_addr untagged_addr
> >  
> > +static inline bool pte_access_permitted(pte_t pte, bool write)
> > +{
> > +	u64 prot;
> > +
> > +	if (tlb_type == hypervisor) {
> > +		prot = _PAGE_PRESENT_4V | _PAGE_P_4V;
> > +		if (prot)
> 
> Feel free to correct me if I misread or miss anything.
> It looks like a typo: s/prot/write/, as checking _PAGE_PRESENT_4V and
> _PAGE_P_4V makes prot always have _PAGE_WRITE_4V set, regardless of write.

True, the if prot should be if write.
