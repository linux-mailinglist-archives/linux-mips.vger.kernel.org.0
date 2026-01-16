Return-Path: <linux-mips+bounces-12943-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 782EBD298EC
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 02:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8824F300E015
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 01:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D443328B5E;
	Fri, 16 Jan 2026 01:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGAdR3nK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA20D328B66
	for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 01:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526115; cv=none; b=pvHOSlJIoPUk9yfQXIqsasRxC7iaDmaCjtHS2MxfHgv4cs+SOun8VfMqJdhlxbBSK8H7ViVmw43aYvv28qnZpZWUnn4rLUxP3+c8ngptD/LQQp2eankbtg1ONg99CwVdcxpChcvRqBxDLmljm4EmSAy4d1fPzrjDk4MGgxNfvo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526115; c=relaxed/simple;
	bh=ROU4R67s950GbA7GHKQWHktozeFvbhpGduCMWOOF/Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vvrf7Oey9oKGuALCKSx4sh4CJnBxbsjUu81WMg3yzU9KlJpSjkcvEFhopOwPLn8iiYmiJ+RWXmqDAKKpTq5zth7wNXzY/hnyiQ9eArrOKFsbcW/tHzAXPjwse6E4Q35jAKNKTskTMd1L5tiAgATUZJH2NIaTk/ZZWMyGdvRgsq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGAdR3nK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso3094137a12.0
        for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 17:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768526105; x=1769130905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS5A6hdws9JgSg5NdQLN8SLz4AQmGLJR4UdFXen0ylY=;
        b=WGAdR3nKFmzxe9lIyP+fL2kMNvgUvbY6wKC8CqaQzX82a+RL56V18+r/CLd1LqW9Hb
         x/uiER+JeOClJ0qZ5qc4VoI8MkTyRRB2tC+8mcZTqlNG3UmszeTRYshboIw6Xb4HSSjj
         MHv/tizZeQGg7VKyEUZIdnC8xV/AWcOhjSZwuCd/c1EhEju/xP01UuqF5Se8yjfBsWWz
         Ovy2pth/gNaiUsVj/nYmxR7A72aWwI9fbT1cD5KLdvIDZe6J/DS1kM9dU5iW7rSFK9Yz
         KY2ZHf8MK8VWXesRwdMUpgbazedJKdA6rg3jAlR3M3WoQ51EWlIhCSAdmroHSvzU0JnD
         hUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526105; x=1769130905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KS5A6hdws9JgSg5NdQLN8SLz4AQmGLJR4UdFXen0ylY=;
        b=D+T1XwnXNJYPI2GQNyrXqcyGMh3pcRNABpJoMjvNB5AwskIoSKQ6MamMmm7RnJCwH4
         FenSloEcmaRxGo6FDgdw7++ZHN4UL+YwAU4VZx2x3q5Ovr1UiTEL8Zv7VpdKcEvIzyhA
         zhConLVs7bIX5EBuQDVMbKxn0Ae0EJ9uy8Q94/3hW40Rv1KwF8L6KEEeqhNp05VcUl/q
         yv1fE3OgdcKUKiG545H6HYr07Y3b/PMXrqslbttvl/CcT8f/imjZr9PoIX5tO7nn98kb
         2OdWiV7QIHe0XYzmff1tKJ4EW3XWmPvxyVWbkbj2J1n0ffWz0drj1uqrIHfcpESscUqE
         DXyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr28KGEYs/OcgQNGaTIDDw1kFRiEqJsTGwAhlrbSmUHyk1NnKqeZuM42eBD2x667iQ3RtLdzxGzWB5@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2ywJlz2gYw6Jf9FmmDMGJebLmqOci4Gts8xLXEuWS78kKeZy
	pOV80sXFOe7OvHEGPBj31Ma25VoWRzPA5iflB9nnZSv81TOlwGxIwHwouMHkeVCw43IofCW3Ngu
	ENt/jFj2+4utmu+NQji59iv04dzfvUZw=
X-Gm-Gg: AY/fxX7R7KtCx6Jr6JIiH4/c5EQtVfDaBTGv8W17EIb6g6OCB4iCBez3vc2q+fCPkm0
	tRRuy6wds5eVJ5vRcVl5YpBfHoYjUKHUA/bXusE+yA8dgP/AGGPrJ3LT+fIQ99MKWmwbzh9Fg1O
	oZEYsdHURhueWoomwVNk91mFdCfK8yn2dQDUCEKS4BQglboa3zgRvMVmc7SWgml6PqRfdyBsC+R
	Br5zNaF0qBk1bGAJUSADzi8Twv/GdfTNQ7MGPMVLjkenVrdOYpXaeff8TCOY6LyT0S4PYsqR9kD
	28t6p/M=
X-Received: by 2002:a05:6402:51c9:b0:645:1078:22aa with SMTP id
 4fb4d7f45d1cf-65452acb341mr974597a12.19.1768526105360; Thu, 15 Jan 2026
 17:15:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767663073.git.zhoubinbin@loongson.cn> <8876bebaf08121bb5edd2500f5289284b75df011.1767663073.git.zhoubinbin@loongson.cn>
 <20260106191314.GA2568583-robh@kernel.org> <CAMpQs4LpKSLGKySmzHeysS3x78inUQy9DF4dShneNymDvAi4Ew@mail.gmail.com>
 <20260114205855.GA3190839-robh@kernel.org> <CAMpQs4+v=KhLW_Cru801p06vmpjJFotvyDfKBALg6mbwxFU5-A@mail.gmail.com>
 <CAL_JsqJVD3o41Zch6fMY6s-qmyd9cQg6CJ+iya+3kdtuqvNMoA@mail.gmail.com>
In-Reply-To: <CAL_JsqJVD3o41Zch6fMY6s-qmyd9cQg6CJ+iya+3kdtuqvNMoA@mail.gmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 16 Jan 2026 09:14:52 +0800
X-Gm-Features: AZwV_QhUFfli37YKjCtOZoZJEFk_EN3-i1wZz_UWr78liB25i8-qldPEHYjcGIE
Message-ID: <CAMpQs4JuGXvNA+gbo3LHeqEw+JZ2JNnmgfLZZQNV+A62e+psdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dt-binding: rtc: loongson: Document
 Loongson-2K0300 compatible
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

Thanks for your reply.

On Fri, Jan 16, 2026 at 1:00=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Thu, Jan 15, 2026 at 1:39=E2=80=AFAM Binbin Zhou <zhoubb.aaron@gmail.c=
om> wrote:
> >
> > Hi Rob:
> >
> > Thanks for your reply.
> >
> > On Thu, Jan 15, 2026 at 4:58=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Wed, Jan 07, 2026 at 09:22:41AM +0800, Binbin Zhou wrote:
> > > > Hi Rob:
> > > >
> > > > Thanks for your review.
> > > >
> > > > On Wed, Jan 7, 2026 at 3:13=E2=80=AFAM Rob Herring <robh@kernel.org=
> wrote:
> > > > >
> > > > > On Tue, Jan 06, 2026 at 09:33:32AM +0800, Binbin Zhou wrote:
> > > > > > Add "loongson,ls2k0300-rtc" dedicated compatible to represent t=
he RTC
> > > > > > interface of the Loongson-2K0300 chip.
> > > > > >
> > > > > > Its hardware design is similar to that of the Loongson-1B, but =
it does
> > > > > > not support the alarm feature.
> > > > >
> > > > > But you are requiring the interrupt property for it? Isn't it no =
alarm
> > > > > feature means no interrupt?
> > > >
> > > > Yes, the `interrupts` attribute is not required without the alarm f=
eature.
> > > >
> > > > But my judgment condition is `not contains` (added in patch-1[1]).
> > > > There are only a few SoCs on the Loongson platform that don't suppo=
rt
> > > > the RTC alarm feature, so I think `not contains` looks cleaner and
> > > > simpler.
> > >
> > > I should have said allowing rather than requiring.
> > >
> > > You are allowing (though not requiring) 'interrupts' for Loongson-1B =
and
> > > Loongson-2K0300. In patch 1, you made it required for other platforms
> > > which is an ABI change. That's fine if it was a mistake and is truly
> > > required.
> >
> > Emm, it's true that for the binding interface, Patch-1 is indeed an
> > ABI change, but it's more of a fixed patch.
> >
> > Throughout all existing Loongson DTS{i}, RTC nodes decide whether to
> > include the `interrupts` property or not based on the alarm feature.
> > Loongson-1c rtc nodes do not include the `interrupts` attribute [1],
> > while all other Loongson chip rtc nodes do [2].
> >
> > So, while this is an ABI change, I don't think it affects existing
> > Loongson DTS{i} rtc nodes. Also, it more accurately describes the
> > features of the corresponding RTC device.
> >
> > Therefore, I would like to clarify it in the Patch-1 commit message of
> > the next patch version and fix the error in the commit title:
> > dt-binding -> dt-bindings.
> >
> > How do you feel about that?
>
> That's fine, but you also need:
>
> else:
>   properties:
>     interrupts: false
>
> So that on the 2 platforms without an interrupt(alarm), 'interrupts'
> is not allowed.
>
> With that, you might as well just drop the 'not' and flip the 'then'
> and 'else' schemas around.

OK, I'll fall back to the writeup in the v1 patchset as follows:

if:
  properties:
    compatible:
      contains:
        enum:
          - loongson,ls1c-rtc
          - loongson,ls2k0300-rtc

then:
  properties:
    interrupts: false

>
> Rob

--=20
Thanks.
Binbin

