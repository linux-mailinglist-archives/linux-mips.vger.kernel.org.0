Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA932D50E
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 07:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfE2FWq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 01:22:46 -0400
Received: from mx1.mailbox.org ([80.241.60.212]:49288 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbfE2FWq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 May 2019 01:22:46 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx1.mailbox.org (Postfix) with ESMTPS id E42DF4DAB6;
        Wed, 29 May 2019 07:22:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de [80.241.56.125]) (amavisd-new, port 10030)
        with ESMTP id olmCPB_Achb5; Wed, 29 May 2019 07:22:33 +0200 (CEST)
Subject: Re: [PATCH 6/8 v2] MIPS: ralink: mt7628a.dtsi: Add SPI controller DT
 node
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
References: <20190527091323.4582-1-sr@denx.de>
 <20190527091323.4582-6-sr@denx.de>
 <20190528204306.r4mzjy7ytvvhfhnn@pburton-laptop>
From:   Stefan Roese <sr@denx.de>
Message-ID: <7af0f0c1-f1cb-30f3-62fb-700db7426c39@denx.de>
Date:   Wed, 29 May 2019 07:22:33 +0200
MIME-Version: 1.0
In-Reply-To: <20190528204306.r4mzjy7ytvvhfhnn@pburton-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 28.05.19 22:43, Paul Burton wrote:
> Hi Stefan,
> 
> On Mon, May 27, 2019 at 11:13:21AM +0200, Stefan Roese wrote:
>> diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
>> index 64a425c7d639..0895ae62782a 100644
>> --- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
>> +++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
>> @@ -186,6 +186,22 @@
>>   			status = "disabled";
>>   		};
>>   
>> +		spi: spi@b00 {
>> +			compatible = "ralink,mt7621-spi";
>> +			reg = <0xb00 0x100>;
> 
> Same here as for the I2C controller - I don't see this compatible string
> documented.

This one is already in mainline (version > v5.2-rc1):

Documentation/devicetree/bindings/spi/spi-mt7621.txt

I've pushed this driver from staging into drivers/spi after doing some
cleanup and fixes.

Thanks,
Stefan
