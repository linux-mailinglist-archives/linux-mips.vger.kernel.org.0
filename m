Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAA57427862
	for <lists+linux-mips@lfdr.de>; Sat,  9 Oct 2021 11:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbhJIJ0K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Oct 2021 05:26:10 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:60653 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231219AbhJIJ0J (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 9 Oct 2021 05:26:09 -0400
Received: from [192.168.0.2] (ip5f5aef39.dynamic.kabel-deutschland.de [95.90.239.57])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id ECA9861E5FE00;
        Sat,  9 Oct 2021 11:24:09 +0200 (CEST)
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
To:     Arnd Bergmann <arnd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
References: <20210928075216.4193128-1-arnd@kernel.org>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <9dedf9bb-5377-9f2c-cbb1-2a57b40493da@molgen.mpg.de>
Date:   Sat, 9 Oct 2021 11:24:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928075216.4193128-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[Cc: +linuxppc-dev@lists.ozlabs.org]

Dear Arnd,


Am 28.09.21 um 09:50 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compile-testing drivers that require access to a firmware layer
> fails when that firmware symbol is unavailable. This happened
> twice this week:
> 
>   - My proposed to change to rework the QCOM_SCM firmware symbol
>     broke on ppc64 and others.
> 
>   - The cs_dsp firmware patch added device specific firmware loader
>     into drivers/firmware, which broke on the same set of
>     architectures.
> 
> We should probably do the same thing for other subsystems as well,
> but fix this one first as this is a dependency for other patches
> getting merged.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Simon Trimmer <simont@opensource.cirrus.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Not sure how we'd want to merge this patch, if two other things
> need it. I'd prefer to merge it along with the QCOM_SCM change
> through the soc tree, but that leaves the cirrus firmware broken
> unless we also merge it the same way (rather than through ASoC
> as it is now).
> 
> Alternatively, we can try to find a different home for the Cirrus
> firmware to decouple the two problems. I'd argue that it's actually
> misplaced here, as drivers/firmware is meant for kernel code that
> interfaces with system firmware, not for device drivers to load
> their own firmware blobs from user space.
> ---
>   arch/arm/Kconfig    | 2 --
>   arch/arm64/Kconfig  | 2 --
>   arch/ia64/Kconfig   | 2 --
>   arch/mips/Kconfig   | 2 --
>   arch/parisc/Kconfig | 2 --
>   arch/riscv/Kconfig  | 2 --
>   arch/x86/Kconfig    | 2 --
>   drivers/Kconfig     | 2 ++
>   8 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index ad96f3dd7e83..194d10bbff9e 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1993,8 +1993,6 @@ config ARCH_HIBERNATION_POSSIBLE
>   
>   endmenu
>   
> -source "drivers/firmware/Kconfig"
> -
>   if CRYPTO
>   source "arch/arm/crypto/Kconfig"
>   endif
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index ebb49585a63f..8749517482ae 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1931,8 +1931,6 @@ source "drivers/cpufreq/Kconfig"
>   
>   endmenu
>   
> -source "drivers/firmware/Kconfig"
> -
>   source "drivers/acpi/Kconfig"
>   
>   source "arch/arm64/kvm/Kconfig"
> diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
> index 045792cde481..1e33666fa679 100644
> --- a/arch/ia64/Kconfig
> +++ b/arch/ia64/Kconfig
> @@ -388,8 +388,6 @@ config CRASH_DUMP
>   	  help
>   	    Generate crash dump after being started by kexec.
>   
> -source "drivers/firmware/Kconfig"
> -
>   endmenu
>   
>   menu "Power management and ACPI options"
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 771ca53af06d..6b8f591c5054 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -3316,8 +3316,6 @@ source "drivers/cpuidle/Kconfig"
>   
>   endmenu
>   
> -source "drivers/firmware/Kconfig"
> -
>   source "arch/mips/kvm/Kconfig"
>   
>   source "arch/mips/vdso/Kconfig"
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 4742b6f169b7..27a8b49af11f 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -384,6 +384,4 @@ config KEXEC_FILE
>   
>   endmenu
>   
> -source "drivers/firmware/Kconfig"
> -
>   source "drivers/parisc/Kconfig"
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 301a54233c7e..6a6fa9e976d5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -561,5 +561,3 @@ menu "Power management options"
>   source "kernel/power/Kconfig"
>   
>   endmenu
> -
> -source "drivers/firmware/Kconfig"
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index e5ba8afd29a0..5dcec5f13a82 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2834,8 +2834,6 @@ config HAVE_ATOMIC_IOMAP
>   	def_bool y
>   	depends on X86_32
>   
> -source "drivers/firmware/Kconfig"
> -
>   source "arch/x86/kvm/Kconfig"
>   
>   source "arch/x86/Kconfig.assembler"
> diff --git a/drivers/Kconfig b/drivers/Kconfig
> index 30d2db37cc87..0d399ddaa185 100644
> --- a/drivers/Kconfig
> +++ b/drivers/Kconfig
> @@ -17,6 +17,8 @@ source "drivers/bus/Kconfig"
>   
>   source "drivers/connector/Kconfig"
>   
> +source "drivers/firmware/Kconfig"
> +
>   source "drivers/gnss/Kconfig"
>   
>   source "drivers/mtd/Kconfig"
> 

With this change, I have the new entries below in my .config:

```
$ diff -u .config.old .config
--- .config.old 2021-10-07 11:38:39.544000000 +0200
+++ .config     2021-10-09 10:02:03.156000000 +0200
@@ -1992,6 +1992,25 @@

  CONFIG_CONNECTOR=y
  CONFIG_PROC_EVENTS=y
+
+#
+# Firmware Drivers
+#
+
+#
+# ARM System Control and Management Interface Protocol
+#
+# end of ARM System Control and Management Interface Protocol
+
+# CONFIG_FIRMWARE_MEMMAP is not set
+# CONFIG_GOOGLE_FIRMWARE is not set
+
+#
+# Tegra firmware driver
+#
+# end of Tegra firmware driver
+# end of Firmware Drivers
+
  # CONFIG_GNSS is not set
  CONFIG_MTD=m
  # CONFIG_MTD_TESTS is not set
```

No idea if the entries could be hidden for platforms not supporting them.

         ARM System Control and Management Interface Protocol  ----
     [ ] Add firmware-provided memory map to sysfs
     [ ] Google Firmware Drivers  ----
         Tegra firmware driver  ----


Kind regards,

Paul
