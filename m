Return-Path: <linux-mips+bounces-558-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C6E8067CC
	for <lists+linux-mips@lfdr.de>; Wed,  6 Dec 2023 07:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D2EE1F214F1
	for <lists+linux-mips@lfdr.de>; Wed,  6 Dec 2023 06:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580E8125CF;
	Wed,  6 Dec 2023 06:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="QfPx6a9G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GH+CucaS"
X-Original-To: linux-mips@vger.kernel.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B632C135;
	Tue,  5 Dec 2023 22:53:34 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id DC3203200B13;
	Wed,  6 Dec 2023 01:53:30 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 06 Dec 2023 01:53:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1701845610; x=1701932010; bh=PW
	66L1dPgZW8LDxXB4sVa/5vk2EkvICnU+1XTg3NMCw=; b=QfPx6a9GTa1f8QF0e9
	lEuKcFsJPTVPzqFVzdlUGuPbTX1bXF+m0OSM+YNNfRN1dBbSz3fYmLlgBf+4qu50
	MSc3XV6QJBw/wNLDMYH0KHgRRX++edlijcqtOR4DqA4Ea4CgvszljPYzldmUD26q
	X3QGbL/vfndBP62fcpHygQeXYNT4laXNuAZ9+yI/mu2Zr1wAHJzcWNi/vCh6laQS
	zIadvRovi+y6hW9eDsJ4ps08lv51m+a/UswS+91VJGQW3/7P5fGNEGyNm7mmao6Y
	VYt6MlBaRPA0p7V67U8kA+AsECGyy9Vy4akvg0ruNp+JfnaQjW1PN3/7Fop5WikR
	fb/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701845610; x=1701932010; bh=PW66L1dPgZW8L
	DxXB4sVa/5vk2EkvICnU+1XTg3NMCw=; b=GH+CucaS/2CicMAeMT4S2qz+0QUxW
	siBhRM00FdK7bQYs0lqFqLWVH9ZhljqfelKYSu8lZZkIjExFiG4mE5HSbFn9TVcb
	btqbpsjRCPqgqFDCm8m1HhMEB1avddz+lKBrKr5XHAhwMwrTuXU51xCEwPXtAqzh
	s13xg4Mjp0wQ8tFG0xuX7CYR5Z8RYQ5pM7u4P6puIwTGKTpHlN6yAwiynTfzeQVT
	d6r8qyJ362D6BWSC1M5lh3CmkQeFxV+pI63VXlBDG6vvZlJlrbOu+aHT68GwQNrJ
	YmdSSyJWOGUJffDa9EAVThSRmPpUSy4a+g3N182uNx7YNX6SYa1XicWYA==
X-ME-Sender: <xms:aRpwZR_vUtWbJQM2foiiiZyKFQR3HaPMIprLyJIT7duQYU_vi8kxSw>
    <xme:aRpwZVvGr_Fh3c2gmaIvLahauUx3siYA3pFKtK_HJCaw2eLIFeH6xVVemPJn8brff
    3HX3_tbFcpcQM3WdvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejledgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:aRpwZfCOUZHZkntdpX7ADkGLEOJJ-EDgM_1SmHXZ6mf2Np6EmQi0ZQ>
    <xmx:aRpwZVfoSFCHWUo_VIyqeD5DKi5Tg8Bt0cLOGDJSd2C1Wnih5_wCJA>
    <xmx:aRpwZWPbQI4CiTpCOsJ6vNoQRmxO0vRyePMO8I6SXlp9Y24mCU3trw>
    <xmx:ahpwZd2ZWm_fEU9gcGqpRlAFAr7FWC0RGK6dqA6-uokNMj0btiqozQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5AAB1B60089; Wed,  6 Dec 2023 01:53:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f712a65b-4984-46e8-bd43-1309b5cd41f0@app.fastmail.com>
In-Reply-To: <5f1caaf8-1edf-444a-b017-c4d08e52213b@infradead.org>
References: <202312041909.lwhcU35R-lkp@intel.com>
 <5f1caaf8-1edf-444a-b017-c4d08e52213b@infradead.org>
Date: Wed, 06 Dec 2023 07:52:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>,
 "kernel test robot" <lkp@intel.com>, "Masahiro Yamada" <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Subject: Re: pm.c:undefined reference to `i8042_command'
Content-Type: text/plain

On Wed, Dec 6, 2023, at 06:24, Randy Dunlap wrote:
>> All errors (new ones prefixed by >>):
>> 
>>    mips64el-linux-ld: arch/mips/loongson2ef/lemote-2f/pm.o: in function `setup_wakeup_events':
>>>> pm.c:(.text+0x118): undefined reference to `i8042_command'
>>>> mips64el-linux-ld: pm.c:(.text+0x154): undefined reference to `i8042_command'
>
>
> How do we feel about this?
> I suppose that an ARCH or mach or board should know what it requires.
>
>
> ---
>  arch/mips/loongson2ef/Kconfig |    3 +++
>  1 file changed, 3 insertions(+)
>
> diff -- a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
> --- a/arch/mips/loongson2ef/Kconfig
> +++ b/arch/mips/loongson2ef/Kconfig
> @@ -40,6 +40,9 @@ config LEMOTE_MACH2F
>  	select ARCH_HAS_PHYS_TO_DMA
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>  	select ARCH_MIGHT_HAVE_PC_SERIO
> +	select INPUT
> +	select SERIO
> +	select SERIO_I8042
>  	select BOARD_SCACHE
>  	select BOOT_ELF32

I think it's bad style to force-select an optional subsystem.
How about making the entire file optional? It seems that there
are already __weak functions in its place.

--- a/arch/mips/loongson2ef/lemote-2f/Makefile
+++ b/arch/mips/loongson2ef/lemote-2f/Makefile
@@ -8,5 +8,6 @@ obj-y += clock.o machtype.o irq.o reset.o dma.o ec_kb3310b.o
 #
 # Suspend Support
 #
-
+ifdef CONFIG_SERIO_I8042
 obj-$(CONFIG_SUSPEND) += pm.o
+endif

     Arnd

