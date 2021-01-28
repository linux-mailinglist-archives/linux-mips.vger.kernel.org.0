Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB7A307910
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 16:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232429AbhA1PFM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 10:05:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbhA1PFE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Jan 2021 10:05:04 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60816C061573;
        Thu, 28 Jan 2021 07:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=7yfcW39MtfJaiXZmnoAPjncfhf53DYwxvJyT9fBnDYM=; b=2Em3igleeT54NYBZl4CeE7uOzz
        Nh1wAmPWL+Hu81DHl2mLRb+Qx2NIocJ0DFIITJmvJAUQrXrPlOGKxaNfWgh0JlVEf1G00FNVZDwam
        f+98RKYRU/gPDw69vlS34mCV9BPzpPfKwfSL5wXq2vUMkxwKP+u1NxbEP3HQ004Kx3iUelv4ze7BK
        iRk67oz91z5U4FMInA/69CSQqcI5BTo4a8fnt1IGkOXDEpsJu/qLLno+4ZwTr5DFcNDs/cgTTtjBY
        5NGQS1mwnIszzBMBEH8Ob0cNQcUk8BQ6VvtEqCb6+JUhhgXoUK1CFJzv4cI9ws4zXzvJFsFw8UQiR
        U1Xww8Og==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l58qf-0002ax-4P; Thu, 28 Jan 2021 15:04:41 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C65323059C6;
        Thu, 28 Jan 2021 16:04:39 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id B7400213FC4B8; Thu, 28 Jan 2021 16:04:39 +0100 (CET)
Date:   Thu, 28 Jan 2021 16:04:39 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: Octeon: Implement __smp_store_release()
Message-ID: <YBLShyGWOXYVZCH8@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-2-alexander.sverdlin@nokia.com>
 <YBHp4139X+p+4IZ+@hirez.programming.kicks-ass.net>
 <aace6ff1-9ddf-15af-3c0a-378c53c59acb@nokia.com>
 <YBKhBQQ97f/J6L+u@hirez.programming.kicks-ass.net>
 <3c0165d9-1814-df1d-7ec9-bf515a3996b3@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c0165d9-1814-df1d-7ec9-bf515a3996b3@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 28, 2021 at 01:09:39PM +0100, Alexander Sverdlin wrote:
> On 28/01/2021 12:33, Peter Zijlstra wrote:
> > On Thu, Jan 28, 2021 at 08:27:29AM +0100, Alexander Sverdlin wrote:
> > 
> >>>> +#define __smp_store_release(p, v)					\
> >>>> +do {									\
> >>>> +	compiletime_assert_atomic_type(*p);				\
> >>>> +	__smp_wmb();							\
> >>>> +	__smp_rmb();							\
> >>>> +	WRITE_ONCE(*p, v);						\
> >>>> +} while (0)

> I actually hoped you will remember the discussion you've participated 5 years
> ago and (in my understanding) actually already agreed that the solution itself
> is not broken:
> 
> https://lore.kernel.org/lkml/20151112180003.GE17308@twins.programming.kicks-ass.net/

My memory really isn't that good. I can barely remember what I did 5
weeks ago, 5 years ago might as well have never happened.

> Could you please just suggest the proper comment you expect to be added here,
> because there is no doubts, you have much more experience here than me?

So for store_release I'm not too worried, and provided no read
speculation, wmb is indeed sufficient. This is because our store_release
is RCpc.

Something like:

/*
 * Because Octeon does not do read speculation, an smp_wmb()
 * is sufficient to ensure {load,store}->{store} order.
 */
#define __smp_store_release(p, v) \
do { \
	compiletime_assert_atomic_type(*p); \
	__smp_wmb(); \
	WRITE_ONCE(*p, v); \
} while (0)
