Return-Path: <linux-mips+bounces-7894-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B62ABA3FBDD
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 17:48:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74FA219C6CC5
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 16:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634B71F9AAB;
	Fri, 21 Feb 2025 16:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6+FH+4N"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C433E20012D;
	Fri, 21 Feb 2025 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740156045; cv=none; b=eTY2c2h0h4g1R3s7hB7gLxF3Rc4MaxKwq6T3HY21x2ZUdjliZaC/FwiK5AYCCAWr1mGtDvfdvLC6EAQZC/fxEizGKs1UilZl+5lb1NvHGc2ZiKKuCgoG3qoXZQ/oF+M7nR/Fmt41xBb7TbyV/lBEjWuWEJRm0dFI16g9eAJII4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740156045; c=relaxed/simple;
	bh=GpoYUbvMHeDFXWzT7i5jYtr05xdjDSBLMsc7Xba85xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jNisjRC02W3D5BN8KE1kDpF8gT+gKt1h6ziF+xw48HjH9AUZRDLOudV3Z7XnD+dzJQdEyBQPEmDFJ/Gn9Nr/SPjC2XtVAA7s+mIgum/o7Ss0RSYR870C4gnBWui39Cp8Rg1jyQl/4SOhIjS0Cwv9sE43FpGGDPMEpK/qV6JwmGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6+FH+4N; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso4808737a91.2;
        Fri, 21 Feb 2025 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740156043; x=1740760843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oriecgGQRM7a6Kxdnk4S3T7p3y/bp+RUK8BxU8K1jc=;
        b=O6+FH+4NeKccMJ0DhZuEJcgWnNMwpuX8FW6xTsRSEIv9lw9s1988+URs2JAYVnRp2U
         2sr9FIJ8+TgFZi0kqsB+FZa9IjoOfZz/03BYDbBaO0oF3tkMlsDVsXrS+yKfLR2Wb3O5
         yw9pAws20WXzhzV/NCfQJhEL5ziEbQQP7hg3T3sDyxisDZgSjS3IVUqoh8pc/Nsv0KrL
         2iArRbhvW4wv7M6OxM429flDzJIYl/WLKI8LnXtXQV5vY5Wtvjsxm43vYTbrgHJ6Ig5G
         9A5WPUQrNPIBxokj/pwPuhij1v45uCtOY+zIYb+ckjJvbpZkVQZZTOj1HCsew88kOT4G
         7ytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740156043; x=1740760843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oriecgGQRM7a6Kxdnk4S3T7p3y/bp+RUK8BxU8K1jc=;
        b=RmTCdeysVENG66KkPxYuOfnOs5LkgKpZn+ucIDLzwTqW60cAu0ChPLvKOIHBDw0qNr
         +C/CcYCGG5IvlIzx/MLZv5Tn6YvAaO2MQZhXSiVbTioPeXNl/Ej4IAxVD5vJM9jCqDWw
         SOGHtx+aEIoVDBTbbfEHfg8Kv0uIj9E6oID4OwB4jlVUJNk6gJkpz+BKAFW3gQ4PIml+
         oiEPfxr6yds8noYJxas+LMijJiFdTob/n1EfQ2E1AEwuZGpXuFjwJH1OcPf3BmiFvc/P
         VFJijOGwtE5AlpmwoQiwObONn64DvWEfXGsTepEaQXuQ25XdNyySSk0D7lXpimWeqnGk
         9MNw==
X-Forwarded-Encrypted: i=1; AJvYcCW9uCFdFY5j4Euo8O/eiamjvwuMx+xzd76JOPtWXKNgeCDEVs5lUXnr4EsAO4LSzd7yb+l7xwgdWyx1aBW6@vger.kernel.org, AJvYcCWJv71pT9EYQS51wno/Mb2bhit5vlwRSfzeJq9Id/7XrtvdY6D30k+Ev+2e77bDsWRH4/3jB3yyjN6O@vger.kernel.org, AJvYcCXBLYCxkM2PN5VtKPBuoDCpnpk5ssVixyvfYPYnt6q6X1U0GO0hpl0mZOEeQkUqehVtKAxr+Oz3VOy8JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYyFU4CaZujAkn6heObGv5hynbxCoxGNwi25c7HoKVeOS/ZWL
	kQMPYTECnGFQctqADwprhjTX19zk0lHRglL2vaOPHVrkwhov5UXi7OZuERT7swQXU/6pMh3kGnf
	jprO9YvOklyzOpCfzJeSNHGf+AMo=
X-Gm-Gg: ASbGncvTOu3Pm9jqj6cDu3wqft9OA6hCJrFPio7Q8Ldk9PbPl/ERJA7tLE0Vz9KF198
	P5zfsVvUafxWnwQYSsOg0ofMK5Cf9vYTW3gmVNzFXZ2vnF4Q1y2k7AF1iVq5FoqqREMAjid2e3N
	XwuU+qAA==
X-Google-Smtp-Source: AGHT+IE5DwaJf4Z30vTQF7YhDIZiPDJYIZdu3bh2rwyOO8cxVmUaTU1ujj+ntqMidNIo7C+7G9AHNXs0n4irABzLme4=
X-Received: by 2002:a17:90b:3ec6:b0:2ee:ab11:fab2 with SMTP id
 98e67ed59e1d1-2fce7b083a3mr5328015a91.22.1740156042924; Fri, 21 Feb 2025
 08:40:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
 <CAMhs-H-VevC+_=HxhMU6-at0bKut_JqdgO7j2detuB4s8R_QFQ@mail.gmail.com>
 <Z7iHorlRgtsi1LOo@alpha.franken.de> <CAMhs-H-fcWU-rz_3FeAuRe0xdCMmvffX2zrZwwmt=8RYpY4Lyg@mail.gmail.com>
 <Z7idguBa2bxZRoxX@alpha.franken.de>
In-Reply-To: <Z7idguBa2bxZRoxX@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 21 Feb 2025 17:40:34 +0100
X-Gm-Features: AWEUYZmBhqj8-3tVa95inuQXfZp89XjOlNWgufDeJ2KSqTBDe4ACRkfogOXIoD0
Message-ID: <CAMhs-H91Pv4bygmL2jL0=swn-wHT0mRYGaYO6Hjm5O-xmmrJ0w@mail.gmail.com>
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

On Fri, Feb 21, 2025 at 4:37=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Feb 21, 2025 at 03:50:09PM +0100, Sergio Paracuellos wrote:
> > Hi Thomas,
> >
> > On Fri, Feb 21, 2025 at 3:05=E2=80=AFPM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Fri, Feb 21, 2025 at 11:48:34AM +0100, Sergio Paracuellos wrote:
> > > > Hi Thomas,
> > > >
> > > > El El lun, 20 ene 2025 a las 10:21, Sergio Paracuellos <
> > > > sergio.paracuellos@gmail.com> escribi=C3=B3:
> > > >
> > > > > Hi all!
> > > > >
> > > > > Ralinks SoCs have a system controller node which serves as clock =
and reset
> > > > > providers for the rest of the world. This patch series introduces=
 clock
> > > > > definitions for these SoCs. The clocks are registered in the driv=
er using
> > > > > a bunch of arrays in specific order so these definitions represen=
t the
> > > > > assigned
> > > > > identifier that is used when this happens so client nodes can eas=
ily use it
> > > > > to specify the clock which they consume without the need of check=
ing
> > > > > driver code.
> > > > >
> > > > > DTS files which are currently on tree are not matching system con=
troller
> > > > > bindings. So all of them are updated to properly match them.
> > > > >
> > > > > I'd like this series to go through kernel mips git tree if possib=
le.
> > > > >
> > > > > Thanks in advance for your time.
> > > > >
> > > > > Changes in v3:
> > > > > - Address Krzysztof comments in v2 (Thanks!):
> > > > >   + Drop reset include file since what it was defined there were =
hardware
> > > > >     constants and no binding related indexes at all.
> > > > >   + Update patches for not referring to this reset removed file.
> > > >
> > > >
> > > > I was expecting this series going through the mips tree.
> > >
> > >   DTC     arch/mips/boot/dts/ralink/rt3883_eval.dtb
> > > Error: /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/rt38=
83.dtsi:2.1-9 syntax error
> > > FATAL ERROR: Unable to parse input tree
> >
> > Weird, it looks like dtc is not happy with the "include" line with new
> > definitions? Are you getting this only with rt3883? Since all the
> > patches are almost the same and I compile tested this before sending..
> > Something got corrupted? I don't have my laptop now to check but I
> > will recheck again on monday.
>
> rt2880_eval.dts:/include/ "rt2880.dtsi"
> rt3052_eval.dts:#include "rt3050.dtsi"
> rt3883_eval.dts:/include/ "rt3883.dtsi"
>
> rt3052 works, rt2880 and rt3883 don't.
>
> changing the /include/ to #include makes them compile.

Mmmm...does this mean that this was broken before my patches? Since I
have not touched the files that need the replacement. So I probably
checked in the openwrt tree and missed this totally. Sorry for that.
How do you want to handle this? Should I send v4 including these
replacements? Or do you prefer to handle them directly?

Thanks again and sorry for the inconvenience.

Best regards,
     Sergio Paracuellos
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

