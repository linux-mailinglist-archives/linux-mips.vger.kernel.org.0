Return-Path: <linux-mips+bounces-3755-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1045910B98
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:14:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7E4D287570
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE0F1B14E7;
	Thu, 20 Jun 2024 16:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hyU2t2Qo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gLPs8ayq"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900521AF6AE;
	Thu, 20 Jun 2024 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718900049; cv=none; b=LqrDcwiEr+96eU7/D1c1skdwcC4KldaCQWJ2Ky/JymwTEqPdIJSn+qhsHDcF2we6hIuQeiDffxYwsEDKIuJUOknOq+nQyX3ZUaTzsSp6I5dqoBI/qRCCO8uXYMZ2hZYWZboqhzL+0HZfSz1+xMU1x0TydBdwP0DpNJY3i0tHYxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718900049; c=relaxed/simple;
	bh=8WvGrEKWEj6huxHRBZE5VfOVaSzUc6kmVBOhZwVQeU0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=i10+PZWot7Z2scCXaUYEGg/QzdS8LxINLNdVl7pAy8djS+gRxg8oJldcrcaDcEShQRx+HPxM/pkJvSNWU+2rJvln3tSMfg+mRXs+Dd15LxyX5b6bDHXjccqqv1eIeaqD7G/QIP4Ff6YNTcgltPyt0Wugg4SbBWvIweC1hHSxLeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=hyU2t2Qo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gLPs8ayq; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id 2CEE91C000AA;
	Thu, 20 Jun 2024 12:14:06 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 20 Jun 2024 12:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718900045;
	 x=1718986445; bh=pTsR4P9iYtq7n9VU6NZN59uSyYXTfa7yGNhTaHlHYxI=; b=
	hyU2t2QoUuoTz/lQtZOBijEk7OjK8VbrePZm6DvQF67Kp9DxnJzEz3hLRF/6HWeP
	XNftT671ReCxZhvuebLo0EHWIU5ag3j00Vsz/T+iVleSZLkxDOV0e/JQLSpoKQb5
	Zo88TADyckHIWcyHgNO7FEeHkejsf6jNcWmgonIdULs1n9LQOfUZEV1fpoeXbKzy
	apEFys18AdKMy3f3Vs4snXmE7m6mDfCNKrXGRMGMF/MephTa3mFA6BqsolXvDmBN
	tmA+OxkllRr3KC97UaV1jZq2ZmFuSGEHJoRnjDtaujYUU90i8t+IQBPwssQQic/3
	E3Qbpaa9qqMnCcM/rIFDTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718900045; x=
	1718986445; bh=pTsR4P9iYtq7n9VU6NZN59uSyYXTfa7yGNhTaHlHYxI=; b=g
	LPs8ayqyvnpbag0nCc9A4AbVUhVsdBTn8Vg+8NOqJVVbV1LpSL+iR5T82sqCRJKg
	W5x5LAmSYNYU2S1VIYe43YJf7h4fY52Zkvzl8N6t9r3azsU1BtS4jlalfNUO40LJ
	k3pq4+XKb+VYwARGgjosYUhsq0Tlw9+7+ViGPWVrY+iQRwnXzrWNQg1tiAu3F6s6
	Z3dGws+xeiLyrVd1UuE//LnLsjUsrufo8cNNb24Fsy5BtTOEX6bySzaK9Q3mLofg
	LehJY1h57l5FgiLjeoZJ0bmSGpZ6XDAi1ROQ2pVb9k5xYGQLFTY/Rm/YOApz7IQ+
	QFMfZpxDi8Y9AdUw+WgbA==
X-ME-Sender: <xms:TVV0ZpFVyWfn42WRi3uIr00cvPdZRCer8ADyeFQMhJoHK6iXqwnMmw>
    <xme:TVV0ZuXQO_vv24uHkDbAFpUoI083ELNVbQ_UswceuzU91di1KkW_5i5OSMkLHVc2-
    vRnC7OecPLxhKDUfr0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:TVV0ZrIHotaaE1k8O-IuNQ2Dd9mxlZ72k7eih-2VsAjuzf3VMVcQvw>
    <xmx:TVV0ZvGe4q4bCtcuQ1EDYADjzazGthzBhmaLgBDHaiPVj3cVQVqq2A>
    <xmx:TVV0ZvX2udGkn_4rAWBsm8ZdHoPEeJPhcKmfsgsqbxBf6qmZkfv-SA>
    <xmx:TVV0ZqPg0AAtLDLmPwzVJ_nNaY1siWqPTCbp1UCR0TQeX5PJ_L3dpw>
    <xmx:TVV0ZvRdEa9yMw_AIhHvVR4J5Wg5ZTjADFqiGLOAIFicKvZzDaKg6qIS>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8114836A0074; Thu, 20 Jun 2024 12:14:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <be608e3e-2ecd-4d7d-bf45-99c553e72c08@app.fastmail.com>
In-Reply-To: <808f27bf-9dc7-407a-86ff-0a8fae79531c@kernel.org>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
 <20240618-boston-syscon-v3-7-c47c06647a26@flygoat.com>
 <6d3fbd07-72a0-43fd-a1e5-c39e3a833bc1@kernel.org>
 <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>
 <808f27bf-9dc7-407a-86ff-0a8fae79531c@kernel.org>
Date: Thu, 20 Jun 2024 17:13:24 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v3 7/8] dt-bindings: mfd: Add img,boston-platform-regs
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8820=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=887:40=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 19/06/2024 13:20, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8819=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=
=E5=8D=8810:28=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
[...]
> Your children depend on parent to provide IO address, so this is not
> simple-mfd. Rule for simple-mfd is that children do not rely on parent
> at all.

I don't really get this.

As per syscon-rebbot.yaml:

The SYSCON registers map is normally retrieved from the
  parental dt-node. So the SYSCON reboot node should be represented as a
  sub-node of a "syscon", "simple-mfd" node.

syscon-reboot is certainly using parent node to provide I/O address,
even regmap property is deprecated. Without "simple-mfd", reboot node
won't be populated at all.

I'll remove the dependency of clock controller to parent node anyway.

Thanks
- Jiaxun

>
>>=20
>> Linux managed to work without "simple-mfd" only because clock subsyst=
em
>> is bypassing regular OF population process. Semantically we need this.
>
> Semantically? No, you need proper populate, not incorrect simple-mfd.
>
>>=20
>> Besides Linux as upstream of devicetree source had accepted U-Boot
>> only stuff here, such as "bootph-all" property.
>
> Because bootph-all is valid and correct. Calling simple-mfd something
> which is not entirely simple-mfd is not that valid.
>
>
> Best regards,
> Krzysztof

--=20
- Jiaxun

