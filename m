Return-Path: <linux-mips+bounces-424-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F1F800928
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43F85B20CBE
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 10:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E25B20B35;
	Fri,  1 Dec 2023 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iEZjQQCW"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982658E;
	Fri,  1 Dec 2023 02:56:24 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6509E000A;
	Fri,  1 Dec 2023 10:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701428183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+aHykdI2ZYd1V9EjT5KVj02Y0Ap+cQgVJzA3meTQI8g=;
	b=iEZjQQCWe6qrlWcccMIHxYXYpai7JvMmIwbARLlXoLnLmilJAoiCMiike1Pcq0ppcc3F7H
	FUvg02eTR4x8vnnXl8aJoVKmNFgpjSgSvdnQCH9ggxCpvx6tInGPi1s6R+Jh3LkESVgs5x
	27eSkWLQ9QE8+9FSBXiiypTvq/h1fTJJSUVRQ8zAjNfaCvjaWHmuvOajwnChg8wERuzScm
	aN4plzh4zs/MQmMFQkuAP+QuMN+nd5lbkOigA1cJ2jLJGjGI1QQXh6YHcFTgOj8Iz9/qDu
	FtQ2MjYJM0gQ574dGqDiFtPCkpN+sKJr6oVKgEllR4bopdeWkq47g7wPycheSQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Paul Burton
 <paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
 <tawfik.bayouk@mobileye.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 18/21] MIPS: mobileye: Add EyeQ5 dtsi
In-Reply-To: <46bba00c-00b7-46db-984c-4391f7fc11f6@linaro.org>
References: <20231123152639.561231-1-gregory.clement@bootlin.com>
 <20231123152639.561231-19-gregory.clement@bootlin.com>
 <46bba00c-00b7-46db-984c-4391f7fc11f6@linaro.org>
Date: Fri, 01 Dec 2023 11:56:22 +0100
Message-ID: <87r0k6dwdl.fsf@BL-laptop>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 23/11/2023 16:26, Gregory CLEMENT wrote:
>> Add a device tree include file for the Mobileye EyeQ5 SoC.
>> 
>> Based on the work of Slava Samsonov <stanislav.samsonov@intel.com>
>> 
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>
>
>> +	aliases {
>> +		serial0 = &uart0;
>> +		serial1 = &uart1;
>> +		serial2 = &uart2;
>> +	};
>> +
>> +	cpu_intc: interrupt-controller {
>> +		compatible = "mti,cpu-interrupt-controller";
>> +		interrupt-controller;
>> +		#address-cells = <0>;
>> +		#interrupt-cells = <1>;
>> +	};
>> +
>> +	gic: interrupt-controller@140000 {
>
> Why do you put MMIO nodes in top-level?

I can move it back under the soc node I think

>
>> +		compatible = "mti,gic";
>> +		reg = <0x0 0x140000 0x0 0x20000>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <3>;
>> +
>> +		/*
>> +		* Declare the interrupt-parent even though the mti,gic
>> +		* binding doesn't require it, such that the kernel can
>> +		* figure out that cpu_intc is the root interrupt
>> +		* controller & should be probed first.
>> +		*/
>> +		interrupt-parent = <&cpu_intc>;
>> +
>> +		timer {
>> +			compatible = "mti,gic-timer";
>> +			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
>> +			clocks = <&core0_clk>;
>> +		};
>> +	};
>> +
>> +	soc: soc {
>
> Are you sure dtbs_check W=1 does not complain? I think you miss here
> address.

Yes dtbs_check W=1 does not complain. There is no reg property in this
node, so there is no address to add to the name of the node.

Gregory

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

