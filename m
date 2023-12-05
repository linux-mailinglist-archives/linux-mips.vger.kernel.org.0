Return-Path: <linux-mips+bounces-545-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E1805A06
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 17:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8450B211A2
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 16:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145CC38E;
	Tue,  5 Dec 2023 16:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QnLp8DxB"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F8A129;
	Tue,  5 Dec 2023 08:34:47 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CAC49FF805;
	Tue,  5 Dec 2023 16:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701794086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uwdqih8d4ChJEVJBX1tE0PIM7+9cgSue2Go+/HkBFxA=;
	b=QnLp8DxBW+vkkFhgEGG5u30oDPIp1UJ1ZIgMiIHL6+ulgLjy0fhQKhNulokopgfNUdsCds
	I2owO3Rqq562ImCeO6pWMbaCXyD9QSk+etF1ovgJDyJwt/zxrtoxsGJtHhEBaoylHnslR0
	KR/bZcCkV92lwJ0RZ97+LcqYP8JMNoB/Wh8gpv1VHjYJqWZvYrDPcHSk4lC6pxQHgb4G9u
	vk4HCxcd8MQq09dR2qupsSdF7vT1ZqWZRAiYPCneHu+snktyVXG3Yb6A826GJZS1KrvGbH
	D+etNxgfJktOAsN1WeYsDX3R6bdnhJw2HB26Nx42jFhMRjOhe4Or6Df84QjKpQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To:  Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Paul Burton <paulburton@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Vladimir
  Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/22] MIPS: Refactor mips_cps_core_entry implementation
In-Reply-To: <20231201111512.803120-7-gregory.clement@bootlin.com>
References: <20231201111512.803120-1-gregory.clement@bootlin.com>
 <20231201111512.803120-7-gregory.clement@bootlin.com>
Date: Tue, 05 Dec 2023 17:34:45 +0100
Message-ID: <87lea8ehga.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hello Jiaxun,

> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Now the exception vector for CPS systems are allocated on-fly
> with memblock as well.
>
> It will try to allocate from KSEG1 first, and then try to allocate
> in low 4G if possible.
>
> The main reset vector is now generated by uasm, to avoid tons
> of patches to the code. Other vectors are copied to the location
> later.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
[...]


> diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
[...]

> +static int __init setup_cps_vecs(void)
> +{
> +	extern void excep_tlbfill(void);
> +	extern void excep_xtlbfill(void);
> +	extern void excep_cache(void);
> +	extern void excep_genex(void);
> +	extern void excep_intex(void);
> +	extern void excep_ejtag(void);
> +	phys_addr_t cps_vec_pa;
> +	void *cps_vec;
> +
> +	/* Try to allocate in KSEG1 first */
> +	cps_vec_pa =3D memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN,
> +						0x0, KSEGX_SIZE - 1);
> +
> +	if (cps_vec_pa)
> +		core_entry_reg =3D CKSEG1ADDR(cps_vec_pa) &
> +					CM_GCR_Cx_RESET_BASE_BEVEXCBASE;
> +
> +	if (!cps_vec_pa && mips_cm_is64) {
> +		cps_vec_pa =3D memblock_phys_alloc_range(BEV_VEC_SIZE, BEV_VEC_ALIGN,
> +							0x0, SZ_4G - 1);
> +		if (cps_vec_pa)
> +			core_entry_reg =3D (cps_vec_pa & CM_GCR_Cx_RESET_BASE_BEVEXCBASE) |
> +					CM_GCR_Cx_RESET_BASE_MODE;
> +	}
> +
> +	if (!cps_vec_pa)
> +		return -ENOMEM;
> +
> +	/* We want to ensure cache is clean before writing uncached mem */
> +	blast_dcache_range(TO_CAC(cps_vec_pa), TO_CAC(cps_vec_pa) + BEV_VEC_SIZ=
E);
> +	bc_wback_inv(TO_CAC(cps_vec_pa), BEV_VEC_SIZE);
> +	__sync();
> +
> +	cps_vec =3D (void *)TO_UNCAC(cps_vec_pa);

Following your remark about the configuration for generic mips32[1]. I made
some changes and tried to build with the following command:
make 32r6el_defconfig; make

I got the follower error:
arch/mips/kernel/smp-cps.c: In function =E2=80=98setup_cps_vecs=E2=80=99:
arch/mips/kernel/smp-cps.c:162:19: error: cast to pointer from integer of d=
ifferent size [-Werror=3Dint-to-pointer-cast]

The issue comes from the TO_UNCAC macro that use the TO_PHYS_MASK macro
which is 64 bits, so it turn the size of TO_UNCAC() to 8 bytes while the
size of a pointer is 4 bytes.

Actually it show that TO_UNCAC was created to be only used for 64 bits,
and it was only your patch "MIPS: spaces: Define a couple of handy
macros" that made possible to use in 32 bit case.

Did you mange to build a kernel in 32 bits configuration ?
Maybe you had a local patch that made it possible.

I propose the following fix to squash into the patch "MIPS: spaces:
Define a couple of handy macros" , what do you think of it?

diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/includ=
e/asm/mach-generic/spaces.h
index 05db19521e817..4884199d8b8c4 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -49,6 +49,9 @@
 #define HIGHMEM_START          _AC(0x20000000, UL)
 #endif
=20
+#define TO_UNCAC(x)            CKSEG1ADDR(x)
+#define TO_CAC(x)              CKSEG0ADDR(x)
+
 #endif /* CONFIG_32BIT */
=20
 #ifdef CONFIG_64BIT
@@ -78,12 +81,12 @@
 #define HIGHMEM_START          (_AC(1, UL) << _AC(59, UL))
 #endif
=20
+#define TO_UNCAC(x)            (UNCAC_BASE | ((x) & TO_PHYS_MASK))
+#define TO_CAC(x)              (CAC_BASE   | ((x) & TO_PHYS_MASK))
 #define TO_PHYS(x)             (             ((x) & TO_PHYS_MASK))
=20
 #endif /* CONFIG_64BIT */
=20
-#define TO_CAC(x)              (CAC_BASE   | ((x) & TO_PHYS_MASK))
-#define TO_UNCAC(x)            (UNCAC_BASE | ((x) & TO_PHYS_MASK))
=20
 /*
  * This handles the memory map.


[1]:https://lore.kernel.org/linux-mips/4eb150cf-3fb7-41c8-accc-06b13e46f086=
@app.fastmail.com/

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

