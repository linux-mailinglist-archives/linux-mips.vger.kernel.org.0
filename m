Return-Path: <linux-mips+bounces-11504-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B4B84DC3
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 15:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3C923A8E2F
	for <lists+linux-mips@lfdr.de>; Thu, 18 Sep 2025 13:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F113303CBE;
	Thu, 18 Sep 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mffiEw3N"
X-Original-To: linux-mips@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFED284688;
	Thu, 18 Sep 2025 13:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202492; cv=none; b=pCmm5Cs+sLJPodfNaNikomFEeiS5clWgNTswOEXW6ZN+8u8iZCdUhgwaxdlGvFLBE8fMtLvqYF31TynHHflv/zs8t8e9QCa8kgEtiE0c6jGPH/AiK9Nh5VIs6EDgUyFlPZsjgGN49M7HHhulZauCHQ9e1e0qM9sscNgqfEuQc24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202492; c=relaxed/simple;
	bh=fbMOsgK3KBan8r6PCrVT0WZEekJpyTiFl1qcW51/sfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqlT2Z6XcVnA+/YiKUB6ufQxmgqxctF8SzieI86pPEuzsSYXN9vxA4IjqvPeAseEGrgEpCeCHzhfHTHTA9L491eXUaDQM9OvLHpp6qHu9VJLUndCW8z/URdO+n10728ad0t6PhFVBOYEgpRXcKazxOjZ/XAnNempihh+HToz+68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mffiEw3N; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2WK7RF7NsYG+8NsyTTvySh7GNGT5jm6UcDa778flAEQ=; b=mffiEw3N0Xsy0iehgYkPk5d+dg
	sWKIhv5XK/zUNW+x7cpwzMKn+fWVigxBkekrLwF/YIOd76oce1YtRzHGNOghxSvsx4TZKrO8BB5yX
	oA6G/OA6kjESeDYNowdA/HoKupolfgZZgm9ZJ1RTWZMa7p8eDc9puB5qodRd9gcxhoms=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uzEmL-008pSt-MZ; Thu, 18 Sep 2025 15:34:29 +0200
Date: Thu, 18 Sep 2025 15:34:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
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
Message-ID: <ca6fc8dc-d1ee-41a8-a1c9-11ed2907207f@lunn.ch>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>

> * Marvell mv78xx0 and kirkwood (armv5 pj1) were fairly
>   powerful in 2008 and could support at least 1GB of RAM,
>   but I only found one machine (OpenBlocks A7) that does
>   this. It's unclear if anyone is still updating kernels
>   on this machine, but they could /probably/ use
>   VMSPLIT_3G_OPT if they do.

If i remember correctly, there was a design issue with the OpenBlocks
A7, and it would not run with its full amount of memory. To get a
stable system you had to limit the RAM. I don't remember if that was
just with the NULL series, and it was fixed for mass production
devices, or they are all broken.

I doubt there are any mv78xx0 machines left, why where never very
popular, but there are still Kirkwood NAS boxes around. I keep mine up
to date, put an LTS kernel on it once a year, update to the latest
debian sid.

	Andrew

