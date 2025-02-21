Return-Path: <linux-mips+bounces-7898-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3E0A3FD87
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 18:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 465BE426171
	for <lists+linux-mips@lfdr.de>; Fri, 21 Feb 2025 17:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C932505C4;
	Fri, 21 Feb 2025 17:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijHunvv5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9279235955;
	Fri, 21 Feb 2025 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740159123; cv=none; b=oLv6y1OkMXFM/p/408F33kSmW4mE0IgWMSB4Ff2KsmiGqg7znv44YRrerFZRXn9sRIeZSBVgtLJ+tdqD7lVBVQT4DNy4Bi0Vtnl5gGDDhlgCaV47PkCe1udZ+397KHj2vl2CBiu7wX/QFyCzgz8rhKp5RTWL4MTBMDqT9Wj4E1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740159123; c=relaxed/simple;
	bh=VgWxCpwf2Q9KFMIddgUkc2CYRnkLJjOOEXo3QLe5ToE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwviaYhorPV7VCNQatiOdwUus43vQqfATNx5v2m2j010FDlE1tZPlvBuQ9tTgT1AkEbrTPEwQSzIauEgTkZsL5LjBVw0BMhm0MCRJqVDCRL4d1QYHTfoLZioAlsRfVZYX35/x/+hwVnFL131hDLFg8nEzf8IeJdTsyrlVym47nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijHunvv5; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-221206dbd7eso50503265ad.2;
        Fri, 21 Feb 2025 09:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740159121; x=1740763921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZTfoZLKdGhieUhqNYuabAUMhySDG/Lsaab0mVAiuGk=;
        b=ijHunvv5LuBZEwGp0skc8ozrfSXxe9VuyCPUkUxQyn7aZgWiyDiumpmHw+In3vJzfU
         ZSKQ0PCSmmIOOxDnDBt3FwwYS5RMx2zogqQj5+TS0Lk09aQWDtCdnqhK3fqK1rJWoj8z
         wBKtjB1n5jr47zUktrA0WTVe4JKeA8T2P+lKq8iHcDrra3vp8iihOvjadzK+Ur9RGaqq
         uOeGpkgbzJZ5NLM+d16h4spYtXmvew8RmHo80MKxfBO4P1rASmEk1kM3PadgJ2OLKXhE
         mKUFGjYafXoIA12fP5Cl8JYYkou3WEm+2CfYhKz7qW2dXLAJlF8WlJVxnATZ/KZJTFwQ
         a0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740159121; x=1740763921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZTfoZLKdGhieUhqNYuabAUMhySDG/Lsaab0mVAiuGk=;
        b=C+f2BCF/UoxD8XHjdP3lGCy0G+Dy3bcLgnYEBNUGwcSWiARJTrdKLAfJcMNHAvsyz4
         A3XuBt8+KCL0N/mdctcJTWmVAnOsfrlXWL6DWoN7rSKVcmDmr3meGVFTPeI9RnJRx4pf
         ffs2M9OLL5GBPDqQWcuqbLeYNWNRNtFdRC/6LGrwE1GkBbDvZpitBSfmxH7edkIkcnGa
         87KSVejOO+RFYxO6v8hCbb50jwWLvz4Sbkjgc/K1OGod+AS2HzTNiGaOOuEqwU71ZuqW
         DOGqqzaQRsKye8EtWPneDgR5x9FeGF7iyYq6V5fheFf8teWUADOvhwkiYtStBs83244K
         culg==
X-Forwarded-Encrypted: i=1; AJvYcCUjm/1pXThXFv23EmDyBGABdnktgVfyTwemTw6TqZuKRmgfjYreU5/q4lIhFVTS1XcwotUshekAkFG6@vger.kernel.org, AJvYcCVm4u7gQLMacYFXA10XdLj4g+23ruGHCcKft/Y7xLMpLClKYZ6dn7XQfJ2zmQrP0l94TBIqP95If5GIGQ==@vger.kernel.org, AJvYcCVqbxBplpDgOVUrjZYRaT0MQB+BLQTFMU6BumQlxxIm8WDjs8YZFkZPT9am1LXjFDi2mC2doEQDbOfRZxLt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbpl53hfqaGP2RoHF6PaaNIdvI7Tydj0SRM2W3N0ylgATJkpBA
	sAy3m/r1YbqCxWY08QrLLwnTVEablPykdKzxbIjz6N6KbG0ja2C5PsiQXcnvtYBD+T7Zwn/eBlb
	gy1GS7mSSyIKVczHNjmz4Ma59hv2XAdndnCM=
X-Gm-Gg: ASbGncvZ6Zhtq57qe632qldyIY2knTiDOOpGJZ5WMIigYD7mRL4oxMEhclTM7Jf82Sy
	35ZeFIk24mHWSLVQbnj/0AeD6TpWWQwvyXXHkpdknlggvbWn++cIFi6A62prL+szoX5+4TN2u8h
	2MNLs50A==
X-Google-Smtp-Source: AGHT+IGvX6qvGMn+KIoSiym6cWI0/nkZPpF6Z96ZqNT2izY3BoWxN63KfbmCr+lFl0lhQj/RNR4+SRdsolaQeSBPF+s=
X-Received: by 2002:a17:90b:4fd2:b0:2fc:2a9c:21de with SMTP id
 98e67ed59e1d1-2fce7b0814emr6701344a91.35.1740159120658; Fri, 21 Feb 2025
 09:32:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120092146.471951-1-sergio.paracuellos@gmail.com>
 <20250120092146.471951-7-sergio.paracuellos@gmail.com> <Z7i1aDGiHLsOFYyz@alpha.franken.de>
In-Reply-To: <Z7i1aDGiHLsOFYyz@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 21 Feb 2025 18:31:51 +0100
X-Gm-Features: AWEUYZmfPnR0Xkg3hXec_be0Y2VGoRk2tcCq1Cvh3Y4Iuwhnyr8MUjUABCqx5YI
Message-ID: <CAMhs-H-8N766PMZMwmV8B3e=65pPZHA4ntnRWDMoqR-U_xULfA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] mips: dts: ralink: mt7628a: update system
 controller node and its consumers
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	p.zabel@pengutronix.de, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, yangshiji66@outlook.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 6:19=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Jan 20, 2025 at 10:21:46AM +0100, Sergio Paracuellos wrote:
> > Current MT7628A device tree file system controller node is wrong since =
it is
> > not matching bindings. Hence, update it to match current bindings updat=
ing
> > it also to use new introduced clock constants.
> >
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  arch/mips/boot/dts/ralink/mt7628a.dtsi | 38 ++++++++++++++++----------
> >  1 file changed, 24 insertions(+), 14 deletions(-)
> >
> > diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dt=
s/ralink/mt7628a.dtsi
> > index 45a15e005cc4..309966049c56 100644
> > --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
> > +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
> > @@ -1,4 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0
> > +#include <dt-bindings/clock/mediatek,mtmips-sysc.h>
> >
> >  / {
> >       #address-cells =3D <1>;
> > @@ -16,11 +17,6 @@ cpu@0 {
> >               };
> >       };
> >
> > -     resetc: reset-controller {
> > -             compatible =3D "ralink,rt2880-reset";
> > -             #reset-cells =3D <1>;
> > -     };
> > -
> >       cpuintc: interrupt-controller {
> >               #address-cells =3D <0>;
> >               #interrupt-cells =3D <1>;
> > @@ -36,9 +32,11 @@ palmbus@10000000 {
> >               #address-cells =3D <1>;
> >               #size-cells =3D <1>;
> >
> > -             sysc: system-controller@0 {
> > -                     compatible =3D "ralink,mt7620a-sysc", "syscon";
> > +             sysc: syscon@0 {
> > +                     compatible =3D "ralink,mt7628-sysc", "syscon";
> >                       reg =3D <0x0 0x60>;
> > +                     #clock-cells =3D <1>;
> > +                     #reset-cells =3D <1>;
> >               };
> >
> >               pinmux: pinmux@60 {
> > @@ -138,7 +136,7 @@ watchdog: watchdog@100 {
> >                       compatible =3D "mediatek,mt7621-wdt";
> >                       reg =3D <0x100 0x30>;
> >
> > -                     resets =3D <&resetc 8>;
> > +                     resets =3D <&sysc 8>;
> >                       reset-names =3D "wdt";
> >
> >                       interrupt-parent =3D <&intc>;
> > @@ -154,7 +152,7 @@ intc: interrupt-controller@200 {
> >                       interrupt-controller;
> >                       #interrupt-cells =3D <1>;
> >
> > -                     resets =3D <&resetc 9>;
> > +                     resets =3D <&sysc 9>;
> >                       reset-names =3D "intc";
> >
> >                       interrupt-parent =3D <&cpuintc>;
> > @@ -190,7 +188,9 @@ spi: spi@b00 {
> >                       pinctrl-names =3D "default";
> >                       pinctrl-0 =3D <&pinmux_spi_spi>;
> >
> > -                     resets =3D <&resetc 18>;
> > +                     clocks =3D <&sysc MT76X8_CLK_SPI1>;
> > +
> > +                     resets =3D <&sysc 18>;
> >                       reset-names =3D "spi";
> >
> >                       #address-cells =3D <1>;
> > @@ -206,7 +206,9 @@ i2c: i2c@900 {
> >                       pinctrl-names =3D "default";
> >                       pinctrl-0 =3D <&pinmux_i2c_i2c>;
> >
> > -                     resets =3D <&resetc 16>;
> > +                     clocks =3D <&sysc MT76X8_CLK_I2C>;
> > +
> > +                     resets =3D <&sysc 16>;
> >                       reset-names =3D "i2c";
> >
> >                       #address-cells =3D <1>;
> > @@ -222,7 +224,9 @@ uart0: uartlite@c00 {
> >                       pinctrl-names =3D "default";
> >                       pinctrl-0 =3D <&pinmux_uart0_uart>;
> >
> > -                     resets =3D <&resetc 12>;
> > +                     clocks =3D <&sysc MT76X8_CLK_UART0>;
> > +
> > +                     resets =3D <&sysc 12>;
> >                       reset-names =3D "uart0";
> >
> >                       interrupt-parent =3D <&intc>;
> > @@ -238,7 +242,9 @@ uart1: uart1@d00 {
> >                       pinctrl-names =3D "default";
> >                       pinctrl-0 =3D <&pinmux_uart1_uart>;
> >
> > -                     resets =3D <&resetc 19>;
> > +                     clocks =3D <&sysc MT76X8_CLK_UART1>;
> > +
> > +                     resets =3D <&sysc 19>;
> >                       reset-names =3D "uart1";
> >
> >                       interrupt-parent =3D <&intc>;
> > @@ -254,7 +260,9 @@ uart2: uart2@e00 {
> >                       pinctrl-names =3D "default";
> >                       pinctrl-0 =3D <&pinmux_uart2_uart>;
> >
> > -                     resets =3D <&resetc 20>;
> > +                     clocks =3D <&sysc MT76X8_CLK_UART2>;
> > +
> > +                     resets =3D <&sysc 20>;
> >                       reset-names =3D "uart2";
> >
> >                       interrupt-parent =3D <&intc>;
> > @@ -290,6 +298,8 @@ wmac: wmac@10300000 {
> >               compatible =3D "mediatek,mt7628-wmac";
> >               reg =3D <0x10300000 0x100000>;
> >
> > +             clocks =3D <&sysc MT76X8_CLK_WMAC>;
> > +
> >               interrupt-parent =3D <&cpuintc>;
> >               interrupts =3D <6>;
> >
> > --
> > 2.25.1
>
> I get
>
>   DTC     arch/mips/boot/dts/ralink/vocore2.dtb
> /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/mt7628a.dtsi:27=
5.28-284.4: ERROR (phandle_references): /usb-phy@10120000: Reference to non=
-existent node or label "resetc"
>
> /local/tbogendoerfer/korg/linux/arch/mips/boot/dts/ralink/mt7628a.dtsi:27=
5.28-284.4: ERROR (phandle_references): /usb-phy@10120000: Reference to non=
-existent node or label "resetc"
>
> ERROR: Input tree has errors, aborting (use -f to force output)
>
> for CONFIG_DTB_VOCORE2=3Dy and a similair failure for CONFIG_DTB_OMEGA2P=
=3Dy
>
> I'll apply rest of the series, please send a fixed patch for mt7628a

Sure, thanks a lot!

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

