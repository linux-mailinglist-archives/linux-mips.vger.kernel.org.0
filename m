Return-Path: <linux-mips+bounces-7486-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B5FA13931
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 12:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475F03A7C8A
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 11:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CD01DE2C1;
	Thu, 16 Jan 2025 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="OO6KTh89";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ORvpSSI1"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654951DE2B8;
	Thu, 16 Jan 2025 11:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737027315; cv=none; b=B1Q//eSk//l6Wa57SkUbVu0eelxraCiL6tgWdL/L7gkfhf7UbB4DbACRjOfSL/NTG513YnUGiWX8avj4fbIcrGWqtz49kuLP2kNAchToye1XlA8Qrs/f9aS9t3KFPYi43LgBtTW/jtR+AGdi/5x70WiTd9GqphpwGeGNVmqM+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737027315; c=relaxed/simple;
	bh=jSVtHDP4vkRRHEPHgwEmKSyueXuCauln5j89nd1+i4E=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UvECbXXJmN2EgBhYIC66gbU+UYvDiBdpZwiRbaP8rK/PtjRXssphd1MMHEzheTbb9R6LYaU+HBp3ZKbz3X3lWI+pO/MJq2mHAgkmPJkkHf20/bR1mmEGsjbJv+2UKlK36EOnLfjAL/9YfOeC043EH5k5fdBDEeJ1g2J7zMmtthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=OO6KTh89; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ORvpSSI1; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 7C3E213801E7;
	Thu, 16 Jan 2025 06:35:12 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Thu, 16 Jan 2025 06:35:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1737027312;
	 x=1737113712; bh=z+EFIr23ZJs03pyrwVBBdlciNSMNgKdLlwXususlrf8=; b=
	OO6KTh89wQBi1r8VN4uihkPC65/ZKZGEW+QHk0XZtTQ05PCI8Y0F+gTBZuDN+Yh2
	17081nei2Go/8yhHDdCmj43DMnY4A3ig34kbHPzRRgH+l6DtxZhJSRb8XGyvYfV9
	owdaP7PGzQ2dAcKYWCb4tbQShLuGMpYJtk7U4gHNtbXHMuV1O4I+cpEWUWm+NT6t
	D0EGzopQTjZhJBdwsZbFgX53WnvxOOi9toR3+Uf7hCuWj1QAnHhAZbLMErL80OST
	EMCAtUs07DwQXBmniXMrBszKzL8btQkkFadU2gugvWfn29NEgbCtANXg0ZxE3SMe
	NvW7zUq4/u9qSoVS/pGeOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737027312; x=
	1737113712; bh=z+EFIr23ZJs03pyrwVBBdlciNSMNgKdLlwXususlrf8=; b=O
	RvpSSI1Gv0uXGeaFWtRBsvzunqeFsPRAbOdCN7GhZlIqeLxE/Rug2WvvBlHzE2mT
	mgRqMWe8vW0LgUv7mnzbJ3D92x57oUkwckCY60eItehUcElTnBEvwfLWAhgMjRUD
	wC3GJGpDDanabMMBAmjKuoeGsy3Yzxndt1RDnRhhiIWH2QLvBWg3jNrC7OumzQmh
	+mWJ4R59/Hql+oaIzFGMYD/K5Hw2aAvxGfwO5ittajQ+asMCD9T78aE94Nt1h1L1
	Y4RRLOTMSgBigxTr/vG8ifJ1X0GjelFZwt46ZyimYs9wcCozxuwkou7z6KlmvU7K
	EjiMA3XUd1ZyUCe5LTHVA==
X-ME-Sender: <xms:7-6IZwg-8eeVTMgDrABKg5heQjv-57phQUS9zAVHFb8MzmAoKw6SyA>
    <xme:7-6IZ5C1yOYSj9Jo1IhwdzNBEfqs2J9dlgnUrgrypNGUykoRh3ORweIpolEGq7J52
    NSGgEqSdukvZnhGv2E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeiuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    ohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtth
    hopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhh
    ohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprg
    hrihhkrghlohesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtrgiffhhi
    khdrsggrhihouhhksehmohgsihhlvgihvgdrtghomh
X-ME-Proxy: <xmx:7-6IZ4EGtc4xvU43c-Dk0OW3AAri7wvT7n6Mpkzj-03kN8Ke7NFdKg>
    <xmx:7-6IZxQXu8h7vlSEDnKLJT3S405NKpI6i4WqyHymAZr57Fg9Kdq1uQ>
    <xmx:7-6IZ9yPGGkSxNQej3TdSsOD1MOeEVWi47x9Gj32pQESqp11trNsEg>
    <xmx:7-6IZ_6Ea7ga--5RlYf4ZtHxExCWU44t5EhPqP8IrZnOKW1os_mvpQ>
    <xmx:8O6IZwopyr1f3Q_EsAyIUQCpDNi45Nt8SVh32dxZ-0nrdxHmEGkdW3FH>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BF2501C20066; Thu, 16 Jan 2025 06:35:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 11:34:50 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <8df8ffbe-fcee-4002-afdd-98307324b63a@app.fastmail.com>
In-Reply-To: <20250116-cluster-hci-broken-v2-5-fc52cfb7a19e@bootlin.com>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
 <20250116-cluster-hci-broken-v2-5-fc52cfb7a19e@bootlin.com>
Subject: Re: [PATCH v2 5/5] MIPS: mobileye: dts: eyeq6h: Enable cluster support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8816=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=8810:59=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> The CM3.5 device used in EyeQ6H SoCs incorrectly reports the status
> for Hardware Cache Initialization (HCI). This commit adds the
> compatible string for the CM to acknowledge this issue, which enables
> the use of the second CPU cluster.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi=20
> b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
> index=20
> 1db3c3cda2e395025075387bcb66ea0737fd37f6..c6087bd8ca1d47855b8d93aa7e75=
e1fed219587b=20
> 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
> +++ b/arch/mips/boot/dts/mobileye/eyeq6h.dtsi
> @@ -32,6 +32,10 @@ cpu_intc: interrupt-controller {
>  		#interrupt-cells =3D <1>;
>  	};
>=20
> +	coherency-manager {
> +		compatible =3D "mti,eyeq6-cm";

                ^=20
                Maybe compatible =3D "mti,eyeq6-cm", "mti,mips-cm";

Thanks


--=20
- Jiaxun

