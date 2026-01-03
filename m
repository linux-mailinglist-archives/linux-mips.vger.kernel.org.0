Return-Path: <linux-mips+bounces-12738-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF46CF0705
	for <lists+linux-mips@lfdr.de>; Sun, 04 Jan 2026 00:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9527730047B0
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 23:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0208274B55;
	Sat,  3 Jan 2026 23:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9U15b9R"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9110C3C465;
	Sat,  3 Jan 2026 23:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767482981; cv=none; b=QQfNTGv5GGNkfQiTniGAHkBXUcohJmhKbiWPb320+htiA5h1mtPp8Ybys1fRojBYKTbkISiSrVNb5mgfzr49casxNOLYTdo1WVsj7OqkASXwRijU+iYVH91SnIqS0B37m2JDEWhgrlKgR0YATLe+ot+FAVKFw00krLS5z/wuTME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767482981; c=relaxed/simple;
	bh=yrlIZZmC5Lkf636QMdCK3gAWLqc/QTEizMpkoKTohjo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=I7g4XueHf0KX3nYzt73OBiFUr6/YGb/1ueRr7iENIsA1fHOoaRjJLE0Fm1aLAgHxQrb3xdHe4Cz3X7aydbm+eo823zzUNAIszIBSzRbLbL3FLji9/7D5l7z5FCwosqIp+YsEqMz1fE5HgtsWERJEPx7XqSHSx+M3Zx22qi03n0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9U15b9R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6E9C113D0;
	Sat,  3 Jan 2026 23:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767482981;
	bh=yrlIZZmC5Lkf636QMdCK3gAWLqc/QTEizMpkoKTohjo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=E9U15b9RxY6HTYs6wpRuWwsmCm4OU8ivllYcEyE2knOFNPiBusMUjUKDpZz6g2cs2
	 60/u4xJvoMD9fO1XPikWOC6Td8bT8qpS0ZnDjvM9XoFfnIWQu3aPZNLVfZCv3JSu7v
	 vNmBkg55lYvymbtUXxIg0vVaKerIC5AMKQ8ZyjRNcVYtGot3A72L1sMdczTc8gSrt7
	 5YNfVDOH6fQV3uiSZbN1lkLXo7u67gTGl4i8kF81pfNJnbk5EUc3CH+sFc1nrlq403
	 SwXAJdbQewUUPyaNeJIRp77912vc+uRumzuKe6nSZqGTgNUg+XBWVRtsEEyQa04zTj
	 xodVamwZZpnZw==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id B831BF40069;
	Sat,  3 Jan 2026 18:29:39 -0500 (EST)
Received: from phl-imap-09 ([10.202.2.99])
  by phl-compute-12.internal (MEProxy); Sat, 03 Jan 2026 18:29:39 -0500
X-ME-Sender: <xms:Y6ZZaeesRuDLLoCJ67QcNN-RasOsGOFeJ3Vhg79_u5ZPi7alvY7DWw>
    <xme:Y6ZZaTD88Y8d0pPH5o6dmhda915lkc3vzwY9TN8u_FPx3kHgpdw0x0u1lvM_PqwOV
    1KioqlqL2qgwL-M1VaT7eBaRzewVdr6DoQNNA-jCFUgE_VRkTrELzE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdekiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfrrhgrthih
    uhhshhcujggruggrvhdfuceophhrrghthihushhhsehkvghrnhgvlhdrohhrgheqnecugg
    ftrfgrthhtvghrnheptdelledvjedtieduhfdtveefueejhffgteelieefffelveettdeg
    veekhefhledunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepmhgvodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqddugeejfedujedt
    tdekqdeftddvleekfeeitddqphhrrghthihushhhpeepkhgvrhhnvghlrdhorhhgseihrg
    gurghvphhrrghthihushhhrdgtohhmpdhnsggprhgtphhtthhopedvvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtth
    hopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohep
    sggtmhdqkhgvrhhnvghlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtg
    homhdprhgtphhtthhopehkrghmrghlrdgurghsuhessghrohgruggtohhmrdgtohhmpdhr
    tghpthhtohepphgruhhlsegtrhgrphhouhhilhhlohhurdhnvghtpdhrtghpthhtoheptg
    homhhpuhhtvghrshhfohhrphgvrggtvgesghhmrghilhdrtghomhdprhgtphhtthhopehh
    rghrvhgvhihhuhhnthhnvgiguhhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitg
    hkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthho
    pehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:Y6ZZaQ7mQXPQkcM4NvdmDqFOL812AD7VtG0uOOwUNuaOKuldo7cKrA>
    <xmx:Y6ZZadcuuUbRXaECpqepJDIaKplrZbJZa4BxI7qZ0jPeNJOZS4zSTw>
    <xmx:Y6ZZafe3HOucT5EYIwZCRjzwdVLXkIFe_j6Eoe9LeTskBgOVbqUp6A>
    <xmx:Y6ZZaaExh7RtaodQZNUCVajs76K9DnvNnhTpsnGk-iPIQVV9lr1H6Q>
    <xmx:Y6ZZaWHYvgqSjc0X8gGrH6Fx_Kfz73xdC9aa3PF1PZU_GL1Y392Hn-Qm>
Feedback-ID: id4c94969:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8F3E63020061; Sat,  3 Jan 2026 18:29:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8SErWKoyjPZ
Date: Sun, 04 Jan 2026 00:28:48 +0100
From: "Pratyush Yadav" <pratyush@kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "Brian Norris" <computersforpeace@gmail.com>,
 "Kamal Dasu" <kamal.dasu@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Harvey Hunt" <harveyhuntnexus@gmail.com>,
 "Paul Cercueil" <paul@crapouillou.net>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Stefan Agner" <stefan@agner.ch>,
 "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Michael Walle" <mwalle@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <230bd4a1-7ccf-479e-acbb-8eb8440ec0e1@app.fastmail.com>
In-Reply-To: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
 <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child
 loop
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

(writing from my phone so please excuse the formatting)

On Sat, Jan 3, 2026, at 1:38 PM, Krzysztof Kozlowski wrote:
> On 02/01/2026 14:33, Pratyush Yadav wrote:
>> Hi Kyzystof,
>> 
>> Thanks for the cleanup.
>> 
>> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
>> 
>>> Use scoped for-each loop when iterating over device nodes to make code a
>>> bit simpler.
>> 
>> Nit: the commit message is a bit too dry. I had to go and look what the
>> difference between the two variants was. I could make an educated guess
>> by looking at the patch, but still.
>
> Really? That's old and widely used syntax, replaced so many times and
> sorry, but really obvious.
>
> We should not explain core kernel API in commit msgs, except maybe first
> months of usage.

Dunno. It's the first time I'm seeing these. So this was my first reaction. I think the patch would read nicer if you explain why the new variant is better even if it is widely used.

Anyway, I don't want to waste either of our energy arguing this, so if you don't want to add the one liner, that's fine by me too.

>> 
>> If you end up doing a v2, a one-liner explanation of the difference
>> between the two loop variants would be nice to have.

-- 
Regards,
Pratyush Yadav

