Return-Path: <linux-mips+bounces-3991-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3802F91AE70
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 19:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E37332853E4
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 17:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0503D19AA74;
	Thu, 27 Jun 2024 17:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCiWXR9K"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC2519AA65;
	Thu, 27 Jun 2024 17:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510500; cv=none; b=h9FHshVkcsQJ4r49trFFx1vW3Q+/eHI+IVBr+8qABrDqbxEKCIyJqdjL62+ez+4bpmvvLOkcTAoC2ea3g0fVjrZSPyKJJ/9bXoNeYF4GDAkgEdteSEfQs71Qm77nl3Md8fnFXyF6kAo3nKAFR2oyEvG3olmkd3ghLj1E99w1s6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510500; c=relaxed/simple;
	bh=7PmzWQkmMO3Dn1RO3gbp/FgtsLrjZ6ti7V62R7Rxfsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5bGWpcyJ9eF8Zr27y9Eoy/bzaMYnvpuX3x+TCqu7bwMIT/n2X/FqUsYD1xidecwFDCwZ2s9XDKNb+kkj6P5IiRE4sVUxyURnlnRVpuRexCS9/ApTM3XA26I0EH06l/0AnAgRkpHm6KLQT9IIRL30y1Vq/cdbqSMXePK2iaKYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCiWXR9K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C6FC4AF07;
	Thu, 27 Jun 2024 17:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510499;
	bh=7PmzWQkmMO3Dn1RO3gbp/FgtsLrjZ6ti7V62R7Rxfsc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eCiWXR9KMoz9cZXBt0bYVwje8vrZth4Fohylmz1hB6HNUh7ZPyqDYibF+OrhrFR97
	 e6eMe2+qTIeCKwK2JNY9Hb08zWAeftt+a4j0Nn/VDkeaSKkgJLe1xnXFTZx/5nATIS
	 RHb+6r0KR4dzCtKvgnKr+46u/fUbBAKv+Hss2+vFFxN8vmIh7Is/KYXfJAns4X9E+n
	 ZvVwdMrx3yPf4AeMPAI3Rj68kQvAh1fD1gHQ2/COFcCkdqTHYg2UJXCvfueJwEP/0A
	 TdREQMP/w58gA3M9X5n6L3TEGKbZPaOjkYFzhWAyI+NF2a0qeAWQErZcunxCaGaQlr
	 tPEc4z0kDzztQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52db11b1d31so3378967e87.0;
        Thu, 27 Jun 2024 10:48:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNu/YXVbaKtshz1FgBVb3GaLrN1D6wJ9LwvHQ3qtRNmnulsf8Py+lJlh6Ni9nKpJ80vpmHdmD0orpDQys5TpN9BG32PaUzahek6XrO4CinUDP3j5E42gMlJpnmKyiN/rI3lCjzqQI/IeDttL27j2NUurt/aV/8PaIxNjRmVrKwiL66vAk=
X-Gm-Message-State: AOJu0Yznc7TUiTNg3p+fHIZgoxdo+x83AniYDsF2YQMsWJ4vE55HjQEh
	qjOA6TOO+/B+IYHYZv8AR0gKPIrgztWHvQGxFUnNP13lP0RH50C0G356QTEC0a94MPGtjkafVKi
	tImMcb7b0LXQgagNrZmENCJ0POA==
X-Google-Smtp-Source: AGHT+IF3/jp/Se8SW3GtFuTT+mhw6PLtTffimJ68HQJOQJw6GO4rJiW1gpfVQofLoFVj0WF7muLIr/yZ3J7+kg1ZnfM=
X-Received: by 2002:a19:6b08:0:b0:52c:8944:2427 with SMTP id
 2adb3069b0e04-52cdf7f65f3mr9553120e87.31.1719510497932; Thu, 27 Jun 2024
 10:48:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627043317.3751996-1-chris.packham@alliedtelesis.co.nz> <20240627043317.3751996-9-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20240627043317.3751996-9-chris.packham@alliedtelesis.co.nz>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Jun 2024 11:48:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKGJ_MNbfuApdziDusYzYoFC3LD_zqkt1ZkWL4AWkjVrw@mail.gmail.com>
Message-ID: <CAL_JsqKGJ_MNbfuApdziDusYzYoFC3LD_zqkt1ZkWL4AWkjVrw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] mips: generic: add fdt fixup for Realtek reference board
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: tglx@linutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	tsbogend@alpha.franken.de, daniel.lezcano@linaro.org, paulburton@kernel.org, 
	peterz@infradead.org, mail@birger-koblitz.de, bert@biot.com, john@phrozen.org, 
	sander@svanheule.net, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, kabel@kernel.org, 
	ericwouds@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 10:33=E2=80=AFPM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> The bootloader used on the Realtek RTL9302C boards is an ancient vendor
> fork of U-Boot that doesn't understand device trees. So to run a modern
> kernel it is necessary use one of the APPENDED_DTB options.
>
> When appending the DTB the inintrd information, if present, needs to be
> inserted into the /chosen device tree node. The bootloader provides the
> initrd start/size via the firmware environment. Add a fdt fixup that
> will update the device tree with the initrd information.

Is this really specific to this board/soc? I think there are lots of
MIPS boards in this state. The code to handle all the possible
combinations of bootloader handoff information and sources of DTB is
quite the mess. Just for DTB source you have bootloader DTB, appended
DTB, or built-in DTB (and there's even logic if you have multiple of
those). Contrast that to arm32 ('the zoo"), where you have 2 choices:
bootloader DTB or appended DTB with legacy bootloader parameters
transferred to DTB. All the uglyness is contained and the kernel boot
deals with 1 possibility. </rant>

>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Notes:
>     Changes in v3:
>     - None
>     Changes in v2:
>     - update compatible string
>
>  arch/mips/generic/Makefile        |  1 +
>  arch/mips/generic/board-realtek.c | 81 +++++++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 arch/mips/generic/board-realtek.c
>
> diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
> index 56011d738441..ea0e4ad5e600 100644
> --- a/arch/mips/generic/Makefile
> +++ b/arch/mips/generic/Makefile
> @@ -13,3 +13,4 @@ obj-$(CONFIG_LEGACY_BOARD_SEAD3)      +=3D board-sead3.=
o
>  obj-$(CONFIG_LEGACY_BOARD_OCELOT)      +=3D board-ocelot.o
>  obj-$(CONFIG_MACH_INGENIC)                     +=3D board-ingenic.o
>  obj-$(CONFIG_VIRT_BOARD_RANCHU)                +=3D board-ranchu.o
> +obj-$(CONFIG_MACH_REALTEK_RTL)         +=3D board-realtek.o
> diff --git a/arch/mips/generic/board-realtek.c b/arch/mips/generic/board-=
realtek.c
> new file mode 100644
> index 000000000000..cd83fbf1968c
> --- /dev/null
> +++ b/arch/mips/generic/board-realtek.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

Kernel license by default is GPL-2.0-only. Why do something different?

> +/*
> + * Copyright (C) 2024 Allied Telesis
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/libfdt.h>
> +#include <linux/of_address.h>

You aren't using this header.

> +#include <linux/types.h>
> +
> +#include <asm/fw/fw.h>
> +#include <asm/machine.h>
> +
> +static __init int realtek_add_initrd(void *fdt)
> +{
> +       int node, err;
> +       u32 start, size;
> +
> +       node =3D fdt_path_offset(fdt, "/chosen");
> +       if (node < 0) {
> +               pr_err("/chosen node not found\n");
> +               return -ENOENT;
> +       }
> +
> +       start =3D fw_getenvl("initrd_start");
> +       size =3D fw_getenvl("initrd_size");
> +
> +       if (start =3D=3D 0 && size =3D=3D 0)
> +               return 0;
> +
> +       pr_info("Adding initrd info from environment\n");
> +
> +       err =3D fdt_setprop_u32(fdt, node, "linux,initrd-start", start);
> +       if (err) {
> +               pr_err("unable to set initrd-start: %d\n", err);
> +               return err;
> +       }
> +
> +       err =3D fdt_setprop_u32(fdt, node, "linux,initrd-end", start + si=
ze);
> +       if (err) {
> +               pr_err("unable to set initrd-end: %d\n", err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct mips_fdt_fixup realtek_fdt_fixups[] __initconst =3D =
{
> +       { realtek_add_initrd, "add initrd" },
> +       {},
> +};
> +
> +static __init const void *realtek_fixup_fdt(const void *fdt, const void =
*match_data)
> +{
> +       static unsigned char fdt_buf[16 << 10] __initdata;
> +       int err;
> +
> +       if (fdt_check_header(fdt))
> +               panic("Corrupt DT");
> +
> +       fw_init_cmdline();
> +
> +       err =3D apply_mips_fdt_fixups(fdt_buf, sizeof(fdt_buf), fdt, real=
tek_fdt_fixups);
> +       if (err)
> +               panic("Unable to fixup FDT: %d", err);
> +
> +       return fdt_buf;
> +
> +}
> +
> +static const struct of_device_id realtek_of_match[] __initconst =3D {
> +       {
> +               .compatible =3D "realtek,rtl9302",
> +       },
> +       {}
> +};
> +
> +MIPS_MACHINE(realtek) =3D {
> +       .matches =3D realtek_of_match,
> +       .fixup_fdt =3D realtek_fixup_fdt,
> +};
> --
> 2.45.2
>
>

