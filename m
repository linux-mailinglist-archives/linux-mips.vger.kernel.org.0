Return-Path: <linux-mips+bounces-12318-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B1C7793D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 07:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2332F34359F
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 06:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA0A32470E;
	Fri, 21 Nov 2025 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAxOl9Ox"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31CC325480;
	Fri, 21 Nov 2025 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763706639; cv=none; b=S4znEIvVCY960Gydr2aBvIfOsKZY7dENACy4e26H5+mUvj9nxZPD8cg6R9hCwzSPO+l2n6N+u3t1dAUy27ht6jFn3eioaE3db8VJM5jp/Y2dI+3CDjtAD/YySxnjhTGNOqcguxfM3IS95Sd5YQqu4YIEXf63Vox7tU067FbLPN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763706639; c=relaxed/simple;
	bh=gDSALg5PLW9mySOKY3LcUIAnuzMXaM0GWAeazqo8adg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsYSzLyzafpnFug12Qc7HOEGdXfPvEdvIiOl7zjFElLGvXqJn4JNM6jC8xNSkJk563NfFs9TPd7+9E8p1/poKxnAbz+xVUZJuT1cpuoAbzz7Lu1DoHlRZUwJhU9ZoLnG6ieRBfK99jzTNnL7wOQhSpnRQlr69VqsYAQPbt5Mwx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAxOl9Ox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8E1C4CEF1;
	Fri, 21 Nov 2025 06:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763706639;
	bh=gDSALg5PLW9mySOKY3LcUIAnuzMXaM0GWAeazqo8adg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAxOl9OxLsYR5RPnQ2ArO8vBCMbdZAyISNQZhdk/iBF3dZeBadX4O84qPuYSlgHG+
	 aTceCMPEqg08aC+59W3sLYzlxJXQQbTm/wm7Y6zeybU4gXHMAhQQrkLrC8MC0cUX15
	 rtir2oUBb8empsgR4WrVpSid23V1e85rhnwOSMTUf/xDm1KsNan+i7qjBYrMKcqi11
	 wW0lkTO6dPWPHM1Bq2YjtO7bqMKlNXYRCaJIgX3S++m6nejwOLxX0Udwny8KDgXdVl
	 BxUV44DQzoD6A4jk24+47g8pQ+00Q6v6KFxU+uKXP/Ff0nOZ4Z2eOaScZ+udG8PMRU
	 OWqDPHXlelZiA==
Date: Thu, 20 Nov 2025 23:30:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] kbuild: Support directory targets for building DTBs
Message-ID: <20251121063033.GA571346@ax162>
References: <20251120204812.1983452-4-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120204812.1983452-4-robh@kernel.org>

On Thu, Nov 20, 2025 at 02:48:13PM -0600, Rob Herring (Arm) wrote:
> It is useful to be able to build all the DTBs for a vendor. One can list
> all the .dts files in a directory and convert those to %.dtb targets,
> but that doesn't work for base+overlay DTB targets.
> 
> Adding the dts subdirectory is straight-forward, but building the
> DTBs should only happen for certain targets (dtbs, dtbs_check, %.dtb,
> %.dtbo, and the directory target(s)).
> 
> The 'scripts_dtc' rule doesn't really depend on 'dt_binding_schemas',
> but the directory target only depends on 'scripts' which depends on
> 'scripts_dtc'.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Please ack and I'll take this in the DT tree.
> 
> I don't really like looking at MAKECMDGOALS, but that's the only way I
> could come up with that works. Maybe someone knows a better way.

Yeah, I do worry that just looking for "dtb" in MAKECMDGOALS could
result in some false positives but in the tree now, I only see one .c
file that would trigger this logic, so maybe it is not that big of a
deal?

  $ fd dtb
  arch/microblaze/boot/dts/linked_dtb.S
  arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
  arch/um/kernel/dtb.c
  drivers/gpu/drm/ci/dtbs-check.sh
  scripts/Makefile.dtbinst
  scripts/Makefile.dtbs

Unfortunately, my Make-fu is pretty weak right now so I do not have any
immediate suggestions but Nicolas might... otherwise, we could probably
ride this for right now and either revert it or forward fix it if
problems come up in further testing, since this does seem rather useful
for folks working on device tree files.

> v2:
>  - Convert arm, mips and riscv. The other DT enabled arches don't have 
>    vendor directories.
>  - Link to v1: https://lore.kernel.org/all/20251113225952.867138-1-robh@kernel.org/ 
> 
> ---
>  Makefile              | 2 +-
>  arch/arm/Kbuild       | 2 ++
>  arch/arm64/Kbuild     | 2 ++
>  arch/mips/Kbuild      | 2 ++
>  arch/riscv/Kbuild     | 2 ++
>  scripts/Makefile.dtbs | 3 +++
>  6 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 17cfa11ca716..85018d461575 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1494,7 +1494,7 @@ export CHECK_DTBS=y
>  endif
>  
>  ifneq ($(CHECK_DTBS),)
> -dtbs_prepare: dt_binding_schemas
> +scripts_dtc: dt_binding_schemas
>  endif
>  
>  dtbs_check: dtbs
> diff --git a/arch/arm/Kbuild b/arch/arm/Kbuild
> index 69de6b6243c7..af7dd53585c3 100644
> --- a/arch/arm/Kbuild
> +++ b/arch/arm/Kbuild
> @@ -10,5 +10,7 @@ obj-y				+= probes/
>  obj-y				+= net/
>  obj-y				+= crypto/
>  
> +subdir-y += boot/dts
> +
>  # for cleaning
>  subdir- += boot
> diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
> index 5bfbf7d79c99..9e9820af48c9 100644
> --- a/arch/arm64/Kbuild
> +++ b/arch/arm64/Kbuild
> @@ -5,5 +5,7 @@ obj-$(CONFIG_XEN)	+= xen/
>  obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
>  obj-$(CONFIG_CRYPTO)	+= crypto/
>  
> +subdir-y += boot/dts
> +
>  # for cleaning
>  subdir- += boot
> diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
> index e901bf554483..6125d00cdcef 100644
> --- a/arch/mips/Kbuild
> +++ b/arch/mips/Kbuild
> @@ -21,5 +21,7 @@ ifdef CONFIG_KVM
>  obj-y += kvm/
>  endif
>  
> +subdir-y += boot/dts
> +
>  # for cleaning
>  subdir- += boot
> diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> index 126fb738fc44..3cf7f84eb287 100644
> --- a/arch/riscv/Kbuild
> +++ b/arch/riscv/Kbuild
> @@ -7,5 +7,7 @@ obj-$(CONFIG_KVM) += kvm/
>  
>  obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
>  
> +subdir-y += boot/dts
> +
>  # for cleaning
>  subdir- += boot
> diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
> index 2d321b813600..4d0d164df275 100644
> --- a/scripts/Makefile.dtbs
> +++ b/scripts/Makefile.dtbs
> @@ -14,7 +14,10 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
>  multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
>  real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
>  
> +ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(findstring dtb,$(MAKECMDGOALS)),)
>  always-y        += $(dtb-y)
> +endif
> +
>  targets         += $(real-dtb-y)
>  
>  # dtbs-list
> -- 
> 2.51.0
> 

