Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 577A67CEB0
	for <lists+linux-mips@lfdr.de>; Wed, 31 Jul 2019 22:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbfGaUef (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Jul 2019 16:34:35 -0400
Received: from mail-eopbgr730110.outbound.protection.outlook.com ([40.107.73.110]:31959
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729340AbfGaUef (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 31 Jul 2019 16:34:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4m7FVPf5KMquzDsuItdEL4Dh2TmD2ZGvP2C8q7PjAnPSFWOmh7nUEhfZVePkas+fmsFbLHc2J6wHB4YN9kEmPLJ0W+A5ipeyS19827AVJ3WbuGPQqnXi8jkuVYklA8FDzBAUhDwuaVE5/Ma/v1rvJoESoWyyC4DkB/KsvtV+5DKvzLo831Z1N6O6AobJE3xMdBL+q7PY15lucl2xhy2YbdG9rq03ubiFYrt4RoYHgn9qRJqqoVgn+LGnh+EzfOQkVm1IeSpte9kpm2cPcznzOXOdhgSy9TjUaFBC0mBZniVoNv1ChOa0G7WCzAviuPaFWuB2kbK9cw8sycLYhDMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BSfW6/Z3wrZCTd3uLN61GiVLqK50SlDJgLKJ4C2i70=;
 b=oHGRW9FuLXV/kub2RYnWEL0SMIp2A+UYrcVJ0V5X+2Kp2cqPijrvy2jZWmuzjfUsTbRCaiwlgh3oqOlmn8Z1g8xcAkdTdJCttf5sbTm82n2t2GA6Ph3U6MqaMOFkDEzXy2YSVJoSIlZza1HcUb9dGa4MOCeHHScoI+kIOyJXCBdqAJCv+sloQddB6iqxArmNKPObxzuEtehRutgh7HFYTF9UvZ+DNF8L6UOYYoY7UGUpS2KOmeqi9oxsWhAb19u1U77zprrcVnRMjvzEC4/j6AjGicUlf2D1DJ1jzaGnKzbDnhxCCfBWUS1JJL25IEcf3AsCMpsLMU1xLUHFkQKGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=wavecomp.com;dmarc=pass action=none
 header.from=mips.com;dkim=pass header.d=mips.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BSfW6/Z3wrZCTd3uLN61GiVLqK50SlDJgLKJ4C2i70=;
 b=krFrURZJo932C9SG1Gzr2UlMeJghsxUyrfj8Q7BX32CfqlQx4k98NKIRgH2ZTQ9/v8Kpsgfn8hdTnLJlgBiLZFru3sfRz3ZVp/OBn3XAoNTO49YLQL6r1vPHkrgzjdMx1tz+l47EFihgJ0Qiivu0FDZZj7B9Eud++xJoiMSfmNU=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1397.namprd22.prod.outlook.com (10.171.217.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 20:34:32 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::c99b:131e:aaf3:bd81]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::c99b:131e:aaf3:bd81%4]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 20:34:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Zhou Yanjie <zhouyanjie@zoho.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "malat@debian.org" <malat@debian.org>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "allison@lohutok.net" <allison@lohutok.net>,
        "syq@debian.org" <syq@debian.org>,
        "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2] MIPS: Ingenic: Fix bugs when detecting X1000's
 parameters.
Thread-Topic: [PATCH v2] MIPS: Ingenic: Fix bugs when detecting X1000's
 parameters.
Thread-Index: AQHVR99bmOUmcWzJY0ul5K4ZfQQScQ==
Date:   Wed, 31 Jul 2019 20:34:31 +0000
Message-ID: <20190731203430.2wst6pivwxnmtt74@pburton-laptop>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564547943-27505-1-git-send-email-zhouyanjie@zoho.com>
 <1564547943-27505-2-git-send-email-zhouyanjie@zoho.com>
In-Reply-To: <1564547943-27505-2-git-send-email-zhouyanjie@zoho.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CO2PR07CA0078.namprd07.prod.outlook.com (2603:10b6:100::46)
 To CY4PR2201MB1272.namprd22.prod.outlook.com (2603:10b6:910:6e::23)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4793c0e0-d533-41e0-b56c-08d715f67de8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR2201MB1397;
x-ms-traffictypediagnostic: CY4PR2201MB1397:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR2201MB1397A1397BA1723380F11A8DC1DF0@CY4PR2201MB1397.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(7916004)(366004)(136003)(396003)(376002)(346002)(39850400004)(189003)(199004)(102836004)(2906002)(7736002)(14454004)(44832011)(7416002)(186003)(446003)(64756008)(6246003)(53936002)(66446008)(66946007)(6116002)(68736007)(476003)(66476007)(6306002)(66556008)(42882007)(9686003)(6512007)(11346002)(4326008)(1076003)(76176011)(3846002)(26005)(66066001)(256004)(8936002)(81156014)(6916009)(52116002)(8676002)(6486002)(81166006)(71200400001)(33716001)(25786009)(58126008)(71190400001)(966005)(316002)(486006)(54906003)(229853002)(305945005)(5660300002)(478600001)(6436002)(386003)(6506007)(99286004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1397;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YbRDpOni2q8NnFAXM529VpZnaPAsBMpsD3VK/Bm704IvYIErxDVbKER3iFQtn6XoElOx4YPFm22VhwAe1mikj6Xe/qTOdPphH0xNkXcaxL5W0ERcfqAUOwLgzOnBjtvDnozM2y3JASbkuXZJY/etmoQ/mYFRcF9p2qFiBtsW/WgeVryZEvbuOqyopSYN0aQ8ZZFL6EHh0flEvxfsxyjAJzZqIxdrNmkyP4YiNaxD3FZk93iz4HVD8pS4lw0ye8VSMy4nc/ms/GfsDHHd/LYJ8pk3zWZJ6IG/WPzHGe3GkRM3/q1dS2aNL598NhPysttLaIGQ/CjIJWeD0k799cAw4Nl9sNq93KaM+j6KPLpgvP6ffpUHW4On91b7HEUkf2pUxDvLoQZKqBHNLka/abjh2NAdWGjbGI1/dJrudj8ge00=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8F169B8AF37D1046B1FBC2978DD34814@namprd22.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4793c0e0-d533-41e0-b56c-08d715f67de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 20:34:31.9693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1397
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

On Wed, Jul 31, 2019 at 12:39:03PM +0800, Zhou Yanjie wrote:
> 1.fix bugs when detecting L2 cache sets value.
> 2.fix bugs when detecting L2 cache ways value.
> 3.fix bugs when calculate bogoMips and loops_per_jiffy.

This should be split into 2 patches - one that fixes the L2 cache
detection problems, and possibly one that fixes the bogomips/lpj issue.

> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
> ---
>  arch/mips/include/asm/mipsregs.h |  1 +
>  arch/mips/kernel/cpu-probe.c     |  7 +++++++
>  arch/mips/mm/sc-mips.c           | 18 +++++++++++++++---
>  3 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mip=
sregs.h
> index 1e6966e..01e0fcb 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -2813,6 +2813,7 @@ __BUILD_SET_C0(status)
>  __BUILD_SET_C0(cause)
>  __BUILD_SET_C0(config)
>  __BUILD_SET_C0(config5)
> +__BUILD_SET_C0(config7)
>  __BUILD_SET_C0(intcontrol)
>  __BUILD_SET_C0(intctl)
>  __BUILD_SET_C0(srsmap)
> diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
> index eb527a1..547c9a0 100644
> --- a/arch/mips/kernel/cpu-probe.c
> +++ b/arch/mips/kernel/cpu-probe.c
> @@ -1964,6 +1964,13 @@ static inline void cpu_probe_ingenic(struct cpuinf=
o_mips *c, unsigned int cpu)
>  		c->cputype =3D CPU_XBURST;
>  		c->writecombine =3D _CACHE_UNCACHED_ACCELERATED;
>  		__cpu_name[cpu] =3D "Ingenic XBurst";
> +		/*
> +		 * config7 bit 4 is used to control a low-power mode in
> +		 * XBurst architecture. This mode may cause errors in the
> +		 * calculation of bogomips and loops_per_jiffy, set config7
> +		 * bit 4 to disable this feature to prevent that.
> +		 */
> +		set_c0_config7(BIT(4));

I happen to know what this bit does - see this old patch for an
explanation:

  https://github.com/paulburton/linux/commit/0d72377bd615d00e99733adc0d37e6=
a2373fcde7

In short it disables a loop optimization in the CPU that is supposed to
special case loops & prevent them from relying upon the BTB.
Unfortunately that loop optimization negatively affects short loops,
such as in __delay(), and Ingenic's vendor kernels have generally set
this bit to disable it.

Note though that bogomips is bogus, so changing the bogomips value is
really not good justification for the patch at all (which is why I've so
far not bothered upstreaming the patch linked above). The best
justification I can think of is that Ingenic set the bit in their
downstream kernels, which presumably means it's beneficial overall (or
just that someone cares too much about bogomips).

In any case, one thing I don't know for sure is which CPU versions are
affected. I don't believe this affected older devices like the JZ4740,
and my copy of the XBurst1 CPU Core Programming Manual documents the bit
as reserved. Given that you're seeing the X1000 is affected, and I know
the JZ4780 is affected, that covers at least 2 different PRIDs so we
can't just check for that.

Hopefully writing to the bit is just a no-op on older systems if it is
actually reserved, but it'd be great if we could test that.

At the very least we should define the bit in asm/mipsregs.h & properly
document what it does - using BIT(4) here may be a little nicer than
(1<<4), but it's still just a magic number. I don't mind if you want to
fix your patch to do that, or one of us can resurrect mine which has
that information already.

>  		break;
>  	default:
>  		panic("Unknown Ingenic Processor ID!");
> diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
> index 9385ddb..ed953d4 100644
> --- a/arch/mips/mm/sc-mips.c
> +++ b/arch/mips/mm/sc-mips.c
> @@ -215,6 +215,14 @@ static inline int __init mips_sc_probe(void)
>  	else
>  		return 0;
> =20
> +	/*
> +	 * According to config2 it would be 512-sets, but that is contradicted
> +	 * by all documentation.
> +	 */
> +	if (current_cpu_type() =3D=3D CPU_XBURST &&
> +				mips_machtype =3D=3D MACH_INGENIC_X1000)
> +		c->scache.sets =3D 256;
> +
>  	tmp =3D (config2 >> 0) & 0x0f;
>  	if (tmp <=3D 7)
>  		c->scache.ways =3D tmp + 1;
> @@ -225,9 +233,13 @@ static inline int __init mips_sc_probe(void)
>  	 * According to config2 it would be 5-ways, but that is contradicted
>  	 * by all documentation.
>  	 */
> -	if (current_cpu_type() =3D=3D CPU_XBURST &&
> -				mips_machtype =3D=3D MACH_INGENIC_JZ4770)
> -		c->scache.ways =3D 4;
> +	if (current_cpu_type() =3D=3D CPU_XBURST) {
> +		switch (mips_machtype) {
> +		case MACH_INGENIC_JZ4770:
> +		case MACH_INGENIC_X1000:
> +			c->scache.ways =3D 4;
> +		}
> +	}
> =20
>  	c->scache.waysize =3D c->scache.sets * c->scache.linesz;
>  	c->scache.waybit =3D __ffs(c->scache.waysize);

Given that we need to fix up both sets & ways, I think this would be
cleaner if both were done in the switch statement here after we've read
the values from Config2. ie. something like:

	if (current_cpu_type() =3D=3D CPU_XBURST) {
		switch (mips_machtype) {
		case MACH_INGENIC_JZ4770:
			c->scache.ways =3D 4;
			break;

		case MACH_INGENIC_X1000:
			c->scache.sets =3D 256;
			c->scache.ways =3D 4;
			break;
		}
	}

With appropriate comments added for each machine/SoC.

Thanks,
    Paul
