Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF1A2DB65F
	for <lists+linux-mips@lfdr.de>; Tue, 15 Dec 2020 23:13:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729926AbgLOWNR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Dec 2020 17:13:17 -0500
Received: from mout.gmx.net ([212.227.15.15]:53555 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729759AbgLOWNQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 15 Dec 2020 17:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608070300;
        bh=eykgBkg9EF8bq1r8JxRlhj1YtGEbeS3BGKrh7f9r4Hk=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=iVMufxoc4mYSzLcZhDVpqyHLzBEm631kGVNxmTrN8VTwPYnFqWZSaHoK3jOa8yJzz
         vDMU3iE5VC1aNCPWmpXNMXAJOT1pyMHkjXIoS6Ofn6nyj2yFamGuaMwFJxU+7gsDZx
         hbnLPZAA8C0KvJDVyOzaQCqPcqax0vP/OZSnsgzg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.55] ([95.91.192.147]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MLi8g-1kXlgx41Ds-00Hfh5; Tue, 15
 Dec 2020 23:11:40 +0100
Subject: Re: [PATCH] Add support for Realtek RTL838x/RTL839x switch SoCs
To:     Bert Vermeulen <bert@biot.com>, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201215183557.646034-1-bert@biot.com>
From:   Oleksij Rempel <linux@rempel-privat.de>
Message-ID: <fbd86bc4-5826-5b2b-5818-3ccd39a090fb@rempel-privat.de>
Date:   Tue, 15 Dec 2020 23:11:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215183557.646034-1-bert@biot.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s7TacMDOE3xxo1D7JBgH+dB9Ndh/428hsnT2kXmTl2W4tpYa5r/
 m1KW3Poz/jBZncW9GhZhJIR4dijUdPh6RuIbVfNcK1YYPweu2eejQVgfoHFfrEUTZj96E1R
 fVdBWgq6EBuHW6oNsU0+uLErb+f04eKM8O5KAFoIkcXFz06c4aXKtcTa4Hbb30FqJko4lg4
 5wi/QYD4/MHLu09roVCUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OUYGbzW+qNU=:gel/DVUMEz+4b2WRU79mgr
 BDItjjlRTBkFQ3mP8qebhtEFyHt1y3zQtP+dh+e8mtqYGAVA8cqDf7kcY7A8WnW0HcHkrmQts
 Stuzj9FkdTsKqPI+tCztE7X5z0fXRXBWlswROFIXvmYPTI/oFCZSbAVeSfcTqf6ShndpIcHqH
 cbWuceVF6kIXH1iJU/elBWlxTVr7TIs0/n9F0tXOuc8Gi6Dqwr9NEvBpeI4Dq6PU2aZQG8to+
 NGL1CxCNm+2Zc+NZgTBWXY3tapptmDYqHAcJ+3SxjErQ+nAZqu8LAFOVhwFLeQqoBDTCuJN4K
 xki7QCsONHIP+BmNXe/dIwNYuqfMx5O/DpvdK8ioF7LyF5cSpBm7XNhW3b7eeLU/8f3xGTCSi
 Vvsr5vH/2bNLdn+xIo8FiHlD7CeS+48VLONiYsBTLmHWU3eEz3Fsdu2q0xUZnH73pK68j/HXX
 qH6xicf46cecED/F4wxBy2yuCTcVFB8fblBBHQvBXv3nrEe4gJCGqQVo+hxYYvLeJdH0V9/3e
 9g8Ejin76o0CxM4d6DI74bB4/xI53w+3YQ3a31POFFIAqfzxIL2OtzYq2dfG/lPqzH/DTU03B
 7PmJbnOJMCEkb1UiVBwNcv6/Ds4y+1swPuDy8ZHgb8I3TdwXz+o2Cu/MMyUX9YdpcQQnxJeSC
 yCMXa0BQ+CKw9tWJ8SYa7GBwZ2QsxyZTPpw4iF2zzyaLVf1y5JuoVtriMZKOFKt/wuRI1vYrC
 sx9pujOqu8h4zR9SENcdzWxd0Fm03QEWc1nJh9AIwK+fDPfekS+uU4bIP3vvBCOjDruzxZZZG
 VR1eRVP0wGdXhSYNo4RurZnqegezk7LJmbA7UxPspuyCqbGxYI+yVODpM/a0Ri76pHY296Ktf
 Bgso7x1CKBBai9EBTTAA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Bert,

thank you for your work. Here are some comments..

Am 15.12.20 um 19:35 schrieb Bert Vermeulen:
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> ---
>  arch/mips/Kbuild.platforms                    |   1 +
>  arch/mips/Kconfig                             |  20 +++
>  arch/mips/include/asm/mach-realtek/ioremap.h  |  29 ++++
>  arch/mips/include/asm/mach-realtek/irq.h      |  69 ++++++++
>  .../include/asm/mach-realtek/mach-realtek.h   |  69 ++++++++
>  arch/mips/realtek/Makefile                    |   1 +
>  arch/mips/realtek/Platform                    |   6 +
>  arch/mips/realtek/irq.c                       | 157 ++++++++++++++++++
>  arch/mips/realtek/prom.c                      | 126 ++++++++++++++
>  arch/mips/realtek/setup.c                     |  58 +++++++
>  10 files changed, 536 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-realtek/ioremap.h
>  create mode 100644 arch/mips/include/asm/mach-realtek/irq.h
>  create mode 100644 arch/mips/include/asm/mach-realtek/mach-realtek.h
>  create mode 100644 arch/mips/realtek/Makefile
>  create mode 100644 arch/mips/realtek/Platform
>  create mode 100644 arch/mips/realtek/irq.c
>  create mode 100644 arch/mips/realtek/prom.c
>  create mode 100644 arch/mips/realtek/setup.c
>
> diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
> index 5483e38b5dc7..e9adc6e7d1d3 100644
> --- a/arch/mips/Kbuild.platforms
> +++ b/arch/mips/Kbuild.platforms
> @@ -22,6 +22,7 @@ platform-$(CONFIG_NLM_COMMON)		+=3D netlogic/
>  platform-$(CONFIG_PIC32MZDA)		+=3D pic32/
>  platform-$(CONFIG_MACH_PISTACHIO)	+=3D pistachio/
>  platform-$(CONFIG_RALINK)		+=3D ralink/
> +platform-$(CONFIG_MACH_REALTEK)		+=3D realtek/
>  platform-$(CONFIG_MIKROTIK_RB532)	+=3D rb532/
>  platform-$(CONFIG_SGI_IP22)		+=3D sgi-ip22/
>  platform-$(CONFIG_SGI_IP27)		+=3D sgi-ip27/
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 6b762bebff33..58966ebaed5b 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -624,6 +624,26 @@ config RALINK
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select RESET_CONTROLLER
>
> +config MACH_REALTEK
> +	bool "Realtek RTL8380 based machines"
> +	select DMA_NONCOHERENT
> +	select IRQ_MIPS_CPU
> +	select CSRC_R4K
> +	select CEVT_R4K
> +	select SYS_HAS_CPU_MIPS32_R1
> +	select SYS_HAS_CPU_MIPS32_R2
> +	select SYS_SUPPORTS_BIG_ENDIAN
> +	select SYS_SUPPORTS_32BIT_KERNEL
> +	select SYS_SUPPORTS_MIPS16
> +	select SYS_SUPPORTS_MULTITHREADING
> +	select SYS_SUPPORTS_VPE_LOADER
> +	select SYS_HAS_EARLY_PRINTK
> +	select SYS_HAS_EARLY_PRINTK_8250
> +	select USE_GENERIC_EARLY_PRINTK_8250
> +	select BOOT_RAW
> +	select PINCTRL
> +	select USE_OF
> +
>  config SGI_IP22
>  	bool "SGI IP22 (Indy/Indigo2)"
>  	select ARC_MEMORY
> diff --git a/arch/mips/include/asm/mach-realtek/ioremap.h b/arch/mips/in=
clude/asm/mach-realtek/ioremap.h
> new file mode 100644
> index 000000000000..8847d0b99dad
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-realtek/ioremap.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _RTL8380_IOREMAP_H_
> +#define _RTL8380_IOREMAP_H_
> +
> +static inline int is_rtl8380_internal_registers(phys_addr_t offset)
> +{
> +	/* IO-Block */
> +	if (offset >=3D 0xb8000000 && offset < 0xb9000000)
> +		return 1;
> +	/* Switch block */
> +	if (offset >=3D 0xbb000000 && offset < 0xbc000000)
> +		return 1;
> +	return 0;
> +}

This part can be replaced with "ranges" device tree bus property.

> +static inline void __iomem *plat_ioremap(phys_addr_t offset, unsigned l=
ong size,
> +					 unsigned long flags)
> +{
> +	if (is_rtl8380_internal_registers(offset))
> +		return (void __iomem *)offset;
> +	return NULL;
> +}
> +
> +static inline int plat_iounmap(const volatile void __iomem *addr)
> +{
> +	return is_rtl8380_internal_registers((unsigned long)addr);
> +}
> +
> +#endif /* _RTL8380_IOREMAP_H_ */
> diff --git a/arch/mips/include/asm/mach-realtek/irq.h b/arch/mips/includ=
e/asm/mach-realtek/irq.h
> new file mode 100644
> index 000000000000..e2e2cd6dd27a
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-realtek/irq.h
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
> + * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
> + * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
> + * Copyright (C) 2020 John Crispin <john@phrozen.org>
> + */
> +
> +#ifndef _RTL8380_IRQ_H_
> +#define _RTL8380_IRQ_H_
> +
> +#define NR_IRQS 32
> +#include_next <irq.h>
> +
> +/* Global Interrupt Mask Register */
> +#define RTL8380_ICTL_GIMR	0x00
> +/* Global Interrupt Status Register */
> +#define RTL8380_ICTL_GISR	0x04
> +
> +/* Cascaded interrupts */
> +#define RTL8380_CPU_IRQ_SHARED0		(MIPS_CPU_IRQ_BASE + 2)
> +#define RTL8380_CPU_IRQ_UART		(MIPS_CPU_IRQ_BASE + 3)
> +#define RTL8380_CPU_IRQ_SWITCH		(MIPS_CPU_IRQ_BASE + 4)
> +#define RTL8380_CPU_IRQ_SHARED1		(MIPS_CPU_IRQ_BASE + 5)
> +#define RTL8380_CPU_IRQ_EXTERNAL	(MIPS_CPU_IRQ_BASE + 6)
> +#define RTL8380_CPU_IRQ_COUNTER		(MIPS_CPU_IRQ_BASE + 7)
> +
> +
> +/* Interrupt routing register */
> +#define RTL8380_IRR0		0x08
> +#define RTL8380_IRR1		0x0c
> +#define RTL8380_IRR2		0x10
> +#define RTL8380_IRR3		0x14
> +
> +/* Cascade map */
> +#define RTL8380_IRQ_CASCADE_UART0	2
> +#define RTL8380_IRQ_CASCADE_UART1	1
> +#define RTL8380_IRQ_CASCADE_TC0		5
> +#define RTL8380_IRQ_CASCADE_TC1		1
> +#define RTL8380_IRQ_CASCADE_OCPTO	1
> +#define RTL8380_IRQ_CASCADE_HLXTO	1
> +#define RTL8380_IRQ_CASCADE_SLXTO	1
> +#define RTL8380_IRQ_CASCADE_NIC		4
> +#define RTL8380_IRQ_CASCADE_GPIO_ABCD	4
> +#define RTL8380_IRQ_CASCADE_GPIO_EFGH	4
> +#define RTL8380_IRQ_CASCADE_RTC		4
> +#define RTL8380_IRQ_CASCADE_SWCORE	3
> +#define RTL8380_IRQ_CASCADE_WDT_IP1	4
> +#define RTL8380_IRQ_CASCADE_WDT_IP2	5
> +
> +/* Pack cascade map into interrupt routing registers */
> +#define RTL8380_IRR0_SETTING (\
> +	(RTL8380_IRQ_CASCADE_UART0	<< 28) | \
> +	(RTL8380_IRQ_CASCADE_UART1	<< 24) | \
> +	(RTL8380_IRQ_CASCADE_TC0	<< 20) | \
> +	(RTL8380_IRQ_CASCADE_TC1	<< 16) | \
> +	(RTL8380_IRQ_CASCADE_OCPTO	<< 12) | \
> +	(RTL8380_IRQ_CASCADE_HLXTO	<< 8)  | \
> +	(RTL8380_IRQ_CASCADE_SLXTO	<< 4)  | \
> +	(RTL8380_IRQ_CASCADE_NIC	<< 0))
> +#define RTL8380_IRR1_SETTING (\
> +	(RTL8380_IRQ_CASCADE_GPIO_ABCD	<< 28) | \
> +	(RTL8380_IRQ_CASCADE_GPIO_EFGH	<< 24) | \
> +	(RTL8380_IRQ_CASCADE_RTC	<< 20) | \
> +	(RTL8380_IRQ_CASCADE_SWCORE	<< 16))
> +#define RTL8380_IRR2_SETTING	0
> +#define RTL8380_IRR3_SETTING	0
> +
> +#endif /* _RTL8380_IRQ_H_ */
> diff --git a/arch/mips/include/asm/mach-realtek/mach-realtek.h b/arch/mi=
ps/include/asm/mach-realtek/mach-realtek.h
> new file mode 100644
> index 000000000000..bc6b1e57c00a
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-realtek/mach-realtek.h
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
> + * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
> + * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
> + * Copyright (C) 2020 John Crispin <john@phrozen.org>
> + */
> +
> +#ifndef _MACH_REALTEK_H_
> +#define _MACH_REALTEK_H_
> +
> +struct realtek_soc_info {
> +	unsigned char *name;
> +	unsigned int id;
> +	unsigned int family;
> +};
> +
> +/* High 16 bits of MODEL_NAME_INFO register */
> +#define RTL8389_FAMILY_ID		0x8389
> +#define RTL8328_FAMILY_ID		0x8328
> +#define RTL8390_FAMILY_ID		0x8390
> +#define RTL8350_FAMILY_ID		0x8350
> +#define RTL8380_FAMILY_ID		0x8380
> +#define RTL8330_FAMILY_ID		0x8330
> +
> +/* Interrupt numbers/bits */
> +#define RTL8380_IRQ_UART0		31
> +#define RTL8380_IRQ_UART1		30
> +#define RTL8380_IRQ_TC0			29
> +#define RTL8380_IRQ_TC1			28
> +#define RTL8380_IRQ_OCPTO		27
> +#define RTL8380_IRQ_HLXTO		26
> +#define RTL8380_IRQ_SLXTO		25
> +#define RTL8380_IRQ_NIC			24
> +#define RTL8380_IRQ_GPIO_ABCD		23
> +#define RTL8380_IRQ_GPIO_EFGH		22
> +#define RTL8380_IRQ_RTC			21
> +#define RTL8380_IRQ_SWCORE		20
> +#define RTL8380_IRQ_WDT_IP1		19
> +#define RTL8380_IRQ_WDT_IP2		18
> +
> +
> +// TODO: move to DT
> +#define RTL8380_SWITCH_BASE		((volatile void *) 0xBB000000)
> +#define RTL8380_MODEL_NAME_INFO		(RTL8380_SWITCH_BASE + 0x00D4)
> +#define RTL8390_MODEL_NAME_INFO		(RTL8380_SWITCH_BASE + 0x0FF0)
> +
> +/* GMII pinmux on RTL838x */
> +#define RTL8380_GMII_INTF_SEL		(RTL8380_SWITCH_BASE + 0x1000)
> +#define RTL8380_GMII_INTF_SEL_UART1	BIT(4)
> +#define RTL8380_GMII_INTF_SEL_JTAG	(BIT(2) | BIT(3))
> +#define RTL8380_GMII_INTF_SEL_GMII	(BIT(0) | BIT(1))
> +
> +/* GMII pinmux on RTL839x */
> +#define RTL8390_MAC_IF_CTRL		(RTL8380_SWITCH_BASE + 0x04)
> +#define RTL8390_MAC_IF_CTRL_JTAG	BIT(1)
> +#define RTL8390_MAC_IF_CTRL_UART	BIT(0)
> +
> +/* Used to detect address length pin strapping on RTL833x/RTL838x */
> +#define RTL8380_INT_RW_CTRL		(RTL8380_SWITCH_BASE + 0x58)
> +#define RTL8380_EXT_VERSION		(RTL8380_SWITCH_BASE + 0xD0)
> +#define RTL8380_PLL_CML_CTRL		(RTL8380_SWITCH_BASE + 0xFF8)
> +#define RTL8380_STRAP_DBG		(RTL8380_SWITCH_BASE + 0x100C)
> +
> +/* Reset */
> +#define RTL8380_RST_GLB_CTRL_1		(RTL8380_SWITCH_BASE + 0x40)
> +#define RTL8390_RST_GLB_CTRL		(RTL8380_SWITCH_BASE + 0x14)
> +
> +#endif /* _MACH_RTL8380_H_ */
> diff --git a/arch/mips/realtek/Makefile b/arch/mips/realtek/Makefile
> new file mode 100644
> index 000000000000..4616928e9883
> --- /dev/null
> +++ b/arch/mips/realtek/Makefile
> @@ -0,0 +1 @@
> +obj-y :=3D setup.o prom.o irq.o
> diff --git a/arch/mips/realtek/Platform b/arch/mips/realtek/Platform
> new file mode 100644
> index 000000000000..6e6b29b82b81
> --- /dev/null
> +++ b/arch/mips/realtek/Platform
> @@ -0,0 +1,6 @@
> +#
> +# Realtek RTL8380 SoCs
> +#
> +platform-$(CONFIG_MACH_REALTEK) +=3D realtek/
> +cflags-$(CONFIG_MACH_REALTEK)   +=3D -I$(srctree)/arch/mips/include/asm=
/mach-realtek/
> +load-$(CONFIG_MACH_REALTEK)     +=3D 0xffffffff80000000
> diff --git a/arch/mips/realtek/irq.c b/arch/mips/realtek/irq.c
> new file mode 100644
> index 000000000000..99c0adb56de3
> --- /dev/null
> +++ b/arch/mips/realtek/irq.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
> + * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
> + * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
> + * Copyright (C) 2020 John Crispin <john@phrozen.org>
> + */
> +
> +#include <linux/irqchip.h>
> +#include <linux/spinlock.h>
> +#include <linux/of_address.h>
> +#include <asm/irq_cpu.h>
> +#include <linux/of_irq.h>
> +#include <asm/cevt-r4k.h>
> +
> +#include <mach-realtek.h>
> +#include "irq.h"
> +
> +#define REG(x)		(realtek_ictl_base + x)
> +
> +extern struct realtek_soc_info soc_info;
> +
> +static DEFINE_RAW_SPINLOCK(irq_lock);
> +static void __iomem *realtek_ictl_base;
> +
> +static void realtek_ictl_enable_irq(struct irq_data *i)
> +{
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&irq_lock, flags);
> +
> +	value =3D readl(REG(RTL8380_ICTL_GIMR));
> +	value |=3D BIT(i->hwirq);
> +	writel(value, REG(RTL8380_ICTL_GIMR));
> +
> +	raw_spin_unlock_irqrestore(&irq_lock, flags);
> +}
> +
> +static void realtek_ictl_disable_irq(struct irq_data *i)
> +{
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&irq_lock, flags);
> +
> +	value =3D readl(REG(RTL8380_ICTL_GIMR));
> +	value &=3D ~BIT(i->hwirq);
> +	writel(value, REG(RTL8380_ICTL_GIMR));
> +
> +	raw_spin_unlock_irqrestore(&irq_lock, flags);
> +}
> +
> +static struct irq_chip realtek_ictl_irq =3D {
> +	.name =3D "rtl8380",
> +	.irq_enable =3D realtek_ictl_enable_irq,
> +	.irq_disable =3D realtek_ictl_disable_irq,
> +	.irq_ack =3D realtek_ictl_disable_irq,
> +	.irq_mask =3D realtek_ictl_disable_irq,
> +	.irq_unmask =3D realtek_ictl_enable_irq,
> +	.irq_eoi =3D realtek_ictl_enable_irq,
> +};
> +
> +static int intc_map(struct irq_domain *d, unsigned int irq, irq_hw_numb=
er_t hw)
> +{
> +	irq_set_chip_and_handler(hw, &realtek_ictl_irq, handle_level_irq);
> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops irq_domain_ops =3D {
> +	.map =3D intc_map,
> +	.xlate =3D irq_domain_xlate_onecell,
> +};
> +
> +static void realtek_irq_dispatch(struct irq_desc *desc)
> +{
> +	unsigned int pending =3D readl(REG(RTL8380_ICTL_GIMR)) & readl(REG(RTL=
8380_ICTL_GISR));
> +
> +	if (pending) {
> +		struct irq_domain *domain =3D irq_desc_get_handler_data(desc);
> +		generic_handle_irq(irq_find_mapping(domain, __ffs(pending)));
> +	} else {
> +		spurious_interrupt();
> +	}
> +}
> +
> +asmlinkage void plat_irq_dispatch(void)
> +{
> +	unsigned int pending;
> +
> +	pending =3D  read_c0_cause() & read_c0_status() & ST0_IM;
> +
> +	if (pending & CAUSEF_IP7)
> +		do_IRQ(RTL8380_CPU_IRQ_COUNTER);
> +
> +	else if (pending & CAUSEF_IP6)
> +		do_IRQ(RTL8380_CPU_IRQ_EXTERNAL);
> +
> +	else if (pending & CAUSEF_IP5)
> +		do_IRQ(RTL8380_CPU_IRQ_SHARED1);
> +
> +	else if (pending & CAUSEF_IP4)
> +		do_IRQ(RTL8380_CPU_IRQ_SWITCH);
> +
> +	else if (pending & CAUSEF_IP3)
> +		do_IRQ(RTL8380_CPU_IRQ_UART);
> +
> +	else if (pending & CAUSEF_IP2)
> +		do_IRQ(RTL8380_CPU_IRQ_SHARED0);
> +
> +	else
> +		spurious_interrupt();
> +}
> +
> +static void __init icu_of_init(struct device_node *node, struct device_=
node *parent)
> +{
> +	struct irq_domain *domain;
> +
> +	domain =3D irq_domain_add_simple(node, 32, 0,
> +				       &irq_domain_ops, NULL);
> +        irq_set_chained_handler_and_data(2, realtek_irq_dispatch, domai=
n);
> +        irq_set_chained_handler_and_data(5, realtek_irq_dispatch, domai=
n);
> +
> +	realtek_ictl_base =3D of_iomap(node, 0);
> +	if (!realtek_ictl_base)
> +		return;
> +
> +	/* Disable all cascaded interrupts */
> +	writel(0, REG(RTL8380_ICTL_GIMR));
> +
> +	/* Set up interrupt routing */
> +	writel(RTL8380_IRR0_SETTING, REG(RTL8380_IRR0));
> +	writel(RTL8380_IRR1_SETTING, REG(RTL8380_IRR1));
> +	writel(RTL8380_IRR2_SETTING, REG(RTL8380_IRR2));
> +	writel(RTL8380_IRR3_SETTING, REG(RTL8380_IRR3));
> +
> +	/* Clear timer interrupt */
> +	write_c0_compare(0);
> +
> +	/* Enable all CPU interrupts */
> +	write_c0_status(read_c0_status() | ST0_IM);
> +
> +	/* Enable timer0 and uart0 interrupts */
> +	writel(BIT(RTL8380_IRQ_TC0) | BIT(RTL8380_IRQ_UART0), REG(RTL8380_ICTL=
_GIMR));
> +}
> +
> +static struct of_device_id __initdata of_irq_ids[] =3D {
> +	{ .compatible =3D "mti,cpu-interrupt-controller", .data =3D mips_cpu_i=
rq_of_init },
> +	{ .compatible =3D "realtek,rtl8380-intc", .data =3D icu_of_init },
> +	{},
> +};
> +
> +void __init arch_init_irq(void)
> +{
> +	of_irq_init(of_irq_ids);
> +}

this driver should go to drivers/irqchip/
please add irqchip subsystem maintainers to CC

> diff --git a/arch/mips/realtek/prom.c b/arch/mips/realtek/prom.c
> new file mode 100644
> index 000000000000..be9d34282969
> --- /dev/null
> +++ b/arch/mips/realtek/prom.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
> + * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
> + * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
> + * Copyright (C) 2020 John Crispin <john@phrozen.org>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/libfdt.h>
> +#include <asm/prom.h>
> +
> +#include <mach-realtek.h>
> +
> +extern char arcs_cmdline[];
> +extern const char __appended_dtb;
> +
> +struct realtek_soc_info soc_info;
> +const void *fdt;
> +
> +
> +const char *get_system_type(void)
> +{
> +	return soc_info.name;
> +}
> +
> +void __init prom_free_prom_memory(void)
> +{
> +	return;
> +}
> +
> +void __init device_tree_init(void)
> +{
> +	if (!fdt_check_header(&__appended_dtb)) {
> +		fdt =3D &__appended_dtb;
> +		pr_info("Using appended Device Tree.\n");
> +	}
> +	initial_boot_params =3D (void *)fdt;
> +	unflatten_and_copy_device_tree();
> +}
> +
> +static void __init prom_init_cmdline(void)
> +{
> +	int argc =3D fw_arg0;
> +	char **argv =3D (char **) KSEG1ADDR(fw_arg1);
> +	int i;
> +
> +	arcs_cmdline[0] =3D '\0';
> +
> +	for (i =3D 0; i < argc; i++) {
> +		char *p =3D (char *) KSEG1ADDR(argv[i]);
> +
> +		if (CPHYSADDR(p) && *p) {
> +			strlcat(arcs_cmdline, p, sizeof(arcs_cmdline));
> +			strlcat(arcs_cmdline, " ", sizeof(arcs_cmdline));
> +		}
> +	}
> +	pr_info("Kernel command line: %s\n", arcs_cmdline);
> +}
> +
> +void __init prom_init(void)
> +{
> +	void *dtb;
> +	uint32_t model;
> +
> +	/* uart0 */
> +	setup_8250_early_printk_port(0xb8002000, 2, 0);
> +
> +	model =3D readl(RTL8380_MODEL_NAME_INFO) >> 16;
> +	if (model !=3D 0x8330 && model !=3D 0x8332 &&
> +	    model !=3D 0x8380 && model !=3D 0x8382 )
> +		model =3D readl(RTL8390_MODEL_NAME_INFO) >> 16;
> +
> +	soc_info.id =3D model;
> +
> +	switch (model) {
> +		case 0x8328:
> +			soc_info.name=3D"RTL8328";
> +			soc_info.family =3D RTL8328_FAMILY_ID;
> +			break;
> +		case 0x8332:
> +			soc_info.name=3D"RTL8332";
> +			soc_info.family =3D RTL8380_FAMILY_ID;
> +			break;
> +		case 0x8380:
> +			soc_info.name=3D"RTL8380";
> +			soc_info.family =3D RTL8380_FAMILY_ID;
> +			break;
> +		case 0x8382:
> +			soc_info.name=3D"RTL8382";
> +			soc_info.family =3D RTL8380_FAMILY_ID;
> +			break;
> +		case 0x8390:
> +			soc_info.name=3D"RTL8390";
> +			soc_info.family =3D RTL8390_FAMILY_ID;
> +			break;
> +		case 0x8391:
> +			soc_info.name=3D"RTL8391";
> +			soc_info.family =3D RTL8390_FAMILY_ID;
> +			break;
> +		case 0x8392:
> +			soc_info.name=3D"RTL8392";
> +			soc_info.family =3D RTL8390_FAMILY_ID;
> +			break;
> +		case 0x8393:
> +			soc_info.name=3D"RTL8393";
> +			soc_info.family =3D RTL8390_FAMILY_ID;
> +			break;
> +		default:
> +			soc_info.name=3D"DEFAULT";
> +			soc_info.family =3D 0;
> +	}
> +	pr_info("SoC Type: %s\n", soc_info.name);
> +	prom_init_cmdline();
> +
> +	if (fw_passed_dtb)
> +		dtb =3D (void *)fw_passed_dtb;
> +	else if (__dtb_start !=3D __dtb_end)
> +		dtb =3D (void *)__dtb_start;
> +	else
> +		panic("no dtb found");
> +
> +	__dt_setup_arch(dtb);
> +}

It will be better to use arch/mips/generic/init.c, in this case we can boo=
t by using UHI boot
protocol, which is supported by barebox and u-boot.

If you will need help with barebox, please contact me.

> +
> diff --git a/arch/mips/realtek/setup.c b/arch/mips/realtek/setup.c
> new file mode 100644
> index 000000000000..00b6af2fd541
> --- /dev/null
> +++ b/arch/mips/realtek/setup.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2006-2012 Tony Wu <tonywu@realtek.com>
> + * Copyright (C) 2020 Birger Koblitz <mail@birger-koblitz.de>
> + * Copyright (C) 2020 Bert Vermeulen <bert@biot.com>
> + * Copyright (C) 2020 John Crispin <john@phrozen.org>
> + */
> +
> +#include <linux/of_fdt.h>
> +#include <asm/reboot.h>
> +#include <asm/time.h>
> +#include <mach-realtek.h>
> +
> +extern struct realtek_soc_info soc_info;
> +
> +static void realtek_restart(char *command)
> +{
> +	if (soc_info.family =3D=3D RTL8380_FAMILY_ID) {
> +		/* Reset Global Control1 Register */
> +		writel(1, RTL8380_RST_GLB_CTRL_1);
> +	} else if (soc_info.family =3D=3D RTL8390_FAMILY_ID) {
> +		/* If calling reset vector fails, reset entire chip */
> +		writel(0xFFFFFFFF, RTL8390_RST_GLB_CTRL);
> +	}
> +}

this code should go to the drivers/reset/

part of it is probably register_restart_handler
See drivers/reset/reset-ath79.c

> +static void realtek_halt(void)
> +{
> +	printk("System halted.\n");
> +	while(1);
> +}
> +
> +void __init plat_mem_setup(void)
> +{
> +	set_io_port_base(KSEG1);
> +
> +	_machine_restart =3D realtek_restart;
> +	_machine_halt =3D realtek_halt;
> +}
> +
> +void __init plat_time_init(void)
> +{
> +	struct device_node *np;
> +	u32 freq =3D 500000000;
> +
> +	np =3D of_find_node_by_name(NULL, "cpus");
> +	if (!np) {
> +		pr_err("Missing 'cpus' DT node, using default frequency.");
> +	} else {
> +		if (of_property_read_u32(np, "frequency", &freq) < 0)
> +			pr_err("No 'frequency' property in DT, using default.");
> +		else
> +			pr_info("CPU frequency from device tree: %d", freq);
> +		of_node_put(np);
> +	}
> +
> +	mips_hpt_frequency =3D freq / 2;
> +}

Since the DTC is not optional and mach code will panic any way, it will be=
 better to not care about
legacy things. Just mainline properly working device tree.

I assume, after applying all needed changes, there will be no files within
arch/mips/include/asm/mach-realtek :)

=2D-
Regards,
Oleksij
