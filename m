Return-Path: <linux-mips+bounces-7909-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44753A407BD
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2025 12:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4E4D3B5230
	for <lists+linux-mips@lfdr.de>; Sat, 22 Feb 2025 10:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723ED20A5CE;
	Sat, 22 Feb 2025 10:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="UBjpuwuv"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF86209F5D
	for <linux-mips@vger.kernel.org>; Sat, 22 Feb 2025 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740221862; cv=none; b=MdN0m+4RsInxjme4n+K4Qyeeh1uz+sDn+A3ZuMJbEoSgXrPB29CN0YQlRzhQRtszmNxW63kJGebB/eP1VUXolVJ4BiQE6JnBH5FJ772g0lzJTA92+uY9YaC5O3Mq3KpwGcCs8E3ZNzL4v3l6KtGrdCQyhFo9ENgu15SFb6Ggzrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740221862; c=relaxed/simple;
	bh=JVxlEJht2x5RnrXe4+WJyXGYRUS9jHA+W18zxZ2QD0A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hDSAx60691wes/JQnF8802KZMWfr90rM1hBB5JxveG/CxZRRo1IUEpw/l1p/r62eNJ9SeyRAoGflDrJI5Ds18FPGdCEOZ09ZtLanD+E8jyOUJSE4EwsXpsvq9WguU5cx2FVueUxFDrvLV7QbP1z+Z+0GKgNg+vAq52+oh6nSMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=UBjpuwuv; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [192.168.90.187] (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 74ADE5C0430;
	Sat, 22 Feb 2025 11:57:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1740221852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVxlEJht2x5RnrXe4+WJyXGYRUS9jHA+W18zxZ2QD0A=;
	b=UBjpuwuv87ExHHcV6HC+rinBCYljQ32a3tDSvwugfMzVfNBoBIFvm0UYJTel7A7ciWm8SI
	nRQIPaCwBFg0IP5G31OINfGMqU9E5zfHGNq/8BoImjdQ+HKvQjTtVB1iXIa6qnHmKBwUaZ
	OTfrAlPpUtka0IOcnCZqpZBgLA/c7pMt+9MTbIjS/SXcASL/u2wd+Hqq0WSbK7WU9ZvJVR
	0ck5h/LiO/VSczk6UVB/h66Gvs9+vhcWhVN/o22cGTNvxXIVy4CIm4LMDdOtMt+wt/6eGN
	S0JVE8MAfJDKFP0Etfjj2JeOCxMikoCmViW9h11Km+POZJ3mmzzcoBj/4ProvA==
Message-ID: <c758dab6497284a6eb5b962c1b0d4619d4fb322e.camel@svanheule.net>
Subject: Re: [PATCH 0/9] mips: dts: Split Realtek devicetrees
From: Sander Vanheule <sander@svanheule.net>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, 	devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Sat, 22 Feb 2025 11:57:30 +0100
In-Reply-To: <Z7ibXewhvwU1d1G3@alpha.franken.de>
References: <20250119183424.259353-1-sander@svanheule.net>
	 <Z7ibXewhvwU1d1G3@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Thomas,

On Fri, 2025-02-21 at 16:27 +0100, Thomas Bogendoerfer wrote:
> On Sun, Jan 19, 2025 at 07:34:15PM +0100, Sander Vanheule wrote:
> > This patch series intends to clean up the base includes, shared between
> > hardware devicetrees. To get rid of some dtbs_check warnings, some cpu
> > clock prorerties are also modified.
> >=20
> > To indicate why the split-up is required, the series concludes with
> > adding some CPU peripherals to rtl838x.dtsi, which are then used to add
> > a gpio-restart for the Cisco SG220-26P.
> >=20
> > Sander Vanheule (9):
> > =C2=A0 mips: dts: realtek: Decouple RTL930x base DTSI
> > =C2=A0 mips: dts: realtek: Clean up CPU clocks
> > =C2=A0 mips: dts: realtek: Add address to SoC node name
> > =C2=A0 mips: dts: realtek: Fold rtl83xx into rtl838x
> > =C2=A0 mips: dts: realtek: Add SoC IRQ node for RTL838x
> > =C2=A0 mips: dts: realtek: Correct uart interrupt-parent
> > =C2=A0 mips: dts: realtek: Replace uart clock property
> > =C2=A0 mips: dts: realtek: Add RTL838x SoC peripherals
> > =C2=A0 mips: dts: realtek: Add restart to Cisco SG220-26P
> >=20
> > =C2=A0arch/mips/boot/dts/realtek/cisco_sg220-26.dts |=C2=A0 10 +-
> > =C2=A0arch/mips/boot/dts/realtek/rtl838x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 111 +++++++++++++-
> > =C2=A0arch/mips/boot/dts/realtek/rtl83xx.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 59 --------
> > =C2=A0arch/mips/boot/dts/realtek/rtl930x.dtsi=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 136 +++++++++++-------
> > =C2=A04 files changed, 202 insertions(+), 114 deletions(-)
> > =C2=A0delete mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi
>=20
> series applied to mips-next

Thanks!

Best,
Sander

