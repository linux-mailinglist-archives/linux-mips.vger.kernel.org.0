Return-Path: <linux-mips+bounces-9036-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A67AABDFFD
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 18:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141F84C0851
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 16:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D5C26A1C1;
	Tue, 20 May 2025 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="VVJYIc1/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9074F264FA0;
	Tue, 20 May 2025 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757263; cv=none; b=u/nMex/xqMndsiq3wkLWSObMMnod20DuxsnzbFG9wjnDKYG/OvCLAdNRNeutR4+vs1ovxKWJgYXeihh2cA2z8K+kJcjHdItPkaOcjlUpXcM4i+DchgvbiJ4c0nW+bGzpFt8T1PB0Yhe0UT8W0YtaIFvAvg8uubSsca80Ql+wJeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757263; c=relaxed/simple;
	bh=v0FbZ0bqTSzkB5eW1N/iQFtA8MZhX0SXF344a9SjbxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s7sHH9I/R22fscYNaIM3XaJwASiU2nDDb2SqI6NXHTnJHs3QGKy6wVZ1hM4zYUfLp0/QCfaPitsrVcUdAIiz1owfevHFWtxALnEmahec7TvWxB5XQuvNwNBZNjHsPaBpIzQw07n2r1eCjLOYWX6IOTNYlMhSb4enVDAmyrJu3fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=VVJYIc1/; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 71DDD181071;
	Tue, 20 May 2025 18:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747757251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cV83WJnUIky+R223g2aSksD+4VCZTp8VI/RTjmuEuU8=;
	b=VVJYIc1/7YFE6qvXwqXLVA94IZ0dzSrZRxXukSdtSbN/dTtplGNKFkQdjqCG2oF1J25EFQ
	SgnFEFC90K9r7g9Dk88ZFaujlq5H6wCBx/Z45nc9bgxbGpNCmPeYYGE03ENqysRPcOvnO6
	DdtfjRCri/cQwbdeCk03w6weIyaWnWYQnFqsb2CYBUH1jENA2CQYy2FWjqNfBVocWmYa0P
	xk2wNpCF+uQiUqS2OEfrOjHPwy0xWnEJwV+9NVID3omYgNa40n//q2muWMns0Q7e6vqC5/
	+NC33cUZJVn/Y03vX7ubC5uKwXVyaaun7NlVCzGXqHVyT0r8KVmZZL7+HaMGYg==
Message-ID: <3e6bb5e4-5f1c-4ff8-9b73-358a89d50b25@cjdns.fr>
Date: Tue, 20 May 2025 18:07:28 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCwl-nAMxjqjxRM6@alpha.franken.de>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aCwl-nAMxjqjxRM6@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 20/05/2025 08:49, Thomas Bogendoerfer wrote:
> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
>> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
>> processors. They are found in xDSL and xPON modems, and contain PCM
>> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
>>
>> The EcoNet MIPS SoCs are divided broadly into two families, the
>> EN751221 family based on the 34Kc, and the EN751627 family based on
>> the 1004Kc. Individual SoCs within a family are very similar, only
>> with different peripherals.
>>
>> This patchset adds basic "boots to a console" support for the EN751221
>> family and adds SmartFiber XP8421-B, a low cost commercially available
>> board that is useful for testing and development.
>>
>> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
>> peripherals, and for historical reasons Airoha chips are sometimes
>> referred to with the EN75xx prefix. However this is a different
>> platform because Airoha chips are ARM based.
>>
>> This patchset is against mips-next.
>>
>> v4 -> v5
>> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>>    * Improve explanation of HPT timer in changelog
>>    * Move pr_info to pr_debug per recommendation
>>    * Remove pointless debug on spurious interrupt
>>    * Small code-style change
>>
>> v3 -> v4
>> * Rebase to 3b3704261e851e25983860e4c352f1f73786f4ab
>> * Omit already accepted patches (thanks guys!):
>>    - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-2-cjd@cjdns.fr/
>>    - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-3-cjd@cjdns.fr/
>>    - https://patchwork.kernel.org/project/linux-mips/patch/20250330170306.2584136-4-cjd@cjdns.fr/
>>
>> v2 -> v3
>> * econet,en751221-timer.yaml -> Improve code style
>> * vendor-prefixes.yaml -> Correct alphabetic order
>> * en751221.dtsi
>>    - interrupt-controller code style
>>    - serial: Explain reason for clock-frequency = <1843200>
>> * v3->v3 diff provided for reference
>>    - https://gist.github.com/cjdelisle/21c9f0cd225f499bdff3c574c7f185f2
>> * CC: linux-mediatek@lists.infradead.org who may be interested.
>>
>> v1 -> v2
>> * Codestyle
>>    - Apply codestyle from "The tip tree handbook" and recommendations
>>    - Remove "_rai" and "_m" symbol suffixes which are not standard
>> * irq-econet-en751221.c
>>    - Use cleanup.h _guard() and _free()
>>    - Separate irq_domain_ops from irq_chip, eliminating econet_intc struct
>>    - Remove irqsave in econet_wreg, irqs are already disabled in mask/unmask
>>    - Add explainatory comments
>>    - Refactor shadow logic for clarity, e.g. INTC_NO_SHADOW -> NOT_PERCPU
>>    - Improve error handling in case of invalid DTS
>> * econet,timer-hpt.yaml
>>    - Rename to econet,timer-en751221.yaml
>>    - Impose rule: "reg" must have 1 item on EN751221 and 2 on EN751627
>> * timer-econet-hpt.c
>>    - Rename to timer-econet-en751221.c to follow naming scheme from DT
>> * econet,en751221-intc.yaml
>>    - Fix validation error from required: interrupt-parent
>>    - shadow-interrupts -> switch to uint32-matrix for list of pairs
>> * MAINTAINERS -> Fixed accidental F: MAINTAINERS
>> * Replace "test image" with device SmartFiber-XP8421-B
>> * Restructure arch/mips/econet/Kconfig per arch/mips/ralink example
>> * v1->v2 diff is offered for reference:
>>    - https://gist.github.com/cjdelisle/bb3acab78b5f70dcdfe5dd6338293efe
>>
>>
>> Caleb James DeLisle (7):
>>    dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
>>    clocksource/drivers: Add EcoNet Timer HPT driver
>>    dt-bindings: mips: Add EcoNet platform binding
>>    mips: Add EcoNet MIPS platform support
>>    dt-bindings: vendor-prefixes: Add SmartFiber
>>    mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
>>    MAINTAINERS: Add entry for newly added EcoNet platform.
>>
>>   .../devicetree/bindings/mips/econet.yaml      |  26 +++
>>   .../bindings/timer/econet,en751221-timer.yaml |  80 +++++++
>>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>>   MAINTAINERS                                   |  12 +
>>   arch/mips/Kbuild.platforms                    |   1 +
>>   arch/mips/Kconfig                             |  25 ++
>>   arch/mips/boot/compressed/uart-16550.c        |   5 +
>>   arch/mips/boot/dts/Makefile                   |   1 +
>>   arch/mips/boot/dts/econet/Makefile            |   2 +
>>   arch/mips/boot/dts/econet/en751221.dtsi       |  67 ++++++
>>   .../econet/en751221_smartfiber_xp8421-b.dts   |  19 ++
>>   arch/mips/econet/Kconfig                      |  48 ++++
>>   arch/mips/econet/Makefile                     |   2 +
>>   arch/mips/econet/Platform                     |   5 +
>>   arch/mips/econet/init.c                       |  78 +++++++
>>   drivers/clocksource/Kconfig                   |   8 +
>>   drivers/clocksource/Makefile                  |   1 +
>>   drivers/clocksource/timer-econet-en751221.c   | 216 ++++++++++++++++++
>>   18 files changed, 598 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml
>>   create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
>>   create mode 100644 arch/mips/boot/dts/econet/Makefile
>>   create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
>>   create mode 100644 arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
>>   create mode 100644 arch/mips/econet/Kconfig
>>   create mode 100644 arch/mips/econet/Makefile
>>   create mode 100644 arch/mips/econet/Platform
>>   create mode 100644 arch/mips/econet/init.c
>>   create mode 100644 drivers/clocksource/timer-econet-en751221.c
> applied patches 3-7 to mips-next

Thank you very much, and also thanks to everyone who helped review and 
apply the others.


Thanks,

Caleb


>
> Thomas.
>

