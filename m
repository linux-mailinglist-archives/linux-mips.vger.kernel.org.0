Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FC3326C02
	for <lists+linux-mips@lfdr.de>; Sat, 27 Feb 2021 07:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhB0Gs1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Feb 2021 01:48:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhB0Gs0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 27 Feb 2021 01:48:26 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313FCC06174A;
        Fri, 26 Feb 2021 22:47:46 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id r3so10661690wro.9;
        Fri, 26 Feb 2021 22:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:content-transfer-encoding:mime-version:subject:date:references
         :to:in-reply-to:message-id;
        bh=F9ny4jQTCeFtjViuEvQMbnhYKNWR/5nTD8Caa29xSeY=;
        b=aiG54aljaWyk1GYdsHS05xajJZEgCKmqBh6YipyN6IDUqf5VbuIVgTc2lpsXsk0nOo
         L/LiJNOmndQ/TjXHPTLwLc+FFArOfvaf1TRUQLt0gMT+GH28kCKABw4OJE9NI5eL5iGd
         QHqO30w2eeIMVyxcEueki5vWcAThdNOt3Gkj+mRUixCI3YNdZNAyvPAKt0q8JcY0ABMu
         VKwbfGz9/8m1X3OC5eNIUJAmyniw3Yx4+9x+KwIpnOXSMTxh5iAu8oMU3plf0Fppemyh
         KE8An79P1BwcXw9xPwQZfiPSaYQtq5LSrNur1gfu3NjQKEZYvQ98IQSV6qQd/BrtpYVa
         8j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:date:references:to:in-reply-to:message-id;
        bh=F9ny4jQTCeFtjViuEvQMbnhYKNWR/5nTD8Caa29xSeY=;
        b=jSL3RvuoA2s86zJdMBTsXd2WkRHYNnSaquKs/ATyigR2Qxg6fFmGlGrVnKnFNgfObW
         5TUN/vLmLgOfw8/P0Ta+y3dGssbUXaCaCRUvzj06WFvf0oY+T9iNuBPZnMPOsV35HNEj
         hLhQSSC+2bobFyyUkaBVBQnJIiNIQg6Kx4/sUM7pbdkrtIIqt4NfclMsE15Goafo/p66
         k/wU/Enlok1y/aEMstn4aaCs957MDbl7EFw1/Z9Z7UXiglL1E0h2/NO0YQgNie7uMd5n
         S/q18hYEgYPHCFPs3y4SpPHwBygDomPBKOgVQXD0qZHRmXEMyV4B8EOdJiBtzQswAh12
         dlrw==
X-Gm-Message-State: AOAM533tAZEUMdrKHkVrOV16lXeVFNxSpOIfopYUrVgYBVM8wbfO/vyl
        r+n8wTK1xfJaycbNq5SbYyo=
X-Google-Smtp-Source: ABdhPJwNahhs7PGMrH0V3yPNBo1ZBibcxA7EC2sItE4aR88pprl+rlN/P4xhHMgF6ribfPm+X1j4aQ==
X-Received: by 2002:a05:6000:1819:: with SMTP id m25mr2474961wrh.169.1614408464708;
        Fri, 26 Feb 2021 22:47:44 -0800 (PST)
Received: from macbook-pro-alvaro.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id f7sm17054139wrm.92.2021.02.26.22.47.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2021 22:47:44 -0800 (PST)
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] mips: smp-bmips: fix CPU mappings
Date:   Sat, 27 Feb 2021 07:47:42 +0100
References: <20210223124817.26486-1-noltari@gmail.com>
 <20210224073336.32265-1-noltari@gmail.com>
To:     Jonas Gorski <jonas.gorski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210224073336.32265-1-noltari@gmail.com>
Message-Id: <F06822DE-1335-40E8-944D-CACC423FAB87@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

Apparently, this patch was flagged as "Not Applicable" without an =
explanation. Why?
=
https://patchwork.kernel.org/project/linux-mips/patch/20210224073336.32265=
-1-noltari@gmail.com/

Best regarss,
=C3=81lvaro.

> El 24 feb 2021, a las 8:33, =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com> escribi=C3=B3:
>=20
> When booting bmips with SMP enabled on a BCM6358 running on CPU #1 =
instead of
> CPU #0, the current CPU mapping code produces the following:
> - smp_processor_id(): 0
> - cpu_logical_map(0): 1
> - cpu_number_map(0): 1
>=20
> This is because SMP isn't supported on BCM6358 since it has a shared =
TLB, so
> it is disabled and max_cpus is decreased from 2 to 1.
>=20
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> v2: Fix duplicated line
>=20
> arch/mips/kernel/smp-bmips.c | 27 +++++++++++++++++----------
> 1 file changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/mips/kernel/smp-bmips.c =
b/arch/mips/kernel/smp-bmips.c
> index 359b176b665f..b6ef5f7312cf 100644
> --- a/arch/mips/kernel/smp-bmips.c
> +++ b/arch/mips/kernel/smp-bmips.c
> @@ -134,17 +134,24 @@ static void __init bmips_smp_setup(void)
> 	if (!board_ebase_setup)
> 		board_ebase_setup =3D &bmips_ebase_setup;
>=20
> -	__cpu_number_map[boot_cpu] =3D 0;
> -	__cpu_logical_map[0] =3D boot_cpu;
> -
> -	for (i =3D 0; i < max_cpus; i++) {
> -		if (i !=3D boot_cpu) {
> -			__cpu_number_map[i] =3D cpu;
> -			__cpu_logical_map[cpu] =3D i;
> -			cpu++;
> +	if (max_cpus > 1) {
> +		__cpu_number_map[boot_cpu] =3D 0;
> +		__cpu_logical_map[0] =3D boot_cpu;
> +
> +		for (i =3D 0; i < max_cpus; i++) {
> +			if (i !=3D boot_cpu) {
> +				__cpu_number_map[i] =3D cpu;
> +				__cpu_logical_map[cpu] =3D i;
> +				cpu++;
> +			}
> +			set_cpu_possible(i, 1);
> +			set_cpu_present(i, 1);
> 		}
> -		set_cpu_possible(i, 1);
> -		set_cpu_present(i, 1);
> +	} else {
> +		__cpu_number_map[0] =3D boot_cpu;
> +		__cpu_logical_map[0] =3D 0;
> +		set_cpu_possible(0, 1);
> +		set_cpu_present(0, 1);
> 	}
> }
>=20
> --=20
> 2.20.1
>=20

