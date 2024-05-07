Return-Path: <linux-mips+bounces-3129-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9718BE6F4
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 17:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BC121C23F8F
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E40161301;
	Tue,  7 May 2024 15:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IgSXrtIE"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5344716132A;
	Tue,  7 May 2024 15:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715094465; cv=none; b=S1BgAPq6jqVmeyWQvcLZ108eLAzTRv60W/syZNkAnprE5g4ZMZLHWENoSSoBDzJYtY9iV0suTHMr/XGYzHZKAHs/Cd17OPhFcEKJKJw3TbRiQkzVFzUNHJXu0DOFzHShpR+S5qZBwDtd7nW6zEVRR5EBm/RBaSZM2t0Prara3YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715094465; c=relaxed/simple;
	bh=UaQVvlK7uFSTTAgQAcJhZCMHMi2rIAYqLbFWW1dKZpE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=j3hTHx/htf9+hgSgsHQ+Hn1ZTULO4qwIic/tOLnbw8bMSeM/7zEduAs1QRHMJvWsu/iNccS4xKeu7gcGZljyliNK+OYMJdkT3J2SILIul8u5wy8E8MecGOoCF2xLq1GmUpP78j2JcgpOTTkLiWWzhypDxFKt+641t/8S4cJuYRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IgSXrtIE; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82A1C24000B;
	Tue,  7 May 2024 15:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715094460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UaQVvlK7uFSTTAgQAcJhZCMHMi2rIAYqLbFWW1dKZpE=;
	b=IgSXrtIEG4/C+lOXqlsXePSOdnwI1SABeDG763VaWxy+S+JXj4runTgPnKwdcHfuXTtzba
	yjZzI3rAwxFFAtc1tHjH3hSj8b0NJCCr8/fb5bQmLzH2do82wj6QKoj0IOc4+4AbdGMvBa
	DGyTqXuROwkGduBJU4SSUeh5irlEVVXmMXyWt+KzZ03vETHcTZdXx2tnyRFDWYA4QtAais
	n7y4ENDEWFfwGejQpba4RWN5ctoHl9jmDY6yPKNIIIxPNsNPbU4D26dINW+HsOKYznFdtU
	TGP30EEV0j/YPSTEHa9+kQnCO0pYGHWOG2XfLoTqwxYA4CfLoibIYZhqMMKi2A==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 May 2024 17:07:39 +0200
Message-Id: <D13I8TFIF77X.2EFWZ14LM2H6N@bootlin.com>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: mobileye,eyeq5-clk: drop
 bindings
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>
X-Mailer: aerc 0.17.0
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <20240503-mbly-olb-v2-1-95ce5a1e18fe@bootlin.com>
 <ee278102-f4b8-4ca0-879e-f83cd54efbd0@linaro.org>
 <13ed1865-d702-47b6-b186-d5f060103280@linaro.org>
In-Reply-To: <13ed1865-d702-47b6-b186-d5f060103280@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello,

On Fri May 3, 2024 at 6:05 PM CEST, Krzysztof Kozlowski wrote:
> On 03/05/2024 17:57, Krzysztof Kozlowski wrote:
> > On 03/05/2024 16:20, Th=C3=A9o Lebrun wrote:
> >> Switch from sub-nodes in system-controller for each functionality to a
> >> single node representing the entire OLB instance. dt-bindings is
> >> unnecessary and soc/mobileye/mobileye,eyeq5-olb.yaml will inherit all
> >> properties.
> >=20
> > Why changing this? You just added these bindings not so long time ago..=
.
> > This is very confusing to push bindings and then immediately ask to
> > remove them.

See this revision as a proposal of something that has been asked
multiple times in previous reviews. See message from Stephen Boyd on
last revision [0], or discussion with Rob Herring on much earlier
revision [1].

Proposal from Stephen Boyd of using auxiliary devices makes sense, that
could be the future direction of this series. It won't change the
dt-bindings aspect of it, only the driver implementations.

[0]: https://lore.kernel.org/lkml/daa732cb31d947c308513b535930c729.sboyd@ke=
rnel.org/
[1]: https://lore.kernel.org/lkml/20240124151405.GA930997-robh@kernel.org/

> One more point - anyway this should be revert with clear explanation WHY
> you are reverting bindings.

I'll make sure to use standard revert formatting and explain why it is
being done.

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


