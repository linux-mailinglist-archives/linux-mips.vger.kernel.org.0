Return-Path: <linux-mips+bounces-7319-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A28A0710C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 10:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 121FF3A5DF8
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784B1215071;
	Thu,  9 Jan 2025 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="FGcfiPTs"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE5B2010EB;
	Thu,  9 Jan 2025 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413930; cv=none; b=nvQkC54EGhB03gUUA3/ORZzKz7LkkfgqwjxbJGz6SN33m3oDlCltGbqlaKR8Mc77EZu9Bx38Hed3/9aC2MEFg0PchiLRpJyiKzBArk+Vbw0MmF6z0oqlgz5jXbJWdQFxbE4RdtJHw1ybot/XnOK4XJq61Po/3ggZa79RZ6AnKDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413930; c=relaxed/simple;
	bh=uWstjnaDMBC/DC8rErmB9L3ULfT+RS/dR4tnmM3JbfU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bTFS7QmojLA2vrFJ2Dckw/yNO3HPHL3FwKSiNlasnq+fsFiYcxFMr+mBcKnc1jTGxQeaujoJC6y2zmRjlz19bqYyWB8BAU3upSnh/dcr6xGRFUqPydDFkIAEff4YTkj+BX7Kz8wgo0xHGj4aC5vFI0v/8JslNOqeiolVN2sE5vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=FGcfiPTs; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kczkN1t1mZsZMoxXbPcY2HTX2BfCPejPhaev8OStMg4=; t=1736413928; x=1737018728; 
	b=FGcfiPTsjSZxMZj1dw+DXq2f4hHzvUesrSf8yF3oTrgjGObrUp8DrC78khgaNBP9awERLF6g0cW
	BhBXOgKC0NFmgGW7y1SbUzVmSNqrtUL2Jzz4PJTsYJfWVB/6mjX62w05JBUk6MmSm/mQbvNh18Jp6
	2MxWu7BIkNJ35Or5401bo0vfqJG5NMEWPGIAGsVOgIWW2yzj/u/96BoUSVVSx2cia9Y5BaDUyIXst
	Hb7DRX5cgIYRMJ7aVLS5vjS4aQ9oBu9s//i2IrMXxipV4oFo8YYYnHHLW8FzcGj468iu8170rsdC1
	Lebu7mki6cjhQmnrWu8iseR7tfYUYVkNOHNw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tVoaC-00000003tfA-1TV5; Thu, 09 Jan 2025 10:12:04 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tVoaC-000000037Ep-0LtI; Thu, 09 Jan 2025 10:12:04 +0100
Message-ID: <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
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
Date: Thu, 09 Jan 2025 10:12:03 +0100
In-Reply-To: <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
	 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
	 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
	 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
	 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
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

On Thu, 2025-01-09 at 09:56 +0100, Arnd Bergmann wrote:
> On Thu, Jan 9, 2025, at 09:46, John Paul Adrian Glaubitz wrote:
> > On Thu, 2025-01-09 at 09:43 +0100, Arnd Bergmann wrote:
> > > On Thu, Jan 9, 2025, at 09:01, Arnd Bergmann wrote:
> > > > On Fri, Jan 3, 2025, at 15:01, John Paul Adrian Glaubitz wrote:
> > > >=20
> > > > >=20
> > > > >  #define SET_PERSONALITY(EX)					\
> > > > > -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
> > > > > -	   ? PER_LINUX_32BIT : PER_LINUX)
> > > > > +	set_personality((((EX).e_flags & EF_ALPHA_32BIT)	\
> > > > > +	   ? PER_LINUX_32BIT : PER_LINUX) | (current->personality & (~P=
ER_MASK)))
> > > >=20
> > > > This looks wrong to me: since ADDR_LIMIT_32BIT is not part of
> > > > PER_MASK, executing a regular binary from a taso binary no longer
> > > > reverts back to the entire 64-bit address space.
> > > >=20
> > > > It seems that the behavior on most other architectures changed in 2=
012
> > > > commit 16f3e95b3209 ("cross-arch: don't corrupt personality flags u=
pon
> > > > exec()").
> > > >=20
> >=20
> > So, if I understand this correctly, we should just use PER_MASK on alph=
a
> > for 64-bit executables and allow the bits to be cleared for 32-bit bina=
ries?
>=20
> I think ideally the EF_ALPHA_32BIT handling should use TIF_32BIT
> as we do on other architectures, at that point the custom SET_PERSONALITY=
()
> can be removed in favor of the asm-generic version.

I have thought about that as well but I wasn't sure whether the extra
mangling on alpha was necessary.

> Alternatively this could do something like the arm32 version (note
> that on arm, PER_LINUX_32BIT/ADDR_LIMIT_32BIT means "allow using
> the entire 32-bit address space rather than limiting to 26 bits for
> compatibility", while on alpha it means "use only 31 instead of
> 42 bits for addressing", but the logic can be the same):
>=20
>         unsigned int personality =3D current->personality & ~PER_MASK;
>         /*
>          * APCS-26 is only valid for OABI executables
>          */
>         if ((eflags & EF_ARM_EABI_MASK) =3D=3D EF_ARM_EABI_UNKNOWN &&
>             (eflags & EF_ARM_APCS_26))
>                 personality &=3D ~ADDR_LIMIT_32BIT;
>         else
>                 personality |=3D ADDR_LIMIT_32BIT;
>         set_personality(personality);

So, this would be the 100% correct for alpha then which would not loose
any functionality even for 32-bit binaries?

> In any case, I think we should fix alpha, mips and loongarch at
> the same time, to make sure it doesn't take another decade to
> fix the rest.

If you're willing to fix all three at once, I would be happy to help
with the testing on all three architectures as I have machines for all
of these.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

