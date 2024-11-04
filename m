Return-Path: <linux-mips+bounces-6655-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA9B9BB9FC
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2024 17:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC351B2155D
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2024 16:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584691BE238;
	Mon,  4 Nov 2024 16:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iY1nblVu"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE120326;
	Mon,  4 Nov 2024 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737011; cv=none; b=jCKMD2D4/vuJ6bXb/7XQqoXcgahnsYniwVosiODq1N09Pa0hhCdnPpmXnL5HrMz9mgldMiwnMpsl4r7urq7LkRmE1vN7azN+jVtWoax5/Mgk2dcwUYnxzTYWj4lxOTh1De4l7r1Ltjs+9tdeGtzF/snayl56bkkD5r6+enZcwD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737011; c=relaxed/simple;
	bh=dvq4WdAmFMn0vLZ9JnYGSSdyWumIrzJUc3NB73OMPOg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=MjbEqF8goa7ZBCz8G+oOwxPknYGD1ynK34NwJ9s4+OieMfr/tcuPySLR5pmGFtdG/RVl0MFMHnqCPGPme18EIvgvbWdahf4m1xsGyx59hB/D3Tntb6LTu+2uAQOnCqsc3yx+azwWga/Ju/10HrR/Ycp+GBa+9clks4UFrnh6dQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iY1nblVu; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E858860007;
	Mon,  4 Nov 2024 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730737006;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6rqr0N+cqbVGEIJ9JWQr1pdzzt48RW1+Mdy+DMTESZ0=;
	b=iY1nblVuCVjnM+iTFMao7fUaBwok5qhuYyl5TtzZscEOZvgXF2YrpkzOxUKzv5XoY74lQK
	oppy49hTbZU/PhquKOHASxNSEXIXlOHpxwISjN/laalnrg63rwBUgbWOw6wQA3B4EcwuIY
	QL767l7li094Yudwrx/DmBYTP+1vITi4aKVfTg09PKocToLFGPI/Sp44U3LnOEnX0mfyJG
	RJ+JuQEPRGN2itJPlbTEUs5t4AwJIK0ViWJjR/FjeJWLI3EErU9IzDYBwrezYGV3eYrJwm
	kbNJY1QqR5BbjWKi9k19PXUtzFNciVn2Du5JABW+OSBJq16y89cFLqZSr1Gulg==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 17:16:45 +0100
Message-Id: <D5DJ2C103MJL.2DBH24E85MPYP@bootlin.com>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, <linux-mips@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 04/13] dt-bindings: clock: eyeq: add Mobileye EyeQ6H
 central clocks
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
 <20241031-mbly-clk-v1-4-89d8b28e3006@bootlin.com>
 <7ebcdarioght4u2bai4l42pckitcw5iz4rky4ncgp7aqmtrlen@zl7k7pgijloq>
In-Reply-To: <7ebcdarioght4u2bai4l42pckitcw5iz4rky4ncgp7aqmtrlen@zl7k7pgijloq>
X-GND-Sasl: theo.lebrun@bootlin.com

On Fri Nov 1, 2024 at 8:48 AM CET, Krzysztof Kozlowski wrote:
> On Thu, Oct 31, 2024 at 04:52:54PM +0100, Th=C3=A9o Lebrun wrote:
> > Add clock indexes for EyeQ6H central OLB.
> >=20
> > Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > ---
> >  include/dt-bindings/clock/mobileye,eyeq5-clk.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/d=
t-bindings/clock/mobileye,eyeq5-clk.h
> > index 7d9e700b5e59573c45919865d9c68a9e8cf6a9eb..2356bc52646df9cfeb93df8=
120eb8f0bf80d97e9 100644
> > --- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
> > +++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
> > @@ -34,6 +34,9 @@
> >  #define EQ6LC_PLL_PER		2
> >  #define EQ6LC_PLL_VDI		3
> > =20
> > +#define EQ6HC_CENTRAL_PLL_CPU	0
> > +#define EQ6HC_CENTRAL_CPU_OCC	1
> > +
>
> Don't add define after define in separate patches. Logical change is to
> add all defines at once, so multiple patches here should be squashed.

Sure, I was not sure so I leaned in the safe bet direction. Squashing is
much easier than splitting. Also improved the commit message, which
will look like this for next revision (incoming soon):

--

dt-bindings: clock: eyeq: add more Mobileye EyeQ5/EyeQ6H clocks

Add #defines for Mobileye clock controller:

 - EyeQ5 core 0 thru 3 clocks. Internally:

      EQ5C_PLL_CPU:           already exposed
      =E2=94=94=E2=94=80=E2=94=80 EQ5C_CPU_OCC:       unexposed, no reason =
to do so
          =E2=94=9C=E2=94=80=E2=94=80 EQ5C_CPU_CORE0: new!
          =E2=94=9C=E2=94=80=E2=94=80 EQ5C_CPU_CORE1: new!
          =E2=94=9C=E2=94=80=E2=94=80 EQ5C_CPU_CORE2: new!
          =E2=94=94=E2=94=80=E2=94=80 EQ5C_CPU_CORE3: new!

 - EyeQ5 peripheral clocks. Internally:

      EQ5C_PLL_PER:          already exposed
      =E2=94=94=E2=94=80=E2=94=80 EQ5C_PER_OCC:      new!
          =E2=94=94=E2=94=80=E2=94=80 EQ5C_PER_UART: new!

 - EyeQ6H central OLB. Internally:

      EQ6HC_CENTRAL_PLL_CPU:     new!
      =E2=94=94=E2=94=80=E2=94=80 EQ6HC_CENTRAL_CPU_OCC: new!

 - EyeQ6H west OLB. Internally:

      EQ6HC_WEST_PLL_PER:          new!
      =E2=94=94=E2=94=80=E2=94=80 EQ6HC_WEST_PER_OCC:      new!
          =E2=94=94=E2=94=80=E2=94=80 EQ6HC_WEST_PER_UART: new!

Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

--

Thanks Krzysztof,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


