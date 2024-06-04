Return-Path: <linux-mips+bounces-3482-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE08FBD2F
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 22:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 008EEB21B0D
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2024 20:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA30114AD32;
	Tue,  4 Jun 2024 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoZ0l1zC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06F283CD6;
	Tue,  4 Jun 2024 20:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717532280; cv=none; b=KWFCB3HNrtUQAJiPqob49Yxl286SNosuvmuuVI6rjVVDdHx7xKUqZeb90HE5ZN5Wx5n5mByiI4Pi/yrxnuVO969lRJJx3NtA3gzOHlMrW+D9i7LEExyDIBBk8NQg9opJnkTnSMh6E9qQGd5TPCLfJrOD72U9pfKpD2T+DHikIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717532280; c=relaxed/simple;
	bh=hzO5VxyNboH0UxSA8oeS3DN/P0lxl1+qVDrF4lH35fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJvdXMnKQ3y0fCG1/wZsuar6CzM7tITqReqJZQ4Nlfz+GOcvqoSVPqDOgUEt4hbidPPe3Ea+ytG1ltIP4fJqNsQ52iUILXc/fCg6s/7QhSapD8skUyE8sSZGt8THqyD/wXWV5FWOXZ856CFXAb+1FczACvxPcpvJldNlj5AYELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoZ0l1zC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DD4C2BBFC;
	Tue,  4 Jun 2024 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717532280;
	bh=hzO5VxyNboH0UxSA8oeS3DN/P0lxl1+qVDrF4lH35fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YoZ0l1zC3xE7XjFm6AyGqJGICJLDpBXsff7pMRSlEudgDhIe2FAqUIlZOHMrcDAr3
	 JFMzUTUWby1raWnTIk9qkVwqwtiz6/Z6smnBNReiuYlHT8eUSl0Z+Aqd5Gb2Mvh34S
	 wAKOpf6ZGKyFw6YsjI3fHnZC+rpMWQawCWhKqPCdn6EmlNin9YkQkOohgJvSm0Jfdq
	 EA1DmGUVMobN6eu67mYDQTP4RfwK6SHx4st2n6F8wStZwJn0RmP6KpiZmkZX3cYHhC
	 s3AwyJtNeSyuaNXCJfi8TiyYPNzftuerF7VkPZyKLtWbcx/eMh95QAsbx5XROxuYBO
	 Zsx5ZvhbZVrFA==
Date: Tue, 4 Jun 2024 21:17:54 +0100
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
Message-ID: <20240604-finalist-screen-c9f35b5cfc56@spud>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com>
 <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
 <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
 <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com>
 <20240604-dazzling-envy-1dcf111eb2c5@spud>
 <CAHVXubhy1yEKOx91gc9S++yKOoQa+sJ5EDSiMFwR6qepwzRMew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwD0Txngxq5MBoPY"
Content-Disposition: inline
In-Reply-To: <CAHVXubhy1yEKOx91gc9S++yKOoQa+sJ5EDSiMFwR6qepwzRMew@mail.gmail.com>


--rwD0Txngxq5MBoPY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 01:44:15PM +0200, Alexandre Ghiti wrote:
> On Tue, Jun 4, 2024 at 10:52=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Jun 04, 2024 at 09:17:26AM +0200, Alexandre Ghiti wrote:
> > > On Tue, Jun 4, 2024 at 9:15=E2=80=AFAM Alexandre Ghiti <alexghiti@riv=
osinc.com> wrote:
> > > > On Tue, Jun 4, 2024 at 8:21=E2=80=AFAM yunhui cui <cuiyunhui@byteda=
nce.com> wrote:
> > > > >
> > > > > As for the current status of the patch, there are two points that=
 can
> > > > > be optimized:
> > > > > 1. Some chip hardware implementations may not cache TLB invalid
> > > > > entries, so it doesn't matter whether svvptc is available or not.=
 Can
> > > > > we consider adding a CONFIG_RISCV_SVVPTC to control it?
> > >
> > > That would produce a non-portable kernel. But I'm not opposed to that
> > > at all, let me check how we handle other extensions. Maybe @Conor
> > > Dooley has some feedback here?
> >
> > To be honest, not really sure what to give feedback on. Could you
> > elaborate on exactly what the option is going to do? Given the
> > portability concern, I guess you were proposing that the option would
> > remove the preventative fences, rather than your current patch that
> > removes them via an alternative?
>=20
> No no, I won't do that, we need a generic kernel for distros so that's
> not even a question. What Yunhui was asking about (to me) is: can we
> introduce a Kconfig option to always remove the preventive fences,
> bypassing the use of alternatives altogether?
>=20
> To me, it won't make a difference in terms of performance. But if we
> already offer such a possibility for other extensions, well I'll do
> it. Otherwise, the question is: should we start doing that?

We don't do that for other extensions yet, because currently all the
extensions we have options for are additive. There's like 3 alternative
patchsites, and they are all just one nop? I don't see the point of
having a Kconfig knob for that.

--rwD0Txngxq5MBoPY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl92cgAKCRB4tDGHoIJi
0jejAP4q4iC1BCvHT6xTV9Sna0UEFmTHPbvuyI/Dr8hN0BftCQEA2HLRmlNNqiPJ
abULfaYTpyjXRctzj8H5FL5kCUjY6gs=
=929z
-----END PGP SIGNATURE-----

--rwD0Txngxq5MBoPY--

