Return-Path: <linux-mips+bounces-7614-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B0A2000D
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 22:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3DCC3A5E88
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 21:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4241D89F8;
	Mon, 27 Jan 2025 21:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="RhDpFeTe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X/EF7ghQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9D4190664;
	Mon, 27 Jan 2025 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738014221; cv=none; b=hPxtcoz69yeVncVJC/QuAleIbezeXUEFwZ+pY/DVMLAQGzkMl8M6AiPSKmR0emSf3ihOPO8DI3YUcT6dX426huQniXxwrdLi/nGBkUi0EvAEutZd1X9ferURL2mW/gaMXbcwNB2UHUDHZGdxztqhYz57VOtFMT53NkdFqczV1ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738014221; c=relaxed/simple;
	bh=btFMGF0l0jNhP3EztGvtxGOBdYKRNVHIlfwFFvFLHnw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ooB0H2+SLqZ4PHk5uZUOb8CtX3gcAaL4K5Bxka8gi2Hw/80/rowj1SdN1WKXoaJUu6ImyY0eFpgAvw6dvrNVG1ZI+4teIN5PqzcnkLMBe73/ERu/w6u3Ued9RH1dYtoJm7MVUe2QHF7nCydUzQzPrAe8oXIKbwiBBrwi9MvZW0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=RhDpFeTe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X/EF7ghQ; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id A2B8A114014F;
	Mon, 27 Jan 2025 16:43:37 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Mon, 27 Jan 2025 16:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1738014217;
	 x=1738100617; bh=UCxpzQHjRe5ProJN41gRZFDzvEjuC1U2OY/rjzYivPs=; b=
	RhDpFeTevnFgafM5InT8qPaILRBcl0+GeGtLNfGO0UkvA6pfMIbb2QbjGK2ZILiK
	Ddh3xMgJTa8Nu3xmp+RmRZTswakZieMJzpt1nmucQNt0vLZpDZY+AWbW48TWc39E
	LklrPY6Af/q4lXRa0rF+mYauyVCSxpsq74Mswdl1MCccWqP9C8JpXetEV9TzOanW
	XihAvSo5eZK9+04cnGhsJ9feAuA01XaP7VksbPKX7I56hHENbf/dj79CEE6+2pFK
	C/aF0V4iE2GvjruNUE9RZglJGi/kdUNNnVKVjA6HNsbX6TNWn/Qp6oKOa5gZ0PsJ
	sM9KCsiTcWz+w6sZrw6jlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738014217; x=
	1738100617; bh=UCxpzQHjRe5ProJN41gRZFDzvEjuC1U2OY/rjzYivPs=; b=X
	/EF7ghQ3UIFV5XUlo3yIcdEUJfxWKGc5p97976Z4lmDxS5IfwUMi2PdZ3w0v3QhB
	9Cp/yQC63LxEkhd5RQdkLHhinoSdl18GEgO2AFQ44XlGCKIhryeuFNhpjcamIxMs
	+Usfb8wQ54dWlfgNJPJ7+tra2Et+0SOChwOCgdSy+b1TY8EoQKQIuwCpR+AjdtpT
	oY7iDTjlUZMk44HDrl+Mll5JkQDlJRZvbdX24CwBCPAwEEgjevlSh2xWQmqkKz/T
	FBH9uGpedTZlHo/9n0bMqTurerBGdGk7UDtbNImN3DcIQB9086g3xIaciLeJCetK
	Kx2iQYQiNhYobmEOFtiVA==
X-ME-Sender: <xms:Cf6XZyj_FlrqH9fqvvmrxRgohU2suZvDk_EipLcZnztqLWd9pdsklg>
    <xme:Cf6XZzCw3jXeTdRulKjG62EZk1QKbAEzPMgs1MuPBQSce_XhgmNggX7qfzwlkRJ9w
    uIWJLUBnGo35CE-EcU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudegfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghngh
    esfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdff
    keethefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
    ohgrthdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtph
    htthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohep
    thhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoh
    eprghrihhkrghlohesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtrgif
    fhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomh
X-ME-Proxy: <xmx:Cf6XZ6F8vAV0ALE9d3kPE6kHgXbG5SauMhOSl61cURbng6eZckpipQ>
    <xmx:Cf6XZ7QiiZAiu0-_DHyJStp--OJmpYWod0HWWTUgXvDUTvCGWU2oCg>
    <xmx:Cf6XZ_xCxRFO_ipK-YoedjDbOlSE3YZ1l3_8vDCvHyGbPc6j8jokyg>
    <xmx:Cf6XZ56JYpQTzjqjpqiPR90mXXtRD0b2qIWD-nrS6gEr-Gfje8Wk3w>
    <xmx:Cf6XZyopveRRLdUew8blSyMtbZOld_L1QARk-6ZLgXehZnVsJEVbbimd>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 21FE11C20066; Mon, 27 Jan 2025 16:43:37 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 21:43:16 +0000
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
Message-Id: <afa2e874-c078-4c3e-b485-d948a0bb6a6f@app.fastmail.com>
In-Reply-To: <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
 <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mips: mips-cm: Add a new compatible string for
 EyeQ6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8823=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=E5=
=8D=8811:01=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization is
> complete, but in reality it's not the case. It also incorrectly
> indicates that Hardware Cache Initialization is supported. This new
> compatible string allows warning about this broken feature that cannot
> be detected at runtime.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 12 ++++++++=
+++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml=20
> b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> index=20
> 4324b2306535f1bf66c44b1f96be9094ee282041..d129d6382847768dc026336d8d2c=
7328b6b81f9b=20
> 100644
> --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
> @@ -19,7 +19,12 @@ maintainers:
>=20
>  properties:
>    compatible:
> -    const: mti,mips-cm
> +    oneOf:
> +      - const: mti,mips-cm
> +      - const: mobileye,eyeq6-cm
> +        description:
> +          On EyeQ6 the HCI (Hardware Cache Initialization) informatio=
n for
> +          the L2 cache in multi-cluster configuration is broken.
>=20
>    reg:
>      description:
> @@ -44,4 +49,9 @@ examples:
>        compatible =3D "mti,mips-cm";
>        reg =3D <0x1bde8000 0x8000>;
>      };
> +
> +  - |
> +    coherency-manager {
> +      compatible =3D "mobileye,eyeq6-cm";

I think =E2=80=9Cmobileye,eyeq6-cm=E2=80=9D, =E2=80=9Cmti,mips-cm=E2=80=9D=
 would describe the hardware better as eyeq6=E2=80=99s CM is just a spec=
ial variant of mips-cm.

But I=E2=80=99m fine with leaving it as is.


Thanks

> +    };
>  ...
>
> --=20
> 2.45.2

--=20
- Jiaxun

