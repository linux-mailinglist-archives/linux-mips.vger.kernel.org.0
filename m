Return-Path: <linux-mips+bounces-11422-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CAB7D8C9
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 14:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3830A3A42CC
	for <lists+linux-mips@lfdr.de>; Wed, 17 Sep 2025 11:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED1B2E6CB5;
	Wed, 17 Sep 2025 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qRDp6TyL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qXsXFJUG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qRDp6TyL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qXsXFJUG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7102E0B5D
	for <linux-mips@vger.kernel.org>; Wed, 17 Sep 2025 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107546; cv=none; b=OEWBVwIKIKIl7hBQENbhk6qS6Epyz1XM6ew4B4VY6VdinzjzCzy8QLKxEpiqPjtkqQqMaOg10x/g8H7QfvQQJyppTkRnoVIrFaMp0cwg49Y1DDt2831iEfBdRto0FZn7aM8Lt9JH+yivDM9IWSDeEiVwK1+ovIyJPpPgHxBsm68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107546; c=relaxed/simple;
	bh=NQfY+SprSXLyPq3eJMFyQdhX7konENPtq9Plg9em2mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ywy4RPb0EOgN5r5Pm9/6FjMY+G6Q1edSsk5jDENVAZUmUBE0CIDaTwm0h69BzHHLiEXMxFgYCz3iF7FXK1CZCpsV5fXqebns4dqIKSHz26n5mYYr8Og1ZvkxDN6TXNGbKZisRXniRMf6LTBAWPjO8/34m8Nh2zV7Cm0rjQtxFQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qRDp6TyL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qXsXFJUG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qRDp6TyL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qXsXFJUG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9120A1F7B8;
	Wed, 17 Sep 2025 11:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758107542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlHRHVHtHHtuuDqiW+QVhwCo9b5r8skmryrvZTDKlw8=;
	b=qRDp6TyL80LuJ4tMZvgKAmj8yXTrwYKIhNs5bqbLNAGiZQiJ+EpFejI3viuKISLeK2aUSW
	UV6hEmeha1xrUMXqimuA6nOF4oXhscwJpjLOCW7JNsMh8sp9f1QdyfIcA+jv9qOfo7WIub
	snNW9rF695OrEwT2/Xwm2ndPKK/6ljE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758107542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlHRHVHtHHtuuDqiW+QVhwCo9b5r8skmryrvZTDKlw8=;
	b=qXsXFJUGGX96shLz4Web5WHYiKLK6P1KIVDe5fic2PzZsrfigCFNZePQdSaMNUe/nxYUDQ
	RhxoO7Oh0pwJAEAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qRDp6TyL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qXsXFJUG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1758107542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlHRHVHtHHtuuDqiW+QVhwCo9b5r8skmryrvZTDKlw8=;
	b=qRDp6TyL80LuJ4tMZvgKAmj8yXTrwYKIhNs5bqbLNAGiZQiJ+EpFejI3viuKISLeK2aUSW
	UV6hEmeha1xrUMXqimuA6nOF4oXhscwJpjLOCW7JNsMh8sp9f1QdyfIcA+jv9qOfo7WIub
	snNW9rF695OrEwT2/Xwm2ndPKK/6ljE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1758107542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qlHRHVHtHHtuuDqiW+QVhwCo9b5r8skmryrvZTDKlw8=;
	b=qXsXFJUGGX96shLz4Web5WHYiKLK6P1KIVDe5fic2PzZsrfigCFNZePQdSaMNUe/nxYUDQ
	RhxoO7Oh0pwJAEAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B4E01368D;
	Wed, 17 Sep 2025 11:12:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MRcsO5KXymghRQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 17 Sep 2025 11:12:18 +0000
Date: Wed, 17 Sep 2025 12:12:17 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>, 
	Guo Ren <guoren@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Nicolas Pitre <nico@fluxnic.net>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@redhat.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Dave Young <dyoung@redhat.com>, Tony Luck <tony.luck@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Dave Martin <Dave.Martin@arm.com>, 
	James Morse <james.morse@arm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Jann Horn <jannh@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev, 
	kexec@lists.infradead.org, kasan-dev@googlegroups.com, Jason Gunthorpe <jgg@nvidia.com>, 
	iommu@lists.linux.dev, Kevin Tian <kevin.tian@intel.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 07/13] mm: introduce io_remap_pfn_range_[prepare,
 complete]()
Message-ID: <hfczgna46ok6zvh3xxgzdhf5t5nzqybpxkmvuulbzncagmgrcy@ase57zw2xsj5>
References: <cover.1758031792.git.lorenzo.stoakes@oracle.com>
 <3d8f72ece78c1b470382b6a1f12eef0eacd4c068.1758031792.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8f72ece78c1b470382b6a1f12eef0eacd4c068.1758031792.git.lorenzo.stoakes@oracle.com>
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 9120A1F7B8
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,lwn.net,infradead.org,kernel.org,alpha.franken.de,linux.ibm.com,davemloft.net,gaisler.com,arndb.de,linuxfoundation.org,intel.com,fluxnic.net,linux.dev,suse.de,redhat.com,paragon-software.com,arm.com,zeniv.linux.org.uk,suse.cz,oracle.com,google.com,suse.com,linux.alibaba.com,gmail.com,vger.kernel.org,lists.linux.dev,kvack.org,lists.infradead.org,googlegroups.com,nvidia.com];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_GT_50(0.00)[62];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email]
X-Spam-Score: -2.51

On Tue, Sep 16, 2025 at 03:11:53PM +0100, Lorenzo Stoakes wrote:
> We introduce the io_remap*() equivalents of remap_pfn_range_prepare() and
> remap_pfn_range_complete() to allow for I/O remapping via mmap_prepare.
> 
> We have to make some architecture-specific changes for those architectures
> which define customised handlers.
> 
> It doesn't really make sense to make this internal-only as arches specify
> their version of these functions so we declare these in mm.h.

Similar question to the remap_pfn_range patch.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Looks ok, but again, i'm no expert on this.

Acked-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro

