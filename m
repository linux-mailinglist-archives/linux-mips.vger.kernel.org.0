Return-Path: <linux-mips+bounces-3324-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74A8CF4AA
	for <lists+linux-mips@lfdr.de>; Sun, 26 May 2024 17:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C7E9281114
	for <lists+linux-mips@lfdr.de>; Sun, 26 May 2024 15:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336E417756;
	Sun, 26 May 2024 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="byNlD+xq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UgRuQ8Qj"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283FF1773D;
	Sun, 26 May 2024 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716735777; cv=none; b=NkeBAmyGJB2A2JgUTj2bl4EJ1bM4aSor6ZI7i88uMwil+z7oOEhJVIHEGlYIZiD94fxWJ0wM2HSbZCPMbNQeu4JscZt2UoUh4bA1BjB5nVehThixCs82HnekX5HpkNHS54kFTw1vp+8ugC3aB52IR7Q8wugrEbDpdQrPvpWcxa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716735777; c=relaxed/simple;
	bh=MiAHNYRovMXshXgiTw6K2ZIPBGUR8TTQAYUWxWuE/g0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=HOYE0eyjtudeKRS+IDP1hMLDU8Sz+bDsc1cR10TubvXyp+kkiT3CFRwZfBafPQhbwY4McJ2ZKtiBT7xqm85Q0phWUI26Etog+RywNgkySuYRPobObbGdXMcDlYxl+hO5VOALgyVK8XqSKDmPa41Zvae7gUmVA1tVEh0AfIHsXvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=byNlD+xq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UgRuQ8Qj; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id 0B1441C000C5;
	Sun, 26 May 2024 11:02:53 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sun, 26 May 2024 11:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1716735773;
	 x=1716822173; bh=OERK5ughi7qdH+rJKwLlPV1a5cd/Fg+ElYS7NyPvt1o=; b=
	byNlD+xqVZDwXo/5y7QEuwpD3t05AEM4H14PJBvC5vUgayoYU6blVrydEEq6mXXC
	IfcfOGrB4E3WieyksmoIsI/aguWzLwBS8iptHPemWa25nHkpREnI2Atq5UQLOEX6
	WZyJ98U4KU5HRn1KSDorTC0M0bvQkOxZsO+ykEiKfyFl6qoyeZJvOeQXs411chFk
	QTTu+BCL3303y/KOhDcxUC6VWhjD8xZHH8AiYZPYCiJFHCzCiPT+Ya0QBBQNUU/Y
	QrDWLYPKkdupqSrXCV3MWHbpNgacvc6ZOE9DZWxFQTVmWTWQ5DrjGvPNCL6I1Oke
	phNzLBG3tFAxAX4yrPcvJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716735773; x=
	1716822173; bh=OERK5ughi7qdH+rJKwLlPV1a5cd/Fg+ElYS7NyPvt1o=; b=U
	gRuQ8Qj+fKYjBYC5puORZ6CpTb2tKJzIiX54nZJgFwjvL2nYepZUmlKoL9n1zd42
	U0it2OM0VxHqjRMNsFmZUumhbJc6snpqheIsJspgvmrahuq2jEsqCAyzhcLmNDGC
	qSAMMwtUHH3tVLlMlz+oNTc6ESwZC7CisaCv57k4rJnBijclm2gMEchNdkWqDKwz
	RQPBYaT50ngN1/mG4HJZK7BAwppxFexOK4TMSv+QkpHBB4Ub8OLfW3i7uF37vMSB
	vnX1VL0ebkzkc0sFYP/ZFshtbADtzkw7l42M2EUcjDAq6q4Ggyi3fnanBKbPzZJ3
	LEsBpihdmY38/CPF1/sqg==
X-ME-Sender: <xms:HE9TZrZ4L1tunzP_5XoWmOiDB6CdFYvml_u8TGzwDnOq-ZEw0ctU6A>
    <xme:HE9TZqYFaN2AzYyW4nFXm95VCWwuBC4-7MD0iexsTApbHJfeSvRMSrPn9wYbW2THY
    vsILXQYr3Vcn8pMLrM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejvddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:HU9TZt_jxdpLF91XSyuakIXBPLQ1DvmeCqkKTbuio3BFbQqysob9AQ>
    <xmx:HU9TZhrMc6mn3g5Y0BwTxgmuXfxqDNi2Q3xMImJizD6YfLV1cm2uLQ>
    <xmx:HU9TZmoH6R-S9Tj4YNb1FFwocHtPZEKIUgyrY2jcJMLun1qqHm0k3A>
    <xmx:HU9TZnQAgDWu1Pbt_qiBGucbLXlFfQTtVtTk2zz92xLamu0ZvsKqwQ>
    <xmx:HU9TZvk80CGzvXcP4WmZHAO3KKQaAAS9DEkDRGPqlP1xu5Cw4CVFgOza>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E054C36A0074; Sun, 26 May 2024 11:02:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-480-g515a2f54a-fm-20240515.001-g515a2f54
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <08ad13a3-45f8-4121-8e95-8a17dfe4773b@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2405261326260.1257@angie.orcam.me.uk>
References: <20240502-mips_debug_ll-v3-0-3b61f30e484c@flygoat.com>
 <3dcf3ac1-5494-482a-a80a-df4126e6ae59@app.fastmail.com>
 <3d6883ed-f8f4-44e5-a184-e5499c44f0f7@app.fastmail.com>
 <Zk2mt/FsgltvhVzf@alpha.franken.de>
 <13aa508f-6830-4d52-87fd-5063f737c990@app.fastmail.com>
 <a62c1c0b-0b2a-4b3f-85df-da586e103fcb@app.fastmail.com>
 <alpine.DEB.2.21.2405261326260.1257@angie.orcam.me.uk>
Date: Sun, 26 May 2024 16:02:32 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 0/9] MIPS: Unify low-level debugging functionalities
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8826=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=881:44=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, 22 May 2024, Jiaxun Yang wrote:
>
>> That being said, have you noticed that prom_putchar and early_printk =
is
>> a non-extant on generic mach, ingenic, ralink etc? That's because we
>> really don't want to introduce any platform specific UART code for
>> early debugging on new platforms. With DEBUG_LL introduced by Arm it's
>> only a Kconfig option to do the trick.

Hi Maciej,

Thanks for your thoughts, my two cents below.
>
>  IMHO that is however the logical thing to do.  And then you need no m=
agic=20
> options to fiddle with and say a distribution kernel will dump whateve=
r it=20
> has to say if something wrong has happened early on.

This is a strict debug only options, we are not expecting any distributi=
on
kernel to enable it. It has made itself explicit that no production devi=
ce
should enable it.

Setting UART address for debug console by developers know what are they
doing is a proven approach among multiple places in multiple projects.

For kernel we have general earlycon cmdline option that would take MMIO
base address, Arm's DEBUG_LL had taken a similar approach and U-Boot have
CONFIG_DEBUG_UART_BASE, even our old zboot debug print code is taking su=
ch
approach.

It takes a balance between platform dependent code addition and bring-up
debugging capability. I fail to see why does it suddenly become an undes=
ired
thing here.

>
>  IOW just wire `prom_putchar' as required, using C code preferably.  N=
B=20
> YAMON does have a `print' entry point for console output, so for the M=
alta=20
> platform you can trivially use just that, no need for messy ad hoc 825=
0=20
> code.

Sadly for the majority of modern MIPS devices are dominated by U-Boot or
vendor's simple loader. In most cases, runtime APIs are not provided by
default. Even if it's enabled, there are still a couple of reasons preve=
nting
it to be utilized properly. U-Boot relies on global pointer stored in K0=
 to
save global runtime data, kernel will clobber it very early and makes U-=
Boot
non-functional. On devices with limited memory, it's easy to get U-Boot =
memory
being clobbered by kernel and render U-Boot's runtime useless anyway.

That's why many new-ish platforms such as lantiq brings it's own UART
implementations for prom_putchar.

However, for generic platform implementing prom_putchar means we need to
introduce platform dependent code, which we had to pay all the price to
avoid. We have many in-tree and out-of tree generic platform users who
don't need to add any single line of code to bring up their platform,
thanks to DeviceTree, but they still need something to help with debuggi=
ng
bring up process when devicetree went wrong or early panics.

>
>  As to intercepting exceptions, it depends.  Again YAMON does handle t=
hat=20
> and dumps the register state, so with the Malta you get the informatio=
n=20
> required.  For less capable ones it might make sense, but it ISTM like=
 a=20
> candidate for an independent change, and then again I fail to see why =
the=20
> handler has to be written in the assembly language rather than C.

Again for U-Boot debug exception dumping is optional and I know many dev=
ices
not shipping with that enabled. Even if it's enabled, it will stop to wo=
rk
after U-Boot's memory/global pointer being clobbered or ebase being over=
ridden
by kernel. Not to mention that Bootloader's exception dumping won't work
with CPS secondary cores.

Paul wrote cps-vec.S and cps-vec-ns16550.S in pure assembly for reasons.
Stack pointer is not initialized at second core & we really want to redu=
ce
code footprint on secondary core to minimize side effects before coheren=
ce
is enabled.

When the infra is here, expand it to generic early exception is just tens
of lines. I fail to see the reason to bring in hundreds lines of C code =
for
the same functionality.

>
>   Maciej

Although it's a pure technical discussion, I still want to expand that w=
hile
I appreciate what you have done to the MIPS, sometimes I feel like we ar=
e not
on the same page because you guys are away from frontliner for so long a=
nd
missed many contexts. MIPS is still evolving, although I never appeared =
here
with my corp email, I'm one of those behind the scene. I draft new archi=
tecture
specs, write AVP and internal simulators, do RTL coding for future core =
products,
helping customers design SoC products, design software architecture and =
bringing
them up. I kept FOSS as my hobby and I tried my best to keep upstream in=
 sync with
modern practices.

I love MIPS heritages, I own an SGI Indy and Algorithmics P-4032, I made=
 some
fixes on MAME emulator for indy to keep kernel running on it. I'm still =
frequently
fascinated by those brilliant old designs. But I think we still need to =
make progress.
While maintaining compatibility with all those old things, we need to ad=
opt common
practices that have been proven by other architectures and make our own =
innovations.
We need to make the development process agile, so no developer is turned=
 away. We
need to adopt modern booting protocols like EFI and ensure generic kerne=
l is really
generic and not being diverted because of different loading address....

I don't know if you would agree with my in both technical details and id=
eology,
but I think it's the time to make my intention clear.

Thanks
--=20
- Jiaxun

