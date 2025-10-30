Return-Path: <linux-mips+bounces-11927-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F751C20044
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 13:29:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C159461033
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 12:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE7B3203B6;
	Thu, 30 Oct 2025 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXvYXwob"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03B3126A3
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 12:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761827292; cv=none; b=sbnCfjhm4FX0mQPcTVwGYf+hQjJeK4t4fSljBihwX6pYHmM7nw2iqgnUVx2qpWGpab8jjjLc+VvXRJXDhJOwGCwf0bm37FoVLtoEPCH9/ywujhCi1o4I8VAFuYM9aBv8Uol9e1wQZVSxXPC1SAysTWWFF8sA7R2FC3PWbI6ueM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761827292; c=relaxed/simple;
	bh=MP/GQsemHnbJLXZSkSeqHyRxgPMfPq6oei3BZNEbjXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0XXINKgLBFgSgEDAyVkBGMEIdfG0Cwq4eoyaxeFxmsfHruolkAwECdXz1GP/u/03DslqIxBKrlTHA7x8inWg2qTNuItBWJE55fyRwZg/h+HLsHvAm/QQ0KzbeU8GX318Is3q7RKPxSmSlLfi+uzapmClnGHOsDeTS3HC0IwYO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXvYXwob; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429b9b6ce96so361015f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 05:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761827288; x=1762432088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
        b=gXvYXwobG7Ndor2WEJoyBX0ENtjcowkmtMAvdHQOwjhR7ECEn+YhAhvvE7Gcf27kA8
         ll9Eaowj9FG1ecycGlqPqzxXnEfiJM4zJ12tOWYZbCv9ZDJrp6gnjKGvyKhhSs3FqKu9
         x8nJ6edmTH9oHg48uATPCmYQdtSEghDL13PPdwuwKftafdLc1AW8MazEIZPDZfJGE9fp
         vEhuhHLnFVS5jCWgLbo03OhC+MQE6+FKqrQTECrc+RS5nglXbEE3ltFsVC83SO/8T+dG
         B4u7w+q+XTcz3TrEnDJlGKbKm75GFei8gfJAYigBxd4P1202hxKN5/JXtygJomHGl+Pt
         pyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761827288; x=1762432088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4faCkAArvXRFWP/BvJT3qCkXJoGOkTL/9xvSBBThwwA=;
        b=kt9wRLCSoBy1YeQ8C+CFsdIr0SgHRObvcZouLDYuF31PLLnbssSsiCXuIJwSxP784m
         r9MHEvZrohemNsg4ReF/A86p7ywKSQBq2y71xhWUqJI/hi1I8Um5O6GpcrlIdzaGgnO/
         rlb9/r75VIQqE0a5NYz2U4ZT4Np7XgbihrYCqHX3/wBEkmQt2LC8XRs3T6bOx6OD1Bl/
         uQ+ofGy+Zeo/6gOr2FYDTCmmVz1vQjK0xP1M1YA1qsMbkiemur4mIdLHaQgHcVwEay1z
         7Dfgo9YYcPJXVIZy2V3RRfy8pDZPLBqBJ/4H7CH8+020VeslSpoXz+9SHACNcI+PZ/5A
         L6tg==
X-Forwarded-Encrypted: i=1; AJvYcCUB1m6v7IG8ZLQ5IA8copmfPW1+lL/4OmKhzSA/vbgNFUufcNNNHVa5h+FQEx2nAEo188zhGvA7xXpM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc1z3j5t+Ct9bXUqNNX0+fFvhRtrMsnTuv81LVdOZQqsPKRhJq
	70j7GZFQFMQGeqgSP385zpjlw9sfE1LzECOmvl6xpOxdU3qXHXaCW2Vd
X-Gm-Gg: ASbGncvzjseEupWcIpJa76v9VKlrsg6+LfN0wanhEVPRYCh8vYT/7zaYeBbcsEPpeEZ
	7gOnPDLkiJ+4iM+3MjShqGVLJpmxnBeN49fzE54qpzxzaKjeHGKmf8hAH7lgq4mWpctdhPj1kvb
	L+oNim83lSaPJ1yhlIeqejg0qMw0NQtcytLMshRgyiY/2fmPxG8TpBGWtGfV1qRNvG7+IrI1o1i
	NVc9mGteL+kQrpJLg00V0uUZ0MbSbVMAna/L7fJwAhwIFhg0/sRNXCUVgsj065akf6orb4deN/p
	QcqsLFdenCeoj/7dkCEk02oUpUZe9V0LhRnSXqA11xzzCj7WTVJBlHgU6PmShvTO8sYnbGtce2k
	WMikggoRXFOs6iCWu2j+GOEGe9qEklXxsn0c0tPQQ6dn5sl+AR9L/2lqw8EvidMHttdrCWoaYSe
	CVmzjho16CEOaB45nsF0a2FiUiApUndDFSK1Kl2YMKgUZPn17S8tJKaAKPr2QQI7gYsU3R9+SGB
	g==
X-Google-Smtp-Source: AGHT+IFohGfPrMB+gEC0PPjeDu6wKsKn5Xw4tnoTnVq6JsR15gq4re74GuIZTwiApDmgxJjGG1cQpQ==
X-Received: by 2002:a5d:5d06:0:b0:3ec:d78d:8fcc with SMTP id ffacd0b85a97d-429aef82ae4mr6294449f8f.14.1761827288007;
        Thu, 30 Oct 2025 05:28:08 -0700 (PDT)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ba445463sm2028625f8f.10.2025.10.30.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:28:06 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:28:04 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
Message-ID: <5psq67p7ozmfz6mbi626q2uixqtbtfpejkhud5fv6wqr66xasz@ksiokkf5qsgr>
References: <20251029163336.2785270-5-thierry.reding@gmail.com>
 <20251029175647.GA1572736@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ob5xm6zi76m7ppm"
Content-Disposition: inline
In-Reply-To: <20251029175647.GA1572736@bhelgaas>


--6ob5xm6zi76m7ppm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of
 global variable
MIME-Version: 1.0

On Wed, Oct 29, 2025 at 12:56:47PM -0500, Bjorn Helgaas wrote:
> On Wed, Oct 29, 2025 at 05:33:33PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Pass the driver-specific data via the syscore struct and use it in the
> > syscore ops.
>=20
> Some of these things in drivers/clk/ are also platform_device drivers
> (though not this one) and use generic power management, e.g.,
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/clk/qcom/q6sstop-qcs404.c?id=3Dv6.17#n209
>=20
> I have no idea if that's desirable or practical here, but using the
> platform_device model instead of syscore could have advantages in
> terms of modeling device dependencies and ordering.

Similar to the MIPS/Alchemy PCI driver, although there's no git log
reference in this case, I suspect this was not in driver PM on purpose.
The pattern I've seen quite often is very low-level device driver code
doing this using syscore_ops because they run very late/early during
suspend/resume, respectively, so the driver PM callbacks often aren't
sufficient.

In recent years, some of the issues have been alleviated by things such
as device links, so a conversion may work now.

However, often these are also exotic and/or old devices that are
difficult to find testers for, so I've been trying to keep the changes
in this series as minimal as possible, so that we can be reasonably sure
things will continue to work just by reviewing the code.

The most important bit in the series is patch 1, which lays the
groundwork for avoiding these global variables for new code. Also, in
particular I have a concrete case where the global variable approach
doesn't work because an IP block that used to be a guaranteed singleton
now no longer is.

I have looked at various drivers that I ended up not converting because
they use a global variable not only for syscore but also for other
things and fixing that up would've been way out of scope of this series.

Thierry

--6ob5xm6zi76m7ppm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkDWcwACgkQ3SOs138+
s6Hg1w//bfwZK2UyWYgH0DjUdLRkw/JLbu/3memPliSQO+SxPOEf7uwnD1QnAiQ3
AaL3UiueXsnj30IkhBnqYoPaFQRz3G5Ag/PFIKX3kireFrAExwZP/9AKWiJflD1I
gh+QOfqgZ1HpJr3QSmmjosBmkm5T7a/J5dUNuCcZoRcya8QmACQqg3sWy8gj4BdT
Hy/aq2/JWEEJs1pLE5SvCexBqTP5gxTj8MTuNgqm3hRDtZc4TQnKNZIcJwgOruMX
Wy4rrgBPQiASKxxP7ksI7iXCTOYM61AlEm39RUFNcGKI9iOw1YxFn2LuVIPoFJc6
H92dgYcRmcEgy/oWPc8yTs9iX2POH5p/40/nb53U3sj6iQVhEMoVIGmIuxEX9RHL
VHkn3RNfYCZlwqDtwCCoN6DWBW2PNUAX3dsD1ng3ZZHuDH2lbQaQudKRi7MGhAxm
ADqiAfq1HO8Fk6uo5BFMtpieue14jJFHaQs21TkOlurf/LH9GT2qO52/8KtcxYx8
F8pXjAM4Ps+sj+Er6h1Tb6PpXrpJ1lvGqagYTEJpWQuWyjXLGeseMpif2ucjdzjp
4qfcE13QtePpLlbO8kklfDMdo6+uClFAMgWMM0jWWFtczIaUWmwRYcDGUbW4RbHt
H6TJJVsDtuaQNx9wfo+vq3oMZviuttJPzFqYefIOL7oACIZD6sk=
=0K07
-----END PGP SIGNATURE-----

--6ob5xm6zi76m7ppm--

