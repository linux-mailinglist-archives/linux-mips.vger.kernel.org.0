Return-Path: <linux-mips+bounces-3791-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D599910F7D
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:55:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C27BB2CF37
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433A71B581B;
	Thu, 20 Jun 2024 17:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Jgvr+GaG"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820BB1B4C2A;
	Thu, 20 Jun 2024 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718905155; cv=none; b=tSUm3CXEAqNbXOj0zWw7fHJFaxo3jwSsz4i/dzZuTxJZwIs1ACbOHYYBv7/+k1Qff8iViaFLCL4ZaUIZ2m9DXT0/r2M646iuS/xbOR/iG5gsPA/k6Fn9rhAe7NxXjQlJFcctO6ubrZ7+MwLX4NbTf7gRAoDoJUsFNvruvT7Xt2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718905155; c=relaxed/simple;
	bh=YTk3Lm9Ov1kYYHSEDrF0pg5GItvYrx4G0xmDmP2GC7w=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=F7LKZtgjmBN6KyEU3+yV7pbL7AIZ9x0oV8TZRoZMgIMWldu9ZpidOHGytq12nzuQL6YrGXvpGix9mBfxnvSgEQjzDaQNJm1UqqkkVeDQngXPfVNbzkHGdsVywLgZDo7W9UwvLH8c5dF0w6bT96fgFALep65slS0jZuEyzi4h4xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Jgvr+GaG; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 30CA71BF205;
	Thu, 20 Jun 2024 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718905145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YTk3Lm9Ov1kYYHSEDrF0pg5GItvYrx4G0xmDmP2GC7w=;
	b=Jgvr+GaGJcOUHSVi29h34AVdwARGliz2lLi7NaRdFKrRMW2OVjEwlGi3L8MThZEu3T805v
	rDng0iNK6hr2kv5yfCcrDuvqet1rU0F6RHIICrZ+FAY5fruHVwG9xiFFUh5QsFKO2Z/8sh
	l2AWBagV0wn7qcQ6W9N2xMoAaC8isPyhTw1oV91bTGtl5LnAFwpdT5e9UbGknSlxpd6a8M
	9xvtlwark/NwQaNb8iaxcrgKE6VrFPPgNJ+/C5kOKto6NN+HGpNccIU9XpZ7Q7eeA1EW9r
	dE1FoLrhZrZR+qV5y0n19g5Lv2Iew7X+8NlVwWKsu+T+6aLgzHVSDhQnLo5GRQ==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Jun 2024 19:39:03 +0200
Message-Id: <D2510PQUKXWM.24TOHQBNTC7Y5@bootlin.com>
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
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
X-Mailer: aerc 0.17.0
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <20240503-mbly-olb-v2-1-95ce5a1e18fe@bootlin.com>
 <ee278102-f4b8-4ca0-879e-f83cd54efbd0@linaro.org>
 <13ed1865-d702-47b6-b186-d5f060103280@linaro.org>
 <D13I8TFIF77X.2EFWZ14LM2H6N@bootlin.com>
 <fd0228f2-2f41-4194-b804-7a90ea3a6091@linaro.org>
In-Reply-To: <fd0228f2-2f41-4194-b804-7a90ea3a6091@linaro.org>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Krzysztof,

On Tue May 7, 2024 at 5:34 PM CEST, Krzysztof Kozlowski wrote:
> On 07/05/2024 17:07, Th=C3=A9o Lebrun wrote:
> > Proposal from Stephen Boyd of using auxiliary devices makes sense, that
> > could be the future direction of this series. It won't change the
> > dt-bindings aspect of it, only the driver implementations.
> >=20
> > [0]: https://lore.kernel.org/lkml/daa732cb31d947c308513b535930c729.sboy=
d@kernel.org/
> > [1]: https://lore.kernel.org/lkml/20240124151405.GA930997-robh@kernel.o=
rg/
>
> So after Robs comment above, you still pushed the wrong approach and now
> you revert it?

Yes. The gist of it is that I had misunderstood the messages. Mostly, I
did not understand how to implement separate Linux driver with the
desired devicetree structure (no subnode on the syscon for each
feature). I was missing knowledge about Linux infrastructure allowing
for that. MFD and auxdevs are two approaches, with auxdevs being
preferred.

The latest revision finally takes those comments into account.

Thanks Krzysztof,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


