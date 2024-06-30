Return-Path: <linux-mips+bounces-4044-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2DF91D319
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 20:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FD7E1F21155
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 18:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CD51552E3;
	Sun, 30 Jun 2024 18:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l+AGc7Gs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DD43716D
	for <linux-mips@vger.kernel.org>; Sun, 30 Jun 2024 18:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719771875; cv=none; b=ZrtyyHMvNKzqJ3VyWuSnPJzWr1CANG/GKOUrLDawfo/fkoyTJxsmVqYAUJ7J/5FVKCLOQ7d27H5RXslIsrValL02wbvg1dN/MKILeC3Xazvg6e/FhbV3Iytx47ItStY5P/f/Zg+pgkyjO7HEfooUPtOOgdQKaE1QVfklI7UBq5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719771875; c=relaxed/simple;
	bh=Ad27A/YQ8b+PsZdM9iE5jjw7ahYNtAu0QVbybXWTgBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iT6ec0tStbYYSqUHZUrhAkH9uOgsEliyrnpALPQrypHqfnallRGxF+rwRNqoJsmlAvQDFZ07FNlbxBnB43ULJCEp8ASFvsMfRpmeo3quQeqKC7WbU8g3pfoKxOPWbYaYy/MODyfV3IQGSLlUFTgRJz/sj/uzJMVj04FUimOn9Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l+AGc7Gs; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ce08616a9so2546e87.1
        for <linux-mips@vger.kernel.org>; Sun, 30 Jun 2024 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719771871; x=1720376671; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ad27A/YQ8b+PsZdM9iE5jjw7ahYNtAu0QVbybXWTgBg=;
        b=l+AGc7GsnOkKZbqJdGnSgO3IOTdWXtTLa2tj+babBfJGb8y1xcztfLDrc8P8Z6icy1
         AM6fgWxb7EghBo97RhDHuj/f4Zx0rbJ7CR/Hz/tNLF6nhIoynjkcKOth/CilQIedMupR
         N3/CHjizANts4vXJ0KNuGZlAVpfTaie6nUxteRcCfy0VGEWZ4KChdXKNCAP7w1llJCzf
         n5l/QQZl/QnOEG2Db0+uTKz+GscU+5EPNnp0sJNB4slDQSeFGTgcs2Zhoz4omz8tp6XN
         /NaFX6xj+ULf8G7+IO9X8NAaSWTCk30qMf81Ep/O+WVdpCgBTDxlT0iCW91fk4eVF6LV
         Fbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719771871; x=1720376671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ad27A/YQ8b+PsZdM9iE5jjw7ahYNtAu0QVbybXWTgBg=;
        b=cvCbj8BH0FLn4MqO4Xh+NoYCBPJ5xf2IUFsbf+Pa6WeiuH/GAbmZ5VrY0Clu8u58RU
         emj5Bo1AxAOPD8kAPCJaqOXczoBtZraPwrFpLMwrVMvVdkuuPaH5ewFRx079e78NG9vl
         w0fG6bKxBnSbPv/4zt5TvmeiK/T65IK/ackNz2uWsUfgL8wsmi2m3oEjSVGFqA5Miz77
         qqCwBIz9f4COGVcr4frXdYoBBXyandlerA0FNDfv3HowDVZ8mLoqnT9jXpt+j/KmTbq/
         FWKMVNp6EeagDHpI7l+4/PTQsenx7UTkuH++OBE6HI1g9p/70jZjD7K4U0hBHZU96prk
         PaLg==
X-Gm-Message-State: AOJu0Yx2uoxV3o9LGvWvUH042I3qMJ4dbe8bG7gKKYYBAdVB05tO3osp
	gK0l6Uqrr0vwVkqvdAJwNr80JXfFcMQIoO73AFzyvQoTs4KtzipIw+F7RcHEPBFaXw0oHAPBDeU
	pPqyqInjTnTjt84bdwQpeig5AdiH6RZOkZLaKamz+tRiuX4ZpXLHi
X-Google-Smtp-Source: AGHT+IE3wLXCgwIsCiLcIacKUfb+N8OR38F8BkKMdC+LdTBY83L+B0yM7DGghF9uTU6/4U+qaMhf/AkX0t8uy0C89jk=
X-Received: by 2002:a05:6512:220b:b0:52e:8475:7c23 with SMTP id
 2adb3069b0e04-52e8475c184mr36719e87.7.1719771871202; Sun, 30 Jun 2024
 11:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOUHufac==iT7BD9_eWERNcpazV6KEaR3qupR9v5SrzC4GXYcg@mail.gmail.com>
 <b8abe9ab-9fc9-4117-b4c4-728c99f46d88@app.fastmail.com> <92ab0d2b-cda9-4d69-8312-1e1c256cf900@app.fastmail.com>
 <03a8b78d-5643-4711-a57f-47f87b8bd566@app.fastmail.com>
In-Reply-To: <03a8b78d-5643-4711-a57f-47f87b8bd566@app.fastmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Sun, 30 Jun 2024 12:23:53 -0600
Message-ID: <CAOUHufbR6sFguZ0r6NvGRH1mO542BkLaE7vzdFq2LArMNj9qfg@mail.gmail.com>
Subject: Re: MCEs on MIPS: multiple matching TLB entries
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 30, 2024 at 11:25=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.c=
om> wrote:
>
>
>
> =E5=9C=A82024=E5=B9=B46=E6=9C=8830=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=
=E5=8D=884:01=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> > =E5=9C=A82024=E5=B9=B46=E6=9C=8830=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=
=E5=8D=883:22=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> >> =E5=9C=A82024=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=
=8B=E5=8D=886:57=EF=BC=8CYu Zhao=E5=86=99=E9=81=93=EF=BC=9A
> >>> Hi,
> >>>
> >>> OpenWrt folks ran into MCEs caused by multiple matching TLB entries
> >>> [1], after they updated their kernel from v6.1 to v6.6.
> >>>
> >>> I reported similar crashes previously [2], on v6.4. So they asked me
> >>> whether I'm aware of a fix from the mainline, which I am not.
> >>> on
> >>> I took a quick look from the MM's POV and found nothing obviously
> >>> wrong. I'm hoping they have better luck with the MIPS experts.
> >>
> >> Hi Yu,
> >>
> >> I never hit such problem on my (non-bcm) 74Kc systems.
> >>
> >> However a quick glance suggested it may be related to Wired TLB entrie=
s
> >> on your platform.
> >>
> >> Both duplicated TLB entries, Index 2 and 3, are all below "Wired" sett=
ing,
> >> which means they are not managed by mm, but platform code.
> >
> > I just tried to dig into bcm47xx platform code and I think we should bl=
ame
> > bcm47xx_prom_highmem_init, which created wired entry for high mem and m=
ay
> > conflict with kernel's mapping.
> >
> > Nowadays, MIPS mm code can handle highmem on it's own, so there is no n=
eed
> > to create such entry IMO.
>
> Sorry, I think I made a wrong diagnoses, it's actually a problem in our c=
ache
> alias code.
>
> Will try to fix.

Thanks for looking into this!

