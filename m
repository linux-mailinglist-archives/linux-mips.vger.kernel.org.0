Return-Path: <linux-mips+bounces-11200-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D6B518D2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 16:06:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B47BB5646FC
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 14:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F3C324B3C;
	Wed, 10 Sep 2025 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dofEW7af"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA36322A13;
	Wed, 10 Sep 2025 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513101; cv=none; b=E7KYKkddd3zkZkMhB4yXmMfHDHOEPsunDDQ4FOsFJRjt5Kdh29roXxS+ngFwelHyF3IbsXnf+4+mbY+AiH09K0OheawTuOE8FqzXjqg593rydy+NEfw5mK60KtdMEJEIJFpRF6GrGtrsGMhs4wMkRti/nDE21WU2atB0bgDqTXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513101; c=relaxed/simple;
	bh=Ue/nhc+rd9GaJbE14Zs0vWlm6GxxSExENpYlLQYUyQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNsiK2gnYoz/J5srbCEhNn14SUxJmk5L2kv3OWIJiiQLe1LdBAPgUz3SpSGf9TA3b0L59xka/MC123BAtycwvbOpwGJtAAQlDP5YuDvQxiIVDVWuTFaQ4x1X9YW48LkzDFgy/5FhYBmTwHSPJbbRL7teaUDvo3JrHwWyzcqd1Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dofEW7af; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mKSB+4xL7cCmeYE/ZtEdtCjsvm7CIgVIfr0teJIjFAU=; b=dofEW7af/ejhmNipPt2aD1zjQc
	r/T1X53PF0e+BEfGBFGmptVoarxZBEN1Hr7xriD76R1w+M+nvAcyFt2PcHdzuHg+TQmoMQFUdBQaA
	jm/o6jj1rPqB5i/QW6QVLU4W6O2YAUS0S3TvZPMLDfVQol1YTS76QR+/j8xxBFEpwnMLWAqId4scS
	bdUpC9Pcr4BH4JRwC/mCjcKWJe0ye/ZaEnL2OllK0B+92NxsmXiDMXLQP/kJYOtEetOYDdThozbzr
	U+eiVsgCMI71Rea2iE366+z3/3jQiRamjgJEHnieliGZegYbRdaVVmJTC4g6lcXbzYemC7sUUzZ3A
	gI/iBz2w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLRO-0000000A1bz-3lAQ;
	Wed, 10 Sep 2025 14:04:54 +0000
Date: Wed, 10 Sep 2025 15:04:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <aMGFhuHyQwtwyF7B@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>

On Wed, Sep 10, 2025 at 03:10:05PM +0200, Linus Walleij wrote:
> This is is done so that we can unmap *most* of the kernel
> memory but *keep* the VMALLOC area, so that e.g. exceptions
> can still execute and save to stack when they occur, and we can
> call into the kernel to execute said exceptions.
> 
> This in practice means the area 0xf1000000-0xffffffff
> which also includes the high exception vectors that must for
> natural reasons also be kept in the mapping.
> What we have mapped today (all of the time) is
> 0xc0000000-0xffffffff.
> 
> A minimal 256 MB mapping from 0xf0000000-0xffffffff
> should be able to cover this.

Can I ask where the MMIO (PCI?) window lives?

