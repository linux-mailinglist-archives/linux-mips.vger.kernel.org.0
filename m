Return-Path: <linux-mips+bounces-8079-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01881A4D251
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 05:08:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0DA617A6832
	for <lists+linux-mips@lfdr.de>; Tue,  4 Mar 2025 04:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7981EB5E9;
	Tue,  4 Mar 2025 04:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SvBh6xKu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18DABA38;
	Tue,  4 Mar 2025 04:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741061298; cv=none; b=Tm2urJ3lDTRE4EbuveCDXw/6kgOfz1gD4CN13FMSogBCx4S0Lfl1Wb6VPt2qQeT1uIyr5AzWXFExLfXxZjXHxR4A+STEPeHImbenk2OUNMmDI60i0jpnF8OFVi7yBgyiskxPoxebPWdjoEakSEx12sGH+L56s7BA/NaS/GHkFl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741061298; c=relaxed/simple;
	bh=OJc+K+BY2l6V5qT9+IgOwiKvV4q44ADIwUlWFtnBRCQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fN1ApumiYmH3mDw0BX1+psWwNCFigfVaiarrxArA3DuZRqHTrqRArBSu4I9GyICtdic1yR8EY8He8aIWq3jU6PKhloSnya6tr0G1v//KzvimnkrMza01qWacJLusYOIpGkjbzCY3QL/rNphv6a5Aa+/scFsofDvJ60RKK1eegGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SvBh6xKu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356E8C4CEE7;
	Tue,  4 Mar 2025 04:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741061297;
	bh=OJc+K+BY2l6V5qT9+IgOwiKvV4q44ADIwUlWFtnBRCQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SvBh6xKua0O4rbGl5Th2h893FxX7s75aMSK/CI6eO1DqDbPVeGxH+L5gTK/tJ4vje
	 QLYaFB944eCWG2oj9FNuFYy6/4EahBL+GAxWOzP5wMTbXrh24P5KHR5JL+N97R06cN
	 9W9X6UKdyRcG1D0ubqQLtWnF+VBx6UkJKFwVkdEY=
Date: Mon, 3 Mar 2025 20:08:15 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, riel@surriel.com,
 vishal.moola@gmail.com, david@redhat.com, jannh@google.com,
 hughd@google.com, willy@infradead.org, yuzhao@google.com,
 muchun.song@linux.dev, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, arnd@arndb.de, dave.hansen@linux.intel.com,
 rppt@kernel.org, alexghiti@rivosinc.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/6 update] mm: pgtable: convert some architectures
 to use tlb_remove_ptdesc()
Message-Id: <20250303200815.53007fb79e5049a99f24c999@linux-foundation.org>
In-Reply-To: <c48715aa-8c1f-41bf-92a0-bacf401c2f7c@bytedance.com>
References: <19db3e8673b67bad2f1df1ab37f1c89d99eacfea.1740454179.git.zhengqi.arch@bytedance.com>
	<20250303072603.45423-1-zhengqi.arch@bytedance.com>
	<20250303155331.de9b2fff9b04984a255a7bc2@linux-foundation.org>
	<c48715aa-8c1f-41bf-92a0-bacf401c2f7c@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 4 Mar 2025 10:31:07 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:

> 
> 
> On 3/4/25 7:53 AM, Andrew Morton wrote:
> > On Mon,  3 Mar 2025 15:26:03 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> > 
> >> Now, the nine architectures of csky, hexagon, loongarch, m68k, mips,
> >> nios2, openrisc, sh and um do not select CONFIG_MMU_GATHER_RCU_TABLE_FREE,
> >> and just call pagetable_dtor() + tlb_remove_page_ptdesc() (the wrapper of
> >> tlb_remove_page()). This is the same as the implementation of
> >> tlb_remove_{ptdesc|table}() under !CONFIG_MMU_GATHER_TABLE_FREE, so
> >> convert these architectures to use tlb_remove_ptdesc().
> >>
> > 
> > checkpatch warns.
> > 
> > Do these things have to be macros?  Switching to static inline fixes
> > the unused-arg warning in a nice fashion.
> 
> This can be switched to static inline. In addition, I found that alpha,
> arc, microblaze, parisc, sparc32 and xtensa also have the unused-arg
> issue. Do I need to add a new patch to fix all of them, or just fix the
> newly added 11 warnings?

I guess leave things as they are now.  Switching all these to C
functions can be addressed at a later time?

