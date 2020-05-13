Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8871D126E
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 14:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731875AbgEMMPu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 08:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgEMMPu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 08:15:50 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F597C061A0C;
        Wed, 13 May 2020 05:15:50 -0700 (PDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jYqIX-00020P-0Z; Wed, 13 May 2020 14:15:41 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 67ED9100605; Wed, 13 May 2020 14:15:40 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 5/6] irqchip: Add Loongson PCH MSI controller
In-Reply-To: <874ksk3uda.fsf@nanos.tec.linutronix.de>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com> <20200428063247.2223499-1-jiaxun.yang@flygoat.com> <20200428063247.2223499-5-jiaxun.yang@flygoat.com> <874ksk3uda.fsf@nanos.tec.linutronix.de>
Date:   Wed, 13 May 2020 14:15:40 +0200
Message-ID: <871rno3uab.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas Gleixner <tglx@linutronix.de> writes:
> Jiaxun Yang <jiaxun.yang@flygoat.com> writes:
>> +
>> +struct pch_msi_data {
>> +	spinlock_t		msi_map_lock;
>> +	phys_addr_t		doorbell;
>> +	u32			irq_first;	/* The vector number that MSIs starts */
>> +	u32			num_irqs;	/* The number of vectors for MSIs */
>> +	unsigned long		*msi_map;
>> +};
>> +
>> +static void pch_msi_mask_msi_irq(struct irq_data *d)
>> +{
>> +	pci_msi_mask_irq(d);
>> +	irq_chip_mask_parent(d);
>> +}
>> +
>> +static void pch_msi_unmask_msi_irq(struct irq_data *d)
>> +{
>> +	pci_msi_unmask_irq(d);
>> +	irq_chip_unmask_parent(d);
>
> The ordering of mask and unmask is assymetric. That does not make sense.
>
>> +static struct msi_domain_info pch_msi_domain_info = {
>> +	.flags		= MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
>> +			  MSI_FLAG_MULTI_PCI_MSI | MSI_FLAG_PCI_MSIX,
>> +	.chip	= &pch_msi_irq_chip,
>
> Please maintain tabular layout.

Ooops. Wanted to reply to V3, but the comments are valid for V3 as well.

Thanks,

        tglx
