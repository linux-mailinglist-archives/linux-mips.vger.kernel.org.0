Return-Path: <linux-mips+bounces-7488-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE8A13A0D
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 13:40:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9CB8166B00
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 12:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063BA1DDA3F;
	Thu, 16 Jan 2025 12:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GRU5Bb3A"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FAE19259A;
	Thu, 16 Jan 2025 12:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737031195; cv=none; b=L4LeAd8lWKD30WQZSCLE0ss4gdKod0NcFa5JDjRqlZVtJAPeHeGHRtTapznlbcjohAklZkToqN8AaUCewEE6NbD2ineyjFlx++GRAXshRVxn1F7v7ybHMzZTIOaTpYtFcsNaycZv053NOLlj/XBy/ITtLNG1YBIDzdHfpO1wtCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737031195; c=relaxed/simple;
	bh=hq5gGe/naKMIKwDV5MG6X2cwmQAESByTrmjdViN1FYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CH+/+uM/WGiPXEFbyJ3OVr/5H4cEan6dk/xbNgVEJsJbUIFJmjE5VvNZAiw1pdpAqyuFVaI9/EH44pyiW8btOGb4Q32t54Dl5Oij8Y/DSuIbmceDMrlPVbG0NuLg6OZEN5mjow+D4bYTdE4iHxaqO8iYsxIqUa061bIW3atX4PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GRU5Bb3A; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9691E0007;
	Thu, 16 Jan 2025 12:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737031191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5pEg1ReTtCFpBLOPiIv4nzlIXH3Hga2D1KjAE3e9oww=;
	b=GRU5Bb3AaXQ5oC/+0tfM42eTvNH+UYdMQUk7W21DGRusn1WzbCEUX7fvaloeYCqroqJffL
	CcByHz4QMibLhaYeOSeukzVOBNwymIPiDry/XbMAyNClMSqDUylxEYz/28tY1O9LX8sgiR
	Jqa5vjielZr+jQ6RYv4Kk9QyG4CNvUWe+YY/5ohqiGlm3SJcTZF7jpQp14PhmX69tQrwZV
	ZyeUqB9YtnCbDdCMjUYVG4kcd5bva8723hya3ISy3QpOvtTYeiNTowUrft3rHyN8cL++qy
	t0tBuR8c1CD2vrcMDVvGtH74CO1ZVFbgIjWFzlfdDPavpYxXTcPPOn9pOoDUeg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] MIPS: mobileye: dts: eyeq6h: Enable cluster support
In-Reply-To: <8df8ffbe-fcee-4002-afdd-98307324b63a@app.fastmail.com>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-5-fc52cfb7a19e@bootlin.com>
 <8df8ffbe-fcee-4002-afdd-98307324b63a@app.fastmail.com>
Date: Thu, 16 Jan 2025 13:39:50 +0100
Message-ID: <87cygnvso9.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Jiaxun,

> =E5=9C=A82025=E5=B9=B41=E6=9C=8816=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=
=E5=8D=8810:59=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> The CM3.5 device used in EyeQ6H SoCs incorrectly reports the status
>> for Hardware Cache Initialization (HCI). This commit adds the
>> compatible string for the CM to acknowledge this issue, which enables
>> the use of the second CPU cluster.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi=20
>> b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
>> index=20
>> 1db3c3cda2e395025075387bcb66ea0737fd37f6..c6087bd8ca1d47855b8d93aa7e75e1=
fed219587b=20
>> 100644
>> --- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
>> +++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
>> @@ -32,6 +32,10 @@ cpu_intc: interrupt-controller {
>>  		#interrupt-cells =3D <1>;
>>  	};
>>=20
>> +	coherency-manager {
>> +		compatible =3D "mti,eyeq6-cm";
>
>                 ^=20
>                 Maybe compatible =3D "mti,eyeq6-cm", "mti,mips-cm";

I explicitly makes the compatible "mti,eyeq6-cm" and "mti,mips-cm"
mutually exclusive. This allows us to require the reg property only for
"mti,mips-cm" and not have to provide it for "mti,eyeq6-cm".

Thanks for your prompt feedback,

Gregory

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

