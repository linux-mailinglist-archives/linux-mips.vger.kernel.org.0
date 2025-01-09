Return-Path: <linux-mips+bounces-7317-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8AA07046
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 09:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5414A1889F9F
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 08:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576EF1AA781;
	Thu,  9 Jan 2025 08:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="Thlhesww"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF61DFDAF;
	Thu,  9 Jan 2025 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736412424; cv=none; b=W9D89jt1oBsxrI6VyJagrIHx8fb8Ebu0h8PW04IsG2HsWPH0mSvJXyv9Wlxdm2eX+fpKGuYlQxmLW6ml4J21f4PP4VLi2w/Tj4eFS9tK6O9DFPlYb+/JIPgTdnT02Y3fP0pMhDRHVkGeH5Eib+uPrKNHYihSsXFjYvbYd9o+bzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736412424; c=relaxed/simple;
	bh=MzthFkt6nOdUmyE7IkPj3bZFKAu5kbyqohOhnjyFu0k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gYeb4MacZKSbCXmU/o0fJzGyL+zD5YHu73Qzw/stY/YPoDQ7QE8Sz/zWt9G2VZBk7nUwiliN0Q7qddg8AVRZF/BTkXaSqIQaA0cm2HAl7/B4fAoEEErFNBhfGbyPLqZo3vpZfIfN8t766y+CWLpgcL/s8cv+ZxtvFeMnCzlOp1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=Thlhesww; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sq2qTY4Odv8rrxk4zev1RQVpjQzKDj6PxDoVpnk8WHs=; t=1736412421; x=1737017221; 
	b=ThlheswwEG+ihpinRMvTMDg8lGQ0ZZInvjAbOUjCcn8McHI/RpiTuZ2SofmU4+D1pfBbP+2PKgT
	LSFmtjnUNhTETwwCTZKZvBnVwejbeK6I1pwUyV9Vr5poWt02G5aUdrnrmtcWGyVIv036K0E9QOct9
	9qKGkYHqS8uBLy6TPADTjV8/8ZTPUKi3bOLVgh8OilzbWIFFvfRj3PO6SJuBs8+2M5I8rlL+yDQGQ
	9cQWbK9kkMSzqvZQ7n/GJJu4VqJPrvsBWhmQDXXDmvgn2YN1ehe3wYsipJWfryoa/1tbmw6DZ1PLn
	R/Pg1EPOOBeaEBXUxqZJT3yu9Xsmhs2u6drg==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tVoBl-00000003gZS-19mr; Thu, 09 Jan 2025 09:46:49 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tVoBk-000000030Mx-4AsR; Thu, 09 Jan 2025 09:46:49 +0100
Message-ID: <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] alpha: Fix personality flag propagation across an exec
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@arndb.de>, Richard Henderson	
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, "Eric W.
 Biederman" <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, 	linux-alpha@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Michael Cree <mcree@orcon.net.nz>, Sam James <sam@gentoo.org>, "Maciej
 W. Rozycki" <macro@orcam.me.uk>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Karcher	 <kernel@mkarcher.dialup.fu-berlin.de>, Chris Hofstaedtler
 <zeha@debian.org>, 	util-linux@vger.kernel.org, linux-mips@vger.kernel.org,
 	loongarch@lists.linux.dev
Date: Thu, 09 Jan 2025 09:46:47 +0100
In-Reply-To: <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
	 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
	 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Arnd,

thanks a lot for your feedback!

On Thu, 2025-01-09 at 09:43 +0100, Arnd Bergmann wrote:
> On Thu, Jan 9, 2025, at 09:01, Arnd Bergmann wrote:
> > On Fri, Jan 3, 2025, at 15:01, John Paul Adrian Glaubitz wrote:
> >=20
> > >=20
> > >  #define SET_PERSONALITY(EX)					\
> > > -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
> > > -	   ? PER_LINUX_32BIT : PER_LINUX)
> > > +	set_personality((((EX).e_flags & EF_ALPHA_32BIT)	\
> > > +	   ? PER_LINUX_32BIT : PER_LINUX) | (current->personality & (~PER_M=
ASK)))
> >=20
> > This looks wrong to me: since ADDR_LIMIT_32BIT is not part of
> > PER_MASK, executing a regular binary from a taso binary no longer
> > reverts back to the entire 64-bit address space.
> >=20
> > It seems that the behavior on most other architectures changed in 2012
> > commit 16f3e95b3209 ("cross-arch: don't corrupt personality flags upon
> > exec()").
> >=20
> > At the time, the same bug existed on mips, parisc and tile, but those
> > got fixed quickly.
>=20
> Correction: from what I can tell, mips still has the bug (and now
> also loongarch), it's just in SET_PERSONALITY2() now instead of
> SET_PERSONALITY():
>=20
>         current->personality &=3D ~READ_IMPLIES_EXEC;
>         ...
>         p =3D personality(current->personality);                         =
 \
>         if (p !=3D PER_LINUX32 && p !=3D PER_LINUX)                      =
   \
>                 set_personality(PER_LINUX);                             \
>=20
> personality() only returns the lower 8 bits (execution domain),
> so if any of them are set (BSD/HPUX/IRIX32/IRIX64/...), both
> the upper and the lower bits are cleared, otherwise neither
> of them are.
>=20
> The behavior on the other architectures is that we clear the
> lower bits but keep the upper ones.

So, if I understand this correctly, we should just use PER_MASK on alpha
for 64-bit executables and allow the bits to be cleared for 32-bit binaries=
?

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

