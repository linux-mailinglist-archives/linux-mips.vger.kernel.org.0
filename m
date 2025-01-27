Return-Path: <linux-mips+bounces-7606-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC031A1D6CB
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 14:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 588581886A4F
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 13:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD811FF7BB;
	Mon, 27 Jan 2025 13:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b="vxMygNh9"
X-Original-To: linux-mips@vger.kernel.org
Received: from minute.unseen.parts (minute.unseen.parts [139.162.151.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12D41FC7C5;
	Mon, 27 Jan 2025 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.151.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984517; cv=none; b=qJ990C0VuPDDbcBMODmbNz+xk9G4TXQJANK3ySVEV0skaUT86kLhdd4hWt0aZtN9wz3zam8nP+lfy5w9WtMmCSB+KK5QQzQeK4VglkNDtyIaCGIF9N84Ahg0kFUM4/9wRr8OuqqCMZNqM3gKGxRvUveL5TJVj4iOn10krIggep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984517; c=relaxed/simple;
	bh=wBwfKx9WEzL0Yj7iv2tHVfsT5U2zNVKgBcChzeYkTyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PyDdtjW6KSLkBxa3BACm8yEd8ZqLhUDAm1UOCzaQOCtk+5icY2Jy2tw+8EQSKsX8WJE9YbAz19rXlHnwyen7gyruTXjided0bd2KyIuxyG6Glolj1E1LKsDKroxgHEIzTJdIWbmZwEIqExJmEGOmyFCvYoG17UsOkLEpCBl+g6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts; spf=pass smtp.mailfrom=unseen.parts; dkim=pass (2048-bit key) header.d=unseen.parts header.i=@unseen.parts header.b=vxMygNh9; arc=none smtp.client-ip=139.162.151.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=unseen.parts
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unseen.parts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=unseen.parts; s=sig; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lP0T7f795wt9O6cEneFd8O1nW/DjYKsbv0oA6g5csSw=; b=vxMygNh9DcqVgPttcu5rOL5rma
	mKNKBGDokTrpImq9eHVt5tE+Y6DerEZvh1fQvwX/9MYb/hUzjVdOs6dZAUwUV2qHE8fMoOo5rXtpY
	92uLIk3/0e8YWHLU85jiQt/vZ8uHInePKoQ20rol8dIzRcrms7HJnbXazvx4bFYo12PzDtTAmTWo3
	5CWufywRDqlMjoXh+d6zheKKnV9npvIlRNKATCmoW5DspZpIF25YF7L46olFS1uYzkz+w54XeoAgt
	aBb0qnMPzrKKRYXhRzIFKMwz4wgXG9dYhOhJEChsZkC2SJDZ0MGp3ayzaw1QGy2bSqCbKGq6OKB6A
	amktslmQ==;
Received: from minute.unseen.parts ([139.162.151.61]:40488 helo=minute)
	by minute.unseen.parts with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <ink@unseen.parts>)
	id 1tcP9g-0003AM-1p;
	Mon, 27 Jan 2025 14:27:56 +0100
Date: Mon, 27 Jan 2025 14:27:54 +0100
From: Ivan Kokshaysky <ink@unseen.parts>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Kees Cook <kees@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-alpha@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>,
	Sam James <sam@gentoo.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
	Chris Hofstaedtler <zeha@debian.org>, util-linux@vger.kernel.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH v2] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
Message-ID: <Z5eJ2p5IeNzPDuVH@minute>
References: <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
 <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
 <2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2501120146480.18889@angie.orcam.me.uk>
 <78f3ae1f68842a9d1af62caaac3929834ce6ecfa.camel@physik.fu-berlin.de>
 <87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org>
 <Z4uECl9wQ2sqdKym@minute>
 <5cff63bf0fc9e62772fb24bc919c591acbd10d53.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cff63bf0fc9e62772fb24bc919c591acbd10d53.camel@physik.fu-berlin.de>

On Sun, Jan 26, 2025 at 06:15:43PM +0100, John Paul Adrian Glaubitz wrote:
> Hi Eric,
> 
> On Sat, 2025-01-18 at 11:35 +0100, Ivan Kokshaysky wrote:
> > On Sun, Jan 12, 2025 at 11:39:01PM -0600, Eric W. Biederman wrote:
> > ...
> > > --- a/arch/alpha/include/asm/pgtable.h
> > > +++ b/arch/alpha/include/asm/pgtable.h
> > > @@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
> > >  
> > >  extern void paging_init(void);
> > >  
> > > -/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
> > > +/* We have our own get_unmapped_area */
> > >  #define HAVE_ARCH_UNMAPPED_AREA
> > 
> > Just remove the definition. As the comment suggests, the only reason
> > it exists is ADDR_LIMIT_32BIT, which is gone.
> > 
> > > --- a/arch/alpha/kernel/osf_sys.c
> > > +++ b/arch/alpha/kernel/osf_sys.c
> > > @@ -1210,8 +1210,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __user *, txc_p)
> > >  	return ret;
> > >  }
> > >  
> > > -/* Get an address range which is currently unmapped.  Similar to the
> > > -   generic version except that we know how to honor ADDR_LIMIT_32BIT.  */
> > > +/* Get an address range which is currently unmapped. */
> > >  
> > >  static unsigned long
> > >  arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> > > @@ -1230,13 +1229,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
> > >  		       unsigned long len, unsigned long pgoff,
> > >  		       unsigned long flags, vm_flags_t vm_flags)
> > >  {
> > > -	unsigned long limit;
> > > -
> > > -	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
> > > -	if (current->personality & ADDR_LIMIT_32BIT)
> > > -		limit = 0x80000000;
> > > -	else
> > > -		limit = TASK_SIZE;
> > > +	unsigned long limit = TASK_SIZE;
> > >  
> > >  	if (len > limit)
> > >  		return -ENOMEM;
> > 
> > Likewise, just remove these functions. The generic_get_unmapped_area()
> > works fine, tested on up1500.
> 
> Can you send a follow-up integrating those changes? It would be good if
> SET_PERSONALITY() could be fixed on alpha for v6.14.

Oh, the changes I proposed are mere cleanup suggestions.
The original patch would do just fine.

Ivan.

