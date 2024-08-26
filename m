Return-Path: <linux-mips+bounces-5109-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3895F477
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 16:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4EEC1C21E1C
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2024 14:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AFB18D65B;
	Mon, 26 Aug 2024 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Zpa4kyQE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Tkw2AwR3"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BAB187FEA;
	Mon, 26 Aug 2024 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724684149; cv=none; b=Ki6DY8owjkPDhw3y3SOxyn1+gWyJxaOKENwOysy8o1I/WZPHv3te2frOYuUvKlj1fvWDzWZ+qWdGR6NuRUe0AFEOObzHU694UWuYgM5lqSdncUVMHi3z2vYXdU06rM4uGh3+WuXLnZ9GPt547zCtgWaENmWAIbF6hiTh/X6vnEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724684149; c=relaxed/simple;
	bh=9TmelYC8tZt7bqVAgPpovFGJQmmwFDIQHX9vuuZAA/c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pIUAx5fJja2M/NE0Y+/qubxQvABbaXI7p9FzHH4Do2TK/Dd4FbxDRsgIHKHzrynOTf11S/WrKQGo0zUFpEQCElcLqaBfDxT/MmgHPgMqc76WjKxrYHTW2WjxKnqxgZ773SjB2Q7C87pIDggniU81rfbeJXC1y4fjtw5LZjjVHl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Zpa4kyQE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Tkw2AwR3; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A32EF1151BCA;
	Mon, 26 Aug 2024 10:55:46 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 26 Aug 2024 10:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724684146;
	 x=1724770546; bh=VV6gKj4YduBLQtRVd/Kk7xoggepydH0ei745eofrJ7E=; b=
	Zpa4kyQEJ805NEduAU83jyc7GMUA+Y+ldVwizTC85ioNuLt3fWY3L8E3AmO/kTmz
	+pwThBu7g4AInV27Md+7jOyaTODvJZbPPMn3uPY4LuFJFSLP2ibFdAd9JAcXHRaa
	GfCmbkVbzgdN/ooNwcdk2JflOy8alDWRpZgXaIbUe3dL92mA5X0xtnuMjGlyzfzO
	VpadDH8bX5XXfRm3nNkxYBTGNrLV3wLeKxNsaNRAW9vnGEpsBMBYVfxDPwcYx6O8
	v91JJLq7tFf/VSeaMOQOctWemyxRqsv/saTSckfZX4VTQ17SNEGCicNjQ3xH46C3
	4hVwf5BzeMdwE2K9z9hRcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724684146; x=
	1724770546; bh=VV6gKj4YduBLQtRVd/Kk7xoggepydH0ei745eofrJ7E=; b=T
	kw2AwR36VE1SGKUlrwKqhGIRYKKZrvNEGGCG118B5d4fKO51cMsOEImheufzRjI0
	okqkowkbFS5IgU9RVteZvgMP2k+pjdXSDC2NZ/1cmg2vxvuyPJ6HYGOmSIPxYhvH
	Yzl6o+0oCpXhuNcygm9oMuxKGvA/d/ybxJEGG8CGCleJYnrKb8KRh0j5ZVV9s4gd
	3IqJUAqlBuZMk5rjKJP1q73LP2DoSarK7+NjWXYMAhRN0ve/JGl2nvkmCmK8v+Bc
	G6h+wn5j89nH+ODYnEveyu3c/7OgcuXSOMf7biAT92VIgzwZYS8T9wlswvbmyb6z
	epo5ldwLwlMxbvIiJNSNA==
X-ME-Sender: <xms:cZfMZk2crJgdTC21vojKPPTfG-SUAmfbTSDvF-zoXp6CVvFPLJkY7g>
    <xme:cZfMZvHW3TrZ8MMBTm_qs1Il09ZttTtJw0WCoW4lV8Lq1K3NuMWnGMdjATZcaxsnI
    33G7tqlLA9k8vxjj20>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvkedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepteefudehvedutdeugfeuveffleduheehfeehffeu
    jeduledvheeivdffleffjedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheprhhitghhrghrugdrvggrrhhnshhhrgifsegrrhhmrdgtohhmpdhrtghpthht
    oheprhhitghhrghrugdrshgrnhguihhfohhrugesrghrmhdrtghomhdprhgtphhtthhope
    hlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepthhonhihsegr
    thhomhhiuggvrdgtohhmpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessg
    hoohhtlhhinhdrtghomhdprhgtphhtthhopehnihgtohesfhhluhignhhitgdrnhgvthdp
    rhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomh
    dprhgtphhtthhopehrohgsvghrthdrjhgrrhiimhhikhesfhhrvggvrdhfrhdprhgtphht
    thhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:cZfMZs5iHXtcIzuW_BSliI_HvreDayTF3XbPOQ1YrZ6yxubahMj6uQ>
    <xmx:cZfMZt2RE9GsrgHPm4NifQtfzw0BCGPHR81VTG9cNpULzvRkWIlqeQ>
    <xmx:cZfMZnFtYfS_kMFrEbTilUi0sKmWqnO5w4uO0X5tfI-FhQ43jiEkMQ>
    <xmx:cZfMZm-74figysDp8LvB0pYnvqAN93YjeLxJOKIFZTRRvzLYjDU4iA>
    <xmx:cpfMZg3hbmwnlL4P2euk13kcaUf_a3x_ySsZE_9Tilz1SVyx_9gPXSnF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 32B31222006F; Mon, 26 Aug 2024 10:55:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Aug 2024 16:55:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Vincent Legoll" <vincent.legoll@gmail.com>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Mark Brown" <broonie@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Janusz Krzysztofik" <jmkrzyszt@gmail.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linux Kernel ML" <linux-kernel@vger.kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, "Nicolas Pitre" <nico@fluxnic.net>,
 "Nikita Shubin" <nikita.shubin@maquefel.me>,
 "Ramana Radhakrishnan" <ramanara@nvidia.com>,
 "Richard Earnshaw" <richard.earnshaw@arm.com>,
 "Richard Sandiford" <richard.sandiford@arm.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Tony Lindgren" <tony@atomide.com>, linux-mips@vger.kernel.org
Message-Id: <35680bf8-d4f0-4b7a-b358-f71eb39e2a94@app.fastmail.com>
In-Reply-To: 
 <CACRpkdZFQSN_t-Vx7xOXq0aF6Vf-XvsZKGF6yNMn7_dCeaZi_w@mail.gmail.com>
References: 
 <CAEwRq=qhHBh5jKdLGb1r2Qem0jia=xcVdevihYfjdrLSYiZuiA@mail.gmail.com>
 <CACRpkdZFQSN_t-Vx7xOXq0aF6Vf-XvsZKGF6yNMn7_dCeaZi_w@mail.gmail.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024, at 11:05, Linus Walleij wrote:
> On Fri, Aug 23, 2024 at 10:47=E2=80=AFPM Vincent Legoll
> <vincent.legoll@gmail.com> wrote:
>
>> It looks like the highmem feature is deemed for removal.
>>
>> I am investigating the loss of some available RAM on a GnuBee PC1 boa=
rd.
>>
>> An highmem-enabled kernel can access a 64MB chunk of RAM that a
>> no-highmem can't. The board has 512 MB.

There have been problems in the past with configurations that have a lot
less highmem than lowmem, since there is codce that assumes that
lowmem is scarce but highmem is not.

This means your configuration may have more RAM available when highmem
is enabled, but still runs into out-of-memory or other problems more
than without highmem.

What you see is certainly unrelated to me mentioning that we may remove
highmem support from the kernel altogether in the future, but it's
possible that OpenWRT turned it off because things work better
without it.=20

https://github.com/openwrt/openwrt/issues/13151 may explain
what ios going on here.

>> That's more than 10% on a RAM-poor NAS-oriented board, probably worth
>> the hassle to get it back.
>>
>> I built & flashed a current OpenWRT snapshot, without any modificatio=
ns,
>> wich gave the following output:
> (...)
>> The lost RAM is back usable.
>>
>> Is there an alternative to CONFIG_HIGHMEM to use that RAM chunk ?
>
> Userspace can still use it right?
>
> The approach we are taking on ARM32 (despite it's.... really hard) is
> to try to create
> separate address spaces for the kernel and userspace so that in kernel=
 context
> the kernel can use 4GB of memory as it wants without the restriction o=
f userpace
> taking up the low addresses.
>
> This looks easy until you run into some kernel assumptions about memor=
y being
> in a linear map at all times. Which I am wrestling with.

MIPS32 is a bit special here since it has segments with a fixed mapped, =
so
the linear map is always at a fixed virtual address and at most 512MB in
size, where most other architectures can make it e.g. 2GB by changing
CONFIG_VMPSPLIT.

CONFIG_CPU_MIPS32_3_5_EVA should allow doing this on MIPS as well,
but I think the 1004K core in this specific (MT7621) SoC is  little too
old to support that feature.

      Arnda

