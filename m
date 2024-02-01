Return-Path: <linux-mips+bounces-1259-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 582AE845DA4
	for <lists+linux-mips@lfdr.de>; Thu,  1 Feb 2024 17:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CA851F26CBD
	for <lists+linux-mips@lfdr.de>; Thu,  1 Feb 2024 16:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1346B1FDB;
	Thu,  1 Feb 2024 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OPcGNwzL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF543FFE
	for <linux-mips@vger.kernel.org>; Thu,  1 Feb 2024 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706806086; cv=none; b=FndC5kDLt5mrdvd5g1UGfYMf3vgLBfguXJZzUsQ02/bYnACA3Zgug7Fvi/ga7fHUHlQjfc63dpwiS8xC9Uf1BuiIxcGM6+TkWkGlDyQ7axYNTzgUOzLEcUsUqJp3U5dN1lfK8rm5/9yGqXQRveTLisAhU0r0jlo6pegyKXLXYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706806086; c=relaxed/simple;
	bh=SEGEdx+dqT+/Ew8JKhflR6LHqrtX2JQ7vsb63ovQuTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bT5VqoeZWFZNyunCXjJ3gLkgtL2PF9MqReHeC159iR9kXD208GVYOO3CBHjRJ+St/RxKHSjDIdf+SGxJcrsia9ab7DHqvb/UfiQsMi63v1ASyBFy+6H7ZujEzEEKCwG92djQnS6olJ286l95yzEb4bhjWkEvEJJW47XeT3gRZ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPcGNwzL; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-604191522daso11506207b3.1
        for <linux-mips@vger.kernel.org>; Thu, 01 Feb 2024 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706806083; x=1707410883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7fik1J0VW0e/Mqa8n8TwB+QOmKZHZ7Id4mjBLFxQY8=;
        b=OPcGNwzL11qz+3B2RvanL72RqurfjxcvWMZ9yTzfvrJsX8KqbpXXeA+iYXRc3VebLY
         nn+Ap/IQC7xbXHi0rrvrQXyrP0H4ciLnjd/lgRuhhpc+dY0WVQZqrQx4xHeS329/qISh
         28K6M5A8APN4g3/xB+M//HDyIk6jySW/aUZ6/X2RNhhaPyPhvF4KZvttxtkv2WTc9mgU
         UP9Aky3gqI6kPPkOL2xdor2QaXqhOcpRwe4b8ABerLs1TrAQvLlhHYbpdAJa0bGVCzNu
         U+bBXu4/bB95KIkwtfC+zVUy9NKK2V//pHqJSNJK7h0GI//rCuDEZxdGfMTW5Rv9WBcb
         6NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706806083; x=1707410883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7fik1J0VW0e/Mqa8n8TwB+QOmKZHZ7Id4mjBLFxQY8=;
        b=Pr6tWPAkuOMCUt6Yt/QnqG4MTxclpcdrj1fYIWBZKCFGwv6orN25qrm1sxn8g1TxZp
         pfBm5m9UkAKJZIqURXz09vMclJfSyh7yw26207YTt4Trj/s2d1zs+nzcZl0a9iS+ht4F
         avPCscejwyrySQY7fo0HoGt3HV/DsvrBwzUsjH2y5o7DM6YFX0/NkwX1VCC9wDJ2wWOQ
         Vbyy9dDUBWFRPG7MeRvWOeBuPP4kY6n3+gJGFaxa9rlh11XKk0IwHLzgCr95gM2GCJGw
         kuAtpr6O6kRii28P7DPWJBsR/oMAHJ3SLkyBXsvvlJxv+51z1Qx+ESPG0cYm2tC/Yg4y
         ycsQ==
X-Gm-Message-State: AOJu0Yzs7l/ZGbpXn38JdvocD0ErdDfg78g/Y4eWeWMbFg+1wyQPGjld
	t3PlhnDgInYp1E/vZDvMnaBcKbaAskAY9XwmMzt/PWfnKNSH0tL1Z5JaOzbDwI8c7aM4mIXH6GL
	Par8K2FpD1+zFSrJhl2nk1mBK/IZJntHm593ZnA==
X-Google-Smtp-Source: AGHT+IG+SmfjRaQH7El4HH0vjqrdEODfpaYOF7D3+sS8NkQHEjWCndUfnYiQf8SoO624jsugJerkjDJUp44CWBy3d2Y=
X-Received: by 2002:a81:c545:0:b0:5ff:a52b:55ac with SMTP id
 o5-20020a81c545000000b005ffa52b55acmr4910993ywj.34.1706806083247; Thu, 01 Feb
 2024 08:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131-mbly-clk-v4-0-bcd00510d6a0@bootlin.com>
 <20240131-mbly-clk-v4-10-bcd00510d6a0@bootlin.com> <CACRpkdZvj2E1zfSU1RGY2+_6sCCYxu=pbQ0yv+-bmTLGzEyFwg@mail.gmail.com>
 <CYTO3C0G7083.1TVFK6PN35G1B@bootlin.com>
In-Reply-To: <CYTO3C0G7083.1TVFK6PN35G1B@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 1 Feb 2024 17:47:52 +0100
Message-ID: <CACRpkdYaVPWKATRec4Ta9mQatsjtt5Fexb-enXFEjGSxAt12tg@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] pinctrl: eyeq5: add platform driver
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 11:24=E2=80=AFAM Th=C3=A9o Lebrun <theo.lebrun@bootl=
in.com> wrote:

> > Can't you just use regmap MMIO to access the banks then...?
> >
> > Maybe it doesn't add much here. I'm not sure.
>
> Indeed, I went the minimalist route. You tell me if you'd prefer an MMIO
> regmap.

I'm not sure, because it might be that it adds more overhead than
it saves and then it is pointless.

> I've not seen any helper to get a regmap based on a resource, targeting
> by name. Is the expected procedure to acquire the resource then create
> a regmap config then call devm_regmap_init_mmio()?

No... haven't seen such a thing.

> > > +                          enum eq5p_bank bank, enum eq5p_regs reg, i=
nt bit)
> > > +{
> > > +       u32 val =3D readl(pctrl->base + eq5p_regs[bank][reg]);
> > > +
> > > +       return (val & BIT(bit)) !=3D 0;
> > > +}
> >
> > Maybe add a check for bit > 31?
>
> Will do. I like that sort of defensive programming. What behavior would
> you expect?
>  - WARN_ON(bit > 31) and return false?
>  - Just return false?
>  - Something else?

Your pick is as good as mine :D
I let the author choose what to do there.

Yours,
Linus Walleij

