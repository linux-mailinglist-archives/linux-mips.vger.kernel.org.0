Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D981E2E2E6E
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 16:04:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgLZPDv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 26 Dec 2020 10:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgLZPDv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 26 Dec 2020 10:03:51 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A18C0613C1
        for <linux-mips@vger.kernel.org>; Sat, 26 Dec 2020 07:03:11 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1ktB65-009v9D-Fk
        for linux-mips@vger.kernel.org; Sat, 26 Dec 2020 16:03:09 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8]
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1ktB5J-009v8T-U4; Sat, 26 Dec 2020 16:02:22 +0100
Subject: Re: [PATCH v2] Add support for Realtek RTL838x/RTL839x switch SoCs
To:     Marc Zyngier <maz@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Stafford Horne <shorne@gmail.com>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        Shawn Guo <shawnguo@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20201223150648.1633113-1-bert@biot.com>
 <87o8ikqywn.wl-maz@kernel.org>
From:   Bert Vermeulen <bert@biot.com>
Message-ID: <b8c989de-aae3-fa5e-90aa-ebce668c80f2@biot.com>
Date:   Sat, 26 Dec 2020 16:02:21 +0100
MIME-Version: 1.0
In-Reply-To: <87o8ikqywn.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/23/20 5:18 PM, Marc Zyngier wrote:

Marc,

Thanks for reviewing. We will rework as needed, however:

> On Wed, 23 Dec 2020 15:06:24 +0000,
> Bert Vermeulen <bert@biot.com> wrote:
[...]

>> +/* Interrupt numbers/bits */
>> +#define RTL8380_IRQ_UART0		31
>> +#define RTL8380_IRQ_UART1		30
>> +#define RTL8380_IRQ_TC0			29
>> +#define RTL8380_IRQ_TC1			28
>> +#define RTL8380_IRQ_OCPTO		27
>> +#define RTL8380_IRQ_HLXTO		26
>> +#define RTL8380_IRQ_SLXTO		25
>> +#define RTL8380_IRQ_NIC			24
>> +#define RTL8380_IRQ_GPIO_ABCD		23
>> +#define RTL8380_IRQ_GPIO_EFGH		22
>> +#define RTL8380_IRQ_RTC			21
>> +#define RTL8380_IRQ_SWCORE		20
>> +#define RTL8380_IRQ_WDT_IP1		19
>> +#define RTL8380_IRQ_WDT_IP2		18
> 
> Why do we need any of this? The mapping should be explicit in the DT.
> 
>> +
>> +/* Global Interrupt Mask Register */
>> +#define RTL8380_ICTL_GIMR	0x00
>> +/* Global Interrupt Status Register */
>> +#define RTL8380_ICTL_GISR	0x04
>> +
>> +/* Cascaded interrupts */
>> +#define RTL8380_CPU_IRQ_SHARED0		(MIPS_CPU_IRQ_BASE + 2)
>> +#define RTL8380_CPU_IRQ_UART		(MIPS_CPU_IRQ_BASE + 3)
>> +#define RTL8380_CPU_IRQ_SWITCH		(MIPS_CPU_IRQ_BASE + 4)
>> +#define RTL8380_CPU_IRQ_SHARED1		(MIPS_CPU_IRQ_BASE + 5)
>> +#define RTL8380_CPU_IRQ_EXTERNAL	(MIPS_CPU_IRQ_BASE + 6)
>> +#define RTL8380_CPU_IRQ_COUNTER		(MIPS_CPU_IRQ_BASE + 7)
>> +
>> +
>> +/* Interrupt routing register */
>> +#define RTL8380_IRR0		0x08
>> +#define RTL8380_IRR1		0x0c
>> +#define RTL8380_IRR2		0x10
>> +#define RTL8380_IRR3		0x14
>> +
>> +/* Cascade map */
>> +#define RTL8380_IRQ_CASCADE_UART0	2
>> +#define RTL8380_IRQ_CASCADE_UART1	1
>> +#define RTL8380_IRQ_CASCADE_TC0		5
>> +#define RTL8380_IRQ_CASCADE_TC1		1
>> +#define RTL8380_IRQ_CASCADE_OCPTO	1
>> +#define RTL8380_IRQ_CASCADE_HLXTO	1
>> +#define RTL8380_IRQ_CASCADE_SLXTO	1
>> +#define RTL8380_IRQ_CASCADE_NIC		4
>> +#define RTL8380_IRQ_CASCADE_GPIO_ABCD	4
>> +#define RTL8380_IRQ_CASCADE_GPIO_EFGH	4
>> +#define RTL8380_IRQ_CASCADE_RTC		4
>> +#define RTL8380_IRQ_CASCADE_SWCORE	3
>> +#define RTL8380_IRQ_CASCADE_WDT_IP1	4
>> +#define RTL8380_IRQ_CASCADE_WDT_IP2	5
>> +
>> +/* Pack cascade map into interrupt routing registers */
>> +#define RTL8380_IRR0_SETTING (\
>> +	(RTL8380_IRQ_CASCADE_UART0	<< 28) | \
>> +	(RTL8380_IRQ_CASCADE_UART1	<< 24) | \
>> +	(RTL8380_IRQ_CASCADE_TC0	<< 20) | \
>> +	(RTL8380_IRQ_CASCADE_TC1	<< 16) | \
>> +	(RTL8380_IRQ_CASCADE_OCPTO	<< 12) | \
>> +	(RTL8380_IRQ_CASCADE_HLXTO	<< 8)  | \
>> +	(RTL8380_IRQ_CASCADE_SLXTO	<< 4)  | \
>> +	(RTL8380_IRQ_CASCADE_NIC	<< 0))
>> +#define RTL8380_IRR1_SETTING (\
>> +	(RTL8380_IRQ_CASCADE_GPIO_ABCD	<< 28) | \
>> +	(RTL8380_IRQ_CASCADE_GPIO_EFGH	<< 24) | \
>> +	(RTL8380_IRQ_CASCADE_RTC	<< 20) | \
>> +	(RTL8380_IRQ_CASCADE_SWCORE	<< 16))
>> +#define RTL8380_IRR2_SETTING	0
>> +#define RTL8380_IRR3_SETTING	0

[...]

>> +	/* Set up interrupt routing */
>> +	writel(RTL8380_IRR0_SETTING, REG(RTL8380_IRR0));
>> +	writel(RTL8380_IRR1_SETTING, REG(RTL8380_IRR1));
>> +	writel(RTL8380_IRR2_SETTING, REG(RTL8380_IRR2));
>> +	writel(RTL8380_IRR3_SETTING, REG(RTL8380_IRR3));
> 
> What is this doing?

It's fairly evident considering the comments -- routing of secondary IRQs 
onto the CPU IRQs. But as to packing this into DTS I'm not sure.

DTS syntax being what it is, this would inevitably get more complex and 
harder to understand. Do you have an example where this is done in a better way?

thanks,


-- 
Bert Vermeulen
bert@biot.com
