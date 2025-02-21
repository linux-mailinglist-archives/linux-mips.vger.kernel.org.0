Return-Path: <linux-mips+bounces-7890-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8F9A3F7AF
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 15:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 134D23B935F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 14:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D2920E6E6;
	Fri, 21 Feb 2025 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="du5vhu5y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033701D9688;
	Fri, 21 Feb 2025 14:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149421; cv=none; b=T/c+WCBj9g36DN8AiS3zQQ5GQtJLlwOmyVoEBxBAv9CVbEi2R0BJJAmMAev7Er93xLyUNdFc858++o/8T2vPk+Ae6tmyHLEO2c2bpkPElIoym82rqzmasVg4vqBmYfQmqfCG4B86LctbtAspXD9Xp90utUJi80AhN3GYZ5RCeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149421; c=relaxed/simple;
	bh=ICu7jURi+eCrwMnxHY2hXLjjLEW2O8TGiD4PRBFSzOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0z4majEHLWeTslQfpl8NmwU/o0bakDrrdykSw01dFDbt67ggI7j8FN/OqW6EFmRAga5z+TRq8hHjc/caZknAQYFBtl7jgKFHYgqjrpNoLDXoQuaqMl7yIx8DjSd753n+MZofTlNB6NyI3cfr5ykNFlZZieFve9zJE6593Qps9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=du5vhu5y; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso3884859a91.0;
        Fri, 21 Feb 2025 06:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740149419; x=1740754219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnaCgJJbjuqCnFgvXsUR+uoiDyGbCE42OXDtThDpJQE=;
        b=du5vhu5y7dEITCD11UhyEE28TAC7uDWe2CDSTaUqP6wISABQTdqxOuxw1F5CuajhCY
         bHjOpjbRf7KEqnOCIyoNCAn5x2wwLW4IjGDmJsWA5/FMqwgf4qzceZfdqgK4Io7PlA5q
         VELpveQZZ0NiT5mOQjmeZQYyJBtIpV/CfPylOqMnzgZLUO4BYdMjb1e9KTRiQ3/143xF
         In8A5KQR4dgq4Mf5UDVEjU6xQDw/FvXfEka/8v6k9nR7lM9ZHK3ipNPIBXp0ppWg21uJ
         etpGo6V2tnvGozRBDgUR4N1HO2/vjcbJrCN/pq63e/4yIJ4RklzY8S3Gcav+pAnwuz2c
         Vfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149419; x=1740754219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TnaCgJJbjuqCnFgvXsUR+uoiDyGbCE42OXDtThDpJQE=;
        b=DfZ3jmY3srZOPdUZNi2EqjOv65bSJ6hnLVc8y8Kh9lzGLJeOQ/RFaWCmOVLwL2lykR
         yfVMpqEiGdDbCSAFMYyN71fG89P76t0OtRM0vZSV6FN6bn23sw63qw7XJSCDbmSYoPZ/
         zrKs9obNjw8ftuGb9JjPiaeRNpYpjGOwzQ+afsugBxqXYPZ/HeBNj3w1lC+D0bACWO5U
         c5ieestvA8xjtGYq18UfkHMFKY/Fkn4JdslQHihga5SDcmkf4oSyU6OafOGqbc537c31
         7SMsXek5561qVngNoJqWvsHFTuMYdpPULuaNw73DG7r9A92WmyreNJWE4oZPHb6wY/Z5
         5/og==
X-Forwarded-Encrypted: i=1; AJvYcCUw8JKJU3DFHzTwR+EFoO3ylIe6AA4+DdMIMH8O9eKvFF43Venv07MMGekKRgfKRVGQ4a1dpmgKwONRH8Oo@vger.kernel.org, AJvYcCWO4V7bMxNnlokDrq7BB7zzWQFdMOGxLGhRZ1U1lRMAhlYrIvFb49RTj6OdWbgQOLaS+uk8sHmmFyG4EA==@vger.kernel.org, AJvYcCWvDVKkFp4id18aho4wq/te2iKDTPyHZacBt15lWQSlRW86IOIEq+1aWsNsafPUPu7V/x8hWcywYnF6@vger.kernel.org
X-Gm-Message-State: AOJu0YyLoS+GTs/rwdjNT3pvuDTFkO5O2FszZ13N0KUoYzBTqXt7wJ38
	yeaGMAtC8GiJxjaNLMHmOUInPh/0dXs12ndr6ZIVW4+Vvow72WLLiP55qDOkrW3arfteYdCxgTa
	6r1BD0w95qVzZTTwRW60XtGxmBF0=
X-Gm-Gg: ASbGncvP3aM3Uzgpvex1qDAE0cAJb7fWBJPJoXQ1lapgUisyYSoxIAV6ZwBRp0uWa1c
	7qpwzyrVdASQGDIrg0w2xZj31V65S4quQ6X3CmCE1KfFlk4apy/Mu66i8CpUVjILP9E/vqAson8
	KTqAbjBQ==
X-Google-Smtp-Source: AGHT+IGL5LVGSgK6IiICRZeBIWASDeK/qq211mmEywpTL8p7CKlj5qrng3Lt1HAaQc2t2ryZnSqP1uQVzUQ/vQHQd5g=
X-Received: by 2002:a17:90a:c105:b0:2fb:fe21:4841 with SMTP id
 98e67ed59e1d1-2fccc117c76mr14345975a91.8.1740149417752; Fri, 21 Feb 2025
 06:50:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
 <CAMhs-H-VevC+_=HxhMU6-at0bKut_JqdgO7j2detuB4s8R_QFQ@mail.gmail.com> <Z7iHorlRgtsi1LOo@alpha.franken.de>
In-Reply-To: <Z7iHorlRgtsi1LOo@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 21 Feb 2025 15:50:09 +0100
X-Gm-Features: AWEUYZnevsycp0vJDlGMFc7DxBxXdxcU7bf0Djx6LzWJk3KIOpX1he7jf8P7O04
Message-ID: <CAMhs-H-fcWU-rz_3FeAuRe0xdCMmvffX2zrZwwmt=8RYpY4Lyg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] mips: dts: ralink: update system controller nodes
 and its consumers
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	p.zabel@pengutronix.de, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, yangshiji66@outlook.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Feb 21, 2025 at 3:05=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Feb 21, 2025 at 11:48:34AM +0100, Sergio Paracuellos wrote:
> > Hi Thomas,
> >
> > El El lun, 20 ene 2025 a las 10:21, Sergio Paracuellos <
> > sergio.paracuellos@gmail.com> escribi=C3=B3:
> >
> > > Hi all!
> > >
> > > Ralinks SoCs have a system controller node which serves as clock and =
reset
> > > providers for the rest of the world. This patch series introduces clo=
ck
> > > definitions for these SoCs. The clocks are registered in the driver u=
sing
> > > a bunch of arrays in specific order so these definitions represent th=
e
> > > assigned
> > > identifier that is used when this happens so client nodes can easily =
use it
> > > to specify the clock which they consume without the need of checking
> > > driver code.
> > >
> > > DTS files which are currently on tree are not matching system control=
ler
> > > bindings. So all of them are updated to properly match them.
> > >
> > > I'd like this series to go through kernel mips git tree if possible.
> > >
> > > Thanks in advance for your time.
> > >
> > > Changes in v3:
> > > - Address Krzysztof comments in v2 (Thanks!):
> > >   + Drop reset include file since what it was defined there were hard=
ware
> > >     constants and no binding related indexes at all.
> > >   + Update patches for not referring to this reset removed file.
> >
> >
> > I was expecting this series going through the mips tree.
>
>   DTC     arch/mips/boot/dts/ralink/rt3883_eval.dtb
> Error: /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/rt3883.d=
tsi:2.1-9 syntax error
> FATAL ERROR: Unable to parse input tree

Weird, it looks like dtc is not happy with the "include" line with new
definitions? Are you getting this only with rt3883? Since all the
patches are almost the same and I compile tested this before sending..
Something got corrupted? I don't have my laptop now to check but I
will recheck again on monday.

Thanks,
    Sergio Paracuellos
>
> that's what I get after applying the series building for RT3883.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

