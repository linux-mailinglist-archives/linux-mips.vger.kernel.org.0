Return-Path: <linux-mips+bounces-7608-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B559A1DA16
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 17:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5131888F4D
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 16:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26519433CB;
	Mon, 27 Jan 2025 16:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="an/mRK4i"
X-Original-To: linux-mips@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426152AD21;
	Mon, 27 Jan 2025 16:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737993773; cv=none; b=C2L4TApDzRPPIta5M3F4uVy9Ai5rCIVefUu7uhQxJNwqJt0pb5SQ3mGUAAwbJJYwiVOtMaCVxZUsXZZobHMHAQbU3EWW1ZG+0YXnc2f7X/kCWc3tKMJaMXqaZQKG9CJps6ssdPEFtcyNeu0iCoVipYhHBMf45RT4oeXY+6f7OOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737993773; c=relaxed/simple;
	bh=kcQe7aG2j2Myj05tFg2s8RbzUcJCMxaTNaK+Rxg8E4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2ldUt5ivyupnRZYkw92QppkH6VYnKFHWOWZjwcw9Ol/vp/awhIQ5GupZdyBrfUUWLSqjiQxkUqi5bWmc45s2yhMF6HXaASagFHfIVE4p4xznCc1iFUk2UELSa0lQIt/Q2UCBHasTMiM1OnDJjKSFghldc5AAbxe5p3NMwxQRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=an/mRK4i; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SXnX6yfCJ4lo25sKBuf0Jih5OsMg7kJt7yHBT/wi2JQ=; b=an/mRK4icZzCqPPHMN609Ff0wL
	Qs2pgoOW69THhWB5T5gY6nH/4fK6Y72Gx049NYy4Jjyug2T3/ZqGxinuzmLsukap/98K7qe6Bqwy6
	7MFOHakKvuHQ9yFf/ZaTeVhJH7QQNtJt3R+A5YsNVDHyFh2+dFXHFqOqCuLPafjvgw/Ko394Ybr25
	5i168RQSG388+3kPTU4tUR6sth73mFYsatyAk065qko7xleaRiAMsQW6PIOD1KtmnXAMGvNjM/h8P
	qmlTj2NGgL7VPHXjuGCxbahpRIiTN3LvPQJXH47YXPZraFzPsPy0cSXa1hMT4QUnZnKtVWB2tSt2P
	1b8AU+gg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRZN-0000000Eiwv-24hm;
	Mon, 27 Jan 2025 16:02:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 145F93004DE; Mon, 27 Jan 2025 17:02:37 +0100 (CET)
Date: Mon, 27 Jan 2025 17:02:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kevin.brodsky@arm.com, riel@surriel.com, vishal.moola@gmail.com,
	david@redhat.com, jannh@google.com, hughd@google.com,
	willy@infradead.org, yuzhao@google.com, muchun.song@linux.dev,
	akpm@linux-foundation.org, will@kernel.org, aneesh.kumar@kernel.org,
	npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
	rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org, x86@kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/5] x86: pgtable: unconditionally use tlb_remove_table()
Message-ID: <20250127160236.GJ16742@noisy.programming.kicks-ass.net>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
 <00bf7935d65826eee547ac195d7854b1c946dbc5.1737637631.git.zhengqi.arch@bytedance.com>
 <20250124113854.GA15996@noisy.programming.kicks-ass.net>
 <45651097-c056-49e3-9cc8-c289c1c0030d@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45651097-c056-49e3-9cc8-c289c1c0030d@bytedance.com>

On Fri, Jan 24, 2025 at 09:00:58PM +0800, Qi Zheng wrote:
> 
> 
> On 2025/1/24 19:38, Peter Zijlstra wrote:
> > On Thu, Jan 23, 2025 at 09:26:17PM +0800, Qi Zheng wrote:
> > > If the CONFIG_MMU_GATHER_TABLE_FREE is disabled, the tlb_remove_table()
> > > will fall back to pagetable_dtor() + tlb_remove_page(). So let's use
> > > tlb_remove_table() unconditionally to free page table pages.
> > > 
> > > Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> > > Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > 
> > I think we can clean up more :-)
> 
> Yes, but Rik van Riel has already done the same thing in his patch series
> [1], so I was originally planning to wait for his patch to be
> merged into the linux-next branch, and then rebase this series onto his
> patch.

Duh, yeah, I've actually seen those patches and totally forgot he did
that... -ETOOMUCHEMAIL :/

