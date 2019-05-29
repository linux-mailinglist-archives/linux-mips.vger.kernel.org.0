Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF112D509
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 07:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725865AbfE2FTo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 01:19:44 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:38402 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbfE2FTo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 May 2019 01:19:44 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id E53AF4FD95;
        Wed, 29 May 2019 07:19:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id ghBXvmPuM0oz; Wed, 29 May 2019 07:19:34 +0200 (CEST)
Subject: Re: [PATCH 5/8 v2] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT
 node
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>,
        Wolfram Sang <wsa@the-dreams.de>
References: <20190527091323.4582-1-sr@denx.de>
 <20190527091323.4582-5-sr@denx.de>
 <20190528204119.g7kvutxcprhwo56d@pburton-laptop>
From:   Stefan Roese <sr@denx.de>
Message-ID: <96f6564a-e45b-a082-4682-c81dde8d22d5@denx.de>
Date:   Wed, 29 May 2019 07:19:31 +0200
MIME-Version: 1.0
In-Reply-To: <20190528204119.g7kvutxcprhwo56d@pburton-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 28.05.19 22:41, Paul Burton wrote:
> Hi Stefan,
> 
> On Mon, May 27, 2019 at 11:13:20AM +0200, Stefan Roese wrote:
>> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
>> index 0c2983c9c47c..64a425c7d639 100644
>> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
>> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
>> @@ -170,6 +170,22 @@
>>   			interrupts = <6>;
>>   		};
>>   
>> +		i2c: i2c@900 {
>> +			compatible = "mediatek,mt7621-i2c";
>> +			reg = <0x900 0x100>;
> 
> I don't see this compatible string listed under
> Documentation/devicetree/bindings, nor in
> drivers/i2c/busses/i2c-mt65xx.c which I presume is the driver that would
> handle it.

No, these is a different driver queued for this (old) SoC. I've submitted
it on the I2C list and am pretty hopeful, that it will hit next shortly:

https://patchwork.ozlabs.org/patch/1095794/

The bindings are included in this patch.
  
> I guess this needs driver changes to be applied before it'll actually do
> anything?

Correct.
  
> I'd prefer that at least the DT binding documentation goes in before we
> add the nodes to the DT.

I understand. I've added Wolfram to Cc to perhaps comment on this.
  
> If those changes are already queued up somewhere else could you point me
> at them?

Please see above.

Thanks,
Stefan
