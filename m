Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A16732E68E
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 11:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbhCEKkS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 05:40:18 -0500
Received: from 3.mo5.mail-out.ovh.net ([46.105.40.108]:50038 "EHLO
        3.mo5.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCEKjs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 05:39:48 -0500
X-Greylist: delayed 1055 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Mar 2021 05:39:48 EST
Received: from player787.ha.ovh.net (unknown [10.108.20.147])
        by mo5.mail-out.ovh.net (Postfix) with ESMTP id 6E15E2B3EE0
        for <linux-mips@vger.kernel.org>; Fri,  5 Mar 2021 11:39:47 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player787.ha.ovh.net (Postfix) with ESMTPSA id 46D2E1BE6FC32;
        Fri,  5 Mar 2021 10:39:37 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G002147fd398-b58b-41e1-ab1a-00ab95efaa5d,
                    4F7D11A3904BD8E553EC742B87CBB6774FEDAA0F) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: [PATCH 2/2] nvmem: iomap: new driver exposing NVMEM accessible
 using I/O mapping
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org
References: <20210304144132.24098-1-zajec5@gmail.com>
 <20210304144132.24098-2-zajec5@gmail.com>
 <047bced8-6c20-4a0a-c7ea-e0ad83318461@linaro.org>
 <93708a21-3444-f68e-c834-a4f769a0acba@milecki.pl>
 <35e498b6-3b2c-d154-db00-d755af339b60@linaro.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <ba4e4376-7d75-4b0e-9d59-26e32dbe2029@milecki.pl>
Date:   Fri, 5 Mar 2021 11:39:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <35e498b6-3b2c-d154-db00-d755af339b60@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 752945565747678743
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepkeduheejheffudefhffghfegjeejleetkeevueelveegkefhhfffieehleelgfevnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05.03.2021 11:33, Srinivas Kandagatla wrote:
> On 05/03/2021 10:24, Rafał Miłecki wrote:
>>>>
>>>> +static int iomap_read(void *context, unsigned int offset, void *val,
>>>> +              size_t bytes)
>>>> +{
>>>> +    struct iomap *priv = context;
>>>> +    u8 *src = priv->base + offset;
>>>> +    u8 *dst = val;
>>>> +    size_t tmp;
>>>> +
>>>> +    tmp = offset % 4;
>>>> +    memcpy_fromio(dst, src, tmp);
>>>> +    dst += tmp;
>>>> +    src += tmp;
>>>> +    bytes -= tmp;
>>>> +
>>>> +    tmp = rounddown(bytes, 4);
>>>> +    __ioread32_copy(dst, src, tmp / 4);
>>>> +    dst += tmp;
>>>> +    src += tmp;
>>>> +    bytes -= tmp;
>>>> +
>>>> +    memcpy_fromio(dst, src, bytes);
>>>> +
>>>
>>>
>>> You could just do this!
>>>
>>>      while (bytes--)
>>>          *val++ = readb(priv->base + offset + i++);
>>
>> Do you mean that as replacement for "memcpy_fromio" or the whole
>> function code?
> 
> Yes please!
> 
>> The reason for using __ioread32_copy() was to improve reading
>> performance (using aligned 32 bit access where possible). I'm not sure
>> if that really matters?
> 
> Just simple while loop is much readable than the previous code TBH!
> 
>>
> 
>> P.S.
>> Please don't yell at me in every sentence :( Makes me a bit sad :(
> Sorry!! I did not mean anything as such! :-)

All clear (I hope)! Thanks for your review!
