Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704BD1CE9CB
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 02:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgELAxg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 May 2020 20:53:36 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:53800 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728110AbgELAxg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 May 2020 20:53:36 -0400
Subject: Re: [PATCH] MIPS: Only include the platform file needed
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        John Crispin <john@phrozen.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        James Hartley <james.hartley@sondrel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200509230150.24466-1-tsbogend@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <ba870324-f8cf-7828-c180-b62635e7026e@gentoo.org>
Date:   Mon, 11 May 2020 20:53:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200509230150.24466-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/9/2020 19:01, Thomas Bogendoerfer wrote:
> Instead of including all Platform files, we simply include the
> needed one and avoid clashes with makefile variables.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/Kbuild.platforms       | 73 +++++++++++++++++++++-------------------
>  arch/mips/alchemy/Platform       |  3 --
>  arch/mips/ar7/Platform           |  1 -
>  arch/mips/ath25/Platform         |  1 -
>  arch/mips/ath79/Platform         |  1 -
>  arch/mips/bcm47xx/Platform       |  1 -
>  arch/mips/bcm63xx/Platform       |  1 -
>  arch/mips/bmips/Platform         |  1 -
>  arch/mips/cavium-octeon/Platform |  1 -
>  arch/mips/cobalt/Platform        |  1 -
>  arch/mips/dec/Platform           |  1 -
>  arch/mips/generic/Platform       |  1 -
>  arch/mips/jazz/Platform          |  1 -
>  arch/mips/jz4740/Platform        |  1 -
>  arch/mips/lantiq/Platform        |  1 -
>  arch/mips/loongson2ef/Platform   |  1 -
>  arch/mips/loongson32/Platform    |  1 -
>  arch/mips/loongson64/Platform    |  1 -
>  arch/mips/mti-malta/Platform     |  1 -
>  arch/mips/netlogic/Platform      |  1 -
>  arch/mips/paravirt/Platform      |  1 -
>  arch/mips/pic32/Platform         |  1 -
>  arch/mips/pistachio/Platform     |  1 -
>  arch/mips/pnx833x/Platform       |  1 -
>  arch/mips/rb532/Platform         |  1 -
>  arch/mips/sgi-ip22/Platform      |  2 --
>  arch/mips/sgi-ip27/Platform      |  3 --
>  arch/mips/sgi-ip30/Platform      |  3 --
>  arch/mips/sgi-ip32/Platform      |  1 -
>  arch/mips/sibyte/Platform        |  4 ---
>  arch/mips/sni/Platform           |  1 -
>  arch/mips/txx9/Platform          |  3 --
>  32 files changed, 39 insertions(+), 77 deletions(-)
> 
> diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
> index 292b59afb4ba..5e3f6ed96292 100644
> --- a/arch/mips/Kbuild.platforms
> +++ b/arch/mips/Kbuild.platforms
> @@ -1,39 +1,44 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # All platforms listed in alphabetic order
>  
> -platforms += alchemy
> -platforms += ar7
> -platforms += ath25
> -platforms += ath79
> -platforms += bcm47xx
> -platforms += bcm63xx
> -platforms += bmips
> -platforms += cavium-octeon
> -platforms += cobalt
> -platforms += dec
> -platforms += generic
> -platforms += jazz
> -platforms += jz4740
> -platforms += lantiq
> -platforms += loongson2ef
> -platforms += loongson32
> -platforms += loongson64
> -platforms += mti-malta
> -platforms += netlogic
> -platforms += paravirt
> -platforms += pic32
> -platforms += pistachio
> -platforms += pnx833x
> -platforms += ralink
> -platforms += rb532
> -platforms += sgi-ip22
> -platforms += sgi-ip27
> -platforms += sgi-ip30
> -platforms += sgi-ip32
> -platforms += sibyte
> -platforms += sni
> -platforms += txx9
> -platforms += vr41xx
> +platform-$(CONFIG_MIPS_ALCHEMY)		+= alchemy/
> +platform-$(CONFIG_AR7)			+= ar7/
> +platform-$(CONFIG_ATH25)		+= ath25/
> +platform-$(CONFIG_ATH79)		+= ath79/
> +platform-$(CONFIG_BCM47XX)		+= bcm47xx/
> +platform-$(CONFIG_BCM63XX)		+= bcm63xx/
> +platform-$(CONFIG_BMIPS_GENERIC)	+= bmips/
> +platform-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon/
> +platform-$(CONFIG_MIPS_COBALT)		+= cobalt/
> +platform-$(CONFIG_MACH_DECSTATION)	+= dec/
> +platform-$(CONFIG_MIPS_GENERIC)		+= generic/
> +platform-$(CONFIG_MACH_JAZZ)		+= jazz/
> +platform-$(CONFIG_MACH_INGENIC)		+= jz4740/
> +platform-$(CONFIG_LANTIQ)		+= lantiq/
> +platform-$(CONFIG_MACH_LOONGSON2EF)	+= loongson2ef/
> +platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
> +platform-$(CONFIG_MACH_LOONGSON64)	+= loongson64/
> +platform-$(CONFIG_MIPS_MALTA)		+= mti-malta/
> +platform-$(CONFIG_NLM_COMMON)		+= netlogic/
> +platform-$(CONFIG_MIPS_PARAVIRT)	+= paravirt/
> +platform-$(CONFIG_PIC32MZDA)		+= pic32/
> +platform-$(CONFIG_MACH_PISTACHIO)	+= pistachio/
> +platform-$(CONFIG_SOC_PNX833X)		+= pnx833x/
> +platform-$(CONFIG_RALINK)		+= ralink/
> +platform-$(CONFIG_MIKROTIK_RB532)	+= rb532/
> +platform-$(CONFIG_SGI_IP22)		+= sgi-ip22/
> +platform-$(CONFIG_SGI_IP27)		+= sgi-ip27/
> +platform-$(CONFIG_SGI_IP28)		+= sgi-ip22/
> +platform-$(CONFIG_SGI_IP30)		+= sgi-ip30/
> +platform-$(CONFIG_SGI_IP32)		+= sgi-ip32/
> +platform-$(CONFIG_SIBYTE_BCM112X)	+= sibyte/
> +platform-$(CONFIG_SIBYTE_SB1250)	+= sibyte/
> +platform-$(CONFIG_SIBYTE_BCM1x55)	+= sibyte/
> +platform-$(CONFIG_SIBYTE_BCM1x80)	+= sibyte/
> +platform-$(CONFIG_SNI_RM)		+= sni/
> +platform-$(CONFIG_MACH_TX39XX)		+= tx99/
> +platform-$(CONFIG_MACH_TX49XX)		+= tx99/
> +platform-$(CONFIG_MACH_VR41XX)		+= vr41xx/
>  
>  # include the platform specific files
> -include $(patsubst %, $(srctree)/arch/mips/%/Platform, $(platforms))
> +include $(patsubst %, $(srctree)/arch/mips/%/Platform, $(platform-y))
> diff --git a/arch/mips/alchemy/Platform b/arch/mips/alchemy/Platform
> index 33c9da3b077b..c8cff50b0eda 100644
> --- a/arch/mips/alchemy/Platform
> +++ b/arch/mips/alchemy/Platform
> @@ -15,19 +15,16 @@ load-$(CONFIG_MIPS_DB1XXX)	+= 0xffffffff80100000
>  #
>  # 4G-Systems MTX-1 "MeshCube" wireless router
>  #
> -platform-$(CONFIG_MIPS_MTX1)	+= alchemy/
>  load-$(CONFIG_MIPS_MTX1)	+= 0xffffffff80100000
>  
>  #
>  # MyCable eval board
>  #
> -platform-$(CONFIG_MIPS_XXS1500) += alchemy/
>  load-$(CONFIG_MIPS_XXS1500)	+= 0xffffffff80100000
>  
>  #
>  # Trapeze ITS GRP board
>  #
> -platform-$(CONFIG_MIPS_GPR)	+= alchemy/
>  load-$(CONFIG_MIPS_GPR)		+= 0xffffffff80100000
>  
>  # boards can specify their own <gpio.h> in one of their include dirs.
> diff --git a/arch/mips/ar7/Platform b/arch/mips/ar7/Platform
> index 21f9102d533c..a9257cc01c3c 100644
> --- a/arch/mips/ar7/Platform
> +++ b/arch/mips/ar7/Platform
> @@ -1,6 +1,5 @@
>  #
>  # Texas Instruments AR7
>  #
> -platform-$(CONFIG_AR7)		+= ar7/
>  cflags-$(CONFIG_AR7)		+= -I$(srctree)/arch/mips/include/asm/mach-ar7
>  load-$(CONFIG_AR7)		+= 0xffffffff94100000
> diff --git a/arch/mips/ath25/Platform b/arch/mips/ath25/Platform
> index ef3f81fa080b..aef098b6f405 100644
> --- a/arch/mips/ath25/Platform
> +++ b/arch/mips/ath25/Platform
> @@ -1,6 +1,5 @@
>  #
>  # Atheros AR531X/AR231X WiSoC
>  #
> -platform-$(CONFIG_ATH25)	+= ath25/
>  cflags-$(CONFIG_ATH25)		+= -I$(srctree)/arch/mips/include/asm/mach-ath25
>  load-$(CONFIG_ATH25)		+= 0xffffffff80041000
> diff --git a/arch/mips/ath79/Platform b/arch/mips/ath79/Platform
> index 2bd663647d27..57744472ed2e 100644
> --- a/arch/mips/ath79/Platform
> +++ b/arch/mips/ath79/Platform
> @@ -2,6 +2,5 @@
>  # Atheros AR71xx/AR724x/AR913x
>  #
>  
> -platform-$(CONFIG_ATH79)	+= ath79/
>  cflags-$(CONFIG_ATH79)		+= -I$(srctree)/arch/mips/include/asm/mach-ath79
>  load-$(CONFIG_ATH79)		= 0xffffffff80060000
> diff --git a/arch/mips/bcm47xx/Platform b/arch/mips/bcm47xx/Platform
> index 70783b75fd9d..833b204fe5da 100644
> --- a/arch/mips/bcm47xx/Platform
> +++ b/arch/mips/bcm47xx/Platform
> @@ -1,7 +1,6 @@
>  #
>  # Broadcom BCM47XX boards
>  #
> -platform-$(CONFIG_BCM47XX)	+= bcm47xx/
>  cflags-$(CONFIG_BCM47XX)	+=					\
>  		-I$(srctree)/arch/mips/include/asm/mach-bcm47xx
>  load-$(CONFIG_BCM47XX)		:= 0xffffffff80001000
> diff --git a/arch/mips/bcm63xx/Platform b/arch/mips/bcm63xx/Platform
> index 5f86b2fff6de..882dc40f49a2 100644
> --- a/arch/mips/bcm63xx/Platform
> +++ b/arch/mips/bcm63xx/Platform
> @@ -1,7 +1,6 @@
>  #
>  # Broadcom BCM63XX boards
>  #
> -platform-$(CONFIG_BCM63XX)	+= bcm63xx/
>  cflags-$(CONFIG_BCM63XX)	+=					\
>  		-I$(srctree)/arch/mips/include/asm/mach-bcm63xx/
>  load-$(CONFIG_BCM63XX)		:= 0xffffffff80010000
> diff --git a/arch/mips/bmips/Platform b/arch/mips/bmips/Platform
> index 5f127fd7f4b5..1434ea31ce85 100644
> --- a/arch/mips/bmips/Platform
> +++ b/arch/mips/bmips/Platform
> @@ -1,7 +1,6 @@
>  #
>  # Broadcom Generic BMIPS kernel
>  #
> -platform-$(CONFIG_BMIPS_GENERIC)	+= bmips/
>  cflags-$(CONFIG_BMIPS_GENERIC)		+=				\
>  		-I$(srctree)/arch/mips/include/asm/mach-bmips/
>  load-$(CONFIG_BMIPS_GENERIC)		:= 0xffffffff80010000
> diff --git a/arch/mips/cavium-octeon/Platform b/arch/mips/cavium-octeon/Platform
> index 45be853700e6..4adef38dea9d 100644
> --- a/arch/mips/cavium-octeon/Platform
> +++ b/arch/mips/cavium-octeon/Platform
> @@ -1,7 +1,6 @@
>  #
>  # Cavium Octeon
>  #
> -platform-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon/
>  cflags-$(CONFIG_CAVIUM_OCTEON_SOC)	+=				\
>  		-I$(srctree)/arch/mips/include/asm/mach-cavium-octeon
>  load-$(CONFIG_CAVIUM_OCTEON_SOC)	+= 0xffffffff81100000
> diff --git a/arch/mips/cobalt/Platform b/arch/mips/cobalt/Platform
> index 34123efd6dfe..4254895ad6f4 100644
> --- a/arch/mips/cobalt/Platform
> +++ b/arch/mips/cobalt/Platform
> @@ -1,6 +1,5 @@
>  #
>  # Cobalt Server
>  #
> -platform-$(CONFIG_MIPS_COBALT)	+= cobalt/
>  cflags-$(CONFIG_MIPS_COBALT)	+= -I$(srctree)/arch/mips/include/asm/mach-cobalt
>  load-$(CONFIG_MIPS_COBALT)	+= 0xffffffff80080000
> diff --git a/arch/mips/dec/Platform b/arch/mips/dec/Platform
> index cf55a6f4e720..c82391e832f9 100644
> --- a/arch/mips/dec/Platform
> +++ b/arch/mips/dec/Platform
> @@ -1,7 +1,6 @@
>  #
>  # DECstation family
>  #
> -platform-$(CONFIG_MACH_DECSTATION)	+= dec/
>  cflags-$(CONFIG_MACH_DECSTATION)	+= \
>  			-I$(srctree)/arch/mips/include/asm/mach-dec
>  libs-$(CONFIG_MACH_DECSTATION)		+= arch/mips/dec/prom/
> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
> index eaa19d189324..53c33cb72974 100644
> --- a/arch/mips/generic/Platform
> +++ b/arch/mips/generic/Platform
> @@ -8,7 +8,6 @@
>  # option) any later version.
>  #
>  
> -platform-$(CONFIG_MIPS_GENERIC)	+= generic/
>  cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
>  load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
>  all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
> diff --git a/arch/mips/jazz/Platform b/arch/mips/jazz/Platform
> index 3373788acca1..eb0490ae8b09 100644
> --- a/arch/mips/jazz/Platform
> +++ b/arch/mips/jazz/Platform
> @@ -1,6 +1,5 @@
>  #
>  # Acer PICA 61, Mips Magnum 4000 and Olivetti M700.
>  #
> -platform-$(CONFIG_MACH_JAZZ)	+= jazz/
>  cflags-$(CONFIG_MACH_JAZZ)	+= -I$(srctree)/arch/mips/include/asm/mach-jazz
>  load-$(CONFIG_MACH_JAZZ)	+= 0xffffffff80080000
> diff --git a/arch/mips/jz4740/Platform b/arch/mips/jz4740/Platform
> index a2a5a85ea1f9..bd35d0621b13 100644
> --- a/arch/mips/jz4740/Platform
> +++ b/arch/mips/jz4740/Platform
> @@ -1,4 +1,3 @@
> -platform-$(CONFIG_MACH_INGENIC)	+= jz4740/
>  cflags-$(CONFIG_MACH_INGENIC)	+= -I$(srctree)/arch/mips/include/asm/mach-jz4740
>  load-$(CONFIG_MACH_INGENIC)	+= 0xffffffff80010000
>  zload-$(CONFIG_MACH_INGENIC)	+= 0xffffffff81000000
> diff --git a/arch/mips/lantiq/Platform b/arch/mips/lantiq/Platform
> index b3ec49838fd7..0bc9c0fbd431 100644
> --- a/arch/mips/lantiq/Platform
> +++ b/arch/mips/lantiq/Platform
> @@ -2,7 +2,6 @@
>  # Lantiq
>  #
>  
> -platform-$(CONFIG_LANTIQ)	+= lantiq/
>  cflags-$(CONFIG_LANTIQ)		+= -I$(srctree)/arch/mips/include/asm/mach-lantiq
>  load-$(CONFIG_LANTIQ)		= 0xffffffff80002000
>  cflags-$(CONFIG_SOC_TYPE_XWAY)	+= -I$(srctree)/arch/mips/include/asm/mach-lantiq/xway
> diff --git a/arch/mips/loongson2ef/Platform b/arch/mips/loongson2ef/Platform
> index 3aca42963f35..cdad3c1a9a18 100644
> --- a/arch/mips/loongson2ef/Platform
> +++ b/arch/mips/loongson2ef/Platform
> @@ -26,7 +26,6 @@ endif
>  # Loongson Machines' Support
>  #
>  
> -platform-$(CONFIG_MACH_LOONGSON2EF) += loongson2ef/
>  cflags-$(CONFIG_MACH_LOONGSON2EF) += -I$(srctree)/arch/mips/include/asm/mach-loongson2ef -mno-branch-likely
>  load-$(CONFIG_LEMOTE_FULOONG2E) += 0xffffffff80100000
>  load-$(CONFIG_LEMOTE_MACH2F) += 0xffffffff80200000
> diff --git a/arch/mips/loongson32/Platform b/arch/mips/loongson32/Platform
> index 7f8e342f1ef5..3b9673e7a2fa 100644
> --- a/arch/mips/loongson32/Platform
> +++ b/arch/mips/loongson32/Platform
> @@ -1,4 +1,3 @@
>  cflags-$(CONFIG_CPU_LOONGSON32)		+= -march=mips32r2 -Wa,--trap
> -platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
>  cflags-$(CONFIG_MACH_LOONGSON32)	+= -I$(srctree)/arch/mips/include/asm/mach-loongson32
>  load-$(CONFIG_CPU_LOONGSON32)		+= 0xffffffff80200000
> diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
> index d5eb94c9edb4..ec42c5085905 100644
> --- a/arch/mips/loongson64/Platform
> +++ b/arch/mips/loongson64/Platform
> @@ -55,6 +55,5 @@ cflags-y += $(call cc-option,-mno-loongson-mmi)
>  # Loongson Machines' Support
>  #
>  
> -platform-$(CONFIG_MACH_LOONGSON64) += loongson64/
>  cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
>  load-$(CONFIG_CPU_LOONGSON64) += 0xffffffff80200000
> diff --git a/arch/mips/mti-malta/Platform b/arch/mips/mti-malta/Platform
> index 2cc72c9b38e3..41e0d2a2d325 100644
> --- a/arch/mips/mti-malta/Platform
> +++ b/arch/mips/mti-malta/Platform
> @@ -1,7 +1,6 @@
>  #
>  # MIPS Malta board
>  #
> -platform-$(CONFIG_MIPS_MALTA)	+= mti-malta/
>  cflags-$(CONFIG_MIPS_MALTA)	+= -I$(srctree)/arch/mips/include/asm/mach-malta
>  ifdef CONFIG_KVM_GUEST
>      load-$(CONFIG_MIPS_MALTA)	+= 0x0000000040100000
> diff --git a/arch/mips/netlogic/Platform b/arch/mips/netlogic/Platform
> index fb8eb4c0c6ec..4195a097f5f2 100644
> --- a/arch/mips/netlogic/Platform
> +++ b/arch/mips/netlogic/Platform
> @@ -13,5 +13,4 @@ cflags-$(CONFIG_CPU_XLP)	+= $(call cc-option,-march=xlp,-march=mips64r2)
>  #
>  # NETLOGIC processor support
>  #
> -platform-$(CONFIG_NLM_COMMON)	+= netlogic/
>  load-$(CONFIG_NLM_COMMON)	+= 0xffffffff80100000
> diff --git a/arch/mips/paravirt/Platform b/arch/mips/paravirt/Platform
> index 7e76ef25ea17..0b857580dfdd 100644
> --- a/arch/mips/paravirt/Platform
> +++ b/arch/mips/paravirt/Platform
> @@ -1,7 +1,6 @@
>  #
>  # Generic para-virtualized guest.
>  #
> -platform-$(CONFIG_MIPS_PARAVIRT)	+= paravirt/
>  cflags-$(CONFIG_MIPS_PARAVIRT)		+=				\
>  		-I$(srctree)/arch/mips/include/asm/mach-paravirt
>  
> diff --git a/arch/mips/pic32/Platform b/arch/mips/pic32/Platform
> index cd2084f44507..1e92e52a137b 100644
> --- a/arch/mips/pic32/Platform
> +++ b/arch/mips/pic32/Platform
> @@ -1,7 +1,6 @@
>  #
>  # PIC32MZDA
>  #
> -platform-$(CONFIG_PIC32MZDA)	+= pic32/
>  cflags-$(CONFIG_PIC32MZDA)	+= -I$(srctree)/arch/mips/include/asm/mach-pic32
>  load-$(CONFIG_PIC32MZDA)	+= 0xffffffff88000000
>  all-$(CONFIG_PIC32MZDA)		:= $(COMPRESSION_FNAME).bin
> diff --git a/arch/mips/pistachio/Platform b/arch/mips/pistachio/Platform
> index c3592b374ad2..f73a1a929965 100644
> --- a/arch/mips/pistachio/Platform
> +++ b/arch/mips/pistachio/Platform
> @@ -1,7 +1,6 @@
>  #
>  # IMG Pistachio SoC
>  #
> -platform-$(CONFIG_MACH_PISTACHIO)	+= pistachio/
>  cflags-$(CONFIG_MACH_PISTACHIO)		+=				\
>  		-I$(srctree)/arch/mips/include/asm/mach-pistachio
>  load-$(CONFIG_MACH_PISTACHIO)		+= 0xffffffff80400000
> diff --git a/arch/mips/pnx833x/Platform b/arch/mips/pnx833x/Platform
> index 287260669551..e5286a49fc3e 100644
> --- a/arch/mips/pnx833x/Platform
> +++ b/arch/mips/pnx833x/Platform
> @@ -1,5 +1,4 @@
>  # NXP STB225
> -platform-$(CONFIG_SOC_PNX833X)	+= pnx833x/
>  cflags-$(CONFIG_SOC_PNX833X)	+= -I$(srctree)/arch/mips/include/asm/mach-pnx833x
>  load-$(CONFIG_NXP_STB220)	+= 0xffffffff80001000
>  load-$(CONFIG_NXP_STB225)	+= 0xffffffff80001000
> diff --git a/arch/mips/rb532/Platform b/arch/mips/rb532/Platform
> index aeec45a7cbb3..12eaa8790b3e 100644
> --- a/arch/mips/rb532/Platform
> +++ b/arch/mips/rb532/Platform
> @@ -1,7 +1,6 @@
>  #
>  # Routerboard 532
>  #
> -platform-$(CONFIG_MIKROTIK_RB532)	+= rb532/
>  cflags-$(CONFIG_MIKROTIK_RB532)		+=				\
>  		-I$(srctree)/arch/mips/include/asm/mach-rc32434
>  load-$(CONFIG_MIKROTIK_RB532)		+= 0xffffffff80101000
> diff --git a/arch/mips/sgi-ip22/Platform b/arch/mips/sgi-ip22/Platform
> index e8f6b3a42a48..62fa30bb959e 100644
> --- a/arch/mips/sgi-ip22/Platform
> +++ b/arch/mips/sgi-ip22/Platform
> @@ -7,7 +7,6 @@
>  # current variable will break so for 64-bit kernels we have to raise the start
>  # address by 8kb.
>  #
> -platform-$(CONFIG_SGI_IP22)		+= sgi-ip22/
>  cflags-$(CONFIG_SGI_IP22)	+= -I$(srctree)/arch/mips/include/asm/mach-ip22
>  ifdef CONFIG_32BIT
>  load-$(CONFIG_SGI_IP22)		+= 0xffffffff88002000
> @@ -29,6 +28,5 @@ ifdef CONFIG_SGI_IP28
>        $(error gcc doesn't support needed option -mr10k-cache-barrier=store)
>    endif
>  endif
> -platform-$(CONFIG_SGI_IP28)		+= sgi-ip22/
>  cflags-$(CONFIG_SGI_IP28)	+= -mr10k-cache-barrier=store -I$(srctree)/arch/mips/include/asm/mach-ip28
>  load-$(CONFIG_SGI_IP28)		+= 0xa800000020004000
> diff --git a/arch/mips/sgi-ip27/Platform b/arch/mips/sgi-ip27/Platform
> index 1fb9c2ea7c8f..e734ee6abd44 100644
> --- a/arch/mips/sgi-ip27/Platform
> +++ b/arch/mips/sgi-ip27/Platform
> @@ -5,8 +5,6 @@
>  # symmon, 0xc00000000001c000 for production kernels.  Note that the value must
>  # be 16kb aligned or the handling of the current variable will break.
>  #
> -ifdef CONFIG_SGI_IP27
> -platform-$(CONFIG_SGI_IP27)	+= sgi-ip27/
>  cflags-$(CONFIG_SGI_IP27)	+= -I$(srctree)/arch/mips/include/asm/mach-ip27
>  ifdef CONFIG_MAPPED_KERNEL
>  load-$(CONFIG_SGI_IP27)		+= 0xc00000004001c000
> @@ -16,4 +14,3 @@ else
>  load-$(CONFIG_SGI_IP27)		+= 0xa80000000001c000
>  OBJCOPYFLAGS			:= --change-addresses=0x57ffffff80000000
>  endif
> -endif
> diff --git a/arch/mips/sgi-ip30/Platform b/arch/mips/sgi-ip30/Platform
> index 2b5695c2049a..f6f11517e091 100644
> --- a/arch/mips/sgi-ip30/Platform
> +++ b/arch/mips/sgi-ip30/Platform
> @@ -1,8 +1,5 @@
>  #
>  # SGI-IP30 (Octane/Octane2)
>  #
> -ifdef CONFIG_SGI_IP30
> -platform-$(CONFIG_SGI_IP30)		+= sgi-ip30/
>  cflags-$(CONFIG_SGI_IP30)		+= -I$(srctree)/arch/mips/include/asm/mach-ip30
>  load-$(CONFIG_SGI_IP30)			+= 0xa800000020004000
> -endif
> diff --git a/arch/mips/sgi-ip32/Platform b/arch/mips/sgi-ip32/Platform
> index 0fea556f3641..f58a7a02b4ca 100644
> --- a/arch/mips/sgi-ip32/Platform
> +++ b/arch/mips/sgi-ip32/Platform
> @@ -6,6 +6,5 @@
>  # a multiple of the kernel stack size or the handling of the current variable
>  # will break.
>  #
> -platform-$(CONFIG_SGI_IP32)	+= sgi-ip32/
>  cflags-$(CONFIG_SGI_IP32)	+= -I$(srctree)/arch/mips/include/asm/mach-ip32
>  load-$(CONFIG_SGI_IP32)		+= 0xffffffff80004000
> diff --git a/arch/mips/sibyte/Platform b/arch/mips/sibyte/Platform
> index af117330ce14..65b2225b76b2 100644
> --- a/arch/mips/sibyte/Platform
> +++ b/arch/mips/sibyte/Platform
> @@ -1,10 +1,6 @@
>  #
>  # These are all rather similar so we consider them a single platform
>  #
> -platform-$(CONFIG_SIBYTE_BCM112X)	+= sibyte/
> -platform-$(CONFIG_SIBYTE_SB1250)	+= sibyte/
> -platform-$(CONFIG_SIBYTE_BCM1x55)	+= sibyte/
> -platform-$(CONFIG_SIBYTE_BCM1x80)	+= sibyte/
>  
>  #
>  # Sibyte SB1250 / BCM1480 family of SOCs
> diff --git a/arch/mips/sni/Platform b/arch/mips/sni/Platform
> index 2644a9d63c0f..b0b3dde0bef8 100644
> --- a/arch/mips/sni/Platform
> +++ b/arch/mips/sni/Platform
> @@ -1,7 +1,6 @@
>  #
>  # SNI RM
>  #
> -platform-$(CONFIG_SNI_RM)		+= sni/
>  cflags-$(CONFIG_SNI_RM)		+= -I$(srctree)/arch/mips/include/asm/mach-rm
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  load-$(CONFIG_SNI_RM)		+= 0xffffffff80600000
> diff --git a/arch/mips/txx9/Platform b/arch/mips/txx9/Platform
> index a176d1fd5799..7f4429ba22eb 100644
> --- a/arch/mips/txx9/Platform
> +++ b/arch/mips/txx9/Platform
> @@ -1,6 +1,3 @@
> -platform-$(CONFIG_MACH_TX39XX)	+= txx9/
> -platform-$(CONFIG_MACH_TX49XX)	+= txx9/
> -
>  cflags-$(CONFIG_MACH_TX39XX)	+=					\
>  		-I$(srctree)/arch/mips/include/asm/mach-tx39xx
>  cflags-$(CONFIG_MACH_TX49XX)	+=					\
> 

Tested-by: Joshua Kinard <kumba@gentoo.org>
Reviewed-by: Joshua Kinard <kumba@gentoo.org>

