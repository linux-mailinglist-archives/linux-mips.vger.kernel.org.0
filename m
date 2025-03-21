Return-Path: <linux-mips+bounces-8304-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4DFA6C67B
	for <lists+linux-mips@lfdr.de>; Sat, 22 Mar 2025 00:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E207463982
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 23:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D50122D781;
	Fri, 21 Mar 2025 23:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="uPnLAcz9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7B22D79A;
	Fri, 21 Mar 2025 23:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742600630; cv=none; b=r1E0G6srKcSwjA3vUqRFVpKm57qz9yxk+nnVtJCucZUB16xS4Jh3UY0J0HFVsGqcUirGl/VFWUpsq9NfDoIhtK9X6CM4fVGsdDojhSb/JK9BWWV3KVvOCuuPx37ABRfU+N04glbODwBnHJupRr1NPKll3hZUmQqJpkq4Okf4gqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742600630; c=relaxed/simple;
	bh=0YlhmsqVJqyKLTQlrLmuX8giANE/7kmOE8z/It4VeEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4Y1W5+Es6VbnIoKwqxRF5PSF0NFucA8IxCD5o+7WDMLVHLrdv/OnQSnfBPXdY76hmUEVJqcWRyNUNtnGibAOFotgHPw4oUjXXUkxbl9KcfBwlbwZYkNAEi9xbtQdhfg6+S/dkuq7Afd/r9lrVNDJXciMkZkG36E0C6Y249VwbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=uPnLAcz9; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 551C1297BEE;
	Sat, 22 Mar 2025 00:43:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742600625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m8/dml8cBA307rIhQR/2DcZSr7O2w983VSBwU+b/4g4=;
	b=uPnLAcz9Mn05NoxfVoN2JC8VxczVJlaiXX8Pk1SQ0fp76TVmxuF8GOvLBnQLSHvbfyUdTc
	BtxRrcHg/ktKSxJM7OcW+hCZ7kUTWjdc1PMw2WNdOBLjpY6pl+lGpwtCQLGIVRF0puM3ue
	AbDyAYBGrsOr/EW7yvO1rqZhGgO8ojmLiePEodCtLsUf6+n9fu+cxM/TcnWpvHzGCxmDwd
	QtuIuByGUyTwd1fL20diptC7R8Z9MnhS9AN5jXHzGnhf2r2rOVLrVMnuV64wTq5xJkr8U7
	Uk89QfVY+a1hBj6wHv6kMlj4keYL7t+I0ChndIUoLSnWE/aH5z7Jqr6MUunmeg==
Message-ID: <8fba3bb0-cfb5-4427-97d0-0cf9493a5bcf@cjdns.fr>
Date: Sat, 22 Mar 2025 00:43:42 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v1 7/8] mips: Add EcoNet MIPS platform support
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu
References: <20250321134633.2155141-1-cjd@cjdns.fr>
 <20250321134633.2155141-8-cjd@cjdns.fr>
 <f1f50469-bbd2-41a8-87a5-a535a9bc495b@kernel.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <f1f50469-bbd2-41a8-87a5-a535a9bc495b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 21/03/2025 22:00, Krzysztof Kozlowski wrote:
> On 21/03/2025 14:46, Caleb James DeLisle wrote:
>> Add platform support for EcoNet MIPS SoCs.
>>
>> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
>> ---
>> As is typical of embedded platforms, it's not realistic to imagine building
>> a fully functioning system from kernel sources alone. In the interest of
>> providing something without external dependencies, I have included build and
>> device tree for a minimal testing / PoC image that can be booted from memory
>> on these devices.
>> ---
>>   arch/mips/Kbuild.platforms                    |  1 +
>>   arch/mips/Kconfig                             | 25 ++++++
>>   arch/mips/boot/compressed/uart-16550.c        |  5 ++
>>   arch/mips/boot/dts/Makefile                   |  1 +
>>   arch/mips/boot/dts/econet/Makefile            |  2 +
>>   arch/mips/boot/dts/econet/en751221.dtsi       | 62 +++++++++++++++
>>   .../boot/dts/econet/en751221_test_image.dts   | 19 +++++
>>   arch/mips/econet/Kconfig                      | 42 ++++++++++
>>   arch/mips/econet/Makefile                     |  2 +
>>   arch/mips/econet/Platform                     |  5 ++
>>   arch/mips/econet/init.c                       | 78 +++++++++++++++++++
>>   11 files changed, 242 insertions(+)
>>   create mode 100644 arch/mips/boot/dts/econet/Makefile
>>   create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
>>   create mode 100644 arch/mips/boot/dts/econet/en751221_test_image.dts
> DTS are always, always separate patches. See also DTS coding style and
> submitting patches in the bindings, which already covers this.
Ok got it, somehow I though arch/mips/* made it different.
>
>
> ...
>
>
>> new file mode 100644
>> index 000000000000..e4404aed5705
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/econet/en751221.dtsi
>> @@ -0,0 +1,62 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/dts-v1/;
>> +
>> +/ {
>> +	compatible = "econet,en751221";
>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
>> +
>> +	hpt_clock: hpt_clock {
> No underscores in node names.
>
> Follow DTS coding style.
Right, I know this, my fault.
>
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <200000000>;  /* 200 MHz */
>> +	};
>> +
>> +	cpus: cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "mips,mips24KEc";
>> +			reg = <0>;
>> +		};
>> +	};
>> +
>> +	cpuintc: interrupt-controller {
>> +		#address-cells = <0>;
>> +		#interrupt-cells = <1>;
>> +		interrupt-controller;
>> +		compatible = "mti,cpu-interrupt-controller";
>> +	};
>> +
>> +	intc: interrupt-controller@1fb40000 {
>> +		compatible = "econet,en751221-intc";
>> +		reg = <0x1fb40000 0x100>;
>> +		interrupt-parent = <&cpuintc>;
>> +		interrupts = <2>;
>> +
>> +		interrupt-controller;
>> +		#interrupt-cells = <1>;
>> +		econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
>> +	};
>> +
>> +	uart: serial@1fbf0000 {
>> +		compatible = "ns16550";
>> +		reg = <0x1fbf0000 0x30>;
>> +		reg-io-width = <4>;
>> +		reg-shift = <2>;
>> +		interrupt-parent = <&intc>;
>> +		interrupts = <0>;
>> +		clock-frequency = <1843200>;
>> +	};
>> +
>> +	timer_hpt: timer_hpt@1fbf0400 {
> Same problem as with binding.
Will fix.
>
>> +		compatible = "econet,timer-hpt";
>> +		reg = <0x1fbf0400 0x100>;
>> +
>> +		interrupt-parent = <&intc>;
>> +		interrupts = <30>;
>> +		clocks = <&hpt_clock>;
>> +	};
>> +};
>> diff --git a/arch/mips/boot/dts/econet/en751221_test_image.dts b/arch/mips/boot/dts/econet/en751221_test_image.dts
>> new file mode 100644
>> index 000000000000..bc140c4043b2
>> --- /dev/null
>> +++ b/arch/mips/boot/dts/econet/en751221_test_image.dts
> Does not look like a board. We do not take some testing/debugging
> thingies. Please upstream *real* board.
No problem, will swap this out for a cheap available modem that I like to dev on.
>
>> @@ -0,0 +1,19 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/dts-v1/;
>> +
>> +#include "en751221.dtsi"
>> +
>> +/ {
>> +	model = "Generic EN751221";
> Missing compatible.
>
>> +
>> +	memory@0 {
>> +		/* We hope at least 64MB will be available wherever we are run */
>> +		device_type = "memory";
>> +		reg = <0x00000000 0x4000000>;
>> +	};
>> +
>> +	chosen {
>> +		bootargs = "console=ttyS0,115200";
> Drop bootargs and use standard property - stdout.
>
> See how all other platforms are doing it (and not some ancient MIPS, but
> the most recent arm64 or riscv).
Sure thing.
>
>
>> +		linux,usable-memory-range = <0x00020000 0x3fe0000>;
>> +	};
>> +};
>> diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
>> new file mode 100644
>> index 000000000000..12f85d638e47
>> --- /dev/null
>> +++ b/arch/mips/econet/Kconfig
>> @@ -0,0 +1,42 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +if ECONET
>> +
>> +config SOC_ECONET_EN751221
>> +	bool
>> +	select COMMON_CLK
>> +	select ECONET_EN751221_INTC
>> +	select IRQ_MIPS_CPU
>> +	select SMP
>> +	select SMP_UP
>> +	select SYS_SUPPORTS_SMP
>> +
>> +choice
>> +	prompt "EcoNet SoC selection"
>> +	default SOC_ECONET_EN751221_FAMILY
>> +	help
>> +	  Select EcoNet MIPS SoC type. Individual SoCs within a family are
>> +	  similar enough that is it enough to select the right family, and
>> +	  then customize to the specific SoC using the device tree only.
>> +
>> +	config SOC_ECONET_EN751221_FAMILY
>> +		bool "EN751221 family"
>> +		select SOC_ECONET_EN751221
>> +		help
>> +		  The EN751221 family includes EN7512, RN7513, EN7521, EN7526.
>> +		  They are based on single core MIPS 34Kc processors. To boot
>> +		  this kernel, you will need a device tree such as
>> +		  MIPS_RAW_APPENDED_DTB=y, and a root filesystem.
>> +
>> +	config SOC_ECONET_EN751221_TEST_IMAGE
>> +		bool "EN751221 test image"
>> +		select SOC_ECONET_EN751221
>> +		select BUILTIN_DTB
>> +		help
>> +		  Build a minimal kernel that will boot on any EN751221 board
>> +		  with at least 64MB of memory. This has a builtin device tree
>> +		  so it can boot with nothing more than an appended initramfs.
>> +		  This is good for validating that a given SoC is EN751221
>> +		  compatible, or for regression testing.
>> +endchoice
>> +
>> +endif
>> diff --git a/arch/mips/econet/Makefile b/arch/mips/econet/Makefile
>> new file mode 100644
>> index 000000000000..7e4529e7d3d7
>> --- /dev/null
>> +++ b/arch/mips/econet/Makefile
>> @@ -0,0 +1,2 @@
>> +
>> +obj-y := init.o
>> diff --git a/arch/mips/econet/Platform b/arch/mips/econet/Platform
>> new file mode 100644
>> index 000000000000..bb659876d855
>> --- /dev/null
>> +++ b/arch/mips/econet/Platform
>> @@ -0,0 +1,5 @@
>> +# To address a 7.2MB kernel size limit in the EcoNet SDK bootloader,
>> +# we put the load address well above where the bootloader loads and then use
>> +# zboot. So please set CONFIG_ZBOOT_LOAD_ADDRESS to the address where your
>> +# bootloader actually places the kernel.
>> +load-$(CONFIG_ECONET)	+= 0xffffffff81000000
>> \ No newline at end of file
> You have patch warnings

"No newline at end of file" - that's embarrassing, I'll try to figure out how that got into the patch.


Thank you very much for your time.


Thanks,

Caleb


>
> Best regards,
> Krzysztof

