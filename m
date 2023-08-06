Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D021771345
	for <lists+linux-mips@lfdr.de>; Sun,  6 Aug 2023 04:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjHFCev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 5 Aug 2023 22:34:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjHFCeu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 5 Aug 2023 22:34:50 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797311FF3
        for <linux-mips@vger.kernel.org>; Sat,  5 Aug 2023 19:34:49 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id DC4A65C00BC;
        Sat,  5 Aug 2023 22:34:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 05 Aug 2023 22:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1691289288; x=1691375688; bh=/3/lI4cN91VmFnrrSFomIQr28LE5gz1AtaA
        SnZpmMZk=; b=0ggichtFbJknfVQUrpBV5OP/O2GYull7EqmLMjqXD/sjruauHlK
        s+ZU9+a9mmxlJ8j58Qdzl20doNip0MOiDxH5vnCiLUtJDOhRHFGen4OyNotv0rul
        TxsxdONjJW8UPx0SrnESgEw0GPsbIv0a2pnPSfvNLbShQ4XhjwyvkCYjPXQEWlNP
        Ir8RtR4dJwX8PmJ3u6EC3hPO4FV2zwSHDz6hiTB8VynGIoJVXpSHrPbq5NFcX/ON
        /yGN5SrdW/1Rh7Hmi79CsTt+XXCvkJpTNIO3nSDi0cFv7Clg7QsLWLbLiGvkIkom
        545Fs3QHiJMfQfzVI8J6d4ukSKaQZpGrWEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1691289288; x=1691375688; bh=/3/lI4cN91VmFnrrSFomIQr28LE5gz1AtaA
        SnZpmMZk=; b=RRcE0Q185TStFRpNNUUCq7lv6OBt5yqq3e6y959dRGYMfk6viaY
        um2cSiZhxL8QRfCqfUE5LKx2yOlfz6ehNOzuEDJYjfP1IfKrmPDqTRhw7KRSg2/+
        JKlWfgdp5ksR9YqIFELatzgf434eeKl5bEnjkw8E5DwQMCO4aLOgjNFg1ZsmgD7i
        4rXeDk5t23KNRlxtHREeOZaMBtCTvvI/lx2sSwKL1bXTCxVwfGTicMSdhFr60yW6
        1VeLv+g33KocikoWpwNiYwiXb2Fd64IaSbxryz9umIFiWVthage1LyE8VZlF414o
        9ggOekP3V1HWngboU+/pTntWuoj7TwBa5Mw==
X-ME-Sender: <xms:yAbPZOBh9TapAzIrgeVF9tzMrAt8Qc9ZxFYJ9av60Ptydl2bbB1pFA>
    <xme:yAbPZIgI4J73tp-mAgHEwUJ43snWhC5B-_10C53mrgfWVn2f6RkVhVRsqYj11vD4V
    NALQc139V4cgFFHIuc>
X-ME-Received: <xmr:yAbPZBkqzrFFDSl58gh2BIvyMbE8QVJESWqRXocxLbUb6bPZhd35OZiOoury_Jai_4v7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrkeejgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfvvehfhffujggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhheevgeegveeihefgtdeviefggfetheeiheffteelteffhefh
    ueetffduheefffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:yAbPZMzOibBmXOkfirdIXAh1D5ZvyScGoLV6bqwVaVQtJDzQeudcrQ>
    <xmx:yAbPZDQZzMKRRnGNZKD3xHGRakvjI8lcM-MgnbSpNEOYx4woXlfI0Q>
    <xmx:yAbPZHYPYiQ5MJlsg0pg1rJahU7U7npb44Y901w-YoCjOXLP8-_CvA>
    <xmx:yAbPZOeYRY26lU5NFB6EQ8pDvS1oUMd7QQPb5jvXol07v4OO0azdKQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Aug 2023 22:34:46 -0400 (EDT)
Message-ID: <e448120d-dac2-1d74-c90f-c52b38ff3ade@flygoat.com>
Date:   Sun, 6 Aug 2023 10:34:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        debian-mips <debian-mips@lists.debian.org>, dsa@debian.org
Cc:     linux-mips@vger.kernel.org
References: <ZL1SZw8VrAf3qdxy@aurel32.net> <ZM7LJvwqR4lLbiR5@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: Getting Bullseye/Bookworm kernel running on Loongson 3A boards
In-Reply-To: <ZM7LJvwqR4lLbiR5@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2023/8/6 6:20, Thomas Bogendoerfer 写道:
> On Sun, Jul 23, 2023 at 06:16:39PM +0200, Aurelien Jarno wrote:
>> Dear MIPS porters,
>>
>> DSA would like to upgrade the remaining mips*el buildds to bullseye (and
>> later to bookworm), however we have trouble running the Bullseye or
>> Bookworm kernel on the LS3A-RS780-1w ones.
>>
>> Both Bullseye and Bookworm kernels boot fine up to the userland, but the
>> network card does not work. It *seems* to an interrupt issue as the
>> corresponding counter in /proc/interrupts does not change, and in
>> addition the kernel logs show the following warnings:
>>
>> [    5.077846] pcieport 0000:00:02.0: of_irq_parse_pci: failed with rc=-22
>> [    5.084744] pcieport 0000:00:03.0: of_irq_parse_pci: failed with rc=-22
>> [    5.170772] ahci 0000:00:11.0: of_irq_parse_pci: failed with rc=-22
>> [    7.376554] pci 0000:00:07.0: of_irq_parse_pci: failed with rc=-22
>> [    7.444769] ata_generic 0000:00:14.1: of_irq_parse_pci: failed with rc=-22
>> [    7.495993] ehci-pci 0000:00:12.2: of_irq_parse_pci: failed with rc=-22
>> [    7.624868] ehci-pci 0000:00:13.2: of_irq_parse_pci: failed with rc=-22
>> [    7.753230] ohci-pci 0000:00:12.0: of_irq_parse_pci: failed with rc=-22
>> [    7.886362] ohci-pci 0000:00:12.1: of_irq_parse_pci: failed with rc=-22
>> [    8.018045] ohci-pci 0000:00:13.0: of_irq_parse_pci: failed with rc=-22
>> [    8.150168] ohci-pci 0000:00:13.1: of_irq_parse_pci: failed with rc=-22
>> [    8.294391] ohci-pci 0000:00:14.5: of_irq_parse_pci: failed with rc=-22
>> [   18.398222] snd_hda_intel 0000:00:14.2: of_irq_parse_pci: failed with rc=-22
>> [   18.547932] pci 0000:00:01.0: of_irq_parse_pci: failed with rc=-22
>>
>> Any idea how to solve this issue? I have attached a full 6.1 kernel boot
>> log for reference.
> asking on linux-mips@vger.kernel.org might get more feedback on the issue...
>  From the quick look at kernel code and device tree of the board IMHO
> the DTS is missing interrupt mapping entries for the PCI bus.
>
> Could someone from Loongson have a look at the issue ?

Hi,

This error meesage is expected because we are not using devicetree to parse
interrupt, it is falling back to legacy PCI interrupt on i8259.

```

static int loongson_map_irq(const struct pci_dev *dev, u8 slot, u8 pin)
{
     int irq;
     u8 val;

     irq = of_irq_parse_and_map_pci(dev, slot, pin);
     if (irq > 0)
         return irq;

     /* Care i8259 legacy systems */
     pci_read_config_byte(dev, PCI_INTERRUPT_LINE, &val);
     /* i8259 only have 15 IRQs */
     if (val > 15)
         return 0;

     return val;
}
```

Is there any other error message regarding NIC in dmesg?

Thanks
- Jiaxun

>
> Thomas.
>

