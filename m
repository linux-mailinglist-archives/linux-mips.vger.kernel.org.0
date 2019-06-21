Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92C274E1C4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 10:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbfFUIPg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 04:15:36 -0400
Received: from verein.lst.de ([213.95.11.211]:36549 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbfFUIPg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Jun 2019 04:15:36 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id BAE6368C4E; Fri, 21 Jun 2019 10:15:01 +0200 (CEST)
Date:   Fri, 21 Jun 2019 10:15:01 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Christoph Hellwig <hch@lst.de>,
        James Hogan <jhogan@kernel.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Burton <paul.burton@mips.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        the arch/x86 maintainers <x86@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments
 in a structure
Message-ID: <20190621081501.GA17718@lst.de>
References: <20190611144102.8848-1-hch@lst.de> <20190611144102.8848-17-hch@lst.de> <1560300464.nijubslu3h.astroid@bobo.none> <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com> <1561032202.0qfct43s2c.astroid@bobo.none> <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 20, 2019 at 10:21:46AM -0700, Linus Torvalds wrote:
> Hmm. Honestly, I've never seen anything like that in any kernel profiles.
> 
> Compared to the problems I _do_ see (which is usually the obvious
> cache misses, and locking), it must either be in the noise or it's
> some problem specific to whatever CPU you are doing performance work
> on?
> 
> I've occasionally seen pipeline hiccups in profiles, but it's usually
> been either some serious glass jaw of the core, or it's been something
> really stupid we did (or occasionally that the compiler did: one in
> particular I remember was how there was a time when gcc would narrow
> stores when it could, so if you set a bit in a word, it would do it
> with a byte store, and then when you read the whole word afterwards
> you'd get a major pipeline stall and it happened to show up in some
> really hot paths).

I've not seen any difference in the GUP bench output here ar all.

But I'm fine with skipping this patch for now, I have a potential
series I'm looking into that would benefit a lot from it, but we
can discusss it in that context and make sure all the other works gets in
in time.
