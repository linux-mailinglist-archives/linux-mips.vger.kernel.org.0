Return-Path: <linux-mips+bounces-3508-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 092378FF6F2
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2024 23:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98072B26DC5
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2024 21:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1457A4F5EC;
	Thu,  6 Jun 2024 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IxtQjifz"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7458AFC02;
	Thu,  6 Jun 2024 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717709631; cv=none; b=PuFVLPpI17Spk5CWBfQLCwj/7YMcYrT4RvV1DkbJqhOYqCQttDPax5Xfx+hGi58xrY5Op7n66lxbmhkIKUjmpgX2/zEAWwugl7LUjMdqGRNBniSo7DCTBp+SXVbpQR0Mk/ZsNnM+reEDm5lsw2afCdgAJbLImvZo/ffSzhSThgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717709631; c=relaxed/simple;
	bh=BIPCNwr2iNo5s7oX2a4ALoQD1rqzDFRTnwAeLaO1RRM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n0aYY9wPtPSnv+YqEVs/4E37nUubcBYNniD0uZE3OQ+UrvR25X4kpJmViuNb3w13KJmir6obh+AJlR2jDThLIpt+bmosvMAFBSxf6xxFdSfo5NfkpSrB8yXqQWBaVhJIVf99rEi7SY5xO/481cOzIdju1BsH1lOWbJnlXSLlrP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IxtQjifz; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9151E240002;
	Thu,  6 Jun 2024 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1717709626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEe67kVi/zYEwJ949gLFt+c1vqpmrvxAyYHa4a+7LAA=;
	b=IxtQjifzTaaXunLyy6L7jVE8sN9djdHYHsjmEicWNx5Nq3dloei3ROWn9XPo63TO2/KR2U
	g/IiGLEwqUfI6iuGrUnGfKkZ2YNO1xaqfuuvNVNPDOPKAOHasengOhflZ6c6JjKK3a7S+w
	gUKd94vQMeWOWpBueVlyHHdyFzXhCoohX6vtRCT4/gSCy7a4DVY1zdl/tAuJOYGNzzJOiv
	pwTEq725uYcoRSF5FxMQktJ5SELAELSaimUoHrDpwVUI45obcjHtSNGiH3bYFAqhno6k56
	r1G6Y1QbivoqI/u6KfMbHgWSwoKvxoBXbBRKU/rqAKhVi01VXeN5rns8T6zxpg==
Date: Thu, 6 Jun 2024 23:33:44 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <20240606233344.4e268c04@xps-13>
In-Reply-To: <CAJhJPsW9gVe2F1qvxvOkQUX_K1BsK5q_1XjT0u2+QH2gRMNqXA@mail.gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
	<20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
	<20240506091444.59228fa9@xps-13>
	<CAJhJPsV1aCvji1G2F94A=pJa8+x6Aw7ndkQUBPtFeeKSxJK9Nw@mail.gmail.com>
	<20240518124732.584f441d@xps-13>
	<CAJhJPsW9gVe2F1qvxvOkQUX_K1BsK5q_1XjT0u2+QH2gRMNqXA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi,

> > > > > +properties:
> > > > > +  compatible:
> > > > > +    oneOf:
> > > > > +      - const: loongson,ls1b-nfc =20
> > > >
> > > > What is the rationale behind this choice? Seems like the b variant =
has
> > > > two possible implementations and should always be preceded by a more
> > > > specific compatible.
> > > >
> > > > As there is currently no description of this controller upstream, I
> > > > would not care too much about any out-of-tree description and direc=
tly
> > > > go for a clean description.
> > > > =20
> > > Excuse me, should I add a description for this property? =20
> >
> > No, description is not needed. But you are allowing the
> > "loongson,ls1b-nfc" compatible alone, which I think is not relevant,
> > unless you convince me it is :-)
> > =20
> "loongson,ls1b-nfc" itself is a specific implementation.
> I was suggested to set up a fallback before.
> https://lore.kernel.org/all/20231007-untapped-masses-01f80b7c13c7@spud/
> Then "loongson,ls1b-nfc" became the fallback.

You cannot allow 'the fallback', alone. But this is what you do above.
Below description is fine. Just don't allow the ls1b-nfc compatible
alone.

Thanks,
Miqu=C3=A8l

