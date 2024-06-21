Return-Path: <linux-mips+bounces-3842-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C9C912AA4
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 17:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 031FE283A6B
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 15:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6D715EFAB;
	Fri, 21 Jun 2024 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="EDHzFVnb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y/wetpbH"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD6823D0;
	Fri, 21 Jun 2024 15:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718985136; cv=none; b=sRvgpVeYB9ksPupJlY97Q6jqwrzKXMzuB5qld2CheGWJxMP8oCRZmvpTOIcnkzsD130Fy1xtB94lwlJhO75aoaDUEei3fLl6vYzAhBhcln69VrnFo3WdLXKVDIhtIItQfOJPrd85XbXK6C9gIDVbB9ZDa+MIBHEa0EjfZK/t1DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718985136; c=relaxed/simple;
	bh=okNWiYN3jSllF7aHvqx8wll68vaA9f02SH5rITMSg9M=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tYxVFkWG8WAoKa3gKM4mZ+I7ZusM6IkmweLxnlN2nGpfgTIaPpVEOxk5PtiHlDvju93RRT3CquFFAh/m8U6rIYABeJcESb4uQbdvf3HmmXXZeEVFsgaERiMjaqk0MRo2ujXxca8k7pNGrIqnY+oXV7LG7tXMwZWHyfjUnBVJD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=EDHzFVnb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y/wetpbH; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 01E521380099;
	Fri, 21 Jun 2024 11:52:14 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Fri, 21 Jun 2024 11:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718985133;
	 x=1719071533; bh=tEs/YOs3Cin6gK0AVTgZ7Beywij4477QZ3N259TzrVk=; b=
	EDHzFVnbTWo9CJ9z/+Lrm+nKov+alSuDNSLI0EPUXP9mQG/4boCpKJaM78U92mDA
	JWd3saJw31hd/Ub+adR9O+8j9SufxAtOtJxvSy3dNQHRfH0MPpKOUpeY7hjBHJWE
	pa8lo91bTyE43Y0JpjQIW7kIt6QrVFvyZOTW8YWPisvjKva54BOh2OVgsTC0Da/e
	WP6QQtLvvxoD0QT+sJsYK7JCrD7FqdFAblJPZiub+/E7lVNuSjvDeCevES0FEIyx
	FS0VqgKbOjUxAnHo00YssSyAM09As04VT+XX511GzXGim814nM7+jnjW+2DVf1qy
	oF6JIa/eoKZVECNGemXZ8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718985133; x=
	1719071533; bh=tEs/YOs3Cin6gK0AVTgZ7Beywij4477QZ3N259TzrVk=; b=Y
	/wetpbHtFaiPRKucVMd61+OS606HECO5Bk78U5lc78DfS6ud8WeoyuN0tWKjb8Pv
	mBszz30e21ML4muyaZTO0KnKseugxYibygoFfPlaZDROE/rLGM5jDRUFNTM36+sB
	q7srgB8u2UYjiWrPXNIhyyxKUL+6hiGp9COyaoitVKVCSYfvwJN04Fa3riTAZ0dR
	sdYMu3tcg0t7FJOeKuMJKU7pPqOq5gP3WwuM14U3ETCP8h4HTlQbO0V1L83U44+V
	TIVIFfPvbUjEFTSyQeE1aWSGu0pL7Y0KoV/5CGuYIAhNIcBzBh/0NYDDRe/k8Kwy
	xwi6WAjSXWUwZ6L6/vLnw==
X-ME-Sender: <xms:raF1Zn2TThGtlOwWW6Ld6ZTfyCGaHFpB6YrihemH_X_HO9QQUxxPdA>
    <xme:raF1ZmE2KZyobt74-pNjUrQ6qyDclcVPJUlyJQnp9o53a1YT4kwbRyNtWXgAOLCWb
    oZwpuaBXvgwC0jLEXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:raF1Zn6lM7t3eTht1EgKBHXBKMF8ODY9nvYtsgGb0MQjH7obiiWUhA>
    <xmx:raF1Zs0WuDQnMfUfkxDgJUzfG21BjxuOutpwB9TNuYdm9J7uUzrLAw>
    <xmx:raF1ZqGnHd7OkQYjiCfwhp-Kvll1f-jZUBt6tdm-LEdYB0zFgAv_ig>
    <xmx:raF1Zt-hjd5qx97N-rh3AaL41vP-_ymsut8Pwuuft5ocSVOyOJiHwg>
    <xmx:raF1ZtCE5CQYUZVPNu8D0XEC9u0F4NVyflr8BzaYZ_7rOCLI6ykaTODr>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9A90836A0075; Fri, 21 Jun 2024 11:52:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <856ff7b0-774d-4120-8bd8-01270f5c14b4@app.fastmail.com>
In-Reply-To: <808f27bf-9dc7-407a-86ff-0a8fae79531c@kernel.org>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
 <20240618-boston-syscon-v3-7-c47c06647a26@flygoat.com>
 <6d3fbd07-72a0-43fd-a1e5-c39e3a833bc1@kernel.org>
 <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>
 <808f27bf-9dc7-407a-86ff-0a8fae79531c@kernel.org>
Date: Fri, 21 Jun 2024 16:51:55 +0100
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
[...]
>>=20
>> Hi Krzysztof,
>>=20
>> I believe U-Boot's implementation is correct. As per simple-mfd bindi=
ng:
>>=20
>> ```
>> simple-mfd" - this signifies that the operating system should
>>   consider all subnodes of the MFD device as separate devices akin to=
 how
>>   "simple-bus" indicates when to see subnodes as children for a simple
>>   memory-mapped bus.
>> ```
>>=20
>> This reads to me as "if you want sub nodes to be populated as devices
>> you need this."
>>=20
>> In our case there are "clock" and "reset" node sub nodes which should=
 be
>> probed as regular device, so it's true for us.
>
> No, you already got comment from Rob.
>
> Your children depend on parent to provide IO address, so this is not
> simple-mfd. Rule for simple-mfd is that children do not rely on parent
> at all.
>
Hi Krzysztof,

Sorry but can I ask for clarification on "depend on parent to provide IO
address", do you mind explaining it a little bit? Does it mean children
should get regmap node from a phandle property, not the parent node? Or =
there
should be a reg property for child node to tell register offset etc?

There are way too much usage that children "depends" on parents somehow
in tree, so I want to confirm my understanding.

For boston-platform-regs there are some other PHYs that I may add drivers
for them in future, so I certainly want "simple-mfd" to be here=20


--=20
- Jiaxun

