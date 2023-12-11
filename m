Return-Path: <linux-mips+bounces-645-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B613680C480
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 10:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E45041C209C9
	for <lists+linux-mips@lfdr.de>; Mon, 11 Dec 2023 09:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60FE2134D;
	Mon, 11 Dec 2023 09:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ltLkHTRQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="0vUG3E/x"
X-Original-To: linux-mips@vger.kernel.org
X-Greylist: delayed 474 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 11 Dec 2023 01:26:09 PST
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B025B4;
	Mon, 11 Dec 2023 01:26:09 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id BBC975803D6;
	Mon, 11 Dec 2023 04:18:14 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Mon, 11 Dec 2023 04:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1702286294; x=1702293494; bh=A/DCVjFaGMYmi2WhMoCUU3PEn5wAnq6lCN+
	5giiP81c=; b=ltLkHTRQRUic1cqalUyRviBoUOuRC7dMlreLaWd2b+OHp5grrqL
	tdrX7uKZtyx/zNvtC3pe1BYnPCelpW7nbHmAr4opAv/cGT/4x1OTvyfavnVi8YII
	aom74TCQ8edYvyhjw2n44nkh76QcVFIH2T7gNAlvTQOLfU6ZyS2oGh1Lcok/9g0w
	//fIaOaVMKw0RySJ3DVqlwDrh13uKGtKEj0nKb6ltTwUxjaUFuDqDV/vxpTYXdlS
	6ydx1cblz2LTb5ZoUeYJaSvu8A+xwUXePeaNLA6o+/Pc6vHRBacOog79TRMxvZ+y
	E7EZFTCDDcrCO6CYTLNwPZQqlG3fWaGYm1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1702286294; x=1702293494; bh=A/DCVjFaGMYmi2WhMoCUU3PEn5wAnq6lCN+
	5giiP81c=; b=0vUG3E/xGPNoBYuKcw5mRHhNDLdcw5oLYU6xSMWwnPaBWqkFgGm
	jt+Lh+L1+qHzc19RoFC1Rg6dBxX7h5HySyJJTkHJNFUnFs0LbSHR+8ufAxGMj+Kb
	cwrvZ3u5LCH3YF46k91xRr40wl7s6MeYcqglABZ/nY1q/poaBPx+8vE6qRv3gNIz
	EOeWDJ7ftDEk/MZy0iLTlxCQ+p5wfYgvIU5qXUCsKY2c/OTgnG76JEC7fmeGEYpv
	Xnoenh+BD/1Dr/VLaCCnViUD0Xw5VKDnllo/aX4wuDrRMwa2pynkp1c5uT8JwmK1
	2B//noszdkE4gon06cEIf9ylFLoEOhfOzUA==
X-ME-Sender: <xms:1tN2ZS65lef-ZNRjLMtSmX7o3vxqDAIVvYNZxchXLUQNjyP-5U5Pzw>
    <xme:1tN2Zb5IfQGktnmdWPvujOHjDTnL_UFhTZy7vgx23pn05Ax1F-C8_MenoD2ao0yk6
    _5dWxWK1cfs7hEIvbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelvddgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekleevffehtdeigfekfefhffdtudffvdeuvedtffet
    heeuiefhgfetleekleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:1tN2ZRcFO_wiTtf9wHjWypQBhdEolJ50womexLgkYMT62G6kstJBIw>
    <xmx:1tN2ZfJAy1O0xALLtSIvSXCM2GFvSO-KZC9P9AXg47YdI7bH7q_XNw>
    <xmx:1tN2ZWLXP0FdipNKYgpMLxIdEsonjAox48onlX9jCJeYG2rm-taKIQ>
    <xmx:1tN2Za-pKa0tIwg6EcJd263YbfhBNJQnQWEeX-btOduNBcYcpspDWw>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F34B736A0075; Mon, 11 Dec 2023 04:18:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <9bdcd491-5ee5-48b3-844c-d6c0092bfc73@app.fastmail.com>
In-Reply-To: <93b41b72-a6ac-4d7f-95f0-ba42399729fc@loongson.cn>
References: <20230616103127.285608-1-krzysztof.kozlowski@linaro.org>
 <20230616-activity-shed-be3c13e5ac71@spud>
 <93b41b72-a6ac-4d7f-95f0-ba42399729fc@loongson.cn>
Date: Mon, 11 Dec 2023 09:17:54 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Yanteng Si" <siyanteng@loongson.cn>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Andrew Lunn" <andrew@lunn.ch>, "Conor Dooley" <conor@kernel.org>
Cc: "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Giuseppe Cavallaro" <peppe.cavallaro@st.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Jose Abreu" <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFT PATCH 1/2] stmmac: dwmac-loongson: drop useless check for compatible
 fallback
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82023=E5=B9=B412=E6=9C=8810=E6=97=A5=E5=8D=81=E4=BA=8C=E6=9C=88 =
=E4=B8=8A=E5=8D=886:48=EF=BC=8CYanteng Si=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A8 2023/6/17 02:52, Conor Dooley =E5=86=99=E9=81=93:
>> On Fri, Jun 16, 2023 at 12:31:26PM +0200, Krzysztof Kozlowski wrote:
>>> Device binds to proper PCI ID (LOONGSON, 0x7a03), already listed in =
DTS,
>>> so checking for some other compatible does not make sense.  It canno=
t be
>>> bound to unsupported platform.
>>>
>>> Drop useless, incorrect (space in between) and undocumented compatib=
le.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Might be worth noting that dropping it is required to allow the
>> new loongarch dts stuff to be functional with a sane set of compatibl=
es.
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Thank you Krzysztof for your work. when I am
> adding more devices support to stmmac, I found that your
> two patches seemed to be forgotten.
> Thomas, Jiaxun. Can the two patches get an Acked-by?
> My stmmac patch thread:
> <https://lore.kernel.org/loongarch/cover.1699533745.git=20
> .siyanteng@loongson.cn/T/#md3108d29a5efe71b27f4c5ccf5d0217571bf6586>

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Better to resend without RFC :-)

Thanks

> Thanks,
> Yanteng
>
>>
>> Cheers,
>> Conor.

--=20
- Jiaxun

