Return-Path: <linux-mips+bounces-9148-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D04ACA874
	for <lists+linux-mips@lfdr.de>; Mon,  2 Jun 2025 06:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42076189C265
	for <lists+linux-mips@lfdr.de>; Mon,  2 Jun 2025 04:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA28136351;
	Mon,  2 Jun 2025 04:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="cDLc7AG1"
X-Original-To: linux-mips@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ABA182B7;
	Mon,  2 Jun 2025 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748837490; cv=none; b=L37878dKjSGJWh6H7C3iiwwRaTn7cNAskkzzx0xVd5wP9g7N1gdxGryTUhSeC/VmEjqvS8Z7Jg47T8k9NMQrDArdt28wRSDapEJsr/MVSgXdsxL97gxjuja1UmieWoLtQSw4D8KXi6hR2h4MmBlCzPTYVABM4OaPlFlbQGD5RQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748837490; c=relaxed/simple;
	bh=VNUqtAL1SHKb0pozQoeZywC6qZxi9oGNe5rRKbOsy4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biseBkn2Y23CItRRBVvCR4j8+4WkWsZP3wcAcZ9CKxU1Jm0DyzouZiMdZoEb1AEwAOybmqXY4GdbCBndC9f2dDedKD1tuNYeQpfbSaUxfgnhHHqtyrjHUuA9trfjY0Pwa6BD4jC6CZr4AJHmY2XDsriuUY2PzQ8aG5jYMHkp9H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=cDLc7AG1; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iuH08HhCzFKCMOC8/O0swKDH+rpWOadfk7Rm4fI946Q=; b=cDLc7AG1xVeGrDIh1peeN0IWEk
	zSPl9poJhEGT0YoB/3XnvH6rSM6bY3xjL0IUqjUntiObN7RMhtlCPHuD3A62GgdK0UEACC5R8vd1k
	nGJkZRQS6J7IpGD5Cac8ckt2eGuQw0ldn0T1SIMMph5HBpFztRTyZBhVmy8+xkbQoA7OwVtDKj3OZ
	76BRcTLzVJZLqbCzOHiBTXoFLI5gsn+T2zZ4MU1RCovTNxA1K7wQ4w3A4hqY1qW3qspeqQLRXJ12A
	qO/+nks1w4qOwDF7mdiodEdOvdFTMW5W0MgrK6eRVtCQ084Z11K100prR+Fy/v0Uyq+f2T84t8Tki
	2y66Yf/A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLwW6-0000000BUl8-1UDJ;
	Mon, 02 Jun 2025 04:11:18 +0000
Date: Mon, 2 Jun 2025 05:11:18 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linmag7@gmail.com, Al Viro <viro@ftp.linux.org.uk>, arnd@arndb.de,
	chris@zankel.net, dinguyen@kernel.org, glaubitz@physik.fu-berlin.de,
	ink@unseen.parts, jcmvbkbc@gmail.com, kees@kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	mattst88@gmail.com, monstr@monstr.eu, richard.henderson@linaro.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Sam James <sam@gentoo.org>
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
Message-ID: <20250602041118.GA2675383@ZenIV>
References: <87cyfejafj.fsf@gentoo.org>
 <87v7rik020.fsf@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7rik020.fsf@gentoo.org>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sat, Apr 05, 2025 at 06:09:11PM +0100, Sam James wrote:
> Sam James <sam@gentoo.org> writes:
> 
> > Lovely cleanup and a great suggestion from Al.
> >
> > Reviewed-by: Sam James <sam@gentoo.org>
> >
> > I'd suggest adding a:
> > Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> 
> Al, were you planning on taking this through your tree?

FWIW, I expected it to get sent to Linus as "please, run this
sed script before -rc1" kind of thing, script being something
like

sed -i -e 's/int pte_swp_exclusive/bool pte_swp_exclusive/' \
	`git grep -l 'int pte_swp_exclusive'`

with suggested commit message...  It's absolutely regular and
that kind of tree-wide change is easier handled that way.

	Oh, well...  To restore the context: Magnus had spotted a fun
bug on Alpha back in February - pte_swp_exclusive() there returned
pte_val(pte) & _PAGE_SWP_EXCLUSIVE as int.  The problem is that
_PAGE_SWP_EXCLUSIVE is 1UL<<39 there, with obvious results...

	I looked at the originally posted patch and suggested to
make pte_swp_exclusive() return bool instead of int.  All users
are in explicitly boolean contexts:

include/linux/swapops.h:        if (pte_swp_exclusive(pte))
mm/debug_vm_pgtable.c:  WARN_ON(pte_swp_exclusive(pte));
mm/debug_vm_pgtable.c:  WARN_ON(!pte_swp_exclusive(pte));
mm/debug_vm_pgtable.c:  WARN_ON(pte_swp_exclusive(pte));
mm/internal.h:  if (pte_swp_exclusive(pte))
mm/memory.c:            if (pte_swp_exclusive(orig_pte)) {
mm/memory.c:            exclusive = pte_swp_exclusive(vmf->orig_pte);
mm/swapfile.c:          if (pte_swp_exclusive(old_pte))
mm/userfaultfd.c:               if (!pte_swp_exclusive(orig_src_pte)) {

	Magnus posted patch of that form (see
https://lore.kernel.org/all/20250218175735.19882-2-linmag7@gmail.com/),
got no serious objections and then it went nowhere.

	Bug is real and fairly obvious, fix is entirely mechanical and
affects one line in each asm/pgtable.h out there.  Linus, could you
run that sed script just before -rc1?  Commit message from the patch refered
above looks sane:

mm: pgtable: fix pte_swp_exclusive

Make pte_swp_exclusive return bool instead of int. This will better reflect
how pte_swp_exclusive is actually used in the code. This fixes swap/swapoff
problems on Alpha due pte_swp_exclusive not returning correct values when
_PAGE_SWP_EXCLUSIVE bit resides in upper 32-bits of PTE (like on alpha).

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>


