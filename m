Return-Path: <linux-mips+bounces-3725-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D87090D63E
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 16:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6BA01F21E76
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 14:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D51157A41;
	Tue, 18 Jun 2024 14:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="lZi+4Z+u";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TOKykJP4"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout7-smtp.messagingengine.com (wfout7-smtp.messagingengine.com [64.147.123.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365DF13AD29;
	Tue, 18 Jun 2024 14:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718722256; cv=none; b=YuHXve6RxpnngDdZS05wQxKyWYvzvt1pHBqvw3+x0IhWTlH+VovFXsygl0fnBWpkm8bK+KbMLeqFiEKhsy7NOTkNpFZ+kSxg4eGDxw3eLNBUmE6+0TaZoKuxkaSdIFW9rULA/iTJjmZYDjtlNBlANii4ZmS5um3EMW67O8rHig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718722256; c=relaxed/simple;
	bh=hGcbKw7n7y063SAaMZ8ffGbjHZGhut2D+dmcWhtpEH8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=UnueXPSks1Bv0jqrlyU+TV/0QTpS1fiu3tw53xUH+Sriu+jklla9S+2hkm607Bz0b03r74WKyHRyiY1g7L7ZIqGtc/8jlCaT5flUMoIiSskcud024U1RcpfVWrqxH7uLtbICUwYbUI/tPmcfMrm3S15wdBF5IgWNSiMgPtTA8PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=lZi+4Z+u; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TOKykJP4; arc=none smtp.client-ip=64.147.123.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id BD91B1C000E3;
	Tue, 18 Jun 2024 10:50:53 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 18 Jun 2024 10:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718722253;
	 x=1718808653; bh=C90Sq4PGFbLE3AmGVlHhSTr6SX3wdgYia1raOYnOhKg=; b=
	lZi+4Z+uhSAxvGONZNO8PhBIWtE0wt0EJyIgsmUi7mBCb7giaESo7VyuX8VvKe/z
	/LbskahmcgqQssLJMh9f9XPBGkVwYbqf9FChw9uqBC94+fk0xEte3mT07GHbZ8UW
	plcSAOc5zDaHnaWZp84ANTPpVdMHbpU0Zo7xV/p4nrZ7gvOO6VkoszjxA6iM5aZI
	3LqJwOZ9MNkvVIF6polj+S7tRENE61evUvZDtvWvdS/WH6pDQwk1+ZPAHVVJaDeC
	RUt3ZvWHByxsqjXCkdgbgn3f1ljZDVfN0D6cOQhPz7v+LGkEawlXTcS5ervPIpEv
	L9oalGKxY36/h5L9uJ3yjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718722253; x=
	1718808653; bh=C90Sq4PGFbLE3AmGVlHhSTr6SX3wdgYia1raOYnOhKg=; b=T
	OKykJP4OUst02UPJvpI1+MR2C7+kR/rFPvCyzstS2GyAxVBqzmZMqXnYTi226OLn
	OWYxejUjSFuU/d10ssQjY93aw1jWtGFP/qTScifgc7dJdmX5tccCtWm5co9ks2gB
	jC0BG5pUdk0gla88LuIYhOWH9Q78Ywz1w2ehxnj7nbLDlfRlXS5pY1+p0uLcf1oG
	HxYfz8ar9i+4tBiDTZEdGvoiMNM0jql27AGz81hM6WI/zn/+Gydbgvj4a57l0j0L
	Ooa6B3drxI6GnVwUm5i8AB1XOGeUJT69pYwXnoavTPzNq+m24HCtIwxbCLZeEp2K
	m9sHKpZoEXWb4EqHI1K2g==
X-ME-Sender: <xms:zJ5xZv4rkCXTfkHr70K9NVrv11ZUtjjFBhkDS3bGTagyb2sOwyJOgQ>
    <xme:zJ5xZk4LB6BpZMGwoqqgWykP8iPRQlRvJ1dNZinyTnghfVfLbtCX--oM9Gey7rTkU
    EOgXzEdODv7SdZ1sg0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvkedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:zJ5xZmc8cH7BP6g7ZRVs2Lk_NUbV1wObc751dfQdpOjeGTb4o3X7OQ>
    <xmx:zJ5xZgKu5fEFkwZKQ50hD-Hg6FUXnOepKdHE_JoyESf8ln6aMH7FpA>
    <xmx:zJ5xZjKnPLup1zcBPLGvR4UCBEGMBVN5CviX_HfPytVvFUZT8J9kTg>
    <xmx:zJ5xZpy4CDZBLe6zebisWLCqFEiqpU5Dqfbd08FePnmyqXfWPOFcpw>
    <xmx:zZ5xZq8MUzFJulJB6_wrzzJDi6c5-bzs5AYjcq6msfxLBqS-kbfY3WIc>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AD18036A0074; Tue, 18 Jun 2024 10:50:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <a3d57a7e-6134-4da5-bd4a-b150d2c97912@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H7RQu6wdBBjOBptZX6R63Ypw1qFCoJnZ335bFKd1f=XdA@mail.gmail.com>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-4-e332687f1692@flygoat.com>
 <CAAhV-H4LsuLYBefKZb5aHx_+fYyWjvO+Bm8h5=NFtSvk6E0Szw@mail.gmail.com>
 <7cbf218e-d311-4c33-aabb-7208eac231ed@app.fastmail.com>
 <CAAhV-H7RQu6wdBBjOBptZX6R63Ypw1qFCoJnZ335bFKd1f=XdA@mail.gmail.com>
Date: Tue, 18 Jun 2024 15:50:33 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] MIPS: Move mips_smp_ipi_init call after prepare_cpus
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8818=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=884:51=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
> On Tue, Jun 18, 2024 at 6:10=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygo=
at.com> wrote:
>>
>>
>>
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8817=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=882:53=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
>> > Hi, Jiaxun
>> >
>> > On Mon, Jun 17, 2024 at 5:03=E2=80=AFAM Jiaxun Yang <jiaxun.yang@fl=
ygoat.com> wrote:
>> >>
>> >> This will give platform code a genuine chance to setup
>> >> IPI IRQ in prepare_cpus.
>> >>
>> >> This is the best place for platforms to setup IPI as smp_setup
>> >> is too early for IRQ subsystem.
>> > mips_smp_ipi_init() is an early_initcall() function, why do you say=
 it
>> > is in smp_setup()?
>>
>> Sorry, I was trying to say that smp_setup is not a good point so we s=
hould
>> go prepare_cpus.
> It is not in smp_setup() now, then how do you move it from smp_setup()?
[...]

Well I was trying to justify where should I move it to, not where
does it from.

I should improve the commit message to justify the reason first.

Thanks
- Jiaxun
>
> Huacai
>
>>
>> The intention of this patch is to move mips_smp_ipi_init to a certain=
 point
>> so platform would gain control over it.
>>
>> Thanks
>> - Jiaxun
>>
>> >
>> >
>> > Huacai
>> >>
>> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> >> ---
>> >>  arch/mips/kernel/smp.c | 11 ++++++++++-
>> >>  1 file changed, 10 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
>> >> index fe053fe52147..ddf96c28e2f0 100644
>> >> --- a/arch/mips/kernel/smp.c
>> >> +++ b/arch/mips/kernel/smp.c
>> >> @@ -375,7 +375,6 @@ static int __init mips_smp_ipi_init(void)
>> >>
>> >>         return 0;
>> >>  }
>> >> -early_initcall(mips_smp_ipi_init);
>> >>  #endif
>> >>
>> >>  /*
>> >> @@ -460,12 +459,22 @@ void __init smp_cpus_done(unsigned int max_c=
pus)
>> >>  /* called from main before smp_init() */
>> >>  void __init smp_prepare_cpus(unsigned int max_cpus)
>> >>  {
>> >> +       int rc;
>> >> +
>> >>         init_new_context(current, &init_mm);
>> >>         current_thread_info()->cpu =3D 0;
>> >>         mp_ops->prepare_cpus(max_cpus);
>> >>         set_cpu_sibling_map(0);
>> >>         set_cpu_core_map(0);
>> >>         calculate_cpu_foreign_map();
>> >> +#ifdef CONFIG_GENERIC_IRQ_IPI
>> >> +       rc =3D mips_smp_ipi_init();
>> >> +       if (rc) {
>> >> +               pr_err("Failed to initialize IPI - disabling SMP");
>> >> +               init_cpu_present(cpumask_of(0));
>> >> +               return;
>> >> +       }
>> >> +#endif
>> >>  #ifndef CONFIG_HOTPLUG_CPU
>> >>         init_cpu_present(cpu_possible_mask);
>> >>  #endif
>> >>
>> >> --
>> >> 2.43.0
>> >>
>>
>> --
>> - Jiaxun

--=20
- Jiaxun

