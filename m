Return-Path: <linux-mips+bounces-8516-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A03A7E6DA
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 18:38:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3E6A3A9942
	for <lists+linux-mips@lfdr.de>; Mon,  7 Apr 2025 16:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777F420E039;
	Mon,  7 Apr 2025 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JifTUwvy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BCC20DD4C
	for <linux-mips@vger.kernel.org>; Mon,  7 Apr 2025 16:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043022; cv=none; b=Z3WqCxD+ghHqhT7d5Nhicx3Z8r/1hCwb2OEppDi9HLYkLPgjnDqLAa700haHCyM62WwGCt5JrJHbywWYHGmFsBrLvwKSJr5riK87027b4ygrJPfYZwOD9Y0wEO0oR7Xmr3JcxjSxh2qU2DGRkG1H/0NCQwoNAITAAFvCgOiHj4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043022; c=relaxed/simple;
	bh=xK3zdpugWS3t3I7XRyKqSkoBwBn9VFb6ajzBDZzEiQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ea7U6RTVfMskWveaQvcJlwTdP6UdVhGPknYgWrlA/+mIp9bJiva2XIBcCGImwLMSB6UY/4ywtjY/UoqnieBRvFjoi5z6K+9LuMuq4SXnYNrc4SDBTrooUvlqiqob7x/fjZ/NcL83TfDYCvDOK0eU66EiU6IDpPVeyJhAraTTGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JifTUwvy; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6f74b78df93so55914667b3.0
        for <linux-mips@vger.kernel.org>; Mon, 07 Apr 2025 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744043019; x=1744647819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=JifTUwvyVvNi4cElR+4XTMQZUiwIh50LATtsx/jJXMSopgf5Rp1gpX/lBXbPHKoByb
         avZiVmteCwgLlh52T48b53ueFXGIrqplCOaNv4PV8thFXkQZKJLzg3JLwprQ3R4IngaB
         BoLzlfkfROFT9Lcr+ZZRX4PtH84ZCRSXTkcWsYIYCaNMT1zUTV3V933QYOMltkryokcq
         eubT02R784B6f5NEXhokgS3A3lxZyrRxwRxoMENP04ouiYDoaNhaU6YwC67YTtCsfg6n
         gMT08+WiTv8rXjUisSWkgmgD9ntmAIu4SB9lHaoiBfFo6xw4wcx0WGnZAxTIdb0/9psq
         4CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043019; x=1744647819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=EusW8FZtfwOhnhDEiDdim7neBQvMG7uufSnWWynYnxXLTT9g2G9omogC4eIkBx2wZ0
         oD+MuppWQEo/BhVP1LTXDWGi32/nAfEtjaydAWIzwpKCdgjErsnEe/nxXNo6qRIH3uPB
         WTX2ROV96nrAyXRxhRj57xTh0OgHJzkPnoqzgBm+kW5TKyLpaLAWOQmERe3JfYQaj6ZE
         kSmrCZkF9O4Jhux2807R4ud5SjuGZ4+cqA1tUlZ8Vd2s70CWWKv3m1ZFt3APitxL+UsH
         xU8ZLLfvyUcHrSCDhnjS/P2vSQMo3Jd07tEy1On2E5hFQbILh/lhuDhhUOulQ6XiqtNr
         nGWg==
X-Forwarded-Encrypted: i=1; AJvYcCX3NG/QNJlRH5nEhHCYWRRnL5DSmHCa17XiS9TlGzp1u2RTDnK5aym4+a5IlmCH9OwcxSioQZgBZsj/@vger.kernel.org
X-Gm-Message-State: AOJu0YzG3Xu3AOKxEegkJPn7V+UbL1xKMEntG/wp8pmtPX1d16fukQbc
	YOnClKNnqivzpxwTOmBTz+jPQjtzkCLj916Pp1uTgY9T1/XCZZhzkmmO/sb3RfcMstQM+8kD+X5
	ffh+ZWfck+ARWBfAzptMYxzcz703Vefy8QCOckA==
X-Gm-Gg: ASbGncvSDXC1upAlfLY4xIrm4pRKxujXtsScw5cjfNDXww6d0n2DsVaxPwBcJBVdDaq
	zaAan01NqHgSslwNAY9ckPcoidlCecyla4J9vNIQk+5vllBtk0FmMIXQTIJxlPoeBWqfTwCTdxg
	DGmeir2b5fWEZddlTQC5hDsSTPy8E=
X-Google-Smtp-Source: AGHT+IEvCyoULSP8GtunUj7XByE2xLEZApny/EX5BI9r2HNnS7M/lF2l9CVPZCF8J2YyYgCczjPfSOPcnUbnSfgNgFc=
X-Received: by 2002:a05:690c:6481:b0:702:627c:94ec with SMTP id
 00721157ae682-703e3357786mr243332367b3.35.1744043018812; Mon, 07 Apr 2025
 09:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
In-Reply-To: <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:23:02 +0200
X-Gm-Features: ATxdqUG4iYRDoX1uSepWjxp_lc67AACZn0NdIUwL4_627lSdYio0uG7PYHZfOMA
Message-ID: <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrote:
> > >
> > > The "power-domains" and "power-domains-names" properties are missing =
any
> > > constraints. Add the constraints and drop the generic descriptions.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docume=
ntation/devicetree/bindings/arm/cpus.yaml
> > > index 6f74ebfd38df..5bd5822db8af 100644
> > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > @@ -313,19 +313,15 @@ properties:
> > >      maxItems: 1
> > >
> > >    power-domains:
> > > -    description:
> > > -      List of phandles and PM domain specifiers, as defined by bindi=
ngs of the
> > > -      PM domain provider (see also ../power_domain.txt).
> > > +    maxItems: 1
> >
> > There are more than one in some cases. The most is probably three, I th=
ink.
>
> Unless I missed it, testing says otherwise. What would the names be if
> more than 1 entry?

"psci", "perf", "cpr", etc

The "psci" is always for CPU power management, the other is for CPU
performance scaling (which may be more than one power-domain in some
cases).

I would suggest changing this to "maxItems: 3". That should be
sufficient I think.

Kind regards
Uffe

