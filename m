Return-Path: <linux-mips+bounces-12513-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0F1CCBBFA
	for <lists+linux-mips@lfdr.de>; Thu, 18 Dec 2025 13:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB7E33021064
	for <lists+linux-mips@lfdr.de>; Thu, 18 Dec 2025 12:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031B332E14F;
	Thu, 18 Dec 2025 12:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbfm1N29"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1C328248;
	Thu, 18 Dec 2025 12:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059918; cv=none; b=nLfCHDAE7ABNOXlZV7dxcqDdIkqUC4bbEkVj/wQoGasmSk7An4Dl1ITHKdF1qOO86gWQiCr10kBi1EjB9uGaYsV3FlXdaSQKzsW8nMRxWuIAKDO3vAXAjeGDvgVAouWdh7lDjExirFVOr4eCJ/ZSgxiZLUlkf5SQTYNes4/jNMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059918; c=relaxed/simple;
	bh=XGQ+7SgEew4iClGYURs+C9L0stXJTBsZbjZ2oG7UIc0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IMrgPo37uRPotPPg1cWjhvzfxdPdASEvFLw5frKAwIF2GSHVQ9zTYuLtIl6qcW6AWtYaYaIPQcp4ELXX4W6cMYymJmYyd2iY5qDXhBqHTnT27Df+QiQ0RkWONG5sL66LYNWasfKBNfxSPi8xK0b+EehL9P1S8Kuv488GwrHuzMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbfm1N29; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD324C4CEFB;
	Thu, 18 Dec 2025 12:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766059918;
	bh=XGQ+7SgEew4iClGYURs+C9L0stXJTBsZbjZ2oG7UIc0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Pbfm1N29OV600qM6UTmHFrWBgKAAPaEIi8H31U8/D7Fy4/yQH7DtTr8fjL1JU2ZGr
	 6nwz3dwH1V2m2ot6sPml3YHiTkco7la+c2nu+l+SxzciJta8kjjah21YI0wd4vAeV1
	 isA2l1yKhqypiDWu4LQeHt4ykcmpaBp/ImSwyvJVre9a3pRs4GXVsIRHvw6x+1fCZ3
	 aTjQTA27ccRELqk9h2L0kraeNtbMTR5EzRmpbnJomxT+NeArdctTyUhXcuNcwN7S86
	 MwPNLvKu3CLTwt2KbzjkGo2I4spjFwLzTY0Numflrkc7wTVrfPPFNtqzCFaA++T+6a
	 inlbyNZVWvrqA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id BD61AF40069;
	Thu, 18 Dec 2025 07:11:56 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-04.internal (MEProxy); Thu, 18 Dec 2025 07:11:56 -0500
X-ME-Sender: <xms:jO9DafeY02D3zYoswm455JApvwyXo9N__fUotOJi51wAZtuEx-h72w>
    <xme:jO9DaQDfyGYFoXV11b_RfSRExwBkMCEzZBimiIe7NMQwesYYigYemrJGclZL6-nUN
    5nH6_xmiiK7evyXwi9tI-nHYYwNuyJSE2e3okgtOjc_KJ6UT8WLB40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekgfduveffueffveduleefgfejhfevfeduueeiueetleeugeeivdfhfedv
    geeuhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheplhgvohhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdduvdeftdehfeelkeegqddvjeejleejjedvkedqlhgvohhnpe
    epkhgvrhhnvghlrdhorhhgsehlvghonhdrnhhupdhnsggprhgtphhtthhopeefiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigse
    grrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhl
    vghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegurghvvghmsegurghvvghmlh
    hofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhr
    tghpthhtohepohhlvghkshgrnhgurhgpthihshhhtghhvghnkhhosegvphgrmhdrtghomh
    dprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
X-ME-Proxy: <xmx:jO9DaW3ei8lQ9gcPxNPUeQZve5kN2H4YDdliFX36bDRD9uMeDsZ4KA>
    <xmx:jO9DaUpMFxuOPj7_hGyyy_s579il17M-kR5TgcqcXniyOzdDRg_9ow>
    <xmx:jO9DaWJBfSyOkp-S-guhU4sCQMQj21t9ZeDTKlB6MTu_eAniobrx8g>
    <xmx:jO9DaQMmPwxjAIxGEGDyRXW1Dza8HIb57oy-5TquwYRW4FNWdPdjfg>
    <xmx:jO9DaU3nohCadRXkzPkJY71Xjbbz3hpclv3AJ-2YED3d89Ht1quCx0PH>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7DD622CE0072; Thu, 18 Dec 2025 07:11:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AsrGuGndWMm3
Date: Thu, 18 Dec 2025 14:11:35 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Geoff Levand" <geoff@infradead.org>,
 "David Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Jason Gunthorpe" <jgg@nvidia.com>
Message-Id: <77e73a01-9f7e-475b-a810-278f931910ed@app.fastmail.com>
In-Reply-To: <20251218084002.GD39046@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
 <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
 <20251218084002.GD39046@unreal>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys interface [qemu
 test failure]
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Dec 18, 2025, at 10:40, Leon Romanovsky wrote:
> On Wed, Dec 17, 2025 at 04:17:38AM -0800, Guenter Roeck wrote:
>> Hi,
>> 
>> On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
>> > From: Leon Romanovsky <leonro@nvidia.com>
>> > 
>> > Perform mechanical conversion from .map_page to .map_phys callback.
>> > 
>> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> 
>> This patch causes all my 32-bit parisc qemu tests with C3700 machine
>> to fail. Network interface tests fail, and all boot attempts from
>> any kind of hard drive (scsi, usb) fail with this patch in the tree.
>
> Thanks for the report. I have a fix ready; I'll clean it up and send it out
> by EOD.

The fix is available here
https://lore.kernel.org/all/20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com/T/#u

Thanks

>
>> 
>> Guenter

