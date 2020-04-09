Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD5B1A2E21
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 06:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgDIEDO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 00:03:14 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:41941 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725271AbgDIEDO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 00:03:14 -0400
Received: by mail-wr1-f46.google.com with SMTP id h9so10226380wrc.8;
        Wed, 08 Apr 2020 21:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2/cfUKHERsg7vC3c65fVSjVEX0L5usertoMDr3BcjYY=;
        b=JPFtXAJYlrg53H9gh4jcIZTfT+3HUnI4Wlg3H+1CEKahibWzzxJdO4Eo7O3qgCKkQ6
         gvtxrMVe9xKHsbm8ecR7UIgNMUun/5Ot4POp+V4MhMHzaGLoHkzwGRMDEqeu9vkemgR3
         q/I3tDATCvW2VpUxCDMBMIbMqsuod3ESGrGx/JeG18LHPbXSQxma35IbRGFV0WAOGdJQ
         HhAq/1H83iC7HXZXKJNj35nRxgwDBecTeO96HnLFPeNM/+6z7fcDM2Uwb6/eEmWA4Bqv
         RN/VQKS35fM9uIs1wRL8rs5a4ImLfeqVpytg1DxDLE9IMKcSTaJvGp6/9Ds7rQANONM0
         fN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2/cfUKHERsg7vC3c65fVSjVEX0L5usertoMDr3BcjYY=;
        b=j60z/vQZsfhJTg5xPKceySM0RlVT+/8z1xQEYT4j/sLDiu4AbdVLK2VXhuo5w8+Q40
         AT3vurQKXzxfltUBDWXgJIe9OAiD7UbjVnClTkgoO5EpDTwgt8fHhvQq8hNHucuA8qTW
         3cFOU+ocLqdV8ur/QtZwE80YF87vo8VlXGZuEue6Zut5teEZZQaP7+tHZnD92vkxYQPK
         za5mZasDrPBvSD/ulnW/3xXPO3e8z8K/048YXO6abLOS+SzNVcpsd1kN3tELMeItWEej
         gz1DFWgGFqvUARHAgU6qnOOGcl5gEwn77mNHlme4CNXRe5Y/qKaiCHnRr0eeyJOcKC+0
         JPzA==
X-Gm-Message-State: AGi0PuawdJwoDPzkZxCp6GtMX7bQG0wb7npF81pK0gRwxmK5eD/tCqrC
        2C96LzTc7AZdMfb1EKcggfYIhe8A
X-Google-Smtp-Source: APiQypKK2SbzZ8GP1suJvLVSvbLoaoj6A6pnaqK81bg/BCJIF+0kdOAH/uqk5L0NInqAjTw/dJpPAQ==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr11547804wrp.420.1586404991389;
        Wed, 08 Apr 2020 21:03:11 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id m13sm8527982wrx.40.2020.04.08.21.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 21:03:10 -0700 (PDT)
Subject: Re: Dealing with holes in CPU address space
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <fcb8f2655452f60a7c734e2ce54ac4d47eec7e92.camel@alliedtelesis.co.nz>
 <20200408152922.14f90ff3@flygoat-x1e>
 <2e10a19b6608a6c3413b52180c69500aa255a701.camel@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <dd91aa7f-ed7d-44de-6887-ad25c7e4d4ff@gmail.com>
Date:   Wed, 8 Apr 2020 21:03:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2e10a19b6608a6c3413b52180c69500aa255a701.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 4/8/2020 2:33 PM, Chris Packham wrote:
> On Wed, 2020-04-08 at 15:29 +0800, Jiaxun Yang wrote:
>> On Wed, 8 Apr 2020 05:14:22 +0000
>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
>>
>>> Hi All,
>>>
>>> I'm trying to port an old Broadcom MIPS CPU (BCM53003) to a shiny
>>> new
>>> kernel. I have some old historic source from a long forgotten
>>> Broadcom
>>> LDK but I'd prefer to do things the modern way with device-trees.
>>>
>>> The problem I've been grappling with is trying to open up access to
>>> all of the RAM on the board. It has 512MB of DDR2. The CPU has two
>>> areas where this appears. The first 128MB is from 0 to 0x07ffffff
>>> the
>>> second area is from 0x88000000 to 0x9fffffff.
>>>
>>> SoC peripherals are at 0x18000000 and there is an IO window for
>>> flash
>>> at 0x20000000.
>>>
>>> The old code has some custom tlb initialisation to deal with this
>>> but
>>> I figured it should be possible with the following dts snippet.
>>>
>>>         memory@0 {
>>>                 device_type = "memory";
>>>                 reg = <0x00000000 0x08000000
>>>                        0x88000000 0x18000000>;
>>>         };
>>>
>>> I end up with only 128MB available. This appears to be
>>> because the default HIGHMEM_START of 0x20000000 stops the rest from
>>> being made available. If I add an override of HIGHMEM_START to
>>> 0xffffffff I seem to have the full 512MB avaiable but then I get a
>>> kernel panic
>>
>> Hi,
>>
>> Have you tried to enable CONFIG_HIGHMEM?
>>
> 
> I have but that didn't seem to help. As I understand it HIGHMEM is
> intended for situations when you have more physical RAM that can be
> addressed (e.g. >4GB on a 32-bit system).

On MIPS you may have to enable HIGHMEM as soon as you run out of virtual
kernel address space to map the entire amount of memory that is
populated AFAICT. The kernel has a little under 1GB of virtual address
space that can be mapped via the TLB since the first 512MB are occupied
by KSEG0/1.

> 
>>>
>>>   CPU 0 Unable to handle kernel paging request at virtual address
>>> 1fc00000, epc == 800167b8, ra == 800e2860
>>>
>>> 0x1fc00000 is in the range where the SoC peripherals are so I'm
>>> thinking that is the problem. But then again that is a virtual
>>> address
>>> so maybe it's just a co-incidence.
>>
>> 0x1fc00000 should be the Boot ROM's physical address. Probably you
>> forgot to convert it into virtual address in your platform code?
> 
> Yes that's right it's the bootroms PA. I'm not intitentionally doing
> anything with it but maybe that's the problem.

If you were accessing this as a virtual address then it would be either
via KSEG0/1 and the addresses would be 0x1fc0_0000 + 0x8000_0000 or
0x1fc0_0000 + 0xa000_0000 but here it looks like the raw physical
address is being accessed which suggests the TLB is incorrectly
programmed somehow.

> 
>>
>> Check the EPC of exception in vmlinux with addr2line may help. (Don't
>> forget to compile your kernel with debuginfo). 
>>
> 
> The full panic is
> 
> CPU 0 Unable to handle kernel paging request at virtual address 1fc00000, epc == 800167b8, ra == 800e2860                                                                                                                                    
> Oops[#1]:                                                                                                                                                                                                                                    
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.5.0-at1 #46                                                                                                                                                                                        
> $ 0   : 00000000 00000001 00000001 807e4270                                                                                                                                                                                                  
> $ 4   : 1fc00000 00000000 1fc00f80 00000001                                                                                                                                                                                                  
> $ 8   : 83e52a00 83e52a24 807f628c 8080fa00                                                                                                                                                                                                  
> $12   : ffffffff 00000001 0000000b ffffffff                                                                                                                                                                                                  
> $16   : 83e52a20 80000000 80870000 83e52a00                                                                                                                                                                                                  
> $20   : 8080fdd4 807dde00 00000000 8080f9bc                                                                                                                                                                                                  
> $24   : 8080fb68 ffffff7f                                                                                                                                                                                                                    
> $28   : 807dc000 807ddd38 83e52a00 800e2860                                                                                                                                                                                                  
> Hi    : 00000000                                                                                                                                                                                                                             
> Lo    : 00000000                                                                                                                                                                                                                             
> epc   : 800167b8 clear_page+0x18/0x128                                                                                                                                                                                                       
> ra    : 800e2860 get_page_from_freelist+0xa94/0xdd4                                                                                                                                                                                          
> Status: 11000002        KERNEL EXL                                                                                                                                                                                                           
> Cause : 4080000c (ExcCode 03)                                                                                                                                                                                                                
> BadVA : 1fc00000                                                                                                                                                                                                                             
> PrId  : 00019749 (MIPS 74Kc)                                                                                                                                                                                                                 
> Modules linked in:                                                                                                                                                                                                                           
> Process swapper (pid: 0, threadinfo=(ptrval), task=(ptrval), tls=00000000)                                                                                                                                                                   
> *HwTLS: e19f7d3a                                                                                                                                                                                                                             
> Stack : 807e0000 807dde98 80867cd8 80791814 00000001 80687974 807dde18 00000000                                                                                                                                                              
>         807f5ed0 807f628c 807f628c 8080fdd4 80870000 00000001 807e0000 00000044                                                                                                                                                              
>         0000005c 807dde00 00000000 00000001 80810000 8075a660 80870001 00000000                                                                                                                                                              
>         00000100 00000000 807e0000 00000000 00000000 00000001 80860000 808492b4                                                                                                                                                              
>         87d75608 800e3028 00000100 00000000 00000001 80058c08 80870000 80870000                                                                                                                                                              
>         ...                                                                                                                                                                                                                                  
> Call Trace:                                                                                                                                                                                                                                  
> [<800167b8>] clear_page+0x18/0x128                                                                                                                                                                                                           
> [<800e2860>] get_page_from_freelist+0xa94/0xdd4                                                                                                                                                                                              
> [<800e3028>] __alloc_pages_nodemask+0xf4/0xbb8                                                                                                                                                                                               
> [<800e3b08>] __get_free_pages+0x1c/0x58                                                                                                                                                                                                      
> [<80013430>] setup_zero_pages+0x3c/0xe4                                                                                                                                                                                                      
> [<80826eac>] mem_init+0x40/0x50                                                                                                                                                                                                              
> [<808219c0>] start_kernel+0x250/0x510                                                                                                                                                                                                        
> Code: cc9e0040  cc9e0060  cc9e0080 <ac800000> ac800004  ac800008  ac80000c  24840020  ac80fff0  
> 
> I think this is just the early setup of the pages.
> 
>>>
>>> Anyway I'd really appreciate any guidance that anyone could provide
>>> on
>>> this. Even if it's just "go look at this SoC".
>>>
>>> Thanks,
>>> Chris
>>>
>>>
>>
>> --
>> Jiaxun Yang

-- 
Florian
