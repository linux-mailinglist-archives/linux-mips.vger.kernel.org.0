Return-Path: <linux-mips+bounces-7605-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76799A1CD4B
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jan 2025 18:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F59B1887F47
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jan 2025 17:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C9786348;
	Sun, 26 Jan 2025 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="i5/LfFq5"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12626ADD;
	Sun, 26 Jan 2025 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737911756; cv=none; b=cMo0QTjtGq8+pCcgF6M8ATnAQaM0IyEt5jb1GlzxcKLeKbNEcrIsysud86V2y1EVhAMb+TARh3tiem5vUGNCXh96IsNbC6Lbcu4HWeZgouGHNo/Fo6uBHTs1i/PfEhJcnmS8d92TJGUdRiLkh25OPUcExmK4YiDXvH+ZY5se618=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737911756; c=relaxed/simple;
	bh=E1aDrkDg06ajDWt6df67vANzGulUVW1sjcT1EnH0Jdk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aVZhCGjfuaxzxe3ADE+eWdGejHWLH2crE6HRbtxG11HvO2RvKX9kwokVir9wpomIvjQrEBZWiI8+cjdcYmRGseUM9pOndXuLaUcTkJ9SHJINUafM78IH6p1Crlp38ewThqyJa/ZeoAO85gYG6SH/z/8HqYM3hRs1IHPe5jPAg9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=i5/LfFq5; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NDGj5KhhYs5RVS0ic+JKR8T7bxhK3ms7bWt/FFk0Cns=; t=1737911752; x=1738516552; 
	b=i5/LfFq5gUnK6HOLO4eUm+xv09FDkSlu1rN6ZLlKWC8PZGZ8SVkJrIw45b5jHHAB1jwH0/fHE2W
	nyA5dhq0FIYy7Fz2t7aIAN6G62BfvT2W2zAOegXQKzdhsPlWiM5R2uBMYRO8007PtV54ZXHWLPpPj
	0VZCQbY1+V7pOVkUxgvXn++tscv6dzWMo7TaFT/1J7KrvjmDoHS/19c0bL3Xal5zB5AC1P1Wpv/bh
	l3hzM2DG+qI3eoW+zGtJwz59W6bL+Oicdh258Wp9ioYSqaKQglU8cM1tq1fKMfsBkr0dGSeNKIWbn
	Y/tG21KwYcuzwkFVSPWCfitD1eW8UqqTgciQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tc6Ea-00000000TuC-2XmK; Sun, 26 Jan 2025 18:15:44 +0100
Received: from p5dc55cec.dip0.t-ipconnect.de ([93.197.92.236] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tc6Ea-00000002hZK-1Oqp; Sun, 26 Jan 2025 18:15:44 +0100
Message-ID: <5cff63bf0fc9e62772fb24bc919c591acbd10d53.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v2] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Ivan Kokshaysky <ink@unseen.parts>, "Eric W. Biederman"
	 <ebiederm@xmission.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Arnd Bergmann <arnd@arndb.de>, 
 Richard Henderson <richard.henderson@linaro.org>, Matt Turner
 <mattst88@gmail.com>, Kees Cook <kees@kernel.org>,  "Paul E. McKenney"	
 <paulmck@kernel.org>, linux-alpha@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>, Sam James	
 <sam@gentoo.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michael
 Karcher	 <kernel@mkarcher.dialup.fu-berlin.de>, Chris Hofstaedtler
 <zeha@debian.org>, 	util-linux@vger.kernel.org, linux-mips@vger.kernel.org,
 	loongarch@lists.linux.dev
Date: Sun, 26 Jan 2025 18:15:43 +0100
In-Reply-To: <Z4uECl9wQ2sqdKym@minute>
References: <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
	 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
	 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
	 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
	 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
	 <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
	 <2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de>
	 <alpine.DEB.2.21.2501120146480.18889@angie.orcam.me.uk>
	 <78f3ae1f68842a9d1af62caaac3929834ce6ecfa.camel@physik.fu-berlin.de>
	 <87y0zfs26i.fsf_-_@email.froward.int.ebiederm.org>
	 <Z4uECl9wQ2sqdKym@minute>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Eric,

On Sat, 2025-01-18 at 11:35 +0100, Ivan Kokshaysky wrote:
> On Sun, Jan 12, 2025 at 11:39:01PM -0600, Eric W. Biederman wrote:
> ...
> > --- a/arch/alpha/include/asm/pgtable.h
> > +++ b/arch/alpha/include/asm/pgtable.h
> > @@ -360,7 +360,7 @@ static inline pte_t pte_swp_clear_exclusive(pte_t p=
te)
> > =20
> >  extern void paging_init(void);
> > =20
> > -/* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  *=
/
> > +/* We have our own get_unmapped_area */
> >  #define HAVE_ARCH_UNMAPPED_AREA
>=20
> Just remove the definition. As the comment suggests, the only reason
> it exists is ADDR_LIMIT_32BIT, which is gone.
>=20
> > --- a/arch/alpha/kernel/osf_sys.c
> > +++ b/arch/alpha/kernel/osf_sys.c
> > @@ -1210,8 +1210,7 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __us=
er *, txc_p)
> >  	return ret;
> >  }
> > =20
> > -/* Get an address range which is currently unmapped.  Similar to the
> > -   generic version except that we know how to honor ADDR_LIMIT_32BIT. =
 */
> > +/* Get an address range which is currently unmapped. */
> > =20
> >  static unsigned long
> >  arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> > @@ -1230,13 +1229,7 @@ arch_get_unmapped_area(struct file *filp, unsign=
ed long addr,
> >  		       unsigned long len, unsigned long pgoff,
> >  		       unsigned long flags, vm_flags_t vm_flags)
> >  {
> > -	unsigned long limit;
> > -
> > -	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
> > -	if (current->personality & ADDR_LIMIT_32BIT)
> > -		limit =3D 0x80000000;
> > -	else
> > -		limit =3D TASK_SIZE;
> > +	unsigned long limit =3D TASK_SIZE;
> > =20
> >  	if (len > limit)
> >  		return -ENOMEM;
>=20
> Likewise, just remove these functions. The generic_get_unmapped_area()
> works fine, tested on up1500.

Can you send a follow-up integrating those changes? It would be good if
SET_PERSONALITY() could be fixed on alpha for v6.14.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

