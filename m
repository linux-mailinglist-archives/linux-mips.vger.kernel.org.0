Return-Path: <linux-mips+bounces-5162-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCF962E25
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 19:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176311C20C9B
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 17:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B578A1A3BBA;
	Wed, 28 Aug 2024 17:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOE+UeOH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D02513D612;
	Wed, 28 Aug 2024 17:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864734; cv=none; b=pT73aeIYAeeHG+Hhnf35tOx/b0LGdNLpxC3ZrzF7a+Dz8UaHT+rf8CW8Tkhpzva1uwteYSsDVhDs8U4iRB0lB8TEpvncQ9WyztOElyJ/pA7+Xg6lZCOYGLEWyBhUe9dxy4PSvUutImlD3qvtyzJqSFT0Vn4I1LUwzWskxHMGxqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864734; c=relaxed/simple;
	bh=0YrXGL5cUGbIblDpKlt0dTLFCsiCdrv3/assd9BTMzw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rUxhWfGP7sw2kyi0HFS7KJgfiBsRB9voR/o0uRYR55xOMhzy9G6eNpsc5bd5Duaxiy+X9GSFjzdL6z4Po0HDzLkfok9yI//FzS62Kal+uQ8i5zUf3nFtxwjtqVu79RyiMGmH12hbqlzCzeBjCg4Ukd5zRyZyrTpfj3v6I0/uP1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOE+UeOH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3730749ee7aso4109150f8f.2;
        Wed, 28 Aug 2024 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724864731; x=1725469531; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0YrXGL5cUGbIblDpKlt0dTLFCsiCdrv3/assd9BTMzw=;
        b=KOE+UeOHa6Ykgmk+gX6yE0wymtBhTPXPFcrJszPLYjaesxmCmVWCavD1TPD2XBBwuu
         xQ5u/uxTwf74smORWc6SYM+BP3UyFIZYWp1Szx5psI1a28ZENh9mhUSt18IndyQJIkkO
         v96K4hlL+aiX+pPCUFWye6uub2PtB+jLcGLNuqBSKSZ8FcU2+0SP0kFp70bf18r0HUQv
         Z7MbKhdZN6CFKSu8TxiDk1vx4vGlgT++4RnBE0Wrf9jE8ksDrDFAhhn5WlRLv+QWfxTx
         8HNW3E/q9TfLf5FcA+mmfs52QmdFyh0SIgf7LOxBvE7sqGaoXOePYvkqiBIr7fldDlDB
         c/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724864731; x=1725469531;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0YrXGL5cUGbIblDpKlt0dTLFCsiCdrv3/assd9BTMzw=;
        b=wG0NnkXss3opLXe+de1J5M1x1LjqN6n6VemowRlrtCj4PtUrO4f9qXyq5fkJK7Nrx1
         azT/VjghlQ2q3cTemsUJsOOSicl7gbXgPrHkB0PY+J1JY4rnm8qZMjA1jEqi1YK3iunj
         EPu23PbWvACZE6hflLhZ0RAkjqkRNrayr2UPwMfELqp3RTQ98hcKK8OB7Eyr052t6YHn
         pF6H8rLWBodeFCRMEmw6g7v/Blin3X8WDZDNhqd58j7zBkkQRurRb7uki8IyLrmmUGCc
         a8S2Sn6evneHsKh2pmfLVgd5hyfcvDM5AQ4zX1fERrdkFcFpVAibuOzZza6EBWBPCyy7
         yo+g==
X-Forwarded-Encrypted: i=1; AJvYcCU/rlGkLm2dSstVg+z/frL1tTQl3iV3mfhO8cqfXgkDnPIwCncOpTgPT/Lw8dmevrBcQvinQSvHAKyb@vger.kernel.org, AJvYcCU0o0vTSVtw0akPB8gLb96hpFk1aNR9L7MRcqeXO7TYHmTrOP3Dq+ia1Id/CQ+0XiITP9oA3xxQal/R/662@vger.kernel.org, AJvYcCW4nW7vVuxEfGr/9x8dL/NmHqF+GXb3Yse0AP4W6LjMYooorwD6ivS6Pwy7oggoaj50YaPmdbkrmrVYeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ax9DDgIgyPwang6nbsmjrYs5SbWokWHOsfcnmApZ3LmM7jwe
	uBgDUOw12hliiUk2GSlAtVB0r/Kr+jUa6q/k7htyxisdgJmtVLy7
X-Google-Smtp-Source: AGHT+IFqmPFtwx22aSwUiTa6+SlKocxcaXUGRyhPHCY180ArsnC7ZPaC5mq0cW5NxbK5x79RL/jwTQ==
X-Received: by 2002:a05:6000:1010:b0:369:ba89:a577 with SMTP id ffacd0b85a97d-3749b54d374mr191440f8f.34.1724864730914;
        Wed, 28 Aug 2024 10:05:30 -0700 (PDT)
Received: from giga-mm-1.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749b22d99bsm263396f8f.10.2024.08.28.10.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 10:05:30 -0700 (PDT)
Message-ID: <e29c28fa5e1a0aa912e0a490588b67a3cfede5d5.camel@gmail.com>
Subject: Re: [PATCH v1 0/2] gpiolib:legacy: Kill GPIOF_DIR_* and GPIOF_INIT_*
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij
	 <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, Russell King
	 <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Bartosz Golaszewski
	 <brgl@bgdev.pl>
Date: Wed, 28 Aug 2024 19:05:30 +0200
In-Reply-To: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
References: <20240828142554.2424189-1-andriy.shevchenko@linux.intel.com>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=mQINBGWpGj8BEACy09IxfduHTzAdqKkf3SmGIHIEquHWHIXqgVIoZo/ufP8mIpsWYwFKP
 9gsCvVvNNugtK8YPN92lbHol35nfZiXLIp16ASRQXYFtBjXj4GAVjUPjaTkQbcedIgD2nEZ/HQSio
 hfnUSS0YmxI0UUJmZFulwQZil6OmPVbbQoda8/In5h/wNRo6y5vJreRhsjqcP5LckLRov3t+jabUz
 n0/1twHNO0SnI508dXenEhQcBX7Wns+JfwRqO8jxBK1P3DntW+n0OJ8DkjSMJjm0zk9JtY28WK332
 Vpq8smZxNDNCfs1YtRMzfEEZKRvxsSMzTxri/cw7VXJa7m138LlyPBkXizjAKqad/Mrthx4ambsWu
 RXyjklYOBYqMEAdlZNLPQnhnIICFwkJ/lnLE8Ek6Dh0NYl1HpsOyvu1ii7VPEXHLMGTKFmFmWtrmC
 UrHIBrAvStMJ2jIRhEyCGDpf6f5dfKNOb3GWRtX36326TDOa2eXWqaTQEPKWRSUwhC3f3j/C/o/vj
 6bDHQ8ZsNcKYxwtSoh+elHT5xtHOMvPBP6gavgZRDnH6wBSHWnXYxyOmZPKr2NuhMwhEyhpvkEq5z
 W6Z/hp5POzZ74GNkIKB5/FpETobgoV/XB2HMnlIUAJE2RYRYwvbgIkKTJxFD4FIIP2DVt/7cT/8ry
 5Nhe2fouscuDQARAQABtDFBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbW
 FpbC5jb20+iQJUBBMBCAA+FiEEYDtVWuq7d7K0J3aR+5lQra83LKgFAmWpGj8CGwMFCQPCZwAFCwk
 IBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ+5lQra83LKjUHA/+KlP0no2WRK1co+2yi0Jz2kbSY61Z
 oX+RqbLqkCoo1UxsU/MddscgjKOfggNASZ1l//jUkx39smTBONmxcauTtY4bB4Q9X8Djk+XO1M9iw
 Gb7feCbnIuRHyvI3qygC+k3XgLIJScui3/yEL0aikd5U4F6nkKyQiPQk7ihKWKyBQXQ+tXS06mUH4
 p0O5BYvxijW32Z9esVB15OB8vUcx2bsdjogEuNc0uwOGMHsVIsW4qupoHRHPc1865uAqzv9vW3a2/
 GOG6IpBFjmXqg7Wy9zwVjSJFMvVxu2xs3RCdpS99aMrfA2na1vjC5A7gNFnr+/N2vtMBP0d0ESfd/
 54zSglu3FW0TIOIz7qkrWQKwiennfUun/mAvCynCrKpCpUMkEgeQw1rHCWpSfnJ6TPG0UfQGNUFyz
 zmBheQRSEksaepfCtqwCxtjF19JZ6yapLi/lQt7YBjwxIPkZRHJNelPkK/bs6yeRJul90+X6UAJst
 Wh4mC7HzVvmopJoCxbInS4+L6qlefdjqhB6NYw9Q5GsRmTKalaqJoW1/kXopeGExCY4r1FP5ZoLHF
 s0xNbycpD2tp/GnI8GlYCIzQED3TNab7IkWP2otXnWAnF8CrqhglBbYnp8oCkgBPatYftO4dWFP3Y
 LVWE0EtoWLLrmiWzHkbWc8YKpWAiFX8OhUJLKtA=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Andy,

On Wed, 2024-08-28 at 17:23 +0300, Andy Shevchenko wrote:
> Shrink the legacy API and definition surface by killing the (internal)
> definitions. This, in particular, will fix a couple of drivers that took
> it wrong.
>=20
> This is assumed to go via BPIOLIB tree as this is quite small series and
> most of the changes related to it.
>=20
> Andy Shevchenko (2):
> =C2=A0 gpiolib: legacy: Kill GPIOF_INIT_* definitions
> =C2=A0 gpiolib: legacy: Kill GPIOF_DIR_* definitions
>=20
> =C2=A0arch/arm/mach-ep93xx/vision_ep9307.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 6 ++----

for the mach-ep93xx part,
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
and in general, for the whole series,
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> =C2=A0arch/mips/bcm63xx/boards/board_bcm963xx.c |=C2=A0 2 +-
> =C2=A0drivers/gpio/gpiolib-legacy.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++---
> =C2=A0include/linux/gpio.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 12 +++---------
> =C2=A04 files changed, 8 insertions(+), 17 deletions(-)

--=20
Alexander Sverdlin.


