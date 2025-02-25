Return-Path: <linux-mips+bounces-7963-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAF9A44F2C
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 22:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0710B3B0FDC
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 21:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6EC21A0BCD;
	Tue, 25 Feb 2025 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoW+jbtL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D213209;
	Tue, 25 Feb 2025 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740520234; cv=none; b=uH7Tw2uU5nxAO+yXYOt/YI/U1v0cT90EM9iGoisc7WIlAGxd55jnUowkZQnIqesDceBLnMVq53i+Zd0rUAz6KC1MV06yBnf5fBxnuGHxV2gSiC7i61NSXvKmFsB0VYEc6DMNjIYI99IL3mnXekqPfxMa0RbZ5LkHKM7xAqylmCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740520234; c=relaxed/simple;
	bh=W3VJeywcIcmgWE/Z+lGSHmVDoqC/JUGqpygA5wDbuHY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ulZs8zVhyE74PJVGWVkwbOEY4qszMKb0i8VQGtUxOiq+7kKksUld//onHtwKwSy4f6AvfC7e2UhJBZ4y8YPdZwmFdZ0QPbt6lUDROd9NLVF4S2ftMPl3J77oqQYv2yh5STTQycoXoMAwB7GPga5X6oNFDCU4AmejBJFjw5WB2zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoW+jbtL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E13C4CEDD;
	Tue, 25 Feb 2025 21:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740520234;
	bh=W3VJeywcIcmgWE/Z+lGSHmVDoqC/JUGqpygA5wDbuHY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=LoW+jbtLwRVL2Q1P7+fVLmM6GdfFUBJVEUnkKehTmUt1z2XdcuaSTjYdREvLmvmUJ
	 iGWbC9wx6gWWV0lyeRKhtILw7Lgax0ZIAUH4ddpbAU+BFmall0PlvOpyQi8MKITYHg
	 zeDEiGQoWY5RCi4slKzARoNTBoZfj2+m4NsNHgkHHlri+0eWOJzTmVlrTxAlKHSLtc
	 w3+Dhq8zyPINn1YI81k6cMBD7bm2f1mm/EoboXtKe/QkscNMYopqHx7XQbYoF0lIRS
	 DTMvnqe4bZbuolX2aFsFJWhkD+4h2vCVM5xLij6aVB21s9ZnaG0z0KQKSjRgK2BFuC
	 PE5Kynk/LGZGQ==
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7D29E1200043;
	Tue, 25 Feb 2025 16:50:32 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 16:50:32 -0500
X-ME-Sender: <xms:KDu-Zw2G3qhsSWBSVJ78uRbJOe-oJ1nosBRGCHdS7K7B_20SnIrtxg>
    <xme:KDu-Z7HdIPVg9uSiZpxdxNBwjkjFBRF2EmkdadCHbkQlGLOTTG_FoVOSQpz4FfNqL
    VnOUQCYP4vJ3esXaF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdekvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvg
    hlrdhorhhgqeenucggtffrrghtthgvrhhnpeejteeguefhffevgfehueetudevieeuueff
    hedvvefhjedthfdutdethefgfeekleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgu
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvke
    ejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvgdpnhgs
    pghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsoh
    hgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhi
    nhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopegrrhhnugesrghrnhgusg
    druggvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphht
    thhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpth
    htohepvggsihhgghgvrhhssehgohhoghhlvgdrtghomhdprhgtphhtthhopehjrghmvghs
    rdgsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhhihhprdgtohhmpdhrtg
    hpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjrghrkhhkohes
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:KDu-Z47Ct7rvxX3LD-Mqpjs2oOQ8907yKjdXDV6Qjh2Vhydmn8IZLQ>
    <xmx:KDu-Z53W1Fw7f4_SgLpMtN621N_CzGDWXaLeowJEgQdY2qJ0qH1H1A>
    <xmx:KDu-ZzEzcPpKuwaQeLZixRWN1Pxa-jCDJz7d1tIzq9Q5H6SQg9mUnw>
    <xmx:KDu-Zy9u1p8MRwMsve2eD3s7aflTOjL2zv4FHqGv9vHU-exNryzX2A>
    <xmx:KDu-Z4m1PH1G87viG8Cyxm0r3f4uzOAddD0rWjYxNxWaPDQKx65kLy9t>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4CAF32220072; Tue, 25 Feb 2025 16:50:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 22:50:10 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>, "Will Deacon" <will@kernel.org>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Harald Freudenberger" <freude@linux.ibm.com>,
 "Holger Dengler" <dengler@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Eric Biggers" <ebiggers@google.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Message-Id: <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
In-Reply-To: <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
Subject: Re: [PATCH] crypto: lib/Kconfig - fix chacha/poly1305 dependencies more more
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2025, at 22:40, Arnd Bergmann wrote:
> On Tue, Feb 25, 2025, at 22:33, Will Deacon wrote:
>> On Tue, Feb 25, 2025 at 05:42:07PM +0100, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>> 
>>> A recent change tries to fix Kconfig dependencies, but introduced
>>> two problems in the process:
>>> 
>>>  - only arm, powerpc and x86 are changed, while mips, arm64 and s390
>>>    are now broken
>>> 
>>>  - there are now configurations where the architecture enables its
>>>    own helper functions as loadable modules, but they remain silently
>>>    unused because CRYPTO_LIB_* falls back to the generic helpers
>>> 
>>> Address both by changing the logic again: the architecture functions
>>> select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA, which may be a loadable
>>> module or built-in, and this controls whether the library is
>>> also built-in.
>>> 
>>> Fixes: 04f9ccc955c7 ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")
>>
>> Which tree contains this change? I can't seem to resolve the SHA locally.
>
> Sorry, that must have been an older commit ID. Today's linux-next
> contains 56b8e4bb7622 ("crypto: lib/Kconfig - Fix lib built-in failure
> when arch is modular")
>
> which is in
> git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git

After looking at the original 0day report, I think the fix for
that problem would have been

--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -94,6 +94,7 @@ config WIREGUARD
        select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
        select CRYPTO_POLY1305_MIPS if MIPS
        select CRYPTO_CHACHA_S390 if S390
+       select CRYPTO_CURVE25519_PPC64 if PPC64 && CPU_LITTLE_ENDIAN
        help
          WireGuard is a secure, fast, and easy to use replacement for IPSec
          that uses modern cryptography and clever networking tricks. It's

which makes powerpc behave the same way as the other architectures.
Ideally wireguard should not need to know about every architecture
specific algorithm that it might use though, and that requires
a different method of enabling those.

     Arnd

