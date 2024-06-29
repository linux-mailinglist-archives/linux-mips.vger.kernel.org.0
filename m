Return-Path: <linux-mips+bounces-4036-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B990A91CF0C
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2024 22:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F5741F21A2B
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2024 20:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C22D137747;
	Sat, 29 Jun 2024 20:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="ga9h4jZ2"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8069F12FB3F
	for <linux-mips@vger.kernel.org>; Sat, 29 Jun 2024 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719694010; cv=none; b=F+eGC2veOeD01Pdt5RF78gnIFYJ4vzlWKbivHucJXh4muUWIL+r+sPrKt+iISo8zGUSOnehE2x/9nLf9oWfff7mQys99k9HVocTu0Qu9z4tkaxphTrYQh7t/y+GpD+L9yc9s1pQqQC80mtT+NvsY42fkkXBSuxR8VqAhQNTeR0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719694010; c=relaxed/simple;
	bh=yNMhGK1opgE2HSUTgSYp/GhoMx5lkgWtAFvzWwgNagM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O3r5443sVtdIP6G1qYaPW0ruvw5vobdThStCM/hpc4IJJfaVVwGcqijhOk8WcYhpvAHB12deL/F+jqFwd6z/iE86uFmvu65VJ123+WTs3+YLSOG9+Qba9FD2RrAcC/q8Uir7j9hGNW4RoJiTnavAuS/hW3r6VMrpwxZorDcqj6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=ga9h4jZ2; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from mars.vega.svanheule.net (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id D5CF950CF11;
	Sat, 29 Jun 2024 22:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1719693622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZAHodOL3wsA9f2Wkj7btMgY0z9vyT6v2GBhO/wOmdM=;
	b=ga9h4jZ26D9Fzzlzj56TP24EJR8nWR1Xfxdc5s8rsPMX2hoUDlpYYzBCRiDq2w3HtsQcPX
	nS1TNoMBR6yaZ2tVeI1hrHMksIEdpef+LYfWzx9TFN4rUUvsryL5EkLIfTL4T5lN6FIlmP
	O61m9r4FKrz7ryRMYo9je9ySUmWZTi3s6zJaXN+YbgIjwASFknRX02ePMS0fbPRHH1vc0X
	D8QBdZE1TlZtcQXXEjKaXyLTGVWI7J/0lb1tnT4NCZlfC36JPy7hsgThqUvS/1gvcfSR16
	W9HcvvLwLHqQllmvoaLP1ZLaEBGG4muatvNFhnzxzXzh5r1RyGIib+Yh6fwbDQ==
Message-ID: <4427a46483d9b7d122ce6923c2fc8cf0d470c6dd.camel@svanheule.net>
Subject: Re: [PATCH v3 5/9] dt-bindings: timer: Add schema for
 realtek,otto-timer
From: Sander Vanheule <sander@svanheule.net>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, tglx@linutronix.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 paulburton@kernel.org,  peterz@infradead.org, mail@birger-koblitz.de,
 bert@biot.com, john@phrozen.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com
Date: Sat, 29 Jun 2024 22:40:20 +0200
In-Reply-To: <20240627043317.3751996-6-chris.packham@alliedtelesis.co.nz>
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz>
	 <20240627043317.3751996-6-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Chris,

Thanks for submitting these patches!

On Thu, 2024-06-27 at 16:33 +1200, Chris Packham wrote:
> Add the devicetree schema for the realtek,otto-timer present on a number
> of Realtek SoCs.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
[...]

> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer0 registers
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer1 registers
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer2 registers
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer3 registers
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer4 registers
> +
> +=C2=A0 clocks:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer0 interrupt
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer1 interrupt
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer2 interrupt
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer3 interrupt
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: timer4 interrupt

Instead of providing a (SoC dependent) number of reg and interrupt items, c=
an't we just
provide one reg+interrupt per timer and instantiate one block for however m=
any timers the
SoC has?

> +
> +additionalProperties: false
> +
> +examples:
> +=C2=A0 - |
> +=C2=A0=C2=A0=C2=A0 timer@3200 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D "realtek,rtl9302-timer", "=
realtek,otto-timer";
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x3200 0x10>, <0x3210 0x10>, <0x=
3220 0x10>,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x32=
30 0x10>, <0x3240 0x10>;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupt-parent =3D <&intc>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D <7>, <8>, <9>, <10>, <11>;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks =3D <&lx_clk>;
> +=C2=A0=C2=A0=C2=A0 };

So this would become:
	timer@3200 {
		compatible =3D ...
		reg =3D <0x3200 0x10>;
		interrupt-parent =3D <&intc>;
		interrupts =3D <7>;
		...
	};
	timer@3210 {
		compatible =3D ...
		reg =3D <0x3210 0x10>;
		interrupt-parent =3D <&intc>;
		interrupts =3D <8>;
		...
	};
	...

More verbose, but it also makes the binding a bit simpler. The driver can t=
hen still do
whatever it wants with all the timers that are registered, although some mo=
re resource
locking might be required.

Best,
Sander

