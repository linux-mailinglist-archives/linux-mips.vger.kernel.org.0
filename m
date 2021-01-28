Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495CE307953
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 16:18:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231329AbhA1PQl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 10:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbhA1PQf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Jan 2021 10:16:35 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7069C061574;
        Thu, 28 Jan 2021 07:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=vdz2uLFVvEe0lGBz/swsb4ZdsSS7Ujlldtrdac+osrU=; b=vhmgOk52SZEcAoLuUE2jqc0MTE
        N4NkQnJTOrTaKvj5EHF1CvZEyjCr4/K+fk2RfrhHIG6Kev/aPydD5W+TOy+kFArvkHemdoOjkVwI8
        5OsogBc0GuEssMzNTeEmiiNSqsqb8kmM59BWzLNH0fpXa3O/sphAUxBuy0II/P8+4ONr5mwacGUm4
        L1WBS8fnnZroc1JVkbZ1q2wCXm+zAXsjVPOUP41eIULVeydEl9kvqQ6HLRXMOHh7y4eZpJguiTiLL
        kfK+4T5chWxdaI/L86zxNDibjUa2TniEmzcXEO4e/qxUbx4BjnPlS+DjFB91Az5bJD3y0PJsVsdaw
        cyBPqakQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l591D-008cCz-Kw; Thu, 28 Jan 2021 15:15:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 48ED2301A27;
        Thu, 28 Jan 2021 16:15:35 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 3242C21405347; Thu, 28 Jan 2021 16:15:35 +0100 (CET)
Date:   Thu, 28 Jan 2021 16:15:35 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: Octeon: Implement __smp_store_release()
Message-ID: <YBLVF0tliXY2G0XZ@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-2-alexander.sverdlin@nokia.com>
 <YBHp4139X+p+4IZ+@hirez.programming.kicks-ass.net>
 <aace6ff1-9ddf-15af-3c0a-378c53c59acb@nokia.com>
 <YBKhBQQ97f/J6L+u@hirez.programming.kicks-ass.net>
 <b00f945a-1278-5fd2-321c-6ea5f07be128@nokia.com>
 <YBLQ9hbj8Zafjz+c@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBLQ9hbj8Zafjz+c@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 28, 2021 at 03:57:58PM +0100, Peter Zijlstra wrote:
> On Thu, Jan 28, 2021 at 12:52:22PM +0100, Alexander Sverdlin wrote:
> > Hello Peter,
> > 
> > On 28/01/2021 12:33, Peter Zijlstra wrote:
> > > This, from commit 6b07d38aaa52 ("MIPS: Octeon: Use optimized memory
> > > barrier primitives."):
> > > 
> > > 	#define smp_mb__before_llsc() smp_wmb()
> > > 	#define __smp_mb__before_llsc() __smp_wmb()
> > > 
> > > is also dodgy as hell and really wants a comment too. I'm not buying the
> > > Changelog of that commit either, __smp_mb__before_llsc should also
> > > ensure the LL cannot happen earlier, but SYNCW has no effect on loads.
> > > So what stops the load from being speculated?
> > 
> > hmm, the commit message you point to above, says:
> > 
> > "Since Octeon does not do speculative reads, this functions as a full barrier."
> 
> So then the only difference between SYNC and SYNCW is a pipeline drain?
> 
> I still worry about the transitivity thing.. ISTR that being a sticky
> point back then too.

Ah, there we are, it's called multi-copy-atomic these days:

  f1ab25a30ce8 ("memory-barriers: Replace uses of "transitive"")

Do those SYNCW / write-completion barriers guarantee this?
