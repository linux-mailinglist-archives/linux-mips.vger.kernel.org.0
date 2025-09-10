Return-Path: <linux-mips+bounces-11173-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FFBB50A6E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 03:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1A6D170761
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 01:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B213B221F06;
	Wed, 10 Sep 2025 01:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f0FcUSZZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD014658D;
	Wed, 10 Sep 2025 01:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757468801; cv=none; b=oknEi1CPL2VCOciZKPPAxQ/5nRgFt6T6Zmaszci6UsRkKQx0NYGJ0aqNCh62lqlT84kQG1lWXW6osadwDoNxsAtfNDXPRMrDwAqFPzbXO+IcC52iDrJKB1OzIo4SZj5/sA5x7GkdFE5crx0Ykhued1m45HmdDlUsars3nwu2ums=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757468801; c=relaxed/simple;
	bh=N6r+NwraDR9bO2wqlxtmcB56JXP9+yvGR4trx8ttnmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PANA5qeFWfJdG0egHQcLtYMgiy1tXyPvI8igso1HQyQaaX+kh34sat2CxfP//oVSa8nuWOM5LA5bxe4W4TkQppM/lRbrYhSf6kSM8SZobKTC4aDHCjwC3G9g5Uu3bMxrqAQF+EzGFqn5HAo6ufROoZKot8bgnSf5uIEGUf1GTuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=f0FcUSZZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iVZDanYB1GEfuIgx7b8oUnFAcvHUmEEb2jsYYOOe4vA=; b=f0FcUSZZjVJBUU1eRiHtLrYC8B
	fX8ygyKP47lN6S0QCXn5v2gT9H3CAbs8IRUKYD4o4ahPPQW9SC1LbIjyzIFy5IpYnJc/Zi35KMKl6
	GdUlF1LCy0kzBtNQT9ZzXDOjZmQlcu+Xai7VaAjWD7/8ywjnmbm5Ol0aHh6nNDZ+nK+u02Mi2LTbP
	KkIhdzSbwdYhFuN6+BCgg6md5Cbqr9Wtb/OQnYkHd+LUsIIIrFqJgd3p4eVkD/vtGMjJRJWTj736c
	yd2K/AZ2RcClBL8DLGKuOfEPa42TkTPx7o/71xbtDzWPW6D8jMVCQK4Hk2xdsrLnqU6R/xPghQ5S7
	5PHe08Rw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw9uo-00000000UeR-417j;
	Wed, 10 Sep 2025 01:46:31 +0000
Date: Wed, 10 Sep 2025 02:46:30 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
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
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>

On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.

I don't mind that the feature remains ... unless it causes us trouble.
Which it currently does.  Perhaps we could start by removing HIGHPTE?
There was a certain amount of complexity introduced into the page fault
path when support for that was introduced.  x86 removed support for it,
so it's just ARM left before we can remove the complexity again.

Most of the other pain points are around storing metadata (directories,
superblocks, etc) in page cache highmem.  I think we can get rid of that
now too.

I don't see any particular need to gt rid of file data stored in highmem,
nor anonymous memory stored in highmem.  And if we're only talking
about hundreds of megabytes of memory, I think anon+ file pagecache is
probably most of the memory in the system already unless you have some
very weird workloads.

Where we may want to be a bit careful is some people have Plans to
reuse the kmap infrastructure to support things like unmapping the
pagecacheto protect against spectre-eqsue attacks.  I know Intel was
working on this when 3dxp was going to be a Thing, but it's recently
been brought back:

https://lore.kernel.org/linux-mm/20250812173109.295750-1-jackmanb@google.com/


