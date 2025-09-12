Return-Path: <linux-mips+bounces-11253-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FE8B5480D
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 11:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D58218961E6
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 09:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6948127E7F0;
	Fri, 12 Sep 2025 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="jxIBuKWB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF93274B44;
	Fri, 12 Sep 2025 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669917; cv=none; b=qWZ/8/KcUpHOg/6PYpF0Wi3aT8Vni3UIUhg/LywtyQVg33vz8dI98uvww8JoAw1FeKhqgT9QLo21JqytkCByzvDRMK3st8170tb8l6zCpOn+vdovehIT1e+9xexemzGzHuB7Uc9BCMvceByX88ParYVZ8J1MNHOCMMSOZkDh3wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669917; c=relaxed/simple;
	bh=XudfAtsdEhEQX5UuGyhpuqOTangiL792TdLl4y095g0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IzFA+v/mN6+GPGUvmqlCBPf8iI7/46+gGIJLFil1TBYbg5bqiGs0kcz4G2ZatTORhMX/VbIDpUaVGLfzANJbSC5mnc96m3os734+cnB/926sxB8i3Wzlm7DeDqRuvLa49dAPCjlnLjOqrjiLYqr7VPlBg8TFGRUqOHM7qNos/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=jxIBuKWB; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 58C9b0xv1357625
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 12 Sep 2025 02:37:00 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 58C9b0xv1357625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1757669821;
	bh=GE2ISEvWqh9sN8UYw61P33fDsnFm1/nb1kUiiX/ifUM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=jxIBuKWBOuwi8Xn/pfTljgb3zhi4Bf+6TpFn4wY12CV2bo/HBYvEFlNNTSG8fPcmd
	 Jj/Tfu0GL4cwgOIGmCy3Nn+jkWh8vnC8zuP/GErTXN0RQ77TNqxFkI31NPKxEScs+g
	 3vOnPn4RJLBqsy4KnA1eIay9kM3VJsautov8wGzn+movTKqUP1FRL6RWjeOsUKd4W1
	 PzI9yWN2VGly1IKj7GF6C15ow1c72iThcEsS5Y7nUNwJIqldXBZ/Cz0CDjQetsdIXJ
	 cSf1aezna12azQgXZfQWWPOQrMR8BIbyp5qTPTfw3ynfjS2Z5IuCtNAHsMLsakvOcZ
	 RcYRHWLQ0/FWA==
Date: Fri, 12 Sep 2025 02:36:58 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
        ksummit@lists.linux.dev
CC: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, imx@lists.linux.dev,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Richard Weinberger <richard@nod.at>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
        =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
User-Agent: K-9 Mail for Android
In-Reply-To: <a393f6bd-ac30-4861-818c-ba0b558df4a4@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com> <363853cd-7f10-4aa9-8850-47eee6d516b9@app.fastmail.com> <a393f6bd-ac30-4861-818c-ba0b558df4a4@gaisler.com>
Message-ID: <0FEA041E-A07E-4259-AFBC-02906D122C3A@zytor.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 12, 2025 2:32:04 AM PDT, Andreas Larsson <andreas@gaisler=2Eco=
m> wrote:
>On 2025-09-11 09:53, Arnd Bergmann wrote:
>> On Thu, Sep 11, 2025, at 07:38, Andreas Larsson wrote:
>>>
>>> We have a upcoming SoC with support for up to 16 GiB of DRAM=2E When t=
hat is
>>> used in LEON sparc32 configuration (using 36-bit physical addressing),=
 a
>>> removed CONFIG_HIGHMEM would be a considerable limitation, even after =
an
>>> introduction of different CONFIG_VMSPLIT_* options for sparc32=2E
>>=20
>> I agree that without highmem that chip is going to be unusable from Lin=
ux,
>> but I wonder if there is a chance to actually use it even with highmem,
>> for a combination of reasons:
>
>I would definitely not call it unusable in LEON sparc32 mode with
>HIGHMEM gone, but it would of course be seriously hampered memory wise
>without HIGHMEM support compared to with HIGHMEM=2E In NOEL-V 64-bit
>RISC-V mode it will of course not be affected by these matters=2E
>
>
>> - sparc32 has 36-bit addressing in the MMU, but Linux apparently never
>>   supported a 64-bit phys_addr_t here, which would be required=2E
>>   This is probably the easiest part and I assume you already have patch=
es
>>   for it=2E
>>=20
>> - As far as I can tell, the current lowmem area is 192MB, which would
>>   be ok(-ish) on a 512MB maxed-out SPARCstation, but for anything bigge=
r
>>   you likely run out of lowmem long before being able to touch the
>>   all highmem pages=2E This obviously depends a lot on the workload=2E
>>=20
>> - If you come up with patches to extend lowmem to 2GB at the expense
>>   of a lower TASK_SIZE, you're still  looking at a ration of 7:1 with
>>   14GB of highmem on the maxed-out configuration, so many workloads
>>   would still struggle to actually use that memory for page cache=2E
>
>Yes, we already have patches for 36-bit addressing with 64-bit
>phys_addr_t=2E Patches for CONFIG_VMSPLIT_* are under development=2E
>
>Even with 192 MiB lowmem we have being using up to 4 GiB without running
>into problems=2E Could you elaborate on why you think lowmem would run ou=
t
>before 14 GiB highmem in a VMSPLIT_3G or VMSPLIT_2G configuration?
>
>And even if 14 GiB highmem would be hard to get full usage out of, for a
>board with 8 GiB memory (or a configuration limiting 16 GiB down to only
>use 8 GiB or somewhere in between) the difference between getting to use
>2 GiB and 8 GiB is quite hefty=2E
>
>=20
>> - If we remove HIGHPTE (as discussed in this thread) but keep HIGHMEM,
>>   you probably still lose on the 16GB configuration=2E On 4GB configura=
tions,
>>   HIGHPTE is not really a requirement, but for workloads with many
>>   concurrent tasks using a lot of virtual address space, you would
>>   likely want to /add/ HIGHPTE support on sparc32 first=2E
>
>That is an interesting point=2E Regardless of workloads though, it still
>would be a huge difference between having or not having HIGHMEM, with or
>without HIGHPTE=2E
>
>
>> When you say "used in LEON sparc32 configuration", does that mean
>> you can also run Linux in some other confuration like an rv64
>> kernel on a NOEL-V core on that chip?
>
>Yes, boot strapping will select between sparc32 LEON and rv64 NOEL-V=2E
>
>
>> Aside from the upcoming SoC and whatever happens to that, what is
>> the largest LEON Linux memory configuration that you know is used
>> in production today and still requires kernel updates beyond ~2029?
>
>The maximum I know of for systems currently in production has the
>capacity to have up to 2 GiB memory=2E
>
>
>Cheers,
>Andreas
>
>

SPARC32 has a 4:4 address space=2E  You still use HIGHMEM?!

