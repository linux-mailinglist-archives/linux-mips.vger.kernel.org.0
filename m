Return-Path: <linux-mips+bounces-6796-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A88669D8CD2
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2024 20:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D9A328A8EC
	for <lists+linux-mips@lfdr.de>; Mon, 25 Nov 2024 19:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DB81B87E1;
	Mon, 25 Nov 2024 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="NxRyKlZB"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B416B192D86
	for <linux-mips@vger.kernel.org>; Mon, 25 Nov 2024 19:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732562794; cv=none; b=BKJIhhRGeV7hnPq+wAL16LZKHiN+wyM2KZOBXtzSAS6y8reJZe9EpWXAC3rx5KgtCrIGsFye/okLXgLnOCsRQwtmwC+CQh4o1LuMlSleiqUSyryxxiTrKyTFc+EJaFz7D31+NBm08QG53Ks21WBbkz+biIybiJ0sXFAHRTGdbJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732562794; c=relaxed/simple;
	bh=zTFOxSYHfrX2oNhOJSPkUYEf6+3QV+r2Rg2nffL1IoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZeI03maxKqbAF9O/p736dppq+EJiZW1LiMC7b8otO3x0EigLCOpwBJvhnVfMt1JC+C/Nyh3SQBWKLRcfmCrLSiUQ6OQ7HbMsPipsqPTXRigQJ9ZbVuz9s/UXw69I0auB4usKDQF4hf2P7UXcFJAx8Cc82b/jlp35KWFcK2wJfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=NxRyKlZB; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 39E2B2C0404;
	Tue, 26 Nov 2024 08:26:28 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1732562788;
	bh=ySIwHnQJcD3oNmwvevdP0H97y8mav9/YRAOB3BNopu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NxRyKlZB5Yaln9hqoBKxOZ3KBwFLtGsOg+Vo2ZKM6f5T0w+NCW/8dWLG4GM5Cwsz/
	 TIMqQGOoAed14sMjRhoItCAnwaiSnDZ8vm0h1HSS1hftuOcj8K7towCHubO5sKrOYx
	 F94boXaDZBP6+EZqpPIJBbZZRkx8yHB5ghNVdGNwQjLMY2zGik2rk7WuHMLyDSGLUl
	 r7oiqz7NFa4CWvUcYqRQTMndTwj3Cadm4jJM2ZF9nCMaIvXGzoEfAFCQ768L2CGknt
	 BLOCgN1Z93kGXyZwcMg2bsRmMAo7p5VAx2062SfEt7rZKkPmF7S4OGXsV0kwdVoU1w
	 8X7cLh8iODr/g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6744cf640000>; Tue, 26 Nov 2024 08:26:28 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 0EDCD13ED7B;
	Tue, 26 Nov 2024 08:26:28 +1300 (NZDT)
Message-ID: <5eeb60df-e966-47ae-a381-bc7496d4fa8f@alliedtelesis.co.nz>
Date: Tue, 26 Nov 2024 08:26:28 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: RTL9300 (mips) fails to boot with commit d4a7f2510ff4
 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
To: Rong Xu <xur@google.com>
Cc: "Han Yao Yeo (atg)" <hanyao.yeo@alliedtelesis.com.sg>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Masahiro Gotoh <gotoh@allied-telesis.co.jp>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cd252b78-077b-441e-8371-106d71258ff3@alliedtelesis.co.nz>
 <84d9200e-25b4-4bd8-8eb5-c954ff92ac08@alliedtelesis.co.nz>
 <CAF1bQ=RU2dZU3ENy3MLM4FvrZNaZprgPAM5vbRtUVDixJNQ_zg@mail.gmail.com>
 <c6719149-8531-4174-824e-a3caf4bc6d0e@alliedtelesis.co.nz>
 <CAF1bQ=QEL3XZYsNL-f7jmbDOVWHSVfhZSYx0iddct3nz8_Yf1A@mail.gmail.com>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <CAF1bQ=QEL3XZYsNL-f7jmbDOVWHSVfhZSYx0iddct3nz8_Yf1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Gam0nhXL c=1 sm=1 tr=0 ts=6744cf64 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5dVuqzPFobW2HRXp1WoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 26/11/24 07:48, Rong Xu wrote:
> Thanks for confirming this! It looks like we do need to put all
> symbols from head.o before any other symbols.
> To be clear, the patch I mentioned was not trying to do that -- it
> just makes sure the _stext is in the right places.
Looking at other architectures it may just be a matter of adding __HEAD=20
to an appropriate place in arch/mips/kernel/head.S and HEAD_TEXT_SECTION=20
to arch/mips/kernel/vmlinux.lds.S. It might even be possible to drop=20
mips from scripts/head-object-list.txt.

> I'll draft a patch for this.

I can give any patch a quick test on my setup.

>
> On Sun, Nov 24, 2024 at 12:40=E2=80=AFPM Chris Packham
> <Chris.Packham@alliedtelesis.co.nz> wrote:
>> Hi Rong,
>>
>> On 22/11/24 18:02, Rong Xu wrote:
>>> Does the following patch fix your issue?
>>> https://lore.kernel.org/lkml/CAK7LNAQSpM2hh2=3DWgribb92nHF5_peRb+gxdO=
1Bt1MkeL8N+hw@mail.gmail.com/t/
>>>
>>> Masahiro Yamada already applied the patch to kbuild-tree.
>>>
>>> I also proposed a similar fix as yours. But we believe the above patc=
h
>>> should also work (and probably is better).
>>>
>>> Please try and let us know.
>> Looks like linux-next already has that patch and no it doesn't fix my
>> issue. For the record here's the start of my System.map
>>
>> $ head System.map
>> ffffffff80100000 T __split_text_end
>> ffffffff80100000 T __split_text_start
>> ffffffff80100000 T __unlikely_text_start
>> ffffffff80100000 T _stext
>> ffffffff80100000 T _text
>> ffffffff80100000 t run_init_process
>> ffffffff80100138 t try_to_run_init_process
>> ffffffff8010018c t put_page
>> ffffffff801001d0 t nr_blocks.isra.0
>> ffffffff80100208 T ack_bad_irq
>>
>> It does look like whatever is supposed to put head.o first isn't kicki=
ng
>> in for me.
>>
>>> Thanks!
>>>
>>> -Rong
>>>
>>> On Thu, Nov 21, 2024 at 6:29=E2=80=AFPM Chris Packham
>>> <chris.packham@alliedtelesis.co.nz> wrote:
>>>> On 22/11/24 14:58, Chris Packham wrote:
>>>>> Hi Rong,
>>>>>
>>>>> I was just trying some of my in-flight changes against linux-next a=
nd
>>>>> found that my RTL9300* based board no longer boots (nothing on the
>>>>> serial console after U-Boot hands off to the kernel).
>>>>>
>>>>> A bisect between Linus's tree and linux-next/master points to commi=
t
>>>>> d4a7f2510ff4 ("vmlinux.lds.h: Adjust symbol ordering in text output
>>>>> section"). A build on d4a7f2510ff4^ boots successfully. That series=
 is
>>>>> well beyond my area of knowledge, there may be something that the M=
IPS
>>>>> SoCs are doing (or not doing) that is being affected by the section=
s
>>>>> moving.
>>>> Based on the sparc change that accompanied this commit the following
>>>> does seem to restore working order for me:
>>>>
>>>> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlin=
ux.lds.S
>>>> index d575f945d422..e90b0f68290c 100644
>>>> --- a/arch/mips/kernel/vmlinux.lds.S
>>>> +++ b/arch/mips/kernel/vmlinux.lds.S
>>>> @@ -62,6 +62,8 @@ SECTIONS
>>>>            _text =3D .;      /* Text and read-only data */
>>>>            _stext =3D .;
>>>>            .text : {
>>>> +               /* Match text section symbols in head.S first */
>>>> +               *head.o(.text)
>>>>                    TEXT_TEXT
>>>>                    SCHED_TEXT
>>>>                    LOCK_TEXT
>>>>
>>>> No idea if that's appropriate
>>>>

