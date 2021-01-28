Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61DE53078EF
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 16:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbhA1PAA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 10:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232384AbhA1O7J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Jan 2021 09:59:09 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21FE3C061573;
        Thu, 28 Jan 2021 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Z5EsWkl1JmttEYNurc9klzo0vYFtmKtLRijlck9brLw=; b=TX91hQiTGUsm7UXi+3eXnYVa1f
        Bcud80EnB8TuCrhp+pjIslNddxZugUrcTZ+KjglWNql8qwA6yRtk7k6gZ13x4FlnQ/KhJvPY3cLb+
        axiSZvX2N2atf7hd+t1BjtQ2DZZ1ysQRbd7+pQIdVtwaOgUIuT4n90dvIBkjIyZDJKen2NNH2LfHb
        tF/XHPkJ67pEfOjmwO0HxEYiVGWi6arfr9q9YIUDTCZ3cMcjRRT/3iBvCpa3BtEqPC5mkkbf0iGWy
        JMSfdiTlagLLAwW0NFN6fcS/Lwq6Xtw9y6e1FZOIXuHr2yROKMINrGiRgJZLhqagna9qcjQ1pumIc
        ZYQfzi8Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l58kD-008ayM-0R; Thu, 28 Jan 2021 14:58:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4AE5D300B22;
        Thu, 28 Jan 2021 15:57:58 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 29A0221405372; Thu, 28 Jan 2021 15:57:58 +0100 (CET)
Date:   Thu, 28 Jan 2021 15:57:58 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: Octeon: Implement __smp_store_release()
Message-ID: <YBLQ9hbj8Zafjz+c@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-2-alexander.sverdlin@nokia.com>
 <YBHp4139X+p+4IZ+@hirez.programming.kicks-ass.net>
 <aace6ff1-9ddf-15af-3c0a-378c53c59acb@nokia.com>
 <YBKhBQQ97f/J6L+u@hirez.programming.kicks-ass.net>
 <b00f945a-1278-5fd2-321c-6ea5f07be128@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b00f945a-1278-5fd2-321c-6ea5f07be128@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 28, 2021 at 12:52:22PM +0100, Alexander Sverdlin wrote:
> Hello Peter,
> 
> On 28/01/2021 12:33, Peter Zijlstra wrote:
> > This, from commit 6b07d38aaa52 ("MIPS: Octeon: Use optimized memory
> > barrier primitives."):
> > 
> > 	#define smp_mb__before_llsc() smp_wmb()
> > 	#define __smp_mb__before_llsc() __smp_wmb()
> > 
> > is also dodgy as hell and really wants a comment too. I'm not buying the
> > Changelog of that commit either, __smp_mb__before_llsc should also
> > ensure the LL cannot happen earlier, but SYNCW has no effect on loads.
> > So what stops the load from being speculated?
> 
> hmm, the commit message you point to above, says:
> 
> "Since Octeon does not do speculative reads, this functions as a full barrier."

So then the only difference between SYNC and SYNCW is a pipeline drain?

I still worry about the transitivity thing.. ISTR that being a sticky
point back then too.
