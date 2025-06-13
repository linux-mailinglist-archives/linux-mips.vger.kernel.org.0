Return-Path: <linux-mips+bounces-9280-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65746AD8B53
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 13:54:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 883BE189004D
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 11:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE16B275B01;
	Fri, 13 Jun 2025 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="RxeXD5Am"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CF0275B0D
	for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 11:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815498; cv=none; b=ZYtNC/l9cehIYoSP4v6XJG9GYKnu8OH4O0U4wytvPuDea1mvE12chqFg6CCCFTZHRbtGsgA5Z8w0Hn/AX43kZ/5kYDNveoFM8GY+CgvMsDy2t4G5fS5kutAorMQbrCjm5GSl4+aqdz5je/lDgLaki+tW3QE2XZ7hgViS6ynxaM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815498; c=relaxed/simple;
	bh=UAIpxcRDVkzi9g5OKmJ5KCJ+YCX/2EuTs5JXG3z3uOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeTWotNKZl2lbp8PDCHqQAtBHBvVq9nrBQ6cd77f4bG/DhHQTjNBPUQEMWsj2l5t7Ai2PVa0EA+nj+7YMOwdt7iKbtmKqbWVxEwdyZ9Cq0tJKua6dscrxGOxhVG+SsvnSVMZHXdeMrql0GUzgGLRZqeCOdO8m0TJksGn8TSdBUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=RxeXD5Am; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e694601f624so1630811276.1
        for <linux-mips@vger.kernel.org>; Fri, 13 Jun 2025 04:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1749815495; x=1750420295; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmrtIIcXnG1dlrrtTiawyfOZwt6VlriFzTy47DVpZZA=;
        b=RxeXD5AmXQUsX4zKf8rpIBKvlSA+rWo5Z2F5MOVHPaeDum1wlLnwHkzAio2W3OuctJ
         zqOTbctBbnVV6BfUsmu3+TesarrLyx2foEF6irjDrSvsThSJq1K4zEYwGSL6vVOPBLUZ
         TQ0+FR8ZYa76t9Nk8B67dJPijuHhQc1/PgJa7dnvTdZ775FHfTlaWFHhEbVc3/hQdEGr
         qcF0LguiQdbmO5S02YpMUcI4Q9Z7grucFMBLbtt0MGsjmdtERWXsnhU65u6VqLn1KxEa
         dhR5CKtALPwgKCPQ9zHCZEn1cXt5Cj2tB+OxQlkx8I0oBztBJQyjFkxO+3qNZkDA7DLW
         TWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815495; x=1750420295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmrtIIcXnG1dlrrtTiawyfOZwt6VlriFzTy47DVpZZA=;
        b=ZXWMcBVOYbYsRhlZyqhrN9VWCc/a3qDR27v0lE67NGhwww4+8fbbK81qMkgwQ0q+5a
         zpekVel1bZd4gNynn0X6uakZ0H7bvAbQdnfSIamWzMR0nJE2eBC8eXWC0NHQgC9YSTjm
         1/ZZtkZpEFei524XhMK9hpxdgxaRZIEgpRJW3fgZYNIBXzhp/3rMrM0HO2GBsHl69FF5
         3zSmnG0YajFmo1SeMfwc+AOdDJuDTU36b5GdfF36HD1tjVa0KBST+RSH1MZSnjPJH0FG
         1dfN/cBK7RKM7ZBjydJZjF9RbLKIUo/evijWxXE6Zous40hTS7rqxVZSluI33RVBfuAW
         S4wg==
X-Gm-Message-State: AOJu0YyAzJSiENElp0+EKuNV0OtLY0G038+6nIrKUVPe1rJS79ic2Dtg
	bifmV8N3kosdI98Trg1qw8RdkllQO8uQVcTdhcc4I21cEjOn2a6rQkL95hVjJ5R/RQpMrtwWxz1
	DrK5soUiThZz22We4VdELnjmhybwyayk2MB2BrovRlH16rArRxTWkRck=
X-Gm-Gg: ASbGnctcujfZBgNlTjeVaaw4vtaDEyAGjfBXK8VlnqRpJP4qzV8FcUa9+p14dCeNKbz
	hrrnJM3uTyUz/YBWJyxVANGBGZ0O7puJokLOx1gYoP+ICloxn9/eCIOpjXNC4wfeSM0uJ+C3IpN
	lC9FM78ZTwq0/ONvpbXUNfR2j5JC0uAasWDCH+sJQqXBhesILl7e6eYBqNZJJ3A9bEYqpCi+FU
X-Google-Smtp-Source: AGHT+IFtdTM3tDAqSwLtb9W8C8LKyTZznoMlvawQVo7SObsf5OwAXCvmVf1hpSG43dr/cXvKoMojeb4lDFdaQJdy4wI=
X-Received: by 2002:a05:6902:2589:b0:e81:7acd:f77e with SMTP id
 3f1490d57ef6-e821c05d2ccmr3369238276.6.1749815495364; Fri, 13 Jun 2025
 04:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194716.302126-1-ezra@easyb.ch> <20250611194716.302126-2-ezra@easyb.ch>
 <e2ffca36-d2ed-4253-86a6-a990e7931ba0@kernel.org>
In-Reply-To: <e2ffca36-d2ed-4253-86a6-a990e7931ba0@kernel.org>
From: Ezra Buehler <ezra@easyb.ch>
Date: Fri, 13 Jun 2025 13:50:58 +0200
X-Gm-Features: AX0GCFu5adDXqKx-XYRYL4r-KzJ5WRpHXroIJAi4fu4f3NJ8m4nFSaPYY7lh6No
Message-ID: <CAM1KZSkcc8wh7yuJ-26ASKSehjWfD_QGs0JrKOWm+WMfXiY+DA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] MIPS: dts: ralink: mt7628a: Fix sysc's compatible
 property for MT7688
To: Krzysztof Kozlowski <krzk@kernel.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-mips@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Harvey Hunt <harveyhuntnexus@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Reto Schneider <reto.schneider@husqvarnagroup.com>, Rob Herring <robh@kernel.org>, 
	Stefan Roese <sr@denx.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org, 
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 1:22=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/06/2025 21:47, Ezra Buehler wrote:
> > From: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> >
> > Otherwise, the MT7688-based GARDENA smart Gateway will fail to boot
> > printing "Kernel panic - not syncing: unable to get CPU clock, err=3D-2=
".
> >
> > Signed-off-by: Ezra Buehler <ezra.buehler@husqvarnagroup.com>
> > ---
> >  arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dt=
s/ralink/mt7628a.dtsi
> > index 0212700c4fb4..10221a41f02a 100644
> > --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> > +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> > @@ -33,7 +33,7 @@ palmbus@10000000 {
> >               #size-cells =3D <1>;
> >
> >               sysc: syscon@0 {
> > -                     compatible =3D "ralink,mt7628-sysc", "syscon";
> > +                     compatible =3D "ralink,mt7628-sysc", "ralink,mt76=
88-sysc", "syscon";
> This is in contradiction to bindings, so you need to fix bindings first
> - with proper justification. If this happened in separate patchset, then
> the DTS thread MUST provide lore link to that.

As the MT7628 and MT7688 are identical in most respects, mt7628a.dtsi is
used for both SoCs. Therefore, I'd rather suggest adapting the driver to
return "ralink,mt7628-sysc" in both cases and remove "ralink,mt7688-sysc"
from the DT bindings.

I'd love to hear Sergio's (or any other) opinion on this matter.

Cheers,
Ezra

