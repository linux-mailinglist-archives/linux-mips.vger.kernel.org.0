Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3924A3237A9
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 08:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbhBXHIs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Feb 2021 02:08:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbhBXHIm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Feb 2021 02:08:42 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF63FC061786;
        Tue, 23 Feb 2021 23:08:01 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p3so849784wmc.2;
        Tue, 23 Feb 2021 23:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=4z9Ua9yaZY1B+vEfftr92vAlb7jCLF0//9CO61p6vrw=;
        b=XPg3Pm/hIucUrJ/bSkStiZ+oSitZmig/VCwFJex52b/e6osO9pHQ1R5GvVdQPFMqay
         MXynE3WuEankK8f9LvrIpMPE5UdUcJURaUmDLNH+OtF1z2YuaQ0E1fHYkLfnrx7+r6jh
         p7zCPhk7AV7xm4yhui2MRDjqCWxjBB/x0Up3Rb97qCBWv+NoeU8c1hDVJ0VB26QNCD4P
         B310TAJnEemKl0h7pBxWLVZpNYvHp/0Ndx4eAsb2lnziXrqTIw64L2FPPYZkJpul30D4
         LjEFuqxCBTo9UYaqRIa4NkT8XFoaL1ZViLtNXPpSJk+Al73+n41mqEQM/IJyloOmkuUV
         bDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=4z9Ua9yaZY1B+vEfftr92vAlb7jCLF0//9CO61p6vrw=;
        b=D9JGj9hCNFXIMvo6XD8d1kfe49YjzoULch3yrmN4MF/ihsDLT41WoeMLLchSQGQhbS
         m0PN17c4OUJoLryylKY4ThNgNnhT16lUdk0zgrU5HioX6wRn0oVL37o+v4DFGvmNvdEp
         VjANPg7XVen6SbgyNkCiavGkHm3nQo8pJUAFusSte4Uka6ChgYFZDw4HEZITet+Gndbj
         EXT+7aiPKvNXuC5vt4MA8DxthAzQN0zs9opQUKwfeEfQ/6nAwVhUGUnHN6FYyvdorfUD
         I8schTaZJCwYKDu4JPVPlh+w/NXZTDpZ21KtKtuX8tyeVBQWHpwW6kUhKqAbLvIz2Iyp
         6KKg==
X-Gm-Message-State: AOAM532PJy7Hs7nJtEdje6MmCroOvWtrvCymtoV3nxRLEogIZwP8DJmI
        Mu1e3/tKrquL1D/s6amUy5s=
X-Google-Smtp-Source: ABdhPJwyn0swr++Y+TjIV6KoM9yyHGSyjsoba/arMHUwtLWHChWje0vVF3U2CQx0Uyl+9e3UkKCu6A==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr2266895wmi.88.1614150480571;
        Tue, 23 Feb 2021 23:08:00 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id g11sm1328847wmk.32.2021.02.23.23.07.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 23:07:59 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] mips: smp-bmips: fix CPU mappings
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <f4b8718c-ee74-2609-40f6-cb8f62247d51@gmail.com>
Date:   Wed, 24 Feb 2021 08:07:57 +0100
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B471DA5-E911-4B7F-BD9A-CE2901C427FC@gmail.com>
References: <20210223124817.26486-1-noltari@gmail.com>
 <f4b8718c-ee74-2609-40f6-cb8f62247d51@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Florian,

> El 24 feb 2021, a las 4:45, Florian Fainelli <f.fainelli@gmail.com> =
escribi=C3=B3:
>=20
>=20
>=20
> On 2/23/2021 4:48 AM, =C3=81lvaro Fern=C3=A1ndez Rojas wrote:
>> When booting bmips with SMP enabled on a BCM6358 running on CPU #1 =
instead of
>> CPU #0, the current CPU mapping code produces the following:
>> - smp_processor_id(): 0
>> - cpu_logical_map(): 1
>> - cpu_number_map(): 1
>>=20
>> This is because SMP isn't supported on BCM6358 since it has a shared =
TLB, so
>> it is disabled and max_cpus is decreased from 2 to 1.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> arch/mips/kernel/smp-bmips.c | 27 +++++++++++++++++----------
>> 1 file changed, 17 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/arch/mips/kernel/smp-bmips.c =
b/arch/mips/kernel/smp-bmips.c
>> index 359b176b665f..c4760cb48a67 100644
>> --- a/arch/mips/kernel/smp-bmips.c
>> +++ b/arch/mips/kernel/smp-bmips.c
>> @@ -134,17 +134,24 @@ static void __init bmips_smp_setup(void)
>> 	if (!board_ebase_setup)
>> 		board_ebase_setup =3D &bmips_ebase_setup;
>>=20
>> -	__cpu_number_map[boot_cpu] =3D 0;
>> -	__cpu_logical_map[0] =3D boot_cpu;
>> -
>> -	for (i =3D 0; i < max_cpus; i++) {
>> -		if (i !=3D boot_cpu) {
>> -			__cpu_number_map[i] =3D cpu;
>> -			__cpu_logical_map[cpu] =3D i;
>> -			cpu++;
>> +	if (max_cpus > 1) {
>> +		__cpu_number_map[boot_cpu] =3D 0;
>> +		__cpu_logical_map[0] =3D boot_cpu;
>> +
>> +		for (i =3D 0; i < max_cpus; i++) {
>> +			if (i !=3D boot_cpu) {
>> +				__cpu_number_map[i] =3D cpu;
>> +				__cpu_logical_map[cpu] =3D i;
>> +				cpu++;
>> +			}
>> +			set_cpu_possible(i, 1);
>> +			set_cpu_present(i, 1);
>> 		}
>> -		set_cpu_possible(i, 1);
>> -		set_cpu_present(i, 1);
>> +	} else {
>> +		__cpu_number_map[0] =3D boot_cpu;
>> +		__cpu_logical_map[0] =3D 0;
>> +		set_cpu_possible(0, 1);
>> +		set_cpu_possible(0, 1);
>=20
> Duplicate line, with that fixed:

Nice catch, it should be set_cpu_present().

>=20
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> --=20
> Florian

