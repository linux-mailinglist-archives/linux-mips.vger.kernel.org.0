Return-Path: <linux-mips+bounces-7060-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DED79F4773
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 10:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3096B18930A5
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2024 09:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0B81DEFF3;
	Tue, 17 Dec 2024 09:22:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CCB1DEFFD;
	Tue, 17 Dec 2024 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427372; cv=none; b=CgzTcSP+Io9R0UVxFKrT+1uaTsI6RLXRo+SJ5PfvEC0morpocpNfUTHHhDKVTJRpOEmj+6RiTM4HjzUMo7/v3PoTXJW+6et9zQ1DT6QRTv9eAV+7HYHvK0mx0bzfwEQ0IGwBi25r6QowpyoOm9F2fh9S56W77wt3lWFErtFRaFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427372; c=relaxed/simple;
	bh=sj4y/EUGEEXlubLyVcCbHTkTIUkhDDhZvrESCrc0LOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQJ7hw2HF+yhAS5wAjAGPoS8Q5vlT9aHrtUdBPaAvkADR3SB+GVS8MUHC5XucdVUWRDs3NiQkibuDl46rmtQcltS4K5mPMSR5E92lNqTw59dzTKUoM/CjezKH7587jVabWreZVjSI1JxcspuZ5HyULvDxDZNZ0SZWGmYMlXDFIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tNSst-0002dn-00; Tue, 17 Dec 2024 09:24:51 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 8B24FC0110; Tue, 17 Dec 2024 09:23:07 +0100 (CET)
Date: Tue, 17 Dec 2024 09:23:07 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: update mips to use do_mmap(), make
 mmap_region() internal
Message-ID: <Z2E06z9yw+/Jb4Yo@alpha.franken.de>
References: <cover.1734017293.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1734017293.git.lorenzo.stoakes@oracle.com>

On Thu, Dec 12, 2024 at 03:36:45PM +0000, Lorenzo Stoakes wrote:
> Currently the only user of mmap_region() outside of the memory management
> code is the MIPS VDSO implementation.
> 
> This uses mmap_region() to map a 'delay slot emulation page' at the top of
> the stack which is read-only and executable.
> 
> This mapping requires that an already-acquired mmap write lock is utilised
> and that uffd and populate logic is ignored. This rules out vm_mmap(),
> however do_mmap() fits the bill.
> 
> Adapt this code to use do_mmap() and then once done, make mmap_region()
> internal and userland testable, and avoid any other uses of mmap_region(),
> which is absolutely and strictly an internal mm function which bypasses a
> great number of checks and logic.
> 
> REVIEWERS NOTES:
> 
> Thomas - I lack the hardware or set up to test this beyond a simple
> cross-compilation test, so I need some input from you MIPS guys as to
> whether this is workable.
> 
> I've therefore sent this as an RFC so we can be sure this is suitable!
> Please could you check to make sure this change is OK and I haven't missed
> anything?

conversation looks correct, but this patch doesn't apply to upstream v6.13-rc1.
Which tree are you using ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

