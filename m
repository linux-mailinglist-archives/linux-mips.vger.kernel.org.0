Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E369327807B
	for <lists+linux-mips@lfdr.de>; Fri, 25 Sep 2020 08:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgIYGV4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Sep 2020 02:21:56 -0400
Received: from [115.28.160.31] ([115.28.160.31]:52128 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726980AbgIYGV4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Sep 2020 02:21:56 -0400
X-Greylist: delayed 517 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Sep 2020 02:21:55 EDT
Received: from hanazono.local (unknown [58.33.27.210])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BFB5A60090;
        Fri, 25 Sep 2020 14:13:13 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1601014393; bh=V0Ygvtf4vpO0JeazKdMA+3ySfJW8HmZ2bFd4D+BjQJk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vdaCtn200P8bDkWt7a59PRBQDkd9IZmysThDky7awGnLrIQKrLZzElqmxYpU/hlgj
         OJSjSACCATrLc7bzVcQS5lMOfIjkRwekLMrlX/m80wJnOg5vnKg12ZNFQ9vxcqFcLV
         u8oUWgzg8w7VHKoenQ9h+E+RGEx47eeOIFelVgos=
Subject: Re: [PATCH 1/4] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
To:     Du Huanpeng <u74147@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     WANG Xuerui <git@xen0n.name>, linux-rtc@vger.kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>
References: <20200923075845.360974-1-git@xen0n.name>
 <20200923075845.360974-2-git@xen0n.name>
 <2a478254-c4de-49dd-d598-c7553f4672bf@loongson.cn>
 <20200923143149.GA11566@tkernel.org>
From:   WANG Xuerui <i@xen0n.name>
Message-ID: <3b35cd8d-012a-18b5-50c3-8dae19cc53b1@xen0n.name>
Date:   Fri, 25 Sep 2020 14:13:13 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:83.0)
 Gecko/20100101 Thunderbird/83.0a1
MIME-Version: 1.0
In-Reply-To: <20200923143149.GA11566@tkernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

(Re-sending, as the original reply inadvertently contained an HTML part
and has been blocked by all of the mailing lists.)

Hi Huanpeng,

On 2020/9/23 22:31, Du Huanpeng wrote:

>> rtc-ls2x --> rtc-ls2x-ls7a
>> RTC_DRV_LS2X --> RTC_DRV_LS2X_LS7A
>> Loongson LS2X RTC --> Loongson LS2X/LS7A RTC
>>
>> Maybe the related names include ls7a or LS7A is better to
>> reflect the reality?
> Is there any difference with the rtc IP in loongson 1* SoCs?

From a cursory look at 1A and 7A manuals the registers seem to have the
same layout. Some registers are marked as "reserved" on the 7A manual
while having real meaning on 1A, like the sys_toytrim and sys_rtctrim
registers.

I am investigating whether the rtc_ls1x driver could be worked to
support DT configuration, along with the hardcoded addresses when
compiled for Loongson 1A. If so, adding a separate rtc_ls2x may not be
necessary, rtc_ls1x would be turned into something like rtc_loongson
instead.

>
> Regards,
> Du Huanpeng
