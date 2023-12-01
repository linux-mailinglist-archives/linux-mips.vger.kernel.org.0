Return-Path: <linux-mips+bounces-422-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B73AC800846
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:34:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E87F51C20EE8
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 10:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD891BDD9;
	Fri,  1 Dec 2023 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Efp+K6pp"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5456DDE;
	Fri,  1 Dec 2023 02:34:33 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D85120003;
	Fri,  1 Dec 2023 10:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701426871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x9QLIDvjWUePyTNPo1KyKIxmABI1QYlXqcofIXZnDv4=;
	b=Efp+K6ppRKNmXRXC312z4I4B/6CUBUuHRLy8PLz+V/UGueyXXhjUby1z/imQlO2LUhYGLR
	GLCiyYckN/srl+stf7jfzn6vO8+xatIFz1FFvYGMSuvYAi3wqhfzOT3fcrulMkGFlAu1wJ
	6sfsj3uvzn9oKJQUzs7Nsw2oDCTQ7M3ErnbzRY7fohDNl9k2hSPTae29J1N6eUF5QhPVDe
	cf/keirVpnBJrg6utYHwPH1+cFVRs0rSUSj/XvDwYB8MoeDtu35HIV2LS2XSCu2aqyWtBx
	zv8qYSdo+dMxNt9XMG8q/3X1Sff/mM5tgB3tImLUaHFEtH/5iGRG0Tpgo/cy/Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, "paulburton@kernel.org"
 <paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 20/21] MIPS: generic: Add support for Mobileye EyeQ5
In-Reply-To: <db993514-7daa-41cb-8e6e-179305c16e24@app.fastmail.com>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
 <20231123152639.561231-21-gregory.clement@bootlin.com>
 <db993514-7daa-41cb-8e6e-179305c16e24@app.fastmail.com>
Date: Fri, 01 Dec 2023 11:34:30 +0100
Message-ID: <87ttp2dxe1.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

"Jiaxun Yang" <jiaxun.yang@flygoat.com> writes:

> =E5=9C=A82023=E5=B9=B411=E6=9C=8823=E6=97=A5=E5=8D=81=E4=B8=80=E6=9C=88 =
=E4=B8=8B=E5=8D=883:26=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> Introduce support for the MIPS based Mobileye EyeQ5 SoCs.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
> [...]
>> diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
>> index 7dc5b3821cc6e..04e1fc6f789b5 100644
>> --- a/arch/mips/generic/Kconfig
>> +++ b/arch/mips/generic/Kconfig
>> @@ -48,6 +48,13 @@ config SOC_VCOREIII
>>  config MSCC_OCELOT
>>  	bool
>>=20
>> +config SOC_EYEQ5
>> +	select ARM_AMBA
>> +	select WEAK_ORDERING
>> +	select WEAK_REORDERING_BEYOND_LLSC
>> +	select PHYSICAL_START_BOOL
>> +	bool
>
> ^ I believe WEAK_ORDERING is already selected by MIPS_CPS,

But MIPS_CPS can be disabled: it is not selected by
MIPS_GENERIC_KERNEL.

> and WEAK_REORDERING_BEYOND_LLSC should be selected by MIPS_CPS as well.

WEAK_REORDERING_BEYOND_LLSC is only selected by CPU_LOONGSON64 for
now not by MIPS_CPS

Thanks,

Gregory
>=20=20
> Thanks
> --=20
> - Jiaxun

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

