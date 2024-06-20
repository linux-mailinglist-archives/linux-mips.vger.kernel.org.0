Return-Path: <linux-mips+bounces-3780-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E204910D1C
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 476651F21678
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4491B29AC;
	Thu, 20 Jun 2024 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="MP49U8c+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zz4g3Eu3"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B3E174EC1;
	Thu, 20 Jun 2024 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718901162; cv=none; b=i5eFAJKPay3tP12ZWl1zdWSvA6gU00Px3jqS/HAZdPZblTTIqjwSzQCV8dvAXi4Ei3OIbL1bnl5W7gs4ekCpGYg8WldDxeDNYaUyylrEextyNKgNK//q3hbjN5ve5dvYf/ezAsgcFRBrVb5GabqqQrSejqeKADklBmoqtsapWSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718901162; c=relaxed/simple;
	bh=Odbk+EWM54S/MJAlmXIgT9f/AlcQ+5s/yWxbT/rznTI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=V32msydq6r6fQmtLCPQ9HIdMGEo1ngYGOAWbCwPiXsRCycJSCP/OAfGYXIiXJfz4Rx/emzh4nfQkmyrDw3Zsz4RqVlDlwssFsoq7ndzadjYQamldlNr21Iang21qboTVZsYtaK1XRvr655/i4/D3EFITqi9xvWk3989WFSh7qTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=MP49U8c+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zz4g3Eu3; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id 93E321C0012F;
	Thu, 20 Jun 2024 12:32:39 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 20 Jun 2024 12:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718901159;
	 x=1718987559; bh=Odbk+EWM54S/MJAlmXIgT9f/AlcQ+5s/yWxbT/rznTI=; b=
	MP49U8c+KCpHeGMcKVE+acKq6tPkjMkNvBNQUG+9kIPz77N9LYWM2QsS0y1HlnQk
	3jbENB3hAc4jbySC6mL/sfJxg3gj0RcOGBbjkX5+h/WITe5hlSojqsqOtrSktZo7
	shqJYvSzUeeTsFoxAvsFPAzl53t+OAksdUVjpG3vIeIqqpKmwNCZXXa8c9M8SY0E
	8k+Cpm447pEQJIdyKilPptUiJ/5vW0CRbqvrq8ENyW0LALbakFu/awZUo1++JOqf
	Z6QeO9R8jwThPIz7ztxs5XiuxgRp5jXICwf8v627Pa/UK7e24vEukIKmxOvuCQ2u
	oAh76/jb8YQ5wnzdRCcs8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718901159; x=
	1718987559; bh=Odbk+EWM54S/MJAlmXIgT9f/AlcQ+5s/yWxbT/rznTI=; b=Z
	z4g3Eu3xwya8GXGMqnYOzuKTJfB/ylUYgSr5Pnv+GWa4899Trx4V8CkPTRGcM8Vz
	DkWRwWAGXRKBSG8WtKDYTSbzrZ4HrGa+c0cuOkZDFDRH7INv8uExwRQXPDYjyB21
	rE03eKVFNyWQulj6aq1ELpAKxm5ubAJnrs8evsrOsV0Pujw0kFr2UjFp+DSFx9lH
	0TG0Oz2RSRgqkisvs5D5rlEfgbcq6ErbBQGIjccdhQgW0wsSZb2qwP56zbEf6ndj
	m2SpBJ3B3oTLRvGuQoF02KpmSZM+h9SJonbeEyV8X6D5FJPOCyeJ/oDCM3uyhzqv
	NzivlYavSLjokdymoBzfA==
X-ME-Sender: <xms:pll0ZljqtYFd19cOttadDOaalvYq5ijyWi_0ws8Sy2YH1eNk-xAxDw>
    <xme:pll0ZqDzFUy9DVcV6_k_K0y4bu4KL9PDWDwpHX5IL0xF5dAepxhhtGLJGnd4oUpJM
    ZlvlsGdAJtJjZVa7ss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:pll0ZlHTGm15d0kiSDJA6gJnfI3FtVaNANqRHnN4m2YpMuOpCYitXw>
    <xmx:pll0ZqQr1t-vxJpUkP7s8_9zr4wsarz_YXQfqOTu7wB0g0ld0Ttcig>
    <xmx:pll0Ziyx2WgH1B_Jrpqk67Ka4wiIXsbMZ-42vcZ_hesjTZj7dr2law>
    <xmx:pll0Zg6UVDe8bmvCeLfUATevopyvNFPmnjYSyC-b9WRa2Yc1kUB_5Q>
    <xmx:p1l0Zmd9HeXlDI8A-fMuXFAyMDB5OP7D-9tlOxkHirlkV97fZgcRJ3qD>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AA55A36A0075; Thu, 20 Jun 2024 12:32:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <2ab8b329-268f-4f18-b0ee-17fdee1b329d@app.fastmail.com>
In-Reply-To: <45d66377-20d8-4b16-9b5c-490d9afc41ed@kernel.org>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
 <20240618-boston-syscon-v3-7-c47c06647a26@flygoat.com>
 <6d3fbd07-72a0-43fd-a1e5-c39e3a833bc1@kernel.org>
 <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>
 <808f27bf-9dc7-407a-86ff-0a8fae79531c@kernel.org>
 <be608e3e-2ecd-4d7d-bf45-99c553e72c08@app.fastmail.com>
 <45d66377-20d8-4b16-9b5c-490d9afc41ed@kernel.org>
Date: Thu, 20 Jun 2024 17:32:19 +0100
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



=E5=9C=A82024=E5=B9=B46=E6=9C=8820=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=885:16=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
[...]
>> syscon-reboot is certainly using parent node to provide I/O address,
>> even regmap property is deprecated. Without "simple-mfd", reboot node
>> won't be populated at all.
>
> That's why I asked you to populate children.

Do you mean I should write a driver for this?
This is a little bit overkilling, I'd rather fix the clock driver.

Thanks
>
> Best regards,
> Krzysztof

--=20
- Jiaxun

