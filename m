Return-Path: <linux-mips+bounces-8048-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A121A49FFB
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 18:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46496164B72
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 17:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA1B1F4C91;
	Fri, 28 Feb 2025 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ZAXCHRej";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SV9az/qj"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED211F4C85;
	Fri, 28 Feb 2025 17:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762676; cv=none; b=SqR+Wk5yy61J91IUib+nTzf2+k9BNi2DfCzAqgrEDT7tnHjIyNY4UEFnJfDQJ+5hgEzrPwsvhjkQZvrW7be7XeTQofcUwSSlyY88/9PhIQquQ45NlfaRwrYP4B3v3J6aQSXQCqALaKvPKqjC8ntqmMPjg7+7CkveSojnDFKyowk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762676; c=relaxed/simple;
	bh=v1Gwi/zAWJOpNmoU0mmRZPQIhqYYHMwck00Fmbp1OnA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qQgB+GbyQHZvgdxyvLaVR7+tbRhdAZ2L2yLBx34GTBpbaR6Eh57RaeCWiDFOBA/MjGqCII31qvP9Ai2gjspoiZtCEmDa82FPtgfBCsANMFAVuLel2uwCLSyMM7gRek3ns1l5Igdei+l+qqX+9kw6h9HY8e8BFVccW7Cb4aq9+1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ZAXCHRej; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SV9az/qj; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9E9642540091;
	Fri, 28 Feb 2025 12:11:11 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-09.internal (MEProxy); Fri, 28 Feb 2025 12:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740762671;
	 x=1740849071; bh=61Rx9CL0OD2pQ9K4Ts1FzxegK9q7CFb+1upk8bVP+Iw=; b=
	ZAXCHRejxrzYgdqF4SBEzo5SY0y21xg4k3NrNQ14GmRT2c4yGeB45pCKDyn23Hiy
	oOM6/ujv3ZfqEwioE8pYupjsnSbufsHl0QygWGvt3wmMszhlS2UZig9Gk3IsTKlS
	9qeobMqix4LsyfWuKSn/SmR1HbOmUYYoUapCao4IM/IeR6Xs1vvBFrynPb3ADs2o
	4KqyIZEXRDERNLaoRRs0dRcrQPcQrjLFlcMYXRDJKtcRh/ap70SnAJRK1zdO2Cg3
	TW2SZwJZo/P3s0Par5rGFtpaNhIirb2m1/PG5p2Rp0voeD6ywFLh7MdFzG0qJ2Qg
	EtP64L/B0Amp0attZhXD4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740762671; x=
	1740849071; bh=61Rx9CL0OD2pQ9K4Ts1FzxegK9q7CFb+1upk8bVP+Iw=; b=S
	V9az/qjjGnvY/feORP2YCuS5xIiDzzkCD1gnjgs/sC/dGvPslozMBztwy0i1mi7e
	iPEPnnHlZqOM62Fqy7ebUMn8VAMkYRK1ExIoJU9F9toHHNfH1JxVYPDu85tlNcP9
	VBCO2Ww/DmHo/RUVuvy+auqPzWBj0UtMX0bTBOqOUumCwgUOsg0LUfMQbDXpGr5C
	67YBJcXQHzbnWIr8dCTaPwe4Dk5vktdhYp9v1SrckibaRA0etECtILFFHl8SHDZ1
	15HiviNDORHvcZlOfhK2ztpvqlIxYLoQDBctpjgP5C4tNOPGyw7uApfu//ui6k/B
	Zg+9vhJoh3l9NpRmT1+Ew==
X-ME-Sender: <xms:Le7BZ0BJS1Tjuf2mrOgaDXNRlJeUk3kAyb_ATjNDQucVCRITaMubpQ>
    <xme:Le7BZ2jM09Y0hcMPCJZwFInpYh9novqWvrrt_WbnqBb5p2LTb2CaNdFqVEPD6BxIo
    8u_edQBWtyKQnZLJR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdeliecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedv
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphh
    grrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghs
    segrrhhmrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvth
    dprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghu
    pdhrtghpthhtohepvggsihhgghgvrhhssehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hjrghmvghsrdgsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhhihhprdgt
    ohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrh
    hnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrrhhkkhhosehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:Le7BZ3nQE1lamEsTpOc4ff5p8D0g7eglG5izUguNOoCDqYQJzAqTfg>
    <xmx:Le7BZ6zlKx3LFJuc3lhZClrlNgu4TNQnMTyK2dhXiAm9gFDv3zDUrQ>
    <xmx:Le7BZ5QW3fpOPIV19VXGZ04N6c_2LDnsXDCF3wcxj-awMGfZAb6riQ>
    <xmx:Le7BZ1YxwhtZAgr6yGSEh2vYi4Ji9rcfNyVdJhBgIBQIe-QkT761jQ>
    <xmx:L-7BZ4AD3je2OoM_KYZLMNFNu0P2c7iS2UdsSatOTbrHixZcjgtd6MIT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EF8AD2220072; Fri, 28 Feb 2025 12:11:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 18:10:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Herbert Xu" <herbert@gondor.apana.org.au>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Will Deacon" <will@kernel.org>,
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
Message-Id: <ca6ebfce-1969-4e13-94de-96702540a967@app.fastmail.com>
In-Reply-To: <Z8E3gjfvG3eFoLxR@gondor.apana.org.au>
References: <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au> <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <Z77aFJCVuXeDXRrs@gondor.apana.org.au> <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
 <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com>
 <Z8All3G80gGXzfaU@gondor.apana.org.au>
 <9f4e5f41-e553-4f2a-88fe-478f074b62cb@app.fastmail.com>
 <Z8E3gjfvG3eFoLxR@gondor.apana.org.au>
Subject: Re: [v3 PATCH] crypto: lib/Kconfig - Hide arch options from user
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Feb 28, 2025, at 05:11, Herbert Xu wrote:
> On Thu, Feb 27, 2025 at 12:56:30PM +0100, Arnd Bergmann wrote:
>>
>> I've tried to undo that portion here and don't run into a
>> dependency loop so far with the patch below on top of yours
>> (around 100 randconfigs in). I'll keep testing and will let
>> you know when something goes wrong.
>
> That's because you removed 'select CRYPTO', which can cause the
> arch code to silently disappear just like my original patch.
>
> It's pretty much difficult to disable CRYPTO because so many
> random things select it.  But I managed to turn CRYPTO off with
> some effort and indeed with your patch the arch code disappears.
>
> In the following config file, CONFIG_CRYPTO_LIB_CHACHA is modular but
> the X86 option for it is not selected, because CRYPTO itself is off.

I see. So the case of building lib/crypto code but not CONFIG_CRYPTO
is something I would normally expect to work, including the
architecture specific optimizations, and it's probably not
too hard to get there, but it's also unclear if there is really a
point in doing that.

For design purity, I think we would need to split the architecture
specific code the same way as the generic ones: library functions
that always get selected by their users to export functions and
the front-ends that are user-selectable and register the algorithm
with the crypto API.

Keeping the 'select CRYPTO' is clearly less effor if you prefer
that.

      Arnd

