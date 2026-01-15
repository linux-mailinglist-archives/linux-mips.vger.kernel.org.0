Return-Path: <linux-mips+bounces-12938-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2643D26051
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 18:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 757973010F9C
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 17:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F012C11F8;
	Thu, 15 Jan 2026 17:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYSxEI+O"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FF02C028F
	for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496424; cv=none; b=g5mQAQA6Ivu29QvLOaMSTTHy4HVhxXu+G95eB4GEpI8/hKAFStvo+R+NjXC4C9wx/yA0kWFrD5ak+1ccPBauybUrdGozTeKLNpDjqkCaFC0e+v4pPHuqJkCDXGqPeazve/f8MT598zG3K82f/av6H6Etrh4YBO2wJbkVurdrHpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496424; c=relaxed/simple;
	bh=ZXnoivxVBUQa2U3uRATn/SAEZubNzQew1oqA4+pLE1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoeECos4HzWrJq2s+y3tLnO2CHGShWO62aa+9oDEB7PcZk9F+CF4pRskR5G9uYvkKeovpRMUhzQXG7uHKXUEjTeHS8Z4RCryemDRICQ4dl7WuXGyHEGP04au2BiQ3Oy2cES2Sd+9f83mZ9qjU+CubMBDfI5i+J+8KofRfzZij0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYSxEI+O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C404EC2BC9E
	for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768496423;
	bh=ZXnoivxVBUQa2U3uRATn/SAEZubNzQew1oqA4+pLE1I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZYSxEI+OeX2Pwcx1nci3AJUY55IvoCBETLJht1XB9aHytEC3TsGCNIMnG0FQaQ5Oe
	 kJk46Oil1uQzFqnx2LNcu2/JDnznDXQktK7KUp7Du9UbNMwIF0au2hPCXwqm28lmmm
	 pXjZvzjuntHxiNkxUyVO98vsUp6QqT4+rTbasD9iDQY/NJ6F49pKRlVR5zUMUj5OWc
	 Si2J6ioWLf1T9b5uIF4mTsLmtSDfeQn8dBXfFyLBrZx7xGdiM35ToWSQg65X1XhA+X
	 hbixT05QHZkBf2xjhgDC6Z6HEukWFo5BR3wnf9dhxZ+X+w7jdWTnPfWSVN8jC7q3v/
	 ci1Ur/JFcY0eQ==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8765be29d6so164898466b.0
        for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 09:00:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA+lMPRhfMbd58u01gmSRuhR9ZEaPZ4tzIGRugqKxEJLPDvhABuRRQZ6h4+9F8TlLChuA3IImAWiTn@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMXtbV5gAEWYHdGMO2EyroOukvE5rkD1yr8PDXxj2JyVFZFQO
	fKAl1erUQwPEm+IyCSkwGPQ3hksYiZQNHl1lNa/e8yrCHXC9EEJ5c7A3Hwt7YCUz1BgDRxcU9+n
	O3sEXL/++getPgKg3CTSbE27YABVnBw==
X-Received: by 2002:a17:907:a48:b0:b87:2f29:2062 with SMTP id
 a640c23a62f3a-b8792dcdf4amr22448466b.19.1768496422244; Thu, 15 Jan 2026
 09:00:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn> <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org> <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
 <20260114205855.GA3190839-robh@kernel.org> <CAMpQs4+v=KhLW_Cru801p06vmpjJFotvyDfKBALg6mbwxFU5-A@mail.gmail.com>
In-Reply-To: <CAMpQs4+v=KhLW_Cru801p06vmpjJFotvyDfKBALg6mbwxFU5-A@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Jan 2026 11:00:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJVD3o41Zch6fMY6s-qmyd9cQg6CJ+iya+3kdtuqvNMoA@mail.gmail.com>
X-Gm-Features: AZwV_QhH7fbAW1uy00b0PiEt9cxyR0HtWiRhvd3H6Ah7cjw_EUJkNE0JYevgxT8
Message-ID: <CAL_JsqJVD3o41Zch6fMY6s-qmyd9cQg6CJ+iya+3kdtuqvNMoA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 1:39=E2=80=AFAM Binbin Zhou <zhoubb.aaron@gmail.com=
> wrote:
>
> Hi Rob:
>
> Thanks for your reply.
>
> On Thu, Jan 15, 2026 at 4:58=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Wed, Jan 07, 2026 at 09:22:41AM +0800, Binbin Zhou wrote:
> > > Hi Rob:
> > >
> > > Thanks for your review.
> > >
> > > On Wed, Jan 7, 2026 at 3:13=E2=80=AFAM Rob Herring <robh@kernel.org> =
wrote:
> > > >
> > > > On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > > > > Add "loongson,ls2k0300-rtc" dedicated compatible to represent the=
 RTC
> > > > > interface of the Loongson-2K0300 chip.
> > > > >
> > > > > Its hardware design is similar to that of the Loongson-1B, but it=
 does
> > > > > not support the alarm feature.
> > > >
> > > > But you are requiring the interrupt property for it? Isn't it no al=
arm
> > > > feature means no interrupt?
> > >
> > > Yes, the `interrupts` attribute is not required without the alarm fea=
ture.
> > >
> > > But my judgment condition is `not contains` (added in patch-1[1]).
> > > There are only a few SoCs on the Loongson platform that don't support
> > > the RTC alarm feature, so I think `not contains` looks cleaner and
> > > simpler.
> >
> > I should have said allowing rather than requiring.
> >
> > You are allowing (though not requiring) 'interrupts' for Loongson-1B an=
d
> > Loongson-2K0300. In patch 1, you made it required for other platforms
> > which is an ABI change. That's fine if it was a mistake and is truly
> > required.
>
> Emm, it's true that for the binding interface, Patch-1 is indeed an
> ABI change, but it's more of a fixed patch.
>
> Throughout all existing Loongson DTS{i}, RTC nodes decide whether to
> include the `interrupts` property or not based on the alarm feature.
> Loongson-1c rtc nodes do not include the `interrupts` attribute [1],
> while all other Loongson chip rtc nodes do [2].
>
> So, while this is an ABI change, I don't think it affects existing
> Loongson DTS{i} rtc nodes. Also, it more accurately describes the
> features of the corresponding RTC device.
>
> Therefore, I would like to clarify it in the Patch-1 commit message of
> the next patch version and fix the error in the commit title:
> dt-binding -> dt-bindings.
>
> How do you feel about that?

That's fine, but you also need:

else:
  properties:
    interrupts: false

So that on the 2 platforms without an interrupt(alarm), 'interrupts'
is not allowed.

With that, you might as well just drop the 'not' and flip the 'then'
and 'else' schemas around.

Rob

