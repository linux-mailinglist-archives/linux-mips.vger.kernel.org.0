Return-Path: <linux-mips+bounces-7323-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FA7A07E16
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 17:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F1D4188C645
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 16:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0F317C230;
	Thu,  9 Jan 2025 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gOTKsWAv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DLvVmNVm"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8861139D19;
	Thu,  9 Jan 2025 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441564; cv=none; b=J+ECB8EqlWmYdKGQM7NS8FT5fX+9BYR6UTXJZtG7qsagCA3NvIpLIgtf0DwzhaGLqnZK7V/vdGGXFe/GEuvLfP+Amlwul7nfYxp31hlYflxfLodYZHljr6zCpQeeJlfSw9iiF+GIRGFdQckPXxuiIu5O0o4ZiEsTof5PtK0klao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441564; c=relaxed/simple;
	bh=luB/Q7Pr54h8XDanrm9In8nLROzm5SSp1mJmyiSn6SI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nAqK2WFUCs+m2qy4SiOgDc557xSdL1+uwf4jv1DD3jEKCXFEWV9cM4rk5VySIucO97yWqIEvqf5RGdsKWPavYvN/Jdnwh2grmTUvoYyWs0q2xGpWA2gEZnzbHZwrq1oH7Cc6WG1L22A1YEYYEY/14oMkWmWEJOOfvC4rDpeyV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gOTKsWAv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DLvVmNVm; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 72DED1140137;
	Thu,  9 Jan 2025 11:52:41 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 09 Jan 2025 11:52:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736441561;
	 x=1736527961; bh=/rcKcUgOCZt40Un+pkihZ5X0Uu+7S4RKKMTZS1cf54U=; b=
	gOTKsWAvZ1JEALHrwD/oajJGGxAcx2U/RSOyBlM8m+cHfL5IEyEqXSDdRHm10huj
	vqyfZHkgoOpSMt1LVLFKEG3O/l+wzre9xJxQSRFff6cD2QdmCcWoBCkmmIVzlZV7
	9JMH37sR7cFSdrcczqkiSA+/eZHkbt1dDLsBGimqn/NkbNjGbjUNkmOUSgYg7O1c
	BmzcI/5NSzuCAwmDA8x46RXBKrwSGFxsFcoQ1gvw5RmLvz39Ws5TqLmZHAfBH1df
	kXs1058mtncX1v8ksZ//WTMeAvXmc+KU3nWFBsjBOyjpZsq6sI6T+u+GgGaYMwPc
	Li8OlGseAVR0KZK6hn9fdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736441561; x=
	1736527961; bh=/rcKcUgOCZt40Un+pkihZ5X0Uu+7S4RKKMTZS1cf54U=; b=D
	LvVmNVmSLnLjGstioKiE6GNIH7n48D8d7QeqviiRaTqI8dmZKwHpm84ExKPwnZ+q
	7JZl5d5RC4nvK+jEwPD0cafJcqisdN/aD+fXkbXHddkvpIGW56Crc9RfV3RPB4Kr
	hZ7KR8q7Nuo51zN/tft2F39Lzu6LesJ+fHSR4VvUGvH4Gs90I/hN5HD7g25VjHVc
	KhaaJRC4uhSNzBoZuNHuUwEPTauRJj2YwvynYhJGCl3oExZq8VU5faLFfrjajKWN
	s/Xe/9AuqSbQcTqLKimhnkv1pLP3btobq0mCbWBDJeooN06/aC7Ep41Bv3Wchncp
	d3CWy9RwO/ytOXmrSP26A==
X-ME-Sender: <xms:1_5_Z6YmniTm5qBTb57UMp88kRBJ6-R6sh054AcN7yR6tCwzgZ-PiA>
    <xme:1_5_Z9a0DYvnw7UbAdf1aMjj21RjnmHyuxzzWx3-xoVNBOYNgfUpGU9VESbhrWIw4
    TQPfr4iRQPBJXnrmUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeiivghhrgesuggvsghirghnrdhorh
    hgpdhrtghpthhtohepshgrmhesghgvnhhtohhordhorhhgpdhrtghpthhtohepmhgrthht
    shhtkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhgvvghssehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopehrihgthhgrrhgurd
    hhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdprhgtphhtthhopehgvggvrhhtsehl
    ihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlohhonhhgrghrtghhsehlihhsth
    hsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:1_5_Z0-b9sXywAWK6nVe4mNlyXUIR65b62h0JtSprMMaWhSeqmnrBg>
    <xmx:1_5_Z8qGQM3FHB4zqKGinuIPOTEks_QFKJBr6t_RY3FPoOcZ3swRpA>
    <xmx:1_5_Z1qkDgjnyFfScoIhoayyrreVnDCRVePDSzeiCGIrtYQheeCuGw>
    <xmx:1_5_Z6Ryw6X7xWMAOnC7qSRcQkY5xdtH9n2QzGU2u_tPqQ4xly14UQ>
    <xmx:2f5_Z08eeA-zBPAw9NGwkPs0AKkpYY4i2SVGT55o8VtwTdxLoccgkpnY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 33BF12220072; Thu,  9 Jan 2025 11:52:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 17:52:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Cc: "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-alpha@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Michael Cree" <mcree@orcon.net.nz>, "Sam James" <sam@gentoo.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michael Karcher" <kernel@mkarcher.dialup.fu-berlin.de>,
 "Chris Hofstaedtler" <zeha@debian.org>, util-linux@vger.kernel.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Message-Id: <9b1749f0-e936-4bf5-90d6-8cf15e4f0ed9@app.fastmail.com>
In-Reply-To: <87ed1cufj1.fsf@email.froward.int.ebiederm.org>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
 <87ed1cufj1.fsf@email.froward.int.ebiederm.org>
Subject: Re: [PATCH] alpha: Fix personality flag propagation across an exec
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025, at 17:18, Eric W. Biederman wrote:
> John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
>> On Thu, 2025-01-09 at 09:56 +0100, Arnd Bergmann wrote:
>>> On Thu, Jan 9, 2025, at 09:46, John Paul Adrian Glaubitz wrote:
>>> > On Thu, 2025-01-09 at 09:43 +0100, Arnd Bergmann wrote:
>>> > > On Thu, Jan 9, 2025, at 09:01, Arnd Bergmann wrote:
>>> > > > This looks wrong to me: since ADDR_LIMIT_32BIT is not part of
>>> > > > PER_MASK, executing a regular binary from a taso binary no longer
>>> > > > reverts back to the entire 64-bit address space.
>>> > > > 
>>> > > > It seems that the behavior on most other architectures changed in 2012
>>> > > > commit 16f3e95b3209 ("cross-arch: don't corrupt personality flags upon
>>> > > > exec()").
>>> > > > 
>>> > 
>>> > So, if I understand this correctly, we should just use PER_MASK on alpha
>>> > for 64-bit executables and allow the bits to be cleared for 32-bit binaries?
>>> 
>>> I think ideally the EF_ALPHA_32BIT handling should use TIF_32BIT
>>> as we do on other architectures, at that point the custom SET_PERSONALITY()
>>> can be removed in favor of the asm-generic version.
>>
>> I have thought about that as well but I wasn't sure whether the extra
>> mangling on alpha was necessary.
>>
>>> Alternatively this could do something like the arm32 version (note
>>> that on arm, PER_LINUX_32BIT/ADDR_LIMIT_32BIT means "allow using
>>> the entire 32-bit address space rather than limiting to 26 bits for
>>> compatibility", while on alpha it means "use only 31 instead of
>>> 42 bits for addressing", but the logic can be the same):
>>> 
>>>         unsigned int personality = current->personality & ~PER_MASK;
>>>         /*
>>>          * APCS-26 is only valid for OABI executables
>>>          */
>>>         if ((eflags & EF_ARM_EABI_MASK) == EF_ARM_EABI_UNKNOWN &&
>>>             (eflags & EF_ARM_APCS_26))
>>>                 personality &= ~ADDR_LIMIT_32BIT;
>>>         else
>>>                 personality |= ADDR_LIMIT_32BIT;
>>>         set_personality(personality);
>>
>> So, this would be the 100% correct for alpha then which would not loose
>> any functionality even for 32-bit binaries?
>
> I don't think it is correct to think about 32-bit binaries on alpha.
>
> Alpha never had a 32bit instruction set.  But at some point it looks
> like binaries that could not handle more than 31 bits of address
> space got ported and someone implemented a work-around.  I guess this
> is the --taso option that Arnd mentioned.

There was a well-documented use case for taso with emulation for
OSF/1 a.out binaries, in particular Netscape used 32-bit pointers.
However, the a.out support got removed a while back, and I have
not figured out why it was ever added for ELF. Maybe it was just
easy to duplicate this from the a.out loader?

Obviously some 30 years ago it was common that software was
broken on 64-bit because of invalid integer-pointer casting,
but these days, it's much more common to be broken on 32-bit
instead.

> I think the alpha version would look like:
>
> #define SET_PERSONALITY(ex) 							\
> 	do {									\
> 		unsigned long personality = current->personality & ~PER_MASK;	\
>                 if ((EX).e_flags & EF_ALPHA_32BIT)				\
>                 	personality |= ADDR_LIMIT_32BIT;			\
> 		else								\
>                 	personality &= ~ADDR_LIMIT_32BIT			\
> 		set_personality(personality);					\
> 	while (0)

Yes, that was what I was suggesting.

> I do see code under arch/alpha/ testing ADDR_LIMIT_32BIT when
> setting STACK_TOP, TASK_UNMAPPED_BASE, and arch_get_unmapped_area.
> So I think the code still works.

MIPS introduced the SET_PERSONALITY2() macro specifically to
allow the TIF flags to be set early enough to apply to the
stack allocation, so I suspect it only works partially.

         Arnd

