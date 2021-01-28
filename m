Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0BE3074EA
	for <lists+linux-mips@lfdr.de>; Thu, 28 Jan 2021 12:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhA1LgR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Jan 2021 06:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhA1LgL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Jan 2021 06:36:11 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F275BC061573;
        Thu, 28 Jan 2021 03:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=LCSTN/8UXDjc9AWCkufvaxBnoH23ssm9PIa6OBZWVs0=; b=Cs0nt6FA04WRG52BZoaUgEgEPt
        VZFJKD3444qcF2NNe9YJrruWaMuR/U5pQHvDLDf8mDgiu1JcEk8wiMaV7+yenOEMVNtE6q6OodtS7
        xLHF9QA7GUAAswa7Xc01lIRgxXF1zRJzRTJiMrraYzReyT399x2H76IHkwhr1hvTbPMs40EN6gOCI
        izk1SPEvpoFiBIYneJyOv6YAoxJyIxKdgoIDB0xkCMC6lBTydSTPjeeUO2A2fEn6yt7SLibVF2xp4
        t9piKrKQM45FC4ODTvRiHxwEt1UDswfRPDtbOtfidkVifVHrB3EiAZDCXepn8h4DGI73/4g8j/46W
        /JtZP+GA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l55Zr-008Od5-Sy; Thu, 28 Jan 2021 11:35:10 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5A5933028C8;
        Thu, 28 Jan 2021 12:35:07 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 42DD121A78F54; Thu, 28 Jan 2021 12:35:07 +0100 (CET)
Date:   Thu, 28 Jan 2021 12:35:07 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>
Cc:     Paul Burton <paul.burton@imgtec.com>, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Will Deacon <will@kernel.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] MIPS: Octeon: qspinlock: Flush write buffer
Message-ID: <YBKha2GRFWyYp+Lz@hirez.programming.kicks-ass.net>
References: <20210127203627.47510-1-alexander.sverdlin@nokia.com>
 <20210127203627.47510-4-alexander.sverdlin@nokia.com>
 <YBHqeXPMILg+352D@hirez.programming.kicks-ass.net>
 <f492b29b-32a4-b4d4-a5d3-0d0dd8a56b5a@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f492b29b-32a4-b4d4-a5d3-0d0dd8a56b5a@nokia.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 28, 2021 at 08:29:57AM +0100, Alexander Sverdlin wrote:
> Hi!
> 
> On 27/01/2021 23:34, Peter Zijlstra wrote:
> > On Wed, Jan 27, 2021 at 09:36:24PM +0100, Alexander A Sverdlin wrote:
> >> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> >>
> >> Flushing the write buffer brings aroung 10% performace on the tight
> >> uncontended spinlock loops on Octeon. Refer to commit 500c2e1fdbcc
> >> ("MIPS: Optimize spinlocks.").
> > No objection to the patch, but I don't find the above referenced commit
> > to be enlightening wrt nudge_writes(). The best it has to offer is the
> > comment that's already in the code.
> 
> My point was that original MIPS spinlocks had this write-buffer-flush and
> it got lost on the conversion to qspinlocks. The referenced commit just
> allows to see the last MIPS-specific implementation before deletion.

Hardware that needs a store-buffer flush after release is highly suspect
and needs big and explicit comments. Not vague hints.
