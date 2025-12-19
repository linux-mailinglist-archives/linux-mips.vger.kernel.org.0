Return-Path: <linux-mips+bounces-12526-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DEECCFBBB
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 13:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEF9E3068604
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 12:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ABB27FD76;
	Fri, 19 Dec 2025 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tca8bXAF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66225332E
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145808; cv=none; b=fx50OrdXNGPlx05YNvOAMEpejw6Io+p180/7f0ggNIUIEpmlTdtsm16ffplrguwVwMKrajstOQZQ/WN7vwkIqEgi+fQMXRCiBHtrnzKYnP5HRcrCJenaxt8j1tvyYI8ONrXV+cClj39G/fZ+QaCXhb6cq0OHfG0scuyVKlUWlz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145808; c=relaxed/simple;
	bh=fFcsjPyIqUCv3wD40UIVsBuh7vbwlbFNmyIyUbKp9Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsADQprTa+6EgwWEk8olK9FwK1oSslWQ6XmkKz2H8+G26m1e+0Js26gPzZYXrm8YlLRxWsGgu3NV5Rz/eM5sq2fwr3NVR09Ju9o3ftIe0nNrDOThvwi2GR/NAV3rIjmruEW0O+i9muqnrNidwgL8IHWupAzSjJqM0tekyDXkI/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tca8bXAF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53ED0C113D0
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 12:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766145808;
	bh=fFcsjPyIqUCv3wD40UIVsBuh7vbwlbFNmyIyUbKp9Xs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tca8bXAFjzPIPozXHzpD61YyzaSxdlKeIz9OpecXNvQEYovBOStxeGvSqaiOv1LMR
	 WLHDXuyxzBke5ICINamcx746inED5LQyQARBk1G/FT1LR3cbCd2jW/YH79Bo5D0mKx
	 h0SuN3vehEY/gqEN4FQmJLTaXFn37oa3GvMjiM/bToTrcqRPJ301K8Jx0nX2H0wbuK
	 pNJwfr2b0EVihyHldSzO/PBkHpN7XL/S1L/CnFETwyxksVSPpUjg5bKpe3ebz8+E38
	 MagrzkPs1mZrm3CJvyF5kLAWTM6EcSbjd+NSHmU/Gf2mpNEk9I8CDofBWxuVyTIlLG
	 7BER2oL3nnUkA==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78e2fe1f568so14349057b3.2
        for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 04:03:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOOtdDRJ5EysR9L3U5YASp0Ji9dfHRGo0Y2i4ttlixzSxzjXKx5oDyfzBrnrjUICMvffRBnyYRXq9p@vger.kernel.org
X-Gm-Message-State: AOJu0YxyXybi0yKXNCHZzFbRSaJt+bzwo7srn26vlR/itxcIRnwd5RVk
	OJI2zzXeCEbUpqisd0UCKc0v1cjkoREsekjaIlOJh6qUDVQUY8j1RmNxby21VA5V5F/Hv5gas+w
	KglJxDJMOXdPdn/N/7y1fyv5t5swb8BU=
X-Google-Smtp-Source: AGHT+IF8XjG+Po2Vv6yh//EvAE0o+otQ4nzUv4tZ6vkF0WU9jmVFU+PTQvhcergXRovrajko7V+YIawOvV9x9HMeFP4=
X-Received: by 2002:a05:690c:480a:b0:788:161c:722e with SMTP id
 00721157ae682-78fb3f2ba22mr25032647b3.26.1766145807702; Fri, 19 Dec 2025
 04:03:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
In-Reply-To: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 19 Dec 2025 13:03:16 +0100
X-Gmail-Original-Message-ID: <CAD++jL=D7uGC8u+EHyxW437crM7Qfd0HHdzNhtvFmEzJyoaNvQ@mail.gmail.com>
X-Gm-Features: AQt7F2r7BbuZ8watFlkEYItQQUs0H71_5UCmy1BCdtldPSWnJS1g8Draqs5LkJU
Message-ID: <CAD++jL=D7uGC8u+EHyxW437crM7Qfd0HHdzNhtvFmEzJyoaNvQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] Introducing the Mobileye EyeQ6Lplus SoC
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Benoit,

thanks for your patches!

On Wed, Dec 17, 2025 at 2:36=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:

> The Eyeq6Lplus is a new system-on-chip part of Mobileye's EyeQ family

I don't know if this is "new" since it was announced in 2022.

> of SoC aimed at Advanced Driver Assistance Systems (ADAS). It is built
> around a multicore MIPS I6500 with 2 cores and 8 threads and integrates
> controllers and accelerators dedicated to driving assistance.

I think a question on everyone's lips is how much new MIPS hardware
MobilEye are going to be churning out? Is there *more* coming?

Don't get me wrong - I think it is pretty cool. But as these systems have
long support cycles, this will have direct consequences for the MIPS arch
maintenance and longevity.

Yours,
Linus Walleij

