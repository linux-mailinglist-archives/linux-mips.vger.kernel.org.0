Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8803C7E777
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2019 03:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbfHBB0b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Aug 2019 21:26:31 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:42148 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727848AbfHBB0b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Aug 2019 21:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1564709188; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tqs00IvwAUuNG1/o0XrrcExWnhM0hU9Bm1hUk2AUxSA=;
        b=Wrb9nSrl5dCse4Akk5HN5AhTvb8TejEDjIfYHy/A+ME5YeItHVZNcqraivenbMwCinNgij
        GLMIJK0sK0IRtBZBpoEoln2HUJyiQvXNf9ID5e1/k1Q3oVA6sPlfrsSii4ZEqO3E5zRAw6
        CKlgxnAEYm/yQ2dphvfG13atXS4xh+A=
Date:   Thu, 01 Aug 2019 21:26:09 -0400
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2 v3] MIPS: Ingenic: Fix bugs when calculate
 bogomips/lpj.
To:     Zhou Yanjie <zhouyanjie@zoho.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, chenhc@lemote.com,
        jiaxun.yang@flygoat.com
Message-Id: <1564709169.1988.0@crapouillou.net>
In-Reply-To: <1564661791-47731-3-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
        <1564661791-47731-1-git-send-email-zhouyanjie@zoho.com>
        <1564661791-47731-3-git-send-email-zhouyanjie@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,



Le jeu. 1 ao=FBt 2019 =E0 8:16, Zhou Yanjie <zhouyanjie@zoho.com> a=20
=E9crit :
> Enable BTB lookups for short loops to fix bugs when calculate
> bogomips and loops_per_jiffy.

The commit description and the code comment below seem to say two
different things. Are we enabling the BTB lookup optimization, or not?

Also, maybe change the commit title to something more meaningful, e.g.
"MIPS: ingenic: Disable broken BTB lookup optimization" or similar.


> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  arch/mips/include/asm/mipsregs.h | 4 ++++
>  arch/mips/kernel/cpu-probe.c     | 7 +++++++
>  2 files changed, 11 insertions(+)
>=20
> diff --git a/arch/mips/include/asm/mipsregs.h=20
> b/arch/mips/include/asm/mipsregs.h
> index 1e6966e..bdbdc19 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -689,6 +689,9 @@
>  #define MIPS_CONF7_IAR		(_ULCAST_(1) << 10)
>  #define MIPS_CONF7_AR		(_ULCAST_(1) << 16)
>=20
> +/* Ingenic Config7 bits */
> +#define MIPS_CONF7_BTB_LOOP_EN	(_ULCAST_(1) << 4)
> +
>  /* Config7 Bits specific to MIPS Technologies. */
>=20
>  /* Performance counters implemented Per TC */
> @@ -2813,6 +2816,7 @@ __BUILD_SET_C0(status)
>  __BUILD_SET_C0(cause)
>  __BUILD_SET_C0(config)
>  __BUILD_SET_C0(config5)
> +__BUILD_SET_C0(config7)
>  __BUILD_SET_C0(intcontrol)
>  __BUILD_SET_C0(intctl)
>  __BUILD_SET_C0(srsmap)
> diff --git a/arch/mips/kernel/cpu-probe.c=20
> b/arch/mips/kernel/cpu-probe.c
> index eb527a1..2bdd3e1 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1964,6 +1964,13 @@ static inline void cpu_probe_ingenic(struct=20
> cpuinfo_mips *c, unsigned int cpu)
>  		c->cputype =3D CPU_XBURST;
>  		c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>  		__cpu_name[cpu] =3D "Ingenic XBurst";
> +		/*
> +		 * The XBurst core by default attempts to avoid branch target
> +		 * buffer lookups by detecting & special casing loops. This
> +		 * feature will cause BogoMIPS and lpj calculate in error.
> +		 * Set cp0 config7 bit 4 to disable this feature.
> +		 */
> +		set_c0_config7(MIPS_CONF7_BTB_LOOP_EN);

Shouldn't it be MIPS_CONF7_BTB_LOOP_DIS then?
Since the feature is disabled when the bit is set.


>  		break;
>  	default:
>  		panic("Unknown Ingenic Processor ID!");
> --
> 2.7.4
>=20
>=20

=

