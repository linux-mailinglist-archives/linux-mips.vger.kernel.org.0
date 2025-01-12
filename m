Return-Path: <linux-mips+bounces-7406-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55590A0AA44
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2025 15:57:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62B431886EA2
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2025 14:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714661B87E0;
	Sun, 12 Jan 2025 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="L9EcIryr"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8591BC073;
	Sun, 12 Jan 2025 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736693814; cv=none; b=SiwnPAhIUAUzaB8f5jay/rVIDlct3fXGANFZPE7SvG/lVUKiF+c+UjBbGXSzW4lXDkvLFxyZfz2GI3qhFEqVAEHPeMr5nKKF3L0y4SS0YLBZdJZD5O5qTuwVqo5guBfh2ADwwBcu7fUWxxkYlMoKOwhOS5OETbEz6LLxKyJ8WlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736693814; c=relaxed/simple;
	bh=4UJrAsH9qFnB82eupyzBlnsARQnnRwfgk4RWVVe7xWs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Czl8WuHXDzP9RlAAZNLADKu7geAva8PpdRBy2rbMF9qNLiC9DurYe8NPc5plxXfTdOwmGDJR5UiFRj0+euz3/Lcfnw34Vh+ORqKT/ewy1eednafVDUhH36kKxn/PSgzmYH06fTEcXGKQhi6OQHDKxoKsYsFurmofk7tSI1HTbjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=L9EcIryr; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=th4l9Oeqf4nV5C90rmZ/2rq1TrXidA60JxkkER8bfPw=; t=1736693811; x=1737298611; 
	b=L9EcIryr4PaGNLtpMqFX4D2+6848Bt0TVFIburMDtGJlTGD2fF8lVAag2tRwSj5Oiyh2tgDqjw6
	OQVKY4LnU2NHQLO2lHewPyHCWiBVNzM/2mXm32TULxCmJ6mCCd4pOekXa3ZoonEr6QjN7o2CsvoT+
	aRP0oHhXvvvjzc2lNPLW9IecVBpEiZUBM0OkTnW4uL8+OtKf4NoIS4zuH6FIkIknC2OEgauAfcJ0J
	qB8o+8TQ006aIL7E/SyqQ0uKncjyb2C5DK3/8uqQ+/XJiOpW9eAsY84lV1FuxjppVI6inVBzyJL5M
	NibAMu4YoCJTTLKTOO/qnNaYwePpocnaFL5A==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1tWzOK-00000002q1l-22c7; Sun, 12 Jan 2025 15:56:40 +0100
Received: from p57bd9274.dip0.t-ipconnect.de ([87.189.146.116] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1tWzOK-000000025Er-0w1O; Sun, 12 Jan 2025 15:56:40 +0100
Message-ID: <78f3ae1f68842a9d1af62caaac3929834ce6ecfa.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] alpha/elf: Fix misc/setarch test of util-linux by
 removing 32bit support
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Arnd Bergmann
 <arnd@arndb.de>,  Richard Henderson <richard.henderson@linaro.org>, Matt
 Turner <mattst88@gmail.com>, Kees Cook <kees@kernel.org>,  "Paul E.
 McKenney"	 <paulmck@kernel.org>, linux-alpha@vger.kernel.org,
 linux-mm@kvack.org, 	linux-kernel@vger.kernel.org, Michael Cree
 <mcree@orcon.net.nz>, Sam James	 <sam@gentoo.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Michael Karcher	
 <kernel@mkarcher.dialup.fu-berlin.de>, Chris Hofstaedtler
 <zeha@debian.org>, 	util-linux@vger.kernel.org, linux-mips@vger.kernel.org,
 	loongarch@lists.linux.dev
Date: Sun, 12 Jan 2025 15:56:39 +0100
In-Reply-To: <alpine.DEB.2.21.2501120146480.18889@angie.orcam.me.uk>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
	  <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
	  <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
	  <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
	  <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
	  <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
	  <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
	 <2758fa70d237ff972b0c8d7114777dc4a20c8f3b.camel@physik.fu-berlin.de>
	 <alpine.DEB.2.21.2501120146480.18889@angie.orcam.me.uk>
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

On Sun, 2025-01-12 at 14:40 +0000, Maciej W. Rozycki wrote:
> On Sat, 11 Jan 2025, John Paul Adrian Glaubitz wrote:
>=20
> > > the EF_ALPHA_32BIT flag set.  Just to fail explicitly in case someone
> > > somewhere has binaries that trying to use alpha's 32bit pointer
> >                             ^^^ are
>=20
>  If nitpicking, I'd say just "try".

No objection. I was just hinting at obvious grammar mistakes. ;-)

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

