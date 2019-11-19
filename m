Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401EF102AA0
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2019 18:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbfKSRRL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Nov 2019 12:17:11 -0500
Received: from foss.arm.com ([217.140.110.172]:55780 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727805AbfKSRRK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 Nov 2019 12:17:10 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 841311FB;
        Tue, 19 Nov 2019 09:17:09 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5FBF3F703;
        Tue, 19 Nov 2019 09:17:04 -0800 (PST)
Subject: Re: [PATCH] dma-mapping: treat dev->bus_dma_mask as a DMA limit
To:     Christoph Hellwig <hch@lst.de>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Paul Burton <paulburton@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
        phil@raspberrypi.org, linux-acpi@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>, Len Brown <lenb@kernel.org>,
        devicetree@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
References: <20191113161340.27228-1-nsaenzjulienne@suse.de>
 <dd074ef5c23ba56598e92be19e8e25ae31b75f93.camel@suse.de>
 <20191119170006.GA19569@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <7609007d-52f5-bb10-e8d5-96fadbfab46d@arm.com>
Date:   Tue, 19 Nov 2019 17:17:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191119170006.GA19569@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 19/11/2019 5:00 pm, Christoph Hellwig wrote:
> On Tue, Nov 19, 2019 at 01:57:43PM +0100, Nicolas Saenz Julienne wrote:
>> Hi Rob & Christoph,
>> do you mind if I append v2 of this into my upcoming v3 RPi4 PCIe support
>> series, I didn't do it initially as I thought this was going to be a
>> contentious patch.  But as it turned out better than expected, I think it
>> should go into the PCIe series. In the end it's the first explicit user of the
>> bus DMA limit.
>>
>> Here's v2 in case you don't know what I'm talking about:
>> https://www.spinics.net/lists/arm-kernel/msg768459.html
> 
> In principle I wouldn't mind, but I think this is going to conflict
> quite badly with other changes in the dma-mapping tree (including
> yours).  So I think we'll need a shared tree or I'll need to pull
> in the whole series through the dma-mapping tree if there are not
> other conflicts and the other maintainers are fine with it.

TBH I can't see it being a massive problem even if the DMA patch, driver 
and DTS patch went entirely separately via the respective DMA, PCI, and 
arm-soc trees in the same cycle. Bisecting over a merge window is a big 
enough pain in the bum as it is, and if the worst case is that someone 
trying to do that on a Pi4 has a wonky PCI controller appear for a 
couple of commits, they may as well just disable that driver for their 
bisection, because it wasn't there at the start so can't possibly be the 
thing they're looking for regressions in ;)

Robin.
