Return-Path: <linux-mips+bounces-12715-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E848CEF277
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 19:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC035300F278
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 18:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9291C30C37D;
	Fri,  2 Jan 2026 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="m4LVIjF3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B0B288C08;
	Fri,  2 Jan 2026 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767377074; cv=none; b=S2xFvuh3QBo29dnRln/1irMEtuaHWuXjghfyTkCgVE+5fMny444E9SzB4FmlrOGIygy7bLBgQLFUoAFD0O2h6sP0uZZWnkBv50vKyJOVdbeZmSNpnMwHbl23S4sxhirxHHd5TxWu+h/+gnshBheK2g+Bt7nHal576dXBHbhQWGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767377074; c=relaxed/simple;
	bh=9Q3BCyqOSN+oJgFNTsghHD+u6iamA25tuC/5QoeUzQI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=duraF7lyrEPP1WZU4yIkiZPZL6RHVlZpevVMUKDvYqbJlQ4s48ngzUn4wzDJ4DuM9yu60mqdMeP0L7xXi0nIK7YMGrfdh+Td9szq6wMVfOYCHcblBdEOFjZDsTHCJf+yKj7y8zeedHfd3tAKyU5yJTZXlPscgxMub/qKCp4KwRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=m4LVIjF3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEB7C116B1;
	Fri,  2 Jan 2026 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767377072;
	bh=9Q3BCyqOSN+oJgFNTsghHD+u6iamA25tuC/5QoeUzQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m4LVIjF3/x1+uJPkmzdQVneFBhdr/tNflWJvzon2aAKXFzapOWWp8T9zfIUe6d3Fu
	 /gElMshb/CMy7xVVdFVFtfq0zPQL7Po74BU1gTpXa7kMFv+gt7F6M9I77NtH9DPO1l
	 PeYULVm06wYXARz/UnbL6bNqJludz4ddsr/It9s4=
Date: Fri, 2 Jan 2026 10:04:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, Dinh
 Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet
 <corbet@lwn.net>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, Oscar
 Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Pratyush
 Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Russell
 King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Suren
 Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH 00/28] arch, mm: consolidate hugetlb early reservation
Message-Id: <20260102100430.623bc1d19b867588bc64f890@linux-foundation.org>
In-Reply-To: <aVdswNM9PUN6Kr8Q@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
	<20251231172714.a7fe44e856c14fdc8fe1cb43@linux-foundation.org>
	<aVdswNM9PUN6Kr8Q@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Jan 2026 08:59:12 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> > > I tried to trim the distribution list and although it's still quite long
> > > if you feel that someone was wrongly excluded please add them back.
> > 
> > I'll add these to mm.git's mm-new branch for some testing.  I'll
> > suppress the usual email storm because 41 * 28 is a lot of emails ;)
> 
> kbuild reported failures on some configurations so I'm anyway going to send
> a lot of emails for v2 :)

Cool, I grabbed v2.

