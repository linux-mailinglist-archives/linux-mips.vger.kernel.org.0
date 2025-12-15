Return-Path: <linux-mips+bounces-12475-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AE7CBEE82
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 17:30:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E41AB3001BFC
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 16:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1877F32827F;
	Mon, 15 Dec 2025 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="b/2TsJQC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697EF31AF10;
	Mon, 15 Dec 2025 16:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816249; cv=none; b=FhovpihTwS1nkqP4XorozD8lghogLcWPLdCPFCw/1wVur9TNeNoXioVBhPQr2j7sCtWbtVNRDCZtoKjA4t0Kee3bIPmBtLVliB+jYpYc4oYJ3vkbsQIBivuLs5iUC6FqMREVzW8FMgfDU/jyKwIK7AfCWmT6EbIh5UQfwkKJ7uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816249; c=relaxed/simple;
	bh=7VUjNg7fMgXMDTFrTqFIf9IV02ig+00RrRe5m1yyOlY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=YG3b8vEckO9GoB8tnOinue3WrGmduCTSvk4zVVCn6EZgMrZ9+gNAr0JbZ+qPAMtUOH6qXUoAjNgkT10LBU1oUDejZ4OvXgWaWsoNM+ZJ2ZAYLAdpHs0MuBcomhAf8K1NbRVelXrK5XsU0srvz9M7+3mmEwsw3IO1qtDtJNIYj/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=b/2TsJQC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 785E5C19D1E;
	Mon, 15 Dec 2025 16:30:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE22D60664;
	Mon, 15 Dec 2025 16:30:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64EAD119426BE;
	Mon, 15 Dec 2025 17:30:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765816244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QF0a2d33ceWGEkE+JlJ9v7Vx9rNUh7hXKpLn5YyCvvc=;
	b=b/2TsJQCxsrDCyqAit+mCBvkpYAvhFDHIWx/MS8yXW6MI6gytG1BbV0q2aipA/pULv8mq8
	yXqpyd5/KmToROssOh1ypUWoVWuMVs/NhwnEbUcEvrVngLLjFZkEv6h3xqMUTHw8TEGKN5
	MlyLBQdacKRzQkpshouWWv5WBTvTp90YJHQkfpbNjxpn+GIWTyUrAKKM0sHbSpkuE8dt6l
	M6h2WhI901vGItG3UiwTTjOOuM6MhmwzuIw3Zg+tvlQ6ytiAcesHHeqQlU3CTrE5tp5bpQ
	s6OAIunOjGUaNZukMcJVuEjlRPTS9eNDrAZiYe5MsLTQdkoFfYHcCAXUDIsyaw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 17:30:41 +0100
Message-Id: <DEYXM6CGJULV.1KKA37ZLEIW1K@bootlin.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v4 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-2-955c625a81a7@bootlin.com>
 <DEUNYYW0Y23E.2SA0SOCS99NA0@bootlin.com>
 <DEYVVCWBOZSH.2ZY41YCHLS8FU@bootlin.com>
 <DEYVXJI90AA7.KPDEQCNZOOXI@bootlin.com>
In-Reply-To: <DEYVXJI90AA7.KPDEQCNZOOXI@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Dec 15, 2025 at 4:11 PM CET, Luca Ceresoli wrote:
> On Mon Dec 15, 2025 at 4:08 PM CET, Th=C3=A9o Lebrun wrote:
>> On Wed Dec 10, 2025 at 5:06 PM CET, Luca Ceresoli wrote:
>>> On Mon Nov 24, 2025 at 3:41 PM CET, Th=C3=A9o Lebrun wrote:
>>>> +	provider =3D devm_of_phy_provider_register(dev, eq5_phy_xlate);
>>>> +	if (IS_ERR(provider)) {
>>>> +		dev_err(dev, "registering provider failed\n");
>>>> +		return PTR_ERR(provider);
>>>> +	}
>>>
>>> As above, why not dev_err_probe()?
>>
>> Good idea once again.
>>
>>> Other than the above minor issues, LGTM. This driver looks cleanly
>>> implemented.
>>
>> Thanks for the review. Does that imply I can append your Rb trailer?
>
> If you apply all the changes I have mention, yes, but in doubt you can
> avoid it and I'll review your next version. Re-reviewing is much faster
> than reviewing the first time (last famous words).

I've taken the Rb trailer, hoping everything is to your taste.

https://lore.kernel.org/lkml/20251215-macb-phy-v5-0-a9dfea39da34@bootlin.co=
m/

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


