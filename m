Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 532F01751B5
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 03:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgCBCEs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Mar 2020 21:04:48 -0500
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17936 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726673AbgCBCEr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Mar 2020 21:04:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1583114668;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:From:Message-ID;
        bh=mMC1uPdfeYX2Jh2so2I7L9PUFsM6xuuqs3vfymhcing=;
        b=ge6Bo3dZlkeiQe8u0WNHYTAjcjHu01ROF+1nmamWKqCRrtTQ5x1XISwj9/RB4bdM
        TDMsbvEmiPppxlFneAay19z5FJupxXMVWT/64WJHsllurMhAmxderEGzZGqyy8RegZU
        DtoYMM0E/F//CHLvWl/BRB2VURTEhvE02Zx+xci0=
Received: from [10.233.233.252] (115.196.12.109 [115.196.12.109]) by mx.zoho.com.cn
        with SMTPS id 1583114665825426.14434295989224; Mon, 2 Mar 2020 10:04:25 +0800 (CST)
Date:   Mon, 02 Mar 2020 10:04:20 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <20200301014119.62733-1-syq@debian.org>
References: <20200301014119.62733-1-syq@debian.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Use ELF_BASE_PLATFORM to pass ISA level
To:     YunQiang Su <syq@debian.org>, linux-mips@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <CF081EAC-DDEF-40BD-BA14-97CEBBEB9B10@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=881=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=889:=
41:19, YunQiang Su <syq@debian=2Eorg> =E5=86=99=E5=88=B0:
>Some userland application/program runtime/dynamic loaded need to
>know about the current ISA level to use the best runtime=2E
>While kernel doesn't provides this info=2E
>
>ELF_PLATFORM only provides some info about the CPU, with very few info,
>for example, the value is "mips" for both 24Kc and P6600=2E
>
>Currently ELF_BASE_PLATFORM is not used by MIPS (only by powerpc)=2E
>So we cant set its value as:
>  mips2, mips3, mips4, mips5,
>  mips32, mips32r2, mips32r6
>  mips64, mips64r2, mips64r6
>Then in userland, we can get it by:
>  getauxval(AT_BASE_PLATFORM)
>
>The only problem is that it seems has different defination than ppc:
>  on ppc, it is the mircoarchitecture
>while now we use it as ISA level on MIPS=2E

Reviewed-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>

It helps a lot=2E

Btw: You forgot your signoff=2E

>---
> arch/mips/include/asm/elf=2Eh  |  3 +++
> arch/mips/kernel/cpu-probe=2Ec | 18 ++++++++++++++++++
> 2 files changed, 21 insertions(+)
>
>diff --git a/arch/mips/include/asm/elf=2Eh b/arch/mips/include/asm/elf=2E=
h
>index f8f44b1a6cbb=2E=2E5aa29ced6970 100644
>--- a/arch/mips/include/asm/elf=2Eh
>+++ b/arch/mips/include/asm/elf=2Eh
>@@ -445,6 +445,9 @@ extern unsigned int elf_hwcap;
> #define ELF_PLATFORM  __elf_platform
> extern const char *__elf_platform;
>=20
>+#define ELF_BASE_PLATFORM  __elf_base_platform
>+extern const char *__elf_base_platform;
>+
> /*
>  * See comments in asm-alpha/elf=2Eh, this is the same thing
>  * on the MIPS=2E
>diff --git a/arch/mips/kernel/cpu-probe=2Ec
>b/arch/mips/kernel/cpu-probe=2Ec
>index 6ab6b03d35ba=2E=2E925cc1c9bb04 100644
>--- a/arch/mips/kernel/cpu-probe=2Ec
>+++ b/arch/mips/kernel/cpu-probe=2Ec
>@@ -513,6 +513,13 @@ static inline void set_elf_platform(int cpu, const
>char *plat)
> 		__elf_platform =3D plat;
> }
>=20
>+static inline void set_elf_base_platform(const char *plat)
>+{
>+	if(__elf_base_platform =3D=3D NULL) {
>+		__elf_base_platform =3D plat;
>+	}
>+}
>+
> static inline void cpu_probe_vmbits(struct cpuinfo_mips *c)
> {
> #ifdef __NEED_VMBITS_PROBE
>@@ -527,36 +534,46 @@ static void set_isa(struct cpuinfo_mips *c,
>unsigned int isa)
> 	switch (isa) {
> 	case MIPS_CPU_ISA_M64R2:
> 		c->isa_level |=3D MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2;
>+		set_elf_base_platform("mips64r2");
> 		/* fall through */
> 	case MIPS_CPU_ISA_M64R1:
> 		c->isa_level |=3D MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1;
>+		set_elf_base_platform("mips64");
> 		/* fall through */
> 	case MIPS_CPU_ISA_V:
> 		c->isa_level |=3D MIPS_CPU_ISA_V;
>+		set_elf_base_platform("mips5");
> 		/* fall through */
> 	case MIPS_CPU_ISA_IV:
> 		c->isa_level |=3D MIPS_CPU_ISA_IV;
>+		set_elf_base_platform("mips4");
> 		/* fall through */
> 	case MIPS_CPU_ISA_III:
> 		c->isa_level |=3D MIPS_CPU_ISA_II | MIPS_CPU_ISA_III;
>+		set_elf_base_platform("mips3");
> 		break;
>=20
> 	/* R6 incompatible with everything else */
> 	case MIPS_CPU_ISA_M64R6:
> 		c->isa_level |=3D MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6;
>+		set_elf_base_platform("mips64r6");
> 		/* fall through */
> 	case MIPS_CPU_ISA_M32R6:
> 		c->isa_level |=3D MIPS_CPU_ISA_M32R6;
>+		set_elf_base_platform("mips32r6");
> 		/* Break here so we don't add incompatible ISAs */
> 		break;
> 	case MIPS_CPU_ISA_M32R2:
> 		c->isa_level |=3D MIPS_CPU_ISA_M32R2;
>+		set_elf_base_platform("mips32r2");
> 		/* fall through */
> 	case MIPS_CPU_ISA_M32R1:
> 		c->isa_level |=3D MIPS_CPU_ISA_M32R1;
>+		set_elf_base_platform("mips32");
> 		/* fall through */
> 	case MIPS_CPU_ISA_II:
> 		c->isa_level |=3D MIPS_CPU_ISA_II;
>+		set_elf_base_platform("mips2");
> 		break;
> 	}
> }
>@@ -2113,6 +2130,7 @@ EXPORT_SYMBOL(__ua_limit);
>=20
> const char *__cpu_name[NR_CPUS];
> const char *__elf_platform;
>+const char *__elf_base_platform =3D NULL;
>=20
> void cpu_probe(void)
> {

--=20
Jiaxun Yang
