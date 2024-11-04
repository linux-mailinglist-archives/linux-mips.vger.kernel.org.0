Return-Path: <linux-mips+bounces-6658-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B310C9BBA88
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2024 17:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B2D81F21BA1
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2024 16:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476B11C2317;
	Mon,  4 Nov 2024 16:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JOk2/8JC"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7942056;
	Mon,  4 Nov 2024 16:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730738776; cv=none; b=BqjnYqe+6SDzG/g8GWE3MZueshi+blsW/7X/u5iq1xpQMPFUoPzlUpUJsQmv5ZX2UganNvjxM0L0j2xHMEBzcpNlHWCV/wtsLsPb0VBRiakOMMlYQUXhCAJ0PA13fPrKk8GYdgKtJa6eFP0Hd62WnV9uYnnSUdv5m90c3Lk0XqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730738776; c=relaxed/simple;
	bh=DGrRE7TUEKaaDw37a+FHzO+nzWDrspEHgHtffr+CQGI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=bpErXFlOIvo4oKq6erRnBzMl9h+myHoOzldg1KTUu8TZQo37Zw+0H/YXP9kAtmGTnwvKbMgNQLNfAxv0/e/RpI1Qn0jjTsS9WDa2FtbRjEnzkMxV20lFeB0jPOtKw4vTujlm1kPr97e+0Z1BkJ+yFhPjkRGP+h52YN/c1AO86bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JOk2/8JC; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8C3E2000D;
	Mon,  4 Nov 2024 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730738771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TK/3OnrOZfeWPKLNUkcYsUToqQO4kgM2GP8iJaKUbjY=;
	b=JOk2/8JCqilJlJUfCvY4uRlTxlIp9ji8Qy1ngcdkwnygCzCyejzCgVMiRSaTFs9FFJDn8L
	zV1x+ih0Gkk/qUZCv5sdT61fI1vEU+O/BjB73mPc8uoRCyM9KgaYdurfjD9fOSxMTWO90C
	celi03gusvUFIczQAXKPUpoHig5vrFrnmhHY0OZVffXsEEsSrjJrxzoUUqvBSOdaYebHxF
	vA3a1Fyno2B1Jd+fU6PRBwiydlj8yI4eAk6TdghaZfng6k3eDH/odGft/I/7lBgEQnAZgV
	psQ0M2X/GNgV6qIjy3UOBxDnghEGd39eq45MFbMKvfkweDnJCvYd6olMILoDPw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Nov 2024 17:46:10 +0100
Message-Id: <D5DJOUV9NPY4.22MIOBKLAYGA3@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 01/13] dt-bindings: soc: mobileye: set `#clock-cells =
 <1>` for all compatibles
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Rob Herring" <robh@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
 <20241031-mbly-clk-v1-1-89d8b28e3006@bootlin.com>
 <20241104153727.GA192461-robh@kernel.org>
In-Reply-To: <20241104153727.GA192461-robh@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

On Mon Nov 4, 2024 at 4:37 PM CET, Rob Herring wrote:
> On Thu, Oct 31, 2024 at 04:52:51PM +0100, Th=C3=A9o Lebrun wrote:
> > Some compatibles expose a single clock. For those, we used to let them
> > using `#clock-cells =3D <0>` (ie <&olb> reference rather than <&olb 0>)=
.
> >=20
> > Switch away from that: enforce a cell for all compatibles. This is more
> > straight forward, and avoids devicetree changes whenever a compatible
> > goes from exposing a single clock to multiple ones.
>
> Your reasoning is flawed. Changing #clock-cells is an ABI break. So you=
=20
> should only be changing this if it was just wrong. And if it's not wrong=
=20
> in some cases, you shouldn't be changing those. The h/w either has 1=20
> clock or multiple and #clocks-cells should match.

I see your reasoning, and I agree that changing #clock-cells is an ABI
break. However, there are two things to take into account:

 - We do not (yet?) have an omniscient view of the hardware. We do not
   know what every single register in those memory regions do.

   Some clocks might be lurking in the shadows, especially as we don't
   support many HW capabilities yet.

 - The earlier the better. If we discover later down the road that,
   indeed, some more clocks were hiding, we'll have to do an ABI break.

   At that point, some people might actually be using the platform.
   Seeing what we currently have supported upstream versus the amount
   of HW blocks available in the SoC, I cannot imagine anyone using the
   platform with an upstream kernel.

So the choice is:
 - potential ABI break in the future, once people use the platform, or,
 - guaranteed ABI break now, when no one is using it.

I pick option two! Do you agree with the thought process?

Thanks Rob,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


