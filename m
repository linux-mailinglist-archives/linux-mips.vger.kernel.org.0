Return-Path: <linux-mips+bounces-8020-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDE0A47CCC
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 13:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B67EF16A8DE
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 12:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF124270044;
	Thu, 27 Feb 2025 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gV4rp0BC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA380270020;
	Thu, 27 Feb 2025 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740657886; cv=none; b=UP2T9nx//nwbbXMzC2WGP4Q5zz8G5LIbIEiUXAwb39LdjauXYrw/9tmI0AuhuTvangdiAbELobevl66aLm+Vx/zOMZWph50/cj7sA8+Z3+YVSafLMYRFscLXZmrt/0Fj3fdunpUl1vsz+h+EtW5BMqL6otesOuxYsZcmDfSKBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740657886; c=relaxed/simple;
	bh=6FWwGoJ7epQNWqdDrQS9AM/XSZAntL4HGMy7Yq/jBwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8tSocWCgqp6imdpdsYevSj1D5cGSE2IV3FtBjCKH4VnU24X9+QGbwOELOhd6n8xeyN7HBckvhdGVNEdbbIB/GB7s/jbJIIvIPXA+HtGkYN3c47k5vlLBKQb5o6j3GR/ZFEg4YIusEVdTKurv+vJMaPkdABEt52KXRQkM3oxpJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gV4rp0BC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DE9C4AF09;
	Thu, 27 Feb 2025 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740657886;
	bh=6FWwGoJ7epQNWqdDrQS9AM/XSZAntL4HGMy7Yq/jBwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gV4rp0BCbXcPMqceIDXJqkfdjxwiT6GV+Ezo/gbexPWSVl5gECR+NNUVvi0PsXh4D
	 YQVZbD57JeTuUaBva8+c9qj/+1neTWMLrLn5MjQoqLRpMSvQqfuYk+EO9hrrEzEHCJ
	 amInlPngk0xMyAFhAUZnk2iGOUGqoZrwC9kiZtb457a/Cvl7HSUYUFZG06v45EHx+R
	 pi4Ogv2Dl8eMSIXonSWDgBakSJikd6rMsaeSkDRi7d1WrlDk1N8DekcmgyydT8bcPt
	 2kcm6WFMNQEpqJ669vh3bY+DR1UR1tHdStsh6C29vupRAwkpBZ71zX/6iREaLpZR3o
	 CQTy3vrhV52rg==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30b8cbbac91so85011fa.1;
        Thu, 27 Feb 2025 04:04:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7czG0zILGHashC+zUMNLgSH9xACUwuATc0zEK4++RxhOmEqoXn5CcF4CGofn0uH4Q0c0ApP1V8hfJFw==@vger.kernel.org, AJvYcCW0TAWZZNgFxr7bNW0FAhZ6guPPMZGyTT6cafMkL9tpfr4zSpK0hcwl9ng6kAYgVejrglL0KpVUDdCIYQ==@vger.kernel.org, AJvYcCXQ5fZw7fb8jvJzANaCQQGoJSviK6d/aAc5Ko7x28RyFeipEmc9ss5zGJ9KQq9P9O9Ha6bSu34CBrLeWy8=@vger.kernel.org, AJvYcCXUppBtc399bXbMxO9GBBv+6CYNGF51pbFXnDwHAheqtMUniTgcNl9D1/R5rQc4hZpLvrcIThjem9OnDMq2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj8t5Ab7lDGR2ntJ1HZWpe8b+R2QSFEP9pJsRwkerLh7DDsvUp
	xArnAL9eyziCnUXOlsOhOAC5Rk2TKy8qmA37aWcEcCFY3GFdpYzniIsmi56uNot8YmelDHHcRRD
	5e+h78Ff+OuL0wyCH1Zg6nX4DX9Q=
X-Google-Smtp-Source: AGHT+IHOWEG0AwNDnxkuV2B0EiyvKGcNM0HJ9W+omMGkeK0JN2w29/qxIjapvjqPv5QDt3WC9EC3aFmjF4za2pjLvC0=
X-Received: by 2002:a2e:b602:0:b0:308:e521:591 with SMTP id
 38308e7fff4ca-30b8469f9ffmr10979031fa.16.1740657884393; Thu, 27 Feb 2025
 04:04:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225164216.4807-1-arnd@kernel.org> <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com> <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au> <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <Z77aFJCVuXeDXRrs@gondor.apana.org.au> <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
 <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com> <Z8All3G80gGXzfaU@gondor.apana.org.au>
 <9f4e5f41-e553-4f2a-88fe-478f074b62cb@app.fastmail.com>
In-Reply-To: <9f4e5f41-e553-4f2a-88fe-478f074b62cb@app.fastmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Feb 2025 13:04:32 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHo56DhW=W=WW6cjGjYJuH-peMJaOzZGwRtD-aDPCn4VA@mail.gmail.com>
X-Gm-Features: AQ5f1Jr-uffN3tS-ijQnZ1d7avnvovRKGHuy1gPUBmz3_2vnL-45BxBh92ztQcU
Message-ID: <CAMj1kXHo56DhW=W=WW6cjGjYJuH-peMJaOzZGwRtD-aDPCn4VA@mail.gmail.com>
Subject: Re: [v3 PATCH] crypto: lib/Kconfig - Hide arch options from user
To: Arnd Bergmann <arnd@arndb.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@kernel.org>, 
	Will Deacon <will@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Eric Biggers <ebiggers@google.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Feb 2025 at 12:57, Arnd Bergmann <arnd@arndb.de> wrote:
>
..
>
> An unrelated issue I noticed is that CRYPTO_LIB_CHACHA20POLY1305
> depends on CRYPTO in order to pull in CRYPTO_ALGAPI, this
> looks like a mistake and could be resolved by moving
> crypto/scatterwalk.c into lib/crypto/ with its own symbol.
> That should be a separate patch of course.
>

The only use of the scatterwalk API in lib/crypto is from
chacha20poly1305_crypt_sg_inplace(), and it occurs on a cold path
where the digest buffer is covered by a separate scatterlist entry.
I'll look into whether we could just use the sg_miter API there
instead, which is what the rest of the code already uses.

