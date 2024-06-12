Return-Path: <linux-mips+bounces-3629-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E72A890594A
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 18:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AC3A284A61
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 16:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3EF181D00;
	Wed, 12 Jun 2024 16:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ajzC4ir7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c2W2+H/E"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7E4181B9F;
	Wed, 12 Jun 2024 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211497; cv=none; b=kBCflVjnLyLtNpY4MhqCIwSfB75j1gDqbx6lwGnuhfcgDE8v5sPraqHytQCo3qaEkchSDpXSzooBecHV/mxDyhgCk4khmpwyDDXQu4KK85R6WwSKQCGVcJIBobiDNTRFGceYx2FeoZrCSZ80Pw07wItc7r2IWIXVMlAHRcfrnPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211497; c=relaxed/simple;
	bh=k9Lt/sYALAs/IdiJUK7DTEjvCUiNGYUcJ23eFenHmAE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Wf6ZMK1OHm+OsM9XXbdGyS+Mv86dtb6+iPXJYr0EyjBXk0Ngl6L5dTWW+Dgt3mB8M5+p0H+BSck4r+EBI3Uc7Tpr1Ebf+bteVX6dQqmzPQA9aRtnF+oIBaaiP6hbeM9gJBqRPZyBILI/REmgX6HiB4QX95vS4+uatobGTvwdiIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ajzC4ir7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=c2W2+H/E; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 91B1011400E9;
	Wed, 12 Jun 2024 12:58:14 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 12 Jun 2024 12:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718211494;
	 x=1718297894; bh=k9Lt/sYALAs/IdiJUK7DTEjvCUiNGYUcJ23eFenHmAE=; b=
	ajzC4ir7E89StbRr2X6oOaFcJj9+eF528n2891pEkwIa1owgqc1yRlR+RFL2L81f
	Ikquyij03BDWWe25GFY5rpSnvz0ZsKwXSv/DDsSiSx6X9jLyBpLUP8V+1+RMLa3W
	J/6L6Lb4Gs7n5KKa1tXGodzCJAv5zxMBciRhmlB92sZgrS3RBlfkv3s7WoGDH2+1
	j8chQhCHkW2zm6X0ONM6aFq3kwC5ErIiFdtRgEpnbFa9vWgf7r82dWurDZgHrCRo
	G/G961Po7PMHBcY9gtZPUwLCtz72rWlIUSPkCTyQlIlT4MCcPsT20aWrG3VrYeLo
	VMjRXwXYdyC8ShKJ/rF3ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718211494; x=
	1718297894; bh=k9Lt/sYALAs/IdiJUK7DTEjvCUiNGYUcJ23eFenHmAE=; b=c
	2W2+H/EbaidVmVKPsNN3FugNYoDqHgrfn7O987wN6NHpIeKw3vK063pRjGIXfdBm
	1i7lB4tDk3SUo9alTNDDnfRE939tqh2D04gX+ybGlUktB43Md5vYmAmV5P5qQ7ae
	MlyPf+rVC1oZPvi4hJbMRh933L2tJ1Xgkm7iu8Sd75NUYRlxFER93Gy6ObEJsE4l
	Tvah0uNEiFMSIL756JNSmYREMgYXKDRdh/7yDcvWGLbGFZkrh1La2VjAqiKuXz9f
	gAwyphFlbQYP5E5aoGAZfamyye/UhuKj+AsliUSMFBxC2wjnyjR3WySdnS5bHjEj
	uDc/ibXUsEKv0Cj46FMRA==
X-ME-Sender: <xms:ptNpZpGY34_deN1sm3tCx8QAbSMl8sQKUtxJvvWHQUpsCNwDeRH6rQ>
    <xme:ptNpZuVX6NCJQZLqwvHyV7Zwjlmv1R2cQhvt0LkqslE763UxHQpWME5kCORO9n5za
    9vrHk5faC0-R6jIZlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:ptNpZrKCYUYbbAkqO98b4a7mFY2gRX8lchyV2YyhGjJY2f_9axigjA>
    <xmx:ptNpZvH9669qTW36dYW7WRpmtBZv_El8IyiYk5XHIF-3feJ1iGDxhw>
    <xmx:ptNpZvVpEULiaCtZDmKzuFqx2ffq-zBRZe71nTtU890IoB_SQzbx6w>
    <xmx:ptNpZqPXXmsANGSDDdSjTvnm9iHwFWm8h_jOk6jA_Xg8UOJ3U4jnUg>
    <xmx:ptNpZvR8MBEWPY5y5aERXiqetsxOsm6LK8V_zwN63X493oqqs9Lu8eiA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1194236A0074; Wed, 12 Jun 2024 12:58:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c991ca40-5b9d-45fd-a4e8-4fe6930c2968@app.fastmail.com>
In-Reply-To: <20240612-styling-deafening-2cdae7cf0b55@spud>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-8-9f8e1a07fa63@flygoat.com>
 <20240612-styling-deafening-2cdae7cf0b55@spud>
Date: Wed, 12 Jun 2024 17:57:55 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 8/8] dt-bindings: mips: img: Add devices binding
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=885:43=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
[...]
> Usually the order used here is something like:
> compatible =3D "vendor,soc-board", "vendor,soc"
> The pistachio one seems to follow that, but AFAICT "boston" is a board
> and the order in this one is something like:
> compatible =3D "vendor,soc", "vendor,generic-fpga-board"

Boston is an FPGA & Emulation platform, so I don't have a good answer
for what should I fill as SoC.

Thanks
>
> =E9=99=84=E4=BB=B6:
> * signature.asc

--=20
- Jiaxun

