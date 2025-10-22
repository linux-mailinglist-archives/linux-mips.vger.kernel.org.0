Return-Path: <linux-mips+bounces-11850-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF18BFBB34
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 13:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31626567C02
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 11:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E55B341660;
	Wed, 22 Oct 2025 11:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQbwhOdN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE10A340A73
	for <linux-mips@vger.kernel.org>; Wed, 22 Oct 2025 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761133367; cv=none; b=uhqC+coSwsmDc8MtMD3rIvar9U4jtpmj098mT98G5RKIHfoFI1hbueMoM1oeY+2XDPmH6OERQla5XaWumNYY2JHyiVFM9e9HN7BYD+SG99lOvGPHCswKZWvflQqMDQQPoXkeMNG491wzQ7ecstT37LXV3sZnfynLfk0ho20NGFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761133367; c=relaxed/simple;
	bh=zOospmkuyCNXsaHwls226XiyOnnAx3jAnkZv86jQp0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2aPMaelCmb1JDQ1NV/RYjxzq692i4I5k1WM2xPY8GxuDbIAct5r1XT859nEwgJUQkiCo4gCz7qyt5HstUqwQTB9ov7roFdCRnrVwpXor3XUIswhQqIR+Nz3bykv/l8C+vLEFJcfAoCa4ShWXSv/WFExt3oZFDo+rGZcm7GN9Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQbwhOdN; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63bc1aeb427so7079127d50.3
        for <linux-mips@vger.kernel.org>; Wed, 22 Oct 2025 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761133365; x=1761738165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWByXUQ+8ls0319ngD63nu9ZBrIRih1/y2GUtOGx1mQ=;
        b=DQbwhOdNnET6y2o0Hf5r60+x2C7TngsCjChvCRzB3GGSN/L+IOvNsdkLkZ1pJAnxpt
         qOToc2PCb8W4aNUiUKDIKZo+g8s9CqtbaBoh4YqOqM69JyZS0G9eaFbpE5X9Cxx5cIxF
         1C6OEEHNpcdOl8AZ2jELKFzGno0/CqoZQQ3e7pCGRSx+MuYvxXjMeTxIej95XbDeOXKT
         cN0FZS9kZ/wTrwdI7xaUWXeUhIzw9Se1u2trvE0V5K9hlc3s4RciDholBXW7v7Kjz/ea
         b+5ZkiHL8pcQw/ZUMfsF+BVWnr/SeymnP9KXWcs90c1PC8DjwUZHoJBCTNf8zoGuVA3I
         VDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761133365; x=1761738165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWByXUQ+8ls0319ngD63nu9ZBrIRih1/y2GUtOGx1mQ=;
        b=NGtFXrKHrQhzE77PcNSr2te65XAtvFQQCEEBBbDnEo3zJ0FrGbne6hQTs4/a+5jnFv
         mNsukkPxRpBH4Wm2pQ0bjnbWZ8JHVHALvGlOEdytffY6588bBq7A0MD1gVuko2tm6MZy
         WWhujyBlFxviSbL/aGr7Z2ugCrYDN4eRMah/De2cN+/EjNIRl6bp8o8+d/2i8wRpba6O
         jruzz3Fx+prw/a5XvHGQDhghSRK2fYKQ4FedKVhzLPhEztCalG2FyRXDr+HnVUZs+I62
         bQC/7DX6NYy69vV1MowY7Q8rVJCS+aUtZRBOaev3ja1/Qs/WPdVZMU9VmMW3PywnQ9YD
         QCDg==
X-Forwarded-Encrypted: i=1; AJvYcCV4CN3MZ200oXnLz8/JdXLN2lpngOc3qpOkGh72Wb03KoZ2Ac0qqKJ2djU6gJNzG8Ohuh4Nd6bOBUjD@vger.kernel.org
X-Gm-Message-State: AOJu0YxEb7RMMTJQTvueyZLxZTAvNdc5mM6Q9lC7Eu0antyIqDUYHuyv
	20RwxirB2eEvIFBd6VsfpyAimXbwnP5urT551XtXQ/dYm+dPmtOxqi8LVmvn1hYJuJKClOc7IHT
	2wklI+GpsMNtPHiUtPD/6FL3LSaIIPV0=
X-Gm-Gg: ASbGncuk1UWlhPNaJdjp3zW3TJPDwknN6dck+fiN9i0cPvPJIJOTlkbuUed2mQ/duag
	6Mr0bEAD5f+3AfSbsTj4/hVeSkVBw1HJRT1jujwgNT52YDtU1tIYwOBx8obQhgLZ86IdlEvwFsC
	0QWHGwiFSXSBH7fQ2sDfgSRAq2pR1stz8mZlIo3m0asgL0bA3bzmXCws+lgNQm7bbCyeYYlU3Mq
	OUbV/QuE6W+181E8jyqMydp/OEOqPahtvzYJDAulS+Wd7rDXJ+66YsKyQ==
X-Google-Smtp-Source: AGHT+IELZe97QxhQ9D0Ydgy8Y/J1wxjgRnJ6WVDd4/Lqiitn0JreGB487p8JvsAzyEYST0oriJRpmMtAcAmNEjRnBp4=
X-Received: by 2002:a05:690e:1487:b0:63c:ee51:5cf6 with SMTP id
 956f58d0204a3-63e16109eb3mr15755076d50.15.1761133364642; Wed, 22 Oct 2025
 04:42:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk> <alpine.DEB.2.21.2510212001250.8377@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2510212001250.8377@angie.orcam.me.uk>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 22 Oct 2025 13:42:33 +0200
X-Gm-Features: AS18NWCiq1xuAbkU0PmwgAvead88grrIXBJFiQl3qMV_6ZQICZF9yNnj15tVVzI
Message-ID: <CAOiHx=kHzx=Q_j+BM6jse7jwjzrXtiUoXpzLLgXVRzQhb38r+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] MIPS: Malta: Fix PCI southbridge legacy resource reservations
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 21, 2025 at 9:38=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> Covering the PCI southbridge legacy port I/O range with a northbridge
> resource reservation prevents MIPS Malta platform code from claiming its
> standard legacy resources.  This is because request_resource() calls
> cause a clash with the previous reservation and consequently fail.
>
> Change to using insert_resource() so as to prevent the clash, switching
> the legacy reservations from:
>
> 00000000-00ffffff : MSC PCI I/O
>   00000020-00000021 : pic1
>   00000070-00000077 : rtc0
>   000000a0-000000a1 : pic2
>   [...]
>
> to:
>
> 00000000-00ffffff : MSC PCI I/O
>   00000000-0000001f : dma1
>   00000020-00000021 : pic1
>   00000040-0000005f : timer
>   00000060-0000006f : keyboard
>   00000070-00000077 : rtc0
>   00000080-0000008f : dma page reg
>   000000a0-000000a1 : pic2
>   000000c0-000000df : dma2
>   [...]
>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
> Cc: stable@vger.kernel.org # v6.18+
> ---
>  arch/mips/mti-malta/malta-setup.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> linux-mips-malta-setup-insert-resource.diff
> Index: linux-macro/arch/mips/mti-malta/malta-setup.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-macro.orig/arch/mips/mti-malta/malta-setup.c
> +++ linux-macro/arch/mips/mti-malta/malta-setup.c
> @@ -213,7 +213,7 @@ void __init plat_mem_setup(void)
>
>         /* Request I/O space for devices used on the Malta board. */

This comment doesn't match the code anymore.

>         for (i =3D 0; i < ARRAY_SIZE(standard_io_resources); i++)
> -               request_resource(&ioport_resource, standard_io_resources+=
i);
> +               insert_resource(&ioport_resource, standard_io_resources +=
 i);
>
>         /*
>          * Enable DMA channel 4 (cascade channel) in the PIIX4 south brid=
ge.
>

Best regards,
Jonas

