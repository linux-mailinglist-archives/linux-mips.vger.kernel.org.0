Return-Path: <linux-mips+bounces-3472-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 024CC8FAE01
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 10:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 334F11C210C6
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 08:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932791420A0;
	Tue,  4 Jun 2024 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mh20iy/f"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CB9BA39;
	Tue,  4 Jun 2024 08:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717491122; cv=none; b=UQRz3XkgvOkPi/lrHslgsvWQwmDYheW1FlGLhwifxBxkzPh8RzP+e8Ew+cLlhBZBrLW4r/kmQQIRyyfzA/LyDESx0Veg4fSGEC3iyvOKYpvjVJ8p6FhRCLOuLLcL30Izfq1xJQKtXESfpzSVShdNArxtKepHPuCqLsav7gd+oUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717491122; c=relaxed/simple;
	bh=X5VEKcXjsckL7bzsB4I2+5w7z1/yIThVP4y03Rift7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5NQMA9jpiPPyWLFGclT7Xoaq1wGWixKTTgBXLZIQAe+WyPfTJVvcgkpbljORG4vOuPuKAOUsNmj09P/QyinjTJdAusV5iRigNnzE7KvVM8QBQ5qG5TMuntN+3sSDgottwYnSqZblxJMygfmq5XI+IYxKNHZNWlVK1ONEFXVHh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mh20iy/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02151C2BBFC;
	Tue,  4 Jun 2024 08:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717491121;
	bh=X5VEKcXjsckL7bzsB4I2+5w7z1/yIThVP4y03Rift7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mh20iy/fPgoKsPFqkHOMkSvPPs3YobSnTzSECvBMzNm1M8s6vO83AlQC6ilY4EOTy
	 8sOXH1quEckXBhwBGWJj3cHU+7AJwHqGK3p8fjuVfk/jjnSzsPPyPutWZjpiLaoAyt
	 gCdMIRxqqGOm0zxE4aSYMab0Wodh06NeE+MsysKpcDwBDbIlcnfS/wkLiVdVzhzICG
	 4UjcQOTTx+aFwRJE1QaD8Cvt4dl3qLXOUDKmxsy7E1fx9TesQtzL9Q+NmezjMQehNS
	 0WMvz7jO6i8duGQNOX4hQOm+ZTVOc7wkWM1vHVgf8whVZyCCBz2ju8SWZpi8Hlqbp4
	 o2gZF74Dfgnvw==
Date: Tue, 4 Jun 2024 09:51:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: yunhui cui <cuiyunhui@bytedance.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting
 preventive sfence.vma for new vmalloc mappings
Message-ID: <20240604-dazzling-envy-1dcf111eb2c5@spud>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com>
 <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
 <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
 <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v+mLtQDAp6jKleQy"
Content-Disposition: inline
In-Reply-To: <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>


--v+mLtQDAp6jKleQy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 09:17:26AM +0200, Alexandre Ghiti wrote:
> On Tue, Jun 4, 2024 at 9:15=E2=80=AFAM Alexandre Ghiti <alexghiti@rivosin=
c.com> wrote:
> > On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@bytedance.=
com> wrote:
> > >
> > > As for the current status of the patch, there are two points that can
> > > be optimized:
> > > 1. Some chip hardware implementations may not cache TLB invalid
> > > entries, so it doesn't matter whether svvptc is available or not. Can
> > > we consider adding a CONFIG_RISCV_SVVPTC to control it?
>=20
> That would produce a non-portable kernel. But I'm not opposed to that
> at all, let me check how we handle other extensions. Maybe @Conor
> Dooley has some feedback here?

To be honest, not really sure what to give feedback on. Could you
elaborate on exactly what the option is going to do? Given the
portability concern, I guess you were proposing that the option would
remove the preventative fences, rather than your current patch that
removes them via an alternative? I don't think we have any extension
related options that work like that at the moment, and making that an
option will just mean that distros that look to cater for multiple
platforms won't be able to turn it on.

Thanks,
Conor.

--v+mLtQDAp6jKleQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl7VpwAKCRB4tDGHoIJi
0htmAP9lKpWaps7KNiXD+LLzGjaogNRPLVfDE+cLSH8OGRjL0gD/b1+iNEj7/u9+
OImeR7875AIcwdnxddUdj3oiiMB/6AA=
=s00j
-----END PGP SIGNATURE-----

--v+mLtQDAp6jKleQy--

