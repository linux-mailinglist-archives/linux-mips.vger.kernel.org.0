Return-Path: <linux-mips+bounces-8295-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A74A6C4C3
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 22:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 553DB7A8767
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 21:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D22723236F;
	Fri, 21 Mar 2025 21:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsIoy34e"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7F323236D;
	Fri, 21 Mar 2025 21:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742590864; cv=none; b=rFBCAqiY3AOJkRJWzTZpz7KEHgaP4NEpV5d5wppXGunnTnR6G4PT/y6VU9afB30ag/LrXe/LzIoDj4huh08tdElOcF+3vetbXKEnYx3bUW88115wdWEYRDqyTYcnC2KQ3m0P27VQgYaEysvLXITH+gCOjNl0FkwFqq5MBAQaNLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742590864; c=relaxed/simple;
	bh=ZipvH43Yr/4Smw5FO0nML5tOlNouJYZeW7TcMFxT5OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yj+w4PgZL85BIuvKxg6zPUSQScHq1Nj/kwl+qtRSqPTKuRnlscCc3FGk9brvt67TeQFD8MHh4SGJ5eKGg57MYkX6xuuLfR57TZ5hZqRuRBf36i0F3+RjnhrLbD02coe4TpYtWy0tD+r39V1ffNrg+x5tANDrfbRNgrXZxrnC6dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsIoy34e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637E6C4CEE3;
	Fri, 21 Mar 2025 21:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742590863;
	bh=ZipvH43Yr/4Smw5FO0nML5tOlNouJYZeW7TcMFxT5OQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bsIoy34ex3WOGbE/VgAtJO+iLPCWy3CV/dThOoq14qMgFsssl6Q/XzvOOUVcoLQjk
	 rcCtsRCkauNQiN3ydqptJn0wkfl0lrGIFBGLfROgzwDlUC5Rvg3fwcDIf8khikuYP8
	 MibSHVZFsz0pUtAeiCr6uebkAAGkOO3XwGLHPJGvwcho3cuUj2MOaifp0+m6TUlqfS
	 kR41UbSBCcdTvXIRrt30AFCRTMOb0Ai2rLeSJMdzVkPw1hmhQEtf6+YGiGrPBomfXw
	 CTNLGoIfrIZiKfUz1xPre3tgnYJgXOeXSIYVYur0YjZGdQ38gfH+J+xg/1sH1AXvNE
	 KaWfM33c/o+Nw==
Message-ID: <f1f50469-bbd2-41a8-87a5-a535a9bc495b@kernel.org>
Date: Fri, 21 Mar 2025 22:00:56 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] mips: Add EcoNet MIPS platform support
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-8-cjd@cjdns.fr>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250321134633.2155141-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2025 14:46, Caleb James DeLisle wrote:
> Add platform support for EcoNet MIPS SoCs.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
> As is typical of embedded platforms, it's not realistic to imagine building
> a fully functioning system from kernel sources alone. In the interest of
> providing something without external dependencies, I have included build and
> device tree for a minimal testing / PoC image that can be booted from memory
> on these devices.
> ---
>  arch/mips/Kbuild.platforms                    |  1 +
>  arch/mips/Kconfig                             | 25 ++++++
>  arch/mips/boot/compressed/uart-16550.c        |  5 ++
>  arch/mips/boot/dts/Makefile                   |  1 +
>  arch/mips/boot/dts/econet/Makefile            |  2 +
>  arch/mips/boot/dts/econet/en751221.dtsi       | 62 +++++++++++++++
>  .../boot/dts/econet/en751221_test_image.dts   | 19 +++++
>  arch/mips/econet/Kconfig                      | 42 ++++++++++
>  arch/mips/econet/Makefile                     |  2 +
>  arch/mips/econet/Platform                     |  5 ++
>  arch/mips/econet/init.c                       | 78 +++++++++++++++++++
>  11 files changed, 242 insertions(+)
>  create mode 100644 arch/mips/boot/dts/econet/Makefile
>  create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
>  create mode 100644 arch/mips/boot/dts/econet/en751221_test_image.dts

DTS are always, always separate patches. See also DTS coding style and
submitting patches in the bindings, which already covers this.



...


> new file mode 100644
> index 000000000000..e4404aed5705
> --- /dev/null
> +++ b/arch/mips/boot/dts/econet/en751221.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +/ {
> +	compatible = "econet,en751221";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	hpt_clock: hpt_clock {

No underscores in node names.

Follow DTS coding style.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;  /* 200 MHz */
> +	};
> +
> +	cpus: cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "mips,mips24KEc";
> +			reg = <0>;
> +		};
> +	};
> +
> +	cpuintc: interrupt-controller {
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	intc: interrupt-controller@1fb40000 {
> +		compatible = "econet,en751221-intc";
> +		reg = <0x1fb40000 0x100>;
> +		interrupt-parent = <&cpuintc>;
> +		interrupts = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
> +	};
> +
> +	uart: serial@1fbf0000 {
> +		compatible = "ns16550";
> +		reg = <0x1fbf0000 0x30>;
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		interrupt-parent = <&intc>;
> +		interrupts = <0>;
> +		clock-frequency = <1843200>;
> +	};
> +
> +	timer_hpt: timer_hpt@1fbf0400 {

Same problem as with binding.

> +		compatible = "econet,timer-hpt";
> +		reg = <0x1fbf0400 0x100>;
> +
> +		interrupt-parent = <&intc>;
> +		interrupts = <30>;
> +		clocks = <&hpt_clock>;
> +	};
> +};
> diff --git a/arch/mips/boot/dts/econet/en751221_test_image.dts b/arch/mips/boot/dts/econet/en751221_test_image.dts
> new file mode 100644
> index 000000000000..bc140c4043b2
> --- /dev/null
> +++ b/arch/mips/boot/dts/econet/en751221_test_image.dts

Does not look like a board. We do not take some testing/debugging
thingies. Please upstream *real* board.

> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "en751221.dtsi"
> +
> +/ {
> +	model = "Generic EN751221";

Missing compatible.

> +
> +	memory@0 {
> +		/* We hope at least 64MB will be available wherever we are run */
> +		device_type = "memory";
> +		reg = <0x00000000 0x4000000>;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttyS0,115200";

Drop bootargs and use standard property - stdout.

See how all other platforms are doing it (and not some ancient MIPS, but
the most recent arm64 or riscv).


> +		linux,usable-memory-range = <0x00020000 0x3fe0000>;
> +	};
> +};
> diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
> new file mode 100644
> index 000000000000..12f85d638e47
> --- /dev/null
> +++ b/arch/mips/econet/Kconfig
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0
> +if ECONET
> +
> +config SOC_ECONET_EN751221
> +	bool
> +	select COMMON_CLK
> +	select ECONET_EN751221_INTC
> +	select IRQ_MIPS_CPU
> +	select SMP
> +	select SMP_UP
> +	select SYS_SUPPORTS_SMP
> +
> +choice
> +	prompt "EcoNet SoC selection"
> +	default SOC_ECONET_EN751221_FAMILY
> +	help
> +	  Select EcoNet MIPS SoC type. Individual SoCs within a family are
> +	  similar enough that is it enough to select the right family, and
> +	  then customize to the specific SoC using the device tree only.
> +
> +	config SOC_ECONET_EN751221_FAMILY
> +		bool "EN751221 family"
> +		select SOC_ECONET_EN751221
> +		help
> +		  The EN751221 family includes EN7512, RN7513, EN7521, EN7526.
> +		  They are based on single core MIPS 34Kc processors. To boot
> +		  this kernel, you will need a device tree such as
> +		  MIPS_RAW_APPENDED_DTB=y, and a root filesystem.
> +
> +	config SOC_ECONET_EN751221_TEST_IMAGE
> +		bool "EN751221 test image"
> +		select SOC_ECONET_EN751221
> +		select BUILTIN_DTB
> +		help
> +		  Build a minimal kernel that will boot on any EN751221 board
> +		  with at least 64MB of memory. This has a builtin device tree
> +		  so it can boot with nothing more than an appended initramfs.
> +		  This is good for validating that a given SoC is EN751221
> +		  compatible, or for regression testing.
> +endchoice
> +
> +endif
> diff --git a/arch/mips/econet/Makefile b/arch/mips/econet/Makefile
> new file mode 100644
> index 000000000000..7e4529e7d3d7
> --- /dev/null
> +++ b/arch/mips/econet/Makefile
> @@ -0,0 +1,2 @@
> +
> +obj-y := init.o
> diff --git a/arch/mips/econet/Platform b/arch/mips/econet/Platform
> new file mode 100644
> index 000000000000..bb659876d855
> --- /dev/null
> +++ b/arch/mips/econet/Platform
> @@ -0,0 +1,5 @@
> +# To address a 7.2MB kernel size limit in the EcoNet SDK bootloader,
> +# we put the load address well above where the bootloader loads and then use
> +# zboot. So please set CONFIG_ZBOOT_LOAD_ADDRESS to the address where your
> +# bootloader actually places the kernel.
> +load-$(CONFIG_ECONET)	+= 0xffffffff81000000
> \ No newline at end of file

You have patch warnings

Best regards,
Krzysztof

