Return-Path: <linux-mips+bounces-6869-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F249E3FA8
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 17:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35182163EF5
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 16:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FE520C473;
	Wed,  4 Dec 2024 16:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iVKb33xa"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B805C20B81B;
	Wed,  4 Dec 2024 16:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733329786; cv=none; b=KWqI/FALc0v9SetaMIkrRcXtUZ90zofYIGztVIu0CvPO7l7QC3e9u5gC0TLKAhxqi/o32dHAi2IL+cVRKG24ygx63zmhcXpDKaf6ykE6+yWyvSRZjNrpKpPycTewI+uxqtH4RL0PECe945cd1Id1jH6NuFyeiyP/5DBhS1bo/XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733329786; c=relaxed/simple;
	bh=wzBRE8HlaUEeiv5ch2lMybQQt3bwt+QhegToMgwfLlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYX9P1hVnQs9qJ9xCy+IY+e3dOpZoXqBB8zPFrrMkLKO/dRSvMewetMzfETs8ZZcWQN31pNqeDP8kDYJWEHzqDVw+SdKikXa/VVEyWg4Pjhn+Z/EaU9abb1uo80KuYTb/d23eCJduiZhu3Omoh2UMiproeh2DOHXXDWPrG1w2bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iVKb33xa; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TeDvk+DFUy0cyWi8NwkWYJIWousmkq2THX+IF1OUp5Y=; b=iVKb33xackS5QtKM5CqC2T8yST
	0WrYqXFh2LIaPBX85LUhhkeu39J1TXZE28Kopv72bx3FWJFBaAUa2qZE/hb77BInXLtFliE1NA2nW
	bo9yugRexcIpD69ONk1atnG5zCZ1rnk2dxWDM4zag5k8kHduNX1j/oHUmnG+iQ+NvjFiZtZJMJAyn
	r1Hqz0tPa3JmlG8pvinGDKn0+nNmXjebEVV2obmEGOq9Vx/Esh+g8UIml43m1F6CsSPnFHz0fImp2
	pQS12O/eLXRwHz4v461dUc1r/uxDzYK4RKP2iuxc4Aif6ZctuO02rBPqgdhyuDRWM8zDC1hjY2cm1
	y3sk4z9w==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsFq-0000000BeCj-2kGP;
	Wed, 04 Dec 2024 16:29:34 +0000
Date: Wed, 4 Dec 2024 16:29:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	John Hubbard <jhubbard@nvidia.com>,
	"Huang, Ying" <ying.huang@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Alexander Potapenko <glider@google.com>,
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] mm: avoid zeroing user movable page twice with
 init_on_alloc=1
Message-ID: <Z1CDbrrTn6RgNmYn@casper.infradead.org>
References: <20241011150304.709590-1-ziy@nvidia.com>
 <CAMuHMdV1hRp_NtR5YnJo=HsfgKQeH91J537Gh4gKk3PFZhSkbA@mail.gmail.com>
 <DAFE2913-0B32-484F-83BE-080C60362DB8@nvidia.com>
 <f64f8a9e-fda8-4f7a-85a2-0113de2feb6c@suse.cz>
 <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9942C08D-C188-461C-B731-F08DE294CD2B@nvidia.com>

On Wed, Dec 04, 2024 at 11:16:51AM -0500, Zi Yan wrote:
> > So maybe the clearing done as part of page allocator isn't enough here.
> >
> Basically, mips needs to flush data cache if kmap address is aliased to

People use "aliased" in contronym ways.  Do you mean "has a
non-congruent alias" or "has a congruent alias"?

> userspace address. This means when mips has THP on, the patch below
> is not enough to fix the issue.
> 
> In post_alloc_hook(), it does not make sense to pass userspace address
> in to determine whether to flush dcache or not.
> 
> One way to fix it is to add something like arch_userpage_post_alloc()
> to flush dcache if kmap address is aliased to userspace address.
> But my questions are that
> 1) if kmap address will always be the same for two separate kmap_local() calls,

No.  It just takes the next address in the stack.

> 2) how much overheads the additional kmap_local() and kunmap_local() have.

That's going to be a per-arch question ...

