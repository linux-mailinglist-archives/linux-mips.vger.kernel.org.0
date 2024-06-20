Return-Path: <linux-mips+bounces-3792-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9F910F62
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24CB31C224E9
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A7A1BC082;
	Thu, 20 Jun 2024 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lrv87RYM"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB171B9AA4;
	Thu, 20 Jun 2024 17:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718905269; cv=none; b=MQR2sYhl1okD55zxWT65i83nC8yLoXIitZC5DWaPqBBX5f7eQNSoMQ6mRTZOionfwTykWXbXNRyqjlOhxzacJu4PAEnBaYbokFqO3wL3F/WpBVGcK2i3ef3Jg+wrUqTaUWMnMQxVYA5XNXpVyXbeWX5T5x6lLgQu+hkQFivg5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718905269; c=relaxed/simple;
	bh=6wUHeTu1QhttKGhu/ZTrHU5kfJDX1NlSsMPXIreIsa0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ooCRzeE9ngDQ+xNDKSv6Giy1YUfArzWoC+BOwJp2XzMAzcoTzdC6nfVX8V7CjXyIYaiqVObIqMH48LFISk6CmfJ9jxCMJVTP0YusTUmvmpjZZmI0s3Wxog1OFFesrzRGNBKcosl83p811rDfcyj/3BdExIXJRwtwo25CfYM73k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lrv87RYM; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B311520002;
	Thu, 20 Jun 2024 17:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718905264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lZf4ibwZLzKClCqjh35Z7HVpohlqofD5SzhTF8YVstQ=;
	b=lrv87RYMhTRu7xGiwLQoJDXjAgPeAkwGzToH2x0IxEARvWNADq1kB/0sTQG8txeOZXrTCx
	nFGKkqxoFJsm4zOnrhGKfuVtsp3qlQvLvmX65Bmn42UxyMLxqN+IJB4GY+eqBbgxbSYfKY
	K6QrWAYpMaHB1UxVjW2hUR0Ee8eQDXYPAKsYz1+Ij+fqt6zCwjDejJTVOGu3h1R3S/yS0j
	jxXRm9nhw3dV7J622mVKpHweESZ+n4M1B+RODqKUAh276ELhCROHoUYK4pyjSR2RE6g+g8
	4RULGAfEPxmVleDWEG535AhO7epenkknfM/1PcWwB7PG3dFmmnuTtWIcmnNu7A==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Jun 2024 19:41:03 +0200
Message-Id: <D25128N9MEYE.5KAMN7OG53O2@bootlin.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: soc: mobileye: add EyeQ OLB
 system controller
Cc: "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
To: "Rob Herring" <robh@kernel.org>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.17.0
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <20240503-mbly-olb-v2-3-95ce5a1e18fe@bootlin.com>
 <20240507125152.GA38845-robh@kernel.org>
In-Reply-To: <20240507125152.GA38845-robh@kernel.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Rob,

On Tue May 7, 2024 at 2:51 PM CEST, Rob Herring wrote:
> On Fri, May 03, 2024 at 04:20:48PM +0200, Th=C3=A9o Lebrun wrote:
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mobileye,eyeq5-olb
> > +          - mobileye,eyeq6l-olb
> > +          - mobileye,eyeq6h-acc-olb
> > +          - mobileye,eyeq6h-central-olb
> > +          - mobileye,eyeq6h-east-olb
> > +          - mobileye,eyeq6h-west-olb
> > +          - mobileye,eyeq6h-south-olb
> > +          - mobileye,eyeq6h-ddr0-olb
> > +          - mobileye,eyeq6h-ddr1-olb
> > +      - const: syscon
> > +      - const: simple-mfd
>
> You are getting rid of the child nodes, so you shouldn't need simple-mfd=
=20
> any more.

Indeed, simple-mfd was heritage from previous revisions. It has been
removed in the latest one [0].

Thanks Rob,

[0]: https://lore.kernel.org/lkml/20240620-mbly-olb-v3-0-5f29f8ca289c@bootl=
in.com/

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


