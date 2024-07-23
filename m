Return-Path: <linux-mips+bounces-4425-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB2F93986D
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 04:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DBB71C2199D
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 02:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2696713A402;
	Tue, 23 Jul 2024 02:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJ0PDWT9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15662F32;
	Tue, 23 Jul 2024 02:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721703235; cv=none; b=rojOfhUZtoA/HNzADtoxAgfIEv1zsVFslnty+fVykXrlOkCBc24M6mP2PW0yeC9FQfaVOW+xs6N0ASIo87pt0tgY7aVf8Z9i56JjRMlgMCOipzdgryl/iPmzdTXyqsMrZ4larzBgI71oBVaYUD82L/8U7u3zkprqfzEpftFUMZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721703235; c=relaxed/simple;
	bh=mGtWKysuUWTpJmO0vGq+fr7tw12kxzMkz57MGDuNNVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qleBOZtxw1ICKk3638xHSvPOkvoe5rpFSlE3cZhmFc0i7VdObUKjhQQH5XFkDw9Pc5ybInMgX3T7j3WF+XgeAwZEY+RDZFFwcmOL9t5+3GMl10yhtmTGZ2ysf6tBYa8mMhtrMzE0EngpU5UwfNPKGOn/p6EC/2O6Tz7/k/0rLHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJ0PDWT9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A823C4AF0E;
	Tue, 23 Jul 2024 02:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721703234;
	bh=mGtWKysuUWTpJmO0vGq+fr7tw12kxzMkz57MGDuNNVw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lJ0PDWT9WJnhDCJyPkEbZGh7LdWvb0/AYuM7v3I0LRGP4eQKKFDGG1DNEzLhMf6+r
	 UZDQpCKHdRm88bhKYan8uVMwqelVDa/d1/WUC4aEDLMHJI2lmeS5WRopXZXTq0RUc2
	 FDmHfHTMBq6N8RU+Mf5Biz4mOmxzAf19rEKZfu2uXyJuOGJUQzysydWx3lqRjWp7wV
	 5SEVh95w29U7wgL2rDyIzybUcOnjdfi19mvx0uwwcIS8U+72WUgWdBwbw725kYVSUF
	 ATYx0zF3bUlr1FZjo34WnkJWRHInkmiAd3EnVHhhah0o0/ltSN3ddcgUCYbCneEPFn
	 Eff8TwvMPhqQg==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a1c49632deso4465856a12.2;
        Mon, 22 Jul 2024 19:53:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjJ2HC0pL+rBXNoonIMSsGGUtXjfog6W1n/Qi0z+Sf8wsNFgDjowhwuNj39y1z3X53cUBhRArj9FFzW6emAz14L5+6ST+vzwQgr6iPRwS4QVOsh0p7QKfkWhfJlIKnzwtaCRzMb98o5w==
X-Gm-Message-State: AOJu0YzyrTts7W+obeo8N2FjQy/fSwekYghGWO++02n+2tlr/u23c4kh
	NxS05yWHOlTaYnQUuOfcmywl8w690FotuSpi6XQMVNDyhcPiyoJmz7R5nzIbi1AB5wmRgTQ+ODY
	9cuTzJbQ8upN66FLpxgCLgPnv3lI=
X-Google-Smtp-Source: AGHT+IHIhw7+SWNwrgCM4TUPmphBy1vlVAh0ebdtuMkoTGohzqzDCvWDAqZluZI9pPDAaMBXs7IYAk7gEvqgTpVbGbY=
X-Received: by 2002:a05:6402:520d:b0:58f:748f:9dca with SMTP id
 4fb4d7f45d1cf-5a477694f25mr6433188a12.1.1721703233086; Mon, 22 Jul 2024
 19:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
 <e68b7f44-8a3c-4963-8d95-be8747bf9a61@app.fastmail.com> <ZplQxmWwujQkBU5w@alpha.franken.de>
In-Reply-To: <ZplQxmWwujQkBU5w@alpha.franken.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 23 Jul 2024 10:53:40 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5gosuRFU8y1uLP6RmAGG9FTMK7ezhBuzeT9i5mkY8C=A@mail.gmail.com>
Message-ID: <CAAhV-H5gosuRFU8y1uLP6RmAGG9FTMK7ezhBuzeT9i5mkY8C=A@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Loongson64: Switch to SYNC_R4K
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

On Fri, Jul 19, 2024 at 1:29=E2=80=AFAM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Thu, Jul 18, 2024 at 03:34:30PM +0800, Jiaxun Yang wrote:
> >
> >
> > =E5=9C=A82024=E5=B9=B47=E6=9C=8814=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=
=E5=8D=8810:41=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> > > Nowadays SYNC_R4K is performing better than Loongson64's
> > > custom sync mechanism.
> > >
> > > Switch to SYNC_R4K to improve performance and reduce code
> > > duplication.
> > >
> > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > ---
> > > Last minute for 6.11 :-)
> >
> > Hi Thomas,
> >
> > Could you please apply this to 6.11 PR, or 6.11 fixes?
> >
> > This is technically a left over of previous clock source series, and it=
 does help
> > on preventing random RCU stall for multi-node Loongson-3 systems.
>
> if Huacai is ok with it, I'll add it to a second PR for 6.11.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

