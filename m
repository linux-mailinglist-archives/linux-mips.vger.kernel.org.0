Return-Path: <linux-mips+bounces-11265-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B6B54F2B
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 15:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED40EA01782
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 13:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3992C30DEA5;
	Fri, 12 Sep 2025 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V7hbJdPn"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0083F9E8;
	Fri, 12 Sep 2025 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757683026; cv=none; b=Y+RqULmZu5v9VlwtptuHe4c+54mGu2UEKArs+OyQcdoaPyr1l2qkX81wtG/0QuS+Dlkga+nvepqIBQ2ifUl270P0szvYSEe9UuCCuDsqQnbIEtGXXa8RyhUF66wmGzxgWtqtlGiOfYmC/2rL4YR7+l/E+hBGKkynbslLHQojKYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757683026; c=relaxed/simple;
	bh=7xIMcP92jiQAPxq5/zSswUfSlfX6znUZnWJVD4xQfjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCl00HmcObw4yWrneZSeSPu2beL5k21RcMPX6JSePNrBgweSWoD75Up0L/qEjjq7hWaSUYd9850NQ5N6vsY+aGUMjic/XVFOgAuzgok+ggyB7cnL25/+1ZLwMCokwlbHTA4rwmA4LjS7PksAGFNzqoItAQOojm73V+7ZB+47rHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V7hbJdPn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O1QwMEVkzC77rV7TEVB4ZQxwruyo9VsaKM2Zj3Ph0wQ=; b=V7hbJdPnNgBvGak31eOz58Mf1P
	otiV4vFRfmengjQC3i3FF81bSu7SfBAe1eqxiJzNTi1R4gLaN8u0wpffGkz1JpY9jt3Yom4hqcBia
	EH96uZOoSoxiTz2Zj9io0vk5m2EHlsDzoA0vREw85DvJq2B06EH11KXlog8cNmVcJCJG39zhOd8bH
	mw/2V1agjKxuu9Vbd/bpA2oQZ2D7UqzEV3AGXt9sdRGaY3X9Wj3XwpXZotScYIF+ba+xeGTIUi/TN
	VO8oGIY/qzBSbT23U9PZt7aVPiRKyyRiP8iuAoGvZoxA6fv7XIBlghM+z0k6GaIFOdVxXRMVL3YMB
	LcM8h7vA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3e1-0000000GJeP-3Q7n;
	Fri, 12 Sep 2025 13:16:53 +0000
Date: Fri, 12 Sep 2025 14:16:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <aMQdRfcMGGZQrW1_@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
 <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E986779F-C7AA-4940-9508-08601EE2FDD0@zytor.com>

On Fri, Sep 12, 2025 at 02:58:48AM -0700, H. Peter Anvin wrote:
> On September 10, 2025 10:38:15 PM PDT, Andreas Larsson <andreas@gaisler.com> wrote:
> >We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
> >used in LEON sparc32 configuration (using 36-bit physical addressing), a
> >removed CONFIG_HIGHMEM would be a considerable limitation, even after an
> >introduction of different CONFIG_VMSPLIT_* options for sparc32.
> 
> It really sounds like a self-inflicted problem... getting your customers switched over to the RV64 side is probably the best you can do for them.


"We only support configurations above 4GB when using the RV64 core".

