Return-Path: <linux-mips+bounces-3442-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F6D8D6635
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 18:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55096B263CF
	for <lists+linux-mips@lfdr.de>; Fri, 31 May 2024 16:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCCD15887C;
	Fri, 31 May 2024 16:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmY/o7PB"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89371586D5;
	Fri, 31 May 2024 16:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717171261; cv=none; b=c4Xgcb6Zp2leB4pr2vq1L4+19zTxNQgyXlY5yGFiGtJmL0g4r2W0i9HliW0sxDrQby8gsbGnpoA9ThKw5lth5ubhUCvcFKKRIoJ2o0bY0Fy5dzpDDvEwsRgP3lfRb8kvRdwI0knIT9W48qF+jhXcSPsLXxC8rQV9ix/a3VZ/vIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717171261; c=relaxed/simple;
	bh=c+d4lcGPb/U+FefoCxW7HsKJKVrrlM9uztIB003s6WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqY6ZuLC0DttlRUVlGLam4ZJS/iVP+FUh0vMc6xgR0/KtTSQi4skOVhu94rTmcKfaqRGJmKm81vkHPzyeJuL6XHOSbjuM9IfWdsbJ6ZPjd2YMcmUBtGn1bXheArjp+9e5yxoYcl/l0HJESmKJEZo8SLKQk6o7xsNSUfPU1kkfTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmY/o7PB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C84BC116B1;
	Fri, 31 May 2024 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171261;
	bh=c+d4lcGPb/U+FefoCxW7HsKJKVrrlM9uztIB003s6WM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KmY/o7PBK6+b7v0yeKL94FXrqypcQdlFqjIk1YD3bprmcNrkiWA/lkrGGUg+Yckt6
	 F5YiQH+HN0fU7IdeAnPaHGUMed9j9D31MAVdOqtPa1PBWlzE7on6uStPhaAmmVsvni
	 DMiS2bMTL2rHJGWrMzTOOTff6SHXvYvQ47na80/m32re8sJrYQwvMlNv29rvYMk7Zy
	 uuyvKesDfCMpz2c48Py9Uw55FomuDS3tqkGi2ASFqUBhC8xYOE7Xo/wq53xk+eOuxA
	 NJcbcevLQDEzGI1uGgGm62hlEIjCipDY1hdpzchSVWJHT4O0eAUnxboW3jX49bL2kC
	 +aq/irrOp90uA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b89fcdcc7so1087854e87.3;
        Fri, 31 May 2024 09:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVC6DxHv6rQQx+ts91mUS0/+47XlK/DLdFZo5YtwndiRpil1ry4ju0JSoQL20p7fXv4gEuwB/34HImaml2mx9Epcp6fvooPb7kPqfbhM7Q+dhszh3Fqgv1uLbZxBTW3BOztp3NFvTMaQNJqT4OMeu5NOWWNWncbl/0vUZhYabVYkdBmlDw95MubVMtL4zjPmRK04Rd4aADIC7m+GXx2Ai3YXpBxvDPtljLK7nmvleb5ailqSdxse9c=
X-Gm-Message-State: AOJu0YwaOn6m3EVrsP8lsp5I0n3lqvW0jceG5ZymXfV68kyQZC6CJhvw
	DYu4c5RPAbcPXXSX8/vw2XGXxBkN44A/boMWhizpNGGo/YZng9CKNSMaWtRxtEAjjVzxI5hk7o7
	3SkkwymkKL46VZUKzqRELbsKFnA==
X-Google-Smtp-Source: AGHT+IH4oy5XfEeI6M9ivxBCoSxDCjBCAk+o5jUpEGutuJaJMQxDlvaDmEbQUTIillqvz9TNUGFpdA36DhO70v2pCRU=
X-Received: by 2002:a05:6512:3145:b0:51e:f68b:d266 with SMTP id
 2adb3069b0e04-52b896c49cemr1375881e87.50.1717171259738; Fri, 31 May 2024
 09:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510123018.3902184-1-robh@kernel.org> <20240531134536.GK1005600@google.com>
In-Reply-To: <20240531134536.GK1005600@google.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 May 2024 11:00:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
Message-ID: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 8:45=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 10 May 2024, Rob Herring (Arm) wrote:
>
> > Add another batch of various "simple" syscon compatibles which were
> > undocumented or still documented with old text bindings. Remove the old
> > text binding docs for the ones which were documented.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > This batch is mostly from arm32 platforms.
> > ---
> >  .../bindings/arm/amlogic/analog-top.txt       | 20 -------------
> >  .../bindings/arm/amlogic/assist.txt           | 17 -----------
> >  .../bindings/arm/amlogic/bootrom.txt          | 17 -----------
> >  .../devicetree/bindings/arm/amlogic/pmu.txt   | 18 ------------
> >  .../devicetree/bindings/arm/atmel-sysregs.txt | 29 -------------------
> >  .../devicetree/bindings/arm/axis.txt          | 16 ----------
> >  .../arm/cpu-enable-method/al,alpine-smp       | 10 -------
> >  .../arm/freescale/fsl,vf610-mscm-cpucfg.txt   | 14 ---------
> >  .../bindings/arm/marvell/marvell,dove.txt     | 15 ----------
> >  .../devicetree/bindings/arm/spear-misc.txt    |  9 ------
> >  .../bindings/clock/ti-keystone-pllctrl.txt    | 20 -------------
> >  .../devicetree/bindings/mfd/syscon.yaml       | 29 +++++++++++++++++++
> >  .../devicetree/bindings/mips/mscc.txt         | 17 -----------
> >  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
> >  .../bindings/net/hisilicon-hip04-net.txt      | 10 -------
> >  15 files changed, 29 insertions(+), 221 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/analo=
g-top.txt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/assis=
t.txt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/bootr=
om.txt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/pmu.t=
xt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl=
,vf610-mscm-cpucfg.txt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/spear-misc.tx=
t
> >  delete mode 100644 Documentation/devicetree/bindings/clock/ti-keystone=
-pllctrl.txt
>
> No longer applies.  Please rebase and I'll promptly hoover this up.

I can't find where it doesn't. Fine on next, v6.10-rc1, your current
branch. Maybe something you applied today and haven't pushed out?

Rob

