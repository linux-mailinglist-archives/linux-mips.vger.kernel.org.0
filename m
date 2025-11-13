Return-Path: <linux-mips+bounces-12233-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3BC597BF
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 19:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8592B3B7C37
	for <lists+linux-mips@lfdr.de>; Thu, 13 Nov 2025 18:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1A230EF93;
	Thu, 13 Nov 2025 18:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="buoZPyVo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FBA30AD1B
	for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 18:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763058766; cv=none; b=XPHp/Os7DZAjgdt6mTCp93AHM1HO/Hn23V8nQMNwnXNb/PW591nL4gnqL9lrrwRgJjQYUcSIax3vMPQxsOCOaE6sLsVCl010iKfpuIsF/ybfa3NuAUTlzFc8iNIODoT2MX/a/h30fcSm7r6GuFi4reV8swnJjdcSmpPiNgbnNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763058766; c=relaxed/simple;
	bh=lVK6LGrRGW3eaG+V9l1z4aQDY2CjycAA5y0HtlS4sFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAOTZrY99zATu5g9+shSjY2Apeu7zItK2Q7AhvNm2afxC12oy1y5j13A5kR1lar2XJX10cFmb96nUNbUqSJU0O07z/EgXojZqcofp5ewOE8zvbupnIfvBQL7PIBZjUN9rPRLwfCu0HxXYL/ncAp7xV1gHwB1AeEhT12bUIuQDj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=buoZPyVo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47777000dadso8833075e9.1
        for <linux-mips@vger.kernel.org>; Thu, 13 Nov 2025 10:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763058763; x=1763663563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=buoZPyVo7ZpxO7iHnKxBGL+Mddg0YRXQE95VObAX4idoXofJHPS7wtTeN1dfitRF2v
         C3P8AadegOHoPG9KGBUkncQnmKw2oI00zot1SGTXuEWVzyAyhfuQDD7rvTmhd/ujDliq
         DvQ4sbzWj8b/4JIfb1fflA2qsG7llFGKk4YPRD6KMgAqMjjH6kwEIuHNm7VWM3k8rmYq
         Hru2Fqz92YWIqvxeavvM2p2gCflCx49M4wSrUTqo9bRb/854VOA17uXmUELQ8juuWUyD
         K145cLRHUNwMMnduWR7cHY6SgPAs2gqSPaD1lbO3U8iSatx7FJcokQvOSl+qZe10R4ki
         2/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058763; x=1763663563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=B3vWKr4VGXHRX7WeFTESMUggSqKcP7OfC2r0gWR1zRVgDvEFB9EsUvl1d9mT0v/LeF
         Ym4ufNd6YrRBnh4aIOvi28hnNWtS544t5obsqBSE1HNy7u97c5axy0TV/L1orbS7bPD2
         hNDjmnoRZLug4IbbdkHApOEqrN6Y6u4RQN0FassjFKKsdSUPldeeQAtkB1k66LRrW7fl
         CuU7k7LvO/uC3u6r8AmBNE1bNp7zmuxMIhSEJXm86TRSQCP/0AEmAMsp3UBHAWrt+sIY
         bB5qcOMMyVDMRvppZjDdje469N2/3ec+FGo1COO96SowLgrb9rAmzS5Z3FcVKxHXXXwH
         F0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXy8Pt8N9rxom0ntUPAby+3RTW2LGjfXKNtv5G1skycGEobEkFoy2ercOiGiP59IM7yf0qaDKj6vaJW@vger.kernel.org
X-Gm-Message-State: AOJu0YzKx1Tp7W7wv4yW0jfsazI5REEF/fyHdhvrptJZizMP2Ay3goUt
	ow7c5IX+6p0/x1pZ/xbibYgToDrEYRMJ3fxftjYaPZvpIDNbFa2wByb5
X-Gm-Gg: ASbGncvtf1X7nh9fbmPjqb0NAvBsk3hio7tZ36C7Rggv7yQiDVVNw0wUCiItRxyUM+F
	5mmdCuB0upUNKSEAvFAckuyJLRtpPwDxVbpgu/wwz9sUoBJVatlF1ts7pUx+ILSLpejOEHyKu7Z
	Ojc0XDd7Mj4qAvLXQOkeIT9EvjIf9NS6eNY6LmVrOoLQwqoM6npx/d6+HsITlQ8PRrensEOGUW2
	MCMCkh5orEZy0NixWcnck17qrDDu8KoFYWOZiXymURm/S8N6GfNbx0yq8IjhW5uJDlOoqo8Pi1h
	/Df1I32WhKQzI4xNrHqrto+02yXDxepozXoMMgkkQTIWs0XBn+cBj0Hojh3TVICLA6k/kZXCP/m
	KCOHHkMknTjM0auVyExWV3gODeVJtSCHIpm7XHZpbqGHnnbWPUpfI5eH9pg7h2cZqQTAYFHIgSc
	xWfT0tPmdPwDVVnQR0f5a2BhON39VPZZhq4p0URU/mYQ70K1mzuDmvyLzByBQlspNvkVfweAbvP
	g==
X-Google-Smtp-Source: AGHT+IEUOfl9Mj/MhDnCs6vXeSUiBJWe5OA5hhf/B85epyvDSKEXz8FsTxq8lGXRcYwvA52KNvjEqA==
X-Received: by 2002:a05:600c:3b12:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-4778febd327mr4653575e9.36.1763058762895;
        Thu, 13 Nov 2025 10:32:42 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm63595835e9.11.2025.11.13.10.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:32:40 -0800 (PST)
Date: Thu, 13 Nov 2025 19:32:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
 <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7axrx4sqgqvkj2b7"
Content-Disposition: inline
In-Reply-To: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>


--7axrx4sqgqvkj2b7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Wed, Nov 05, 2025 at 05:52:01PM +0100, Thierry Reding wrote:
> On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> > On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@=
gmail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Several drivers can benefit from registering per-instance data along
> > > with the syscore operations. To achieve this, move the modifiable fie=
lds
> > > out of the syscore_ops structure and into a separate struct syscore t=
hat
> > > can be registered with the framework. Add a void * driver data field =
for
> > > drivers to store contextual data that will be passed to the syscore o=
ps.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > This change is fine with me, so I can apply it unless somebody has any
> > specific heartburn related to it (Greg?), but in case you want to
> > route it differently
> >=20
> > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
>=20
> I have a few follow-up patches for the Tegra PMC driver that depend on
> this. 6.19 is what I was targetting, so if we could put this into a
> stable branch that'd be the best solution. I can set that up via the
> Tegra tree if you and Greg are okay with it.
>=20
> If that's all too complicated, I can probably wait until the next cycle
> to merge the PMC changes.

I've added this single patch to a branch based off of v6.18-rc1 that I
plan to feed into linux-next so it can get some broader exposure.

I can keep that branch stable so it can go through multiple trees if
needed. If anyone's interested, the branch is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/log/?h=3Df=
or-6.19/syscore

Thierry

--7axrx4sqgqvkj2b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkWJEYACgkQ3SOs138+
s6GbLQ/+LcY0n50MLCzG6P3cLlbnizYWB4fd77qBH6YbB2iRPf1TPkFtC1s24QiA
KgZqLzCkJ5rw0Xtvmtzci4gr3GeqsMf/4DM0k3X5WdN/DMat0RTe1rhVuxq0MmGV
7kmy+iB9FW6MgVt4kjeYdEL94ohEKXEUKTS6HTGfPFsonbJjnZdIsv4GVThClyxW
Y3vE0mnoAvxjqtVu57jc/Ihryv5Zz6pYiX9AWhT1ryTG7tmgKuFWW0YgqkFy/Y9O
rneSUrPJCeOBzjgL5oY6mPqTCl5f0VdGMb9S18RK+DKXSCLW7b0nGt4CCN7sEuOo
7Dy1UuUjok1XLs8NYPQ7oDD29Q536WmrUmQMjMm0R3HuqmmD+PDO0/I9QA2cuOvw
V1zUm+XqIlAyZs4lZkJXotqlCEBkPNCv0iIqEraETrCS1RYi/k0eqPF3Yu3oQc5p
58cnaEW28DaJ9+Cy7T4NCu7lsDzDyyL+5n4HQyWGaFkVYU+Wkfh0H1ezo8bP9txU
/Yan3s21OGdjzLMcCT0abiDrFOdN9N6HGOI2/UHnz87jxubwy7HjZ52Fkz3iGATD
uz1HyHzrIav2FWTN0PkENUQpiTQIHTs0znDBKPpTvDkeVbTF5nQuP2S0+bUGxvLR
BBevVnm7dT2dD5WqJbGfhem+DFPn66JVA5SFq9+/bvG0KsOpwpA=
=Jfb5
-----END PGP SIGNATURE-----

--7axrx4sqgqvkj2b7--

