Return-Path: <linux-mips+bounces-7709-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A35A2D478
	for <lists+linux-mips@lfdr.de>; Sat,  8 Feb 2025 08:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8850816883C
	for <lists+linux-mips@lfdr.de>; Sat,  8 Feb 2025 07:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0551A4AAA;
	Sat,  8 Feb 2025 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Aq7ElquE"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D3A3BBE5;
	Sat,  8 Feb 2025 07:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738999398; cv=none; b=Rv5xVJX8fb3KfwduZh8Tayjpr7Y0lVU7tHfcIr5VspCK+BxNmV+9bU7PySAlW6rMThzLWyxRgM4fLKqq5DXbCAdw3D9fC3/BlHOJaDl/TfNx4bGyZK3xreB1ApyOv5dmJ4aJZhiKXuYnHQY4PK7AH3eKzK69J+5unGa7icPYmno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738999398; c=relaxed/simple;
	bh=SQVJlEx2V/RSeXfcXkikh7h+w57xN8e7Hv78bAbfxJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAsU82JLsGAXeXtM1dbdf6ixpS3mm0t5vzUuNKioJT5CjUVKmfkHodNjqbfnmrP90qeeJZ5Vsr1L5ynBrEBd0kNZ+Oe1fK5n/s8oswBkZFpHw8d8VLaYMdmyZC7HFV9tF6IPHDt+2g5TLHErnsMRRUR8xa3SJ2HtEbdhFdOVTJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Aq7ElquE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dIUTnKlqptBhVh4FHbYoQplL5I5DQEoGc3UGevcbKYc=; b=Aq7ElquEb4PU458vaoh2BURefq
	0XGupeL+Ea5a1zbTs9mHs4isuqu4YDjsFkA4psNsUKV2IVtFGihdFzB3J4BlS1lx6yz2RbyKBPzLQ
	q5ug1G3UoBjgjdjZJ8pDtcbs+0u9J4m2W1Iyo6sUbB6qG+Wy0ywQUlWoMnSn8OmDM2h3cb8/NuufT
	bw6tV0V3F/oz2+8ixkTFko2xzqDuL2B9JR1G1aO/JW0eMEN6zXuMA2HAuspE0AAPA0iEyLWFwxwXY
	h9ZeDE/095r6pBz9fJ78gD+4ccGeRpRxZN3tn2b/eY9RppD2xLfz/F6OIiBJtZ6ZGQIYD7hJA/Ade
	hnrUUgrg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tgfAx-00000009uJj-3bg7;
	Sat, 08 Feb 2025 07:22:51 +0000
Date: Sat, 8 Feb 2025 07:22:51 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>, kevin.brodsky@arm.com,
	riel@surriel.com, vishal.moola@gmail.com, david@redhat.com,
	jannh@google.com, hughd@google.com, yuzhao@google.com,
	muchun.song@linux.dev, akpm@linux-foundation.org, will@kernel.org,
	aneesh.kumar@kernel.org, npiggin@gmail.com, arnd@arndb.de,
	dave.hansen@linux.intel.com, rppt@kernel.org,
	alexghiti@rivosinc.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org, x86@kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/5] remove tlb_remove_page_ptdesc()
Message-ID: <Z6cGS__8VRQdzAYA@casper.infradead.org>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
 <20250124114759.GB15996@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124114759.GB15996@noisy.programming.kicks-ass.net>

On Fri, Jan 24, 2025 at 12:47:59PM +0100, Peter Zijlstra wrote:
> Right, so I don't think Sparc and Power care to use ptdesc, they're
> using non page page-tables.

i think you mean s390, not sparc.  all architectures _use_ ptdescs,
it's just that s390  and ppc use fractional ptdescs rather than an
entire ptdesc for an individual page table.

eventually we can change that, but we're looking out perhaps five years
before we can allocate a ptdesc for a sub-PAGE_SIZE quantity.

