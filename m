Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 398F8234DCF
	for <lists+linux-mips@lfdr.de>; Sat,  1 Aug 2020 00:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgGaWt5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 18:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgGaWt5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 18:49:57 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04DDC06174A;
        Fri, 31 Jul 2020 15:49:56 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id u64so30287074qka.12;
        Fri, 31 Jul 2020 15:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AfbW4OLDw+jzbh8Q9mzutrmZ1iJBIk7i75MGhkUmwS0=;
        b=QXzGKWEwR0ofLRFMNj0alecTARQPT8OECxFmlkWodRukCpTriShNTuWuK27RTzQuTU
         KoRNwJQcLoXcwKzUCEUs+D50eAIoWLWCBh0wmKZrf9Qz/vHlxnsSb8zIwWGA680Q6KuF
         keVjr2R1PqCxAOz+9wesAUQm1oWrBvbWxE0JRNChFpy+kd1zlnlh3o5oaMt0JdGwp/3c
         8KypZXNDusFrnLp0Z2yDFz3kU9tB+lwH3LTscaAeCL35XtkOgf6ajKGtjnBEuWr1UfeS
         H4vkNBgp9Km95CHGHKerz8mUXkUoY8U74P7z5YYyt3/CUS5UtvcFQvWMtGm2rZdxbjld
         gM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=AfbW4OLDw+jzbh8Q9mzutrmZ1iJBIk7i75MGhkUmwS0=;
        b=bGRQ87VKqj0DcnntQ4NbQHW40w8BDc83BILD972b18slUjivpgPWqkw6ltcevEaqxi
         XTzuTa+u7sUvn7jJp7gumNCDjc3+A/0qkTBuxM1/y+XAZHsnknpY9CIfXImsWzwNHiAf
         CtmaOryoubZG/1VRPWvj40BPCn8/TdbAlZsdILDyFB+BlE72SYI5prpsm8y+PSyjvFjw
         E8+V01lRqEky1NeL//L/Exj17s8HkYc6IcqtMmJnha0KYP2GN9OYSz8qF58TPvJb2IPL
         SLIIwwFLsiMUSo0y1Gy9/g09u6wuNadObOhdArIh5EgUMk2Kw/1FmEu19/qK0Bs+/9/y
         HNXA==
X-Gm-Message-State: AOAM5304il84b4OBGuM5oe5R9pRlYoyYVYPA6/ZkJtYfOPyM+fWQevVw
        AclUSW3ErSTOex4wIN7bNtXScecf
X-Google-Smtp-Source: ABdhPJyioXUcyyGTHfCRytrcx2dEW2kYlCNrixAp901RDf1v4KdKa0vOKXy6DBe2QcDeQNywP/1zFw==
X-Received: by 2002:a37:e04:: with SMTP id 4mr6148532qko.269.1596235795663;
        Fri, 31 Jul 2020 15:49:55 -0700 (PDT)
Received: from [10.67.50.75] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id x28sm9749990qki.55.2020.07.31.15.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2020 15:49:54 -0700 (PDT)
Subject: Re: [PATCH] MIPS: BMIPS: Disable pref 30 for buggy CPUs
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@linux-mips.org,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200731042401.22871-1-f.fainelli@gmail.com>
 <20200731090526.GB7946@alpha.franken.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <0809b01e-3b36-9d8f-2de1-58b7d649f4c8@gmail.com>
Date:   Fri, 31 Jul 2020 15:49:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731090526.GB7946@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/31/20 2:05 AM, Thomas Bogendoerfer wrote:
> On Thu, Jul 30, 2020 at 09:24:01PM -0700, Florian Fainelli wrote:
>> Disable pref 30 by utilizing the standard quirk method and matching the
>> affected SoCs: 7344, 7346, 7425.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>  arch/mips/bmips/setup.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
>> index 19308df5f577..df0efea12611 100644
>> --- a/arch/mips/bmips/setup.c
>> +++ b/arch/mips/bmips/setup.c
>> @@ -110,6 +110,20 @@ static void bcm6368_quirks(void)
>>  	bcm63xx_fixup_cpu1();
>>  }
>>  
>> +static void bmips5000_pref30_quirk(void)
>> +{
>> +	__asm__ __volatile__(
>> +	"	li	$8, 0x5a455048\n"
>> +	"	.word	0x4088b00f\n"	/* mtc0 $8, $22, 15 */
>> +	"	nop; nop; nop\n"
>> +	"	.word	0x4008b008\n"	/* mfc0 $8, $22, 8 */
>> +	/* disable "pref 30" on buggy CPUs */
>> +	"	lui	$9, 0x0800\n"
>> +	"	or	$8, $9\n"
>> +	"	.word	0x4088b008\n"	/* mtc0 $8, $22, 8 */
>> +	: : : "$8", "$9");
> 
> what's the reason for not using mfc/mtc here ?

See my response to Jiaxun, thanks!
-- 
Florian
