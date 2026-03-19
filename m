Return-Path: <linux-mips+bounces-13786-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L/eBHArvGn4twIAu9opvQ
	(envelope-from <linux-mips+bounces-13786-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 17:59:28 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0002CF424
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 17:59:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 823693047EB0
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 16:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D263BED06;
	Thu, 19 Mar 2026 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgTWHgcw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE69358377;
	Thu, 19 Mar 2026 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939024; cv=none; b=rf+3aZxUABS0lQ9whH7sKY/IToDGrdBZOHCjQzmHIL/+sNb8WsFajNF5RPDZGV0sHwzyj99IoeSaF61J9NTdx8qIvLuoCP9QMHjP2+byzfhok5SYKXXLT2Dh85OuRVJZUJkT0hrRK6+iR0FYaWFGwKf8tGJP3CmnROxJaXxB4Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939024; c=relaxed/simple;
	bh=ySKX/SdqeoTiP9pwQcgZ94qbw5sb0oTPtV3x6ZUzB64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPUjHnPPDEpuEw61UzmcX/x4Z6M3OPnacSupKwixg7EE57UEgztIGMrLe6AH2+OtKpeBKkiFhRviHEpEqPE+pjY5DGkyPaTdx/y/2YhZMWby2T5QRi7JPZKKo0n0DpmA1Fi7S4NSxoiRBn76CYmUUL1Mvll4hB8VQ3oRnaQUQ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgTWHgcw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41945C19424;
	Thu, 19 Mar 2026 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773939024;
	bh=ySKX/SdqeoTiP9pwQcgZ94qbw5sb0oTPtV3x6ZUzB64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YgTWHgcwTFKs1gBYxdYW33eFt5gNoD63sWPX8mdYVejWbKUuDdrFkJsiURNl6lSLi
	 XYkJpx/wRyyEkQGRCONtUVwp8dlhSmjpJmDCO67CtepROdANquLF914vAvs8F03t4f
	 bTPzUwW9A/1agL8G//3eqOLaaV9TNMSiL0J0t6/c4zk5axQdTYHz2ZOVPKnbSwlk6K
	 qocxlmnDCy6A8nO8NHNs/bLSd9OhmFGiAmqwSf3sFUuUX0nCndmYw9sGuphDXOX2tS
	 i4TA+BApsD8Pt+tqXbprswARO/rjXi7FaX5y7BenKplS9DF3okpkWVua6BEbY/FEZi
	 KOJGjMYMEW9VA==
Date: Thu, 19 Mar 2026 16:50:08 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Kees Cook <kees@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@suse.com>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH v2 01/23] mm/vma: add vma_flags_empty(), vma_flags_and(),
 vma_flags_diff_pair()
Message-ID: <3cf675e3-d333-45f1-bcf9-466c7b16f916@lucifer.local>
References: <cover.1773665966.git.ljs@kernel.org>
 <ede9b0f8a2e2dc72e7fbc1a0ddbeb513364c28a2.1773665966.git.ljs@kernel.org>
 <4620167c-bcfe-414b-85f6-a5d28563b9af@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4620167c-bcfe-414b-85f6-a5d28563b9af@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-13786-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lucifer.local:mid]
X-Rspamd-Queue-Id: 1A0002CF424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 03:40:45PM +0100, Vlastimil Babka (SUSE) wrote:
> On 3/16/26 14:07, Lorenzo Stoakes (Oracle) wrote:
> > Firstly, add the ability to determine if VMA flags are empty, that is no
> > flags are set in a vma_flags_t value.
> >
> > Next, add the ability to obtain the equivalent of the bitwise and of two
> > vma_flags_t values, via vma_flags_and().
>
> Nit: "two values" is vma_flags_and_mask(), while vma_flags_and() takes one
> value and list of flags, no?

Sorry missed this. Yeah should be 'via vma_flags_and_mask()', or a better
description of vma_flags_and() :)

>
> > Next, add the ability to obtain the difference between two sets of VMA
> > flags, that is the equivalent to the exclusive bitwise OR of the two sets
> > of flags, via vma_flags_diff_pair().
> >
> > vma_flags_xxx_mask() typically operates on a pointer to a vma_flags_t
> > value, which is assumed to be an lvalue of some kind (such as a field in a
> > struct or a stack variable) and an rvalue of some kind (typically a
> > constant set of VMA flags obtained e.g. via mk_vma_flags() or equivalent).
> >
> > However vma_flags_diff_pair() is intended to operate on two lvalues, so use
> > the _pair() suffix to make this clear.
> >
> > Finally, update VMA userland tests to add these helpers.
> >
> > We also port bitmap_xor() and __bitmap_xor() to the tools/ headers and
> > source to allow the tests to work with vma_flags_diff_pair().
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
>
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>

