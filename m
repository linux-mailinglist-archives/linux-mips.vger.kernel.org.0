Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276753079A8
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 16:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232360AbhA1P04 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 10:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbhA1P0r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Jan 2021 10:26:47 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599F2C0613ED;
        Thu, 28 Jan 2021 07:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9eBIo4Egu97RqbiY6+c7asSiV/ikUF++ZJVD8vqT55E=; b=QDVpDrpKJf8/DSfYuNDmXh7HYF
        KYDY2sR+VpVKzChju3VATvh5amSGkECv5nzTjbDcjGqmGTKURbJShRz2zGI1FCNP/S5YUdCJiKg5V
        M8DIMfSWdHcSYORMzBZPisDicbo0OsD4BaqYMtkZZIJSEELUkryYzwjHCaj2QOsUWh8qirjmKYHiX
        H0J1zVBmSNJWNFj9KswW1EYQaobb+urewFNVZyLKhkx5BUOd0OqlCSfCXe3VBmMU8w/Kk8/Iu7m3L
        Y+YN/JBK55awnYCQBJI+dC2G4zAnXB3asC00H7baaH/jKfkI1SBOgpPfZznutkq2i6Ig/xNy3O5BG
        jcx9PHHg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l59BJ-0007D8-TO; Thu, 28 Jan 2021 15:26:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A77F4301A27;
        Thu, 28 Jan 2021 16:26:00 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 8D80721405348; Thu, 28 Jan 2021 16:26:00 +0100 (CET)
Date:   Thu, 28 Jan 2021 16:26:00 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] MIPS: Octeon: qspinlock: Flush write buffer
Message-ID: <YBLXiG3UxLNDB5xK@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-4-alexander.sverdlin@nokia.com>
 <YBHqeXPMILg+352D@hirez.programming.kicks-ass.net>
 <f492b29b-32a4-b4d4-a5d3-0d0dd8a56b5a@nokia.com>
 <YBKha2GRFWyYp+Lz@hirez.programming.kicks-ass.net>
 <f8344f35-cdf1-ec3d-dcd0-7bfc392ef6e0@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8344f35-cdf1-ec3d-dcd0-7bfc392ef6e0@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 28, 2021 at 01:13:03PM +0100, Alexander Sverdlin wrote:
> Hi!
> 
> On 28/01/2021 12:35, Peter Zijlstra wrote:
> >> My point was that original MIPS spinlocks had this write-buffer-flush and
> >> it got lost on the conversion to qspinlocks. The referenced commit just
> >> allows to see the last MIPS-specific implementation before deletion.
> > Hardware that needs a store-buffer flush after release is highly suspect
> > and needs big and explicit comments. Not vague hints.
> 
> I have a feeling that you are not going to suggest the comments for the code
> and one has to guess what is it you have in mind?

I've no insight in the specific microarch that causes this weirdness, so
it's very hard for me to suggest something here.

Find inspiration in the loongson commit.

> Do you think the proper approach would be to undelete MIPS spinlocks and
> make these broken qspinlocks a configurable option for MIPS? I don't even
> mind if they will be default option for those not interested in performance
> or latency.

qspinlock really isn't the only generic code that relies on this. I
would seriously consider doing the loongson-v3 thing, possibly also
adding that nudge_writes() thing to your smp_store_release(), you
already have it in __clear_bit_unlock().

It would then look something like:


/*
 * Octeon is special; it does not do read speculation, therefore an
 * smp_wmb() is sufficient to generate {load,store}->{store} order
 * required for RELEASE. It however has store-buffer weirdness
 * that requires an additional smp_wmb() (which is a completion barrier
 * for them) to flush the store-buffer, otherwise visibility of the
 * store can be arbitrarily delayed, also see __SYNC_loongson3_war.
 */
#define __smp_store_release(p, v) \
do { \
	compiletime_assert_atomic_type(*p); \
	__smp_wmb(); \
	WRITE_ONCE(*p, v); \
	__smp_wmb(); \
} while (0)

/*
 * Octeon also likes to retain stores, see __SYNC_loongson3_war.
 */
#define cpu_relax()	__smp_wmb();


Or something...
