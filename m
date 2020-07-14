Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E3821EA02
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 09:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbgGNH0t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 03:26:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45042 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725780AbgGNH0t (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jul 2020 03:26:49 -0400
Received: from [10.130.0.75] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_x0qXg1f1UkEAA--.3938S3;
        Tue, 14 Jul 2020 15:26:35 +0800 (CST)
Subject: Re: [PATCH 2/4] MIPS: Loongson64: DeviceTree for LS7A PCH
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
 <1594294424-26218-2-git-send-email-chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <52c5ea0c-1479-a292-65f3-b61de239b79f@loongson.cn>
Date:   Tue, 14 Jul 2020 15:26:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1594294424-26218-2-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dx_x0qXg1f1UkEAA--.3938S3
X-Coremail-Antispam: 1UD129KBjvAXoWfGFy5Jr1DWry3Gw47Kr1UAwb_yoW8Xw43Zo
        W2yFsYyFW0k3yUZ3W8XF1xta12yFs0gF42qayqyF1rGF1rKws8Aa48Aw4fKw48uw4rtr1D
        J342gayrGw4akr4kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYs7k0a2IF6F4UM7kC6x804xWl14x267AKxVW8JVW5JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280
        aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
        ZEXa7IU8BnmtUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/09/2020 07:33 PM, Huacai Chen wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Add DeviceTree files for Classic Loongson64 Quad Core + LS7A boards and
> Generic Loongson64 Quad Core + LS7A boards.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

> ---
>   arch/mips/boot/dts/loongson/Makefile               |   5 +-
>   .../boot/dts/loongson/loongson64c_4core_ls7a.dts   |  37 ++
>   .../boot/dts/loongson/loongson64g-package.dtsi     |  61 ++++
>   .../boot/dts/loongson/loongson64g_4core_ls7a.dts   |  37 ++
>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 371 +++++++++++++++++++++
>   .../include/asm/mach-loongson64/builtin_dtbs.h     |   2 +
>   6 files changed, 512 insertions(+), 1 deletion(-)
>   create mode 100644 arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
>   create mode 100644 arch/mips/boot/dts/loongson/loongson64g-package.dtsi
>   create mode 100644 arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
>   create mode 100644 arch/mips/boot/dts/loongson/ls7a-pch.dtsi
>
> diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
> index aa5069a..ae1c8bf 100644
> --- a/arch/mips/boot/dts/loongson/Makefile
> +++ b/arch/mips/boot/dts/loongson/Makefile
> @@ -1,4 +1,7 @@
>   # SPDX_License_Identifier: GPL_2.0
> -dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb loongson64c_8core_rs780e.dtb
> +dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_ls7a.dtb
> +dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb
> +dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
> +dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
>   
>   obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
> diff --git a/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts b/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
> new file mode 100644
> index 00000000..c7ea4f1c
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "loongson64c-package.dtsi"
> +#include "ls7a-pch.dtsi"
> +
> +/ {
> +	compatible = "loongson,loongson64c-4core-ls7a";
> +};
> +
> +&package0 {
> +	htvec: interrupt-controller@efdfb000080 {
> +		compatible = "loongson,htvec-1.0";
> +		reg = <0xefd 0xfb000080 0x40>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		interrupt-parent = <&liointc>;
> +		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <27 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +};
> +
> +&pch {
> +	msi: msi-controller@2ff00000 {
> +		compatible = "loongson,pch-msi-1.0";
> +		reg = <0 0x2ff00000 0 0x8>;
> +		interrupt-controller;
> +		msi-controller;
> +		loongson,msi-base-vec = <64>;
> +		loongson,msi-num-vecs = <64>;
> +		interrupt-parent = <&htvec>;
> +	};
> +};
> diff --git a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
> new file mode 100644
> index 00000000..38abc57
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
> @@ -0,0 +1,61 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpuintc: interrupt-controller {
> +		#address-cells = <0>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		compatible = "mti,cpu-interrupt-controller";
> +	};
> +
> +	package0: bus@1fe00000 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <1>;
> +		ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
> +			0 0x3ff00000 0 0x3ff00000 0x100000
> +			0xefd 0xfb000000 0xefd 0xfb000000 0x10000000>;
> +
> +		liointc: interrupt-controller@3ff01400 {
> +			compatible = "loongson,liointc-1.0";
> +			reg = <0 0x3ff01400 0x64>;
> +
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			interrupt-parent = <&cpuintc>;
> +			interrupts = <2>, <3>;
> +			interrupt-names = "int0", "int1";
> +
> +			loongson,parent_int_map = <0x00ffffff>, /* int0 */
> +						<0xff000000>, /* int1 */
> +						<0x00000000>, /* int2 */
> +						<0x00000000>; /* int3 */
> +
> +		};
> +
> +		cpu_uart0: serial@1fe001e0 {
> +			compatible = "ns16550a";
> +			reg = <0 0x1fe00100 0x10>;
> +			clock-frequency = <100000000>;
> +			interrupt-parent = <&liointc>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
> +			no-loopback-test;
> +		};
> +
> +		cpu_uart1: serial@1fe001e8 {
> +			status = "disabled";
> +			compatible = "ns16550a";
> +			reg = <0 0x1fe00110 0x10>;
> +			clock-frequency = <100000000>;
> +			interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&liointc>;
> +			no-loopback-test;
> +		};
> +	};
> +};
> diff --git a/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts b/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
> new file mode 100644
> index 00000000..bdc911e
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/dts-v1/;
> +
> +#include "loongson64g-package.dtsi"
> +#include "ls7a-pch.dtsi"
> +
> +/ {
> +	compatible = "loongson,loongson64g-4core-ls7a";
> +};
> +
> +&package0 {
> +	htvec: interrupt-controller@efdfb000080 {
> +		compatible = "loongson,htvec-1.0";
> +		reg = <0xefd 0xfb000080 0x40>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		interrupt-parent = <&liointc>;
> +		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
> +			     <25 IRQ_TYPE_LEVEL_HIGH>,
> +			     <26 IRQ_TYPE_LEVEL_HIGH>,
> +			     <27 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +};
> +
> +&pch {
> +	msi: msi-controller@2ff00000 {
> +		compatible = "loongson,pch-msi-1.0";
> +		reg = <0 0x2ff00000 0 0x8>;
> +		interrupt-controller;
> +		msi-controller;
> +		loongson,msi-base-vec = <64>;
> +		loongson,msi-num-vecs = <128>;
> +		interrupt-parent = <&htvec>;
> +	};
> +};
> diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> new file mode 100644
> index 00000000..1c286bb
> --- /dev/null
> +++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
> @@ -0,0 +1,371 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/ {
> +	pch: bus@10000000 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0x10000000 0 0x10000000 0 0x10000000 /* PIO & CONF & APB */
> +				0 0x20000000 0 0x20000000 0 0x10000000
> +				0 0x40000000 0 0x40000000 0 0x40000000 /* PCI MEM */
> +				0xe00 0x00000000 0xe00 0x00000000 0x100 0x0000000>;
> +
> +		pic: interrupt-controller@10000000 {
> +			compatible = "loongson,pch-pic-1.0";
> +			reg = <0 0x10000000 0 0x400>;
> +			interrupt-controller;
> +			interrupt-parent = <&htvec>;
> +			loongson,pic-base-vec = <0>;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pci@1a000000 {
> +			compatible = "loongson,ls7a-pci";
> +			device_type = "pci";
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			#interrupt-cells = <2>;
> +			msi-parent = <&msi>;
> +
> +			reg = <0 0x1a000000 0 0x02000000>,
> +				<0xefe 0x00000000 0 0x20000000>;
> +
> +			ranges = <0x01000000 0x0 0x00020000 0x0 0x18020000 0x0 0x00020000>,
> +				 <0x02000000 0x0 0x40000000 0x0 0x40000000 0x0 0x40000000>;
> +
> +			ohci@4,0 {
> +				compatible = "pci0014,7a24.0",
> +						   "pci0014,7a24",
> +						   "pciclass0c0310",
> +						   "pciclass0c03";
> +
> +				reg = <0x2000 0x0 0x0 0x0 0x0>;
> +				interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			ehci@4,1 {
> +				compatible = "pci0014,7a14.0",
> +						   "pci0014,7a14",
> +						   "pciclass0c0320",
> +						   "pciclass0c03";
> +
> +				reg = <0x2100 0x0 0x0 0x0 0x0>;
> +				interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			ohci@5,0 {
> +				compatible = "pci0014,7a24.0",
> +						   "pci0014,7a24",
> +						   "pciclass0c0310",
> +						   "pciclass0c03";
> +
> +				reg = <0x2800 0x0 0x0 0x0 0x0>;
> +				interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			ehci@5,1 {
> +				compatible = "pci0014,7a14.0",
> +						   "pci0014,7a14",
> +						   "pciclass0c0320",
> +						   "pciclass0c03";
> +
> +				reg = <0x2900 0x0 0x0 0x0 0x0>;
> +				interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			sata@8,0 {
> +				compatible = "pci0014,7a08.0",
> +						   "pci0014,7a08",
> +						   "pciclass010601",
> +						   "pciclass0106";
> +
> +				reg = <0x4000 0x0 0x0 0x0 0x0>;
> +				interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			sata@8,1 {
> +				compatible = "pci0014,7a08.0",
> +						   "pci0014,7a08",
> +						   "pciclass010601",
> +						   "pciclass0106";
> +
> +				reg = <0x4100 0x0 0x0 0x0 0x0>;
> +				interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			sata@8,2 {
> +				compatible = "pci0014,7a08.0",
> +						   "pci0014,7a08",
> +						   "pciclass010601",
> +						   "pciclass0106";
> +
> +				reg = <0x4200 0x0 0x0 0x0 0x0>;
> +				interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			gpu@6,0 {
> +				compatible = "pci0014,7a15.0",
> +						   "pci0014,7a15",
> +						   "pciclass030200",
> +						   "pciclass0302";
> +
> +				reg = <0x3000 0x0 0x0 0x0 0x0>;
> +				interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			dc@6,1 {
> +				compatible = "pci0014,7a06.0",
> +						   "pci0014,7a06",
> +						   "pciclass030000",
> +						   "pciclass0300";
> +
> +				reg = <0x3100 0x0 0x0 0x0 0x0>;
> +				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			hda@7,0 {
> +				compatible = "pci0014,7a07.0",
> +						   "pci0014,7a07",
> +						   "pciclass040300",
> +						   "pciclass0403";
> +
> +				reg = <0x3800 0x0 0x0 0x0 0x0>;
> +				interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +			};
> +
> +			gmac@3,0 {
> +				compatible = "pci0014,7a03.0",
> +						   "pci0014,7a03",
> +						   "pciclass020000",
> +						   "pciclass0200";
> +
> +				reg = <0x1800 0x0 0x0 0x0 0x0>;
> +				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
> +					     <13 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "macirq", "eth_lpi";
> +				interrupt-parent = <&pic>;
> +				phy-mode = "rgmii";
> +				mdio {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					compatible = "snps,dwmac-mdio";
> +					phy0: ethernet-phy@0 {
> +						reg = <0>;
> +					};
> +				};
> +			};
> +
> +			gmac@3,1 {
> +				compatible = "pci0014,7a03.0",
> +						   "pci0014,7a03",
> +						   "pciclass020000",
> +						   "pciclass0200";
> +
> +				reg = <0x1900 0x0 0x0 0x0 0x0>;
> +				interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
> +					     <15 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "macirq", "eth_lpi";
> +				interrupt-parent = <&pic>;
> +				phy-mode = "rgmii";
> +				mdio {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					compatible = "snps,dwmac-mdio";
> +					phy1: ethernet-phy@1 {
> +						reg = <0>;
> +					};
> +				};
> +			};
> +
> +			pci_bridge@9,0 {
> +				compatible = "pci0014,7a19.1",
> +						   "pci0014,7a19",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x4800 0x0 0x0 0x0 0x0>;
> +				interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 32 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@a,0 {
> +				compatible = "pci0014,7a09.1",
> +						   "pci0014,7a09",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x5000 0x0 0x0 0x0 0x0>;
> +				interrupts = <33 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 33 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@b,0 {
> +				compatible = "pci0014,7a09.1",
> +						   "pci0014,7a09",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x5800 0x0 0x0 0x0 0x0>;
> +				interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 34 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@c,0 {
> +				compatible = "pci0014,7a09.1",
> +						   "pci0014,7a09",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x6000 0x0 0x0 0x0 0x0>;
> +				interrupts = <35 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 35 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@d,0 {
> +				compatible = "pci0014,7a19.1",
> +						   "pci0014,7a19",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x6800 0x0 0x0 0x0 0x0>;
> +				interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 36 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@e,0 {
> +				compatible = "pci0014,7a09.1",
> +						   "pci0014,7a09",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x7000 0x0 0x0 0x0 0x0>;
> +				interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 37 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@f,0 {
> +				compatible = "pci0014,7a29.1",
> +						   "pci0014,7a29",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x7800 0x0 0x0 0x0 0x0>;
> +				interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 40 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@10,0 {
> +				compatible = "pci0014,7a19.1",
> +						   "pci0014,7a19",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x8000 0x0 0x0 0x0 0x0>;
> +				interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 41 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@11,0 {
> +				compatible = "pci0014,7a29.1",
> +						   "pci0014,7a29",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x8800 0x0 0x0 0x0 0x0>;
> +				interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 42 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@12,0 {
> +				compatible = "pci0014,7a19.1",
> +						   "pci0014,7a19",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x9000 0x0 0x0 0x0 0x0>;
> +				interrupts = <43 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 43 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@13,0 {
> +				compatible = "pci0014,7a29.1",
> +						   "pci0014,7a29",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0x9800 0x0 0x0 0x0 0x0>;
> +				interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 38 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +
> +			pci_bridge@14,0 {
> +				compatible = "pci0014,7a19.1",
> +						   "pci0014,7a19",
> +						   "pciclass060400",
> +						   "pciclass0604";
> +
> +				reg = <0xa000 0x0 0x0 0x0 0x0>;
> +				interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-parent = <&pic>;
> +
> +				#interrupt-cells = <1>;
> +				interrupt-map-mask = <0 0 0 0>;
> +				interrupt-map = <0 0 0 0 &pic 39 IRQ_TYPE_LEVEL_HIGH>;
> +			};
> +		};
> +	};
> +};
> diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
> index 930c8a1..6d2f141 100644
> --- a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
> +++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
> @@ -8,6 +8,8 @@
>   #ifndef __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
>   #define __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
>   
> +extern u32 __dtb_loongson64c_4core_ls7a_begin[];
>   extern u32 __dtb_loongson64c_4core_rs780e_begin[];
>   extern u32 __dtb_loongson64c_8core_rs780e_begin[];
> +extern u32 __dtb_loongson64g_4core_ls7a_begin[];
>   #endif

