Return-Path: <linux-mips+bounces-6784-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEF39D5901
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2024 06:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFF7A1F22788
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2024 05:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB95570828;
	Fri, 22 Nov 2024 05:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KrJ0ZCEb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C5EC4
	for <linux-mips@vger.kernel.org>; Fri, 22 Nov 2024 05:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732251745; cv=none; b=Dwn4L41T8858dIKZmjejIsahQIQXSa/A69GbMOQhhRRnG2z6X6xeLUJ4AifDzjq6M2ubVJMSSTrEB7PIJK3/FxrsAf4dtgN2lX23xxsMP7L7I+D7saqU+qbyaJXn3ty1y1VKAc6ZurDBNacxQWf8VV8p6kM7tb8fYvWd9W+xel8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732251745; c=relaxed/simple;
	bh=qS801PKOtt5qeQd2rrmw105l2ICVujdW2kRWx0Iz3Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tac2D+NF3lY8PMjEYfAY6pwM1zUshgrJNDabxSOfN/se+jAxpL++KxTqCRCuJJ8QQY/rzxJyY3+KZXbqFlGmBXyT65zk9jdJxctKUPgT9PoqEBDUGldUI3ypGqyMeS3SlyRK7G89eAkiYWOXxd5Ib6n3QS+5WAO577yYUb3Uq08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KrJ0ZCEb; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-460a8d1a9b7so110351cf.1
        for <linux-mips@vger.kernel.org>; Thu, 21 Nov 2024 21:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732251742; x=1732856542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM2OedZjIPfu4sCxCIoKHGUlk/UJAhQ9XCieLskfQt0=;
        b=KrJ0ZCEb9LOLPC3M4Pt0rlrP2ESunco/Ld7vDx2GIMfdVvROkINNdfxWVyub9lWt+H
         GEhfOc7giNAl4IR5ehENn3t7XV3LwM2bx9IFA4YX5fKwxcTegrxQqt31c2c/L9Qj70tG
         EXhFC5EIcHH3KmHTK0dnI0g+siE6Q1fZbSQSWXhwQBl9DwtZMVlTpOPTeqYKximwpENl
         110CeRcXUTWyJGWaERwsB6+Y8vSQX3PK8Ark/bCuF5MWMSJoDtCE7EiLzcXlTc/ZI6lV
         sm48KvG2AAEvuiqjk0ntAgUu1UafbT8jrvPbutGNDC+OY8yqH/T2m9VzB24xN31iEIPy
         PpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732251742; x=1732856542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EM2OedZjIPfu4sCxCIoKHGUlk/UJAhQ9XCieLskfQt0=;
        b=dw2vAJ4XR5E2ZY9Petu9OZwRTRqFpOiOtd5aU8V10DtEfGF747j20CQbUTZFVWIpx+
         NazTP2epb0BbVnI3etW191crmKfh/owrbF0632ifUJVeohUhUqXPueHKXDK1MncQMGgJ
         UIZX9BDOZO8DCYiE2qqpUs1m6mPojQqsPaE830/i5SMt+22+9kUSI+5hRqikedbamMRE
         zfYM1QViVbzhJHcw9uK4tE9+ax47Gs4iQl4mOrdWlz/Ec1RYbFepL4+3KnG0eRNp0Tfq
         swdwClh9k3BQYt0ftkS3uewZm9tqIMwkFN1V3Elgt2rylmLPM3RwyF05KTcwMSxtJBmj
         Ef+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAECfrJj2Th8FTJxDjSc4CYzBLkpab/awPb9YERhBUYCHcKhBeqAt4TzYoSrN9sydWfX3eScx0E0xV@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUu94E6PDyfwxiLSt9wYgcARIh9abfx4qZWp1jGuGZevsJpWk
	syfECmTxUJ3kb2T1MiXsyjIhbiWDEUZ19hTmQJ7ou5KkDEW7rDQqbNcqwrysbOcwQjKOVVBFEVF
	O18AaYGGolC+iGlNVX5CMPBXFdXk73NuiFtMeaUrca1BjfnVCvXPMD6I=
X-Gm-Gg: ASbGncuSD8KIYxJjfVoFkXPPn+K9TaUx+K1MdRz3fBF1HIz13EN+FNqurt/9pSfxPJz
	Wz4Z///YSajLnZegA0GNB8HnCTJtsycY5ARK2V7FuUwPF7w9pWIM3SDjjrMA=
X-Google-Smtp-Source: AGHT+IGSBdZWAT4cnvExtpdsqL27XrwwPqF3r4InTPu6pwGviu4eUZLWygopHUdvMXgTBRe1ZG+RSJzlreUH80PAKWg=
X-Received: by 2002:ac8:5d02:0:b0:463:6f7b:250d with SMTP id
 d75a77b69052e-4653d5d7379mr1908991cf.24.1732251742485; Thu, 21 Nov 2024
 21:02:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cd252b78-077b-441e-8371-106d71258ff3@alliedtelesis.co.nz> <84d9200e-25b4-4bd8-8eb5-c954ff92ac08@alliedtelesis.co.nz>
In-Reply-To: <84d9200e-25b4-4bd8-8eb5-c954ff92ac08@alliedtelesis.co.nz>
From: Rong Xu <xur@google.com>
Date: Thu, 21 Nov 2024 21:02:10 -0800
Message-ID: <CAF1bQ=RU2dZU3ENy3MLM4FvrZNaZprgPAM5vbRtUVDixJNQ_zg@mail.gmail.com>
Subject: Re: RTL9300 (mips) fails to boot with commit d4a7f2510ff4
 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: "Han Yao Yeo (atg)" <hanyao.yeo@alliedtelesis.com.sg>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Gotoh <gotoh@allied-telesis.co.jp>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does the following patch fix your issue?
https://lore.kernel.org/lkml/CAK7LNAQSpM2hh2=3DWgribb92nHF5_peRb+gxdO1Bt1Mk=
eL8N+hw@mail.gmail.com/t/

Masahiro Yamada already applied the patch to kbuild-tree.

I also proposed a similar fix as yours. But we believe the above patch
should also work (and probably is better).

Please try and let us know.

Thanks!

-Rong

On Thu, Nov 21, 2024 at 6:29=E2=80=AFPM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
>
> On 22/11/24 14:58, Chris Packham wrote:
> > Hi Rong,
> >
> > I was just trying some of my in-flight changes against linux-next and
> > found that my RTL9300* based board no longer boots (nothing on the
> > serial console after U-Boot hands off to the kernel).
> >
> > A bisect between Linus's tree and linux-next/master points to commit
> > d4a7f2510ff4 ("vmlinux.lds.h: Adjust symbol ordering in text output
> > section"). A build on d4a7f2510ff4^ boots successfully. That series is
> > well beyond my area of knowledge, there may be something that the MIPS
> > SoCs are doing (or not doing) that is being affected by the sections
> > moving.
>
> Based on the sparc change that accompanied this commit the following
> does seem to restore working order for me:
>
> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.ld=
s.S
> index d575f945d422..e90b0f68290c 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -62,6 +62,8 @@ SECTIONS
>          _text =3D .;      /* Text and read-only data */
>          _stext =3D .;
>          .text : {
> +               /* Match text section symbols in head.S first */
> +               *head.o(.text)
>                  TEXT_TEXT
>                  SCHED_TEXT
>                  LOCK_TEXT
>
> No idea if that's appropriate
>

