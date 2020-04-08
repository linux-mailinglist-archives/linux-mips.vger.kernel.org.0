Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD5D61A2A14
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 22:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbgDHUH7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 16:07:59 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:35701 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgDHUH7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 16:07:59 -0400
Received: by mail-pg1-f171.google.com with SMTP id k5so3839261pga.2;
        Wed, 08 Apr 2020 13:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QsnzAdVt7Fsx+bBhQb5aTLzxdhcRYZh3fgcDr1VqfQw=;
        b=iAVV2c6Er8c9Kia54pQTwJFLtsi65g4XSJkgCd5No62xMizu4WZwaWDIgbUJrilECt
         JxN6O/bApBaCkfYfXQUGwiLspJjqyl95PlY0286fiD0jCyENLV2H9G2HWDKp1+xxCxYZ
         bwOtF0w0ONT/hG2DLzetOD8or4XHukOF9bgErAaF+h3l1fseOqUU5JGHR+oAYPDM0BLJ
         Y6/GvphtsM1WQEO8VhIqosyNdkd42mqYvqnD5OUCOezGY2j/WCgyu8osiA7etSo7g5ra
         2eW0D6fCexdDD1m6uEZV3b2LU1SasbrxCOdk1ErSqZJwHAknN/1/ISQc0l4RTVrwARWT
         ytNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=QsnzAdVt7Fsx+bBhQb5aTLzxdhcRYZh3fgcDr1VqfQw=;
        b=TdLS0mwS+MUeH1+n2IdVqnKi6CoHfxBFCdwaecTpFidTjtMbdzxfwjBvCNtthRo4zn
         UvVGI5eRuj2vNiFZcYmDcMp2wqqEL377vvWbvs0wPJtWiVd81YCCxXueyVRynb6e+7K6
         sUamAhmN4NFPaP1jxYxwoNq36it7ChhNg+324bd4COrwjUjBJnbEwFMNYOLB/h6i1Aws
         wakYcN0fUgb40TQ0yk3kCTBkxIpXrUcX56bQVCRSM9oDLFQNMHT48c6gKUhyhJlPdXei
         E5cNSu7o4buEm7mI1RdRxy0VTFHIfJDnzAS6u6bKllFMdXxp5d6CPxNR0ZcG3rXRv6kf
         xNGA==
X-Gm-Message-State: AGi0PuZJJaFgRSXAMUO48dsWrjGgoao6yHXM81Z43171l7wKFNwxduN/
        o/1ER1tNdzkjgLatIgZ0ehG0cpJL
X-Google-Smtp-Source: APiQypLZsUqC3U1mD935bxOq8e2HBe6MDK571LQaP1NvSIfkBqLFLLb/nldZDNfsOizF1ub0EkZHMQ==
X-Received: by 2002:aa7:984e:: with SMTP id n14mr9623418pfq.291.1586376475860;
        Wed, 08 Apr 2020 13:07:55 -0700 (PDT)
Received: from [10.230.188.26] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ne16sm343530pjb.11.2020.04.08.13.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 13:07:55 -0700 (PDT)
Subject: Re: Dealing with holes in CPU address space
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <fcb8f2655452f60a7c734e2ce54ac4d47eec7e92.camel@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <02a20755-5107-29d8-77ca-522f292dcf8b@gmail.com>
Date:   Wed, 8 Apr 2020 13:07:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <fcb8f2655452f60a7c734e2ce54ac4d47eec7e92.camel@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 4/7/2020 10:14 PM, Chris Packham wrote:
> Hi All,
> 
> I'm trying to port an old Broadcom MIPS CPU (BCM53003) to a shiny new
> kernel. I have some old historic source from a long forgotten Broadcom
> LDK but I'd prefer to do things the modern way with device-trees.

This is a MIPS74Kc CPU, right?

> 
> The problem I've been grappling with is trying to open up access to all
> of the RAM on the board. It has 512MB of DDR2. The CPU has two areas
> where this appears. The first 128MB is from 0 to 0x07ffffff the second
> area is from 0x88000000 to 0x9fffffff.
> 
> SoC peripherals are at 0x18000000 and there is an IO window for flash
> at 0x20000000.
> 
> The old code has some custom tlb initialisation to deal with this but I
> figured it should be possible with the following dts snippet.
> 
>         memory@0 {
>                 device_type = "memory";
>                 reg = <0x00000000 0x08000000
>                        0x88000000 0x18000000>;
>         };
> 
> I end up with only 128MB available. This appears to be
> because the default HIGHMEM_START of 0x20000000 stops the rest from
> being made available. If I add an override of HIGHMEM_START to
> 0xffffffff I seem to have the full 512MB avaiable but then I get a
> kernel panic

Given the SoC supports 128MB or 256MB of EBI space, I suppose you could
try setting HIGHMEM_START to 0x2000_0000 + 256MB = 0x3000_0000 and see
if it works better. There is also this comment in
arch/mips/include/asm/mach-malta/spaces.h regarding the last 64KB of
HIGHMEM:

 * The last 64KB of physical memory are reserved for correct HIGHMEM
 * macros arithmetics.

#define HIGHMEM_START   _AC(0xffff0000, UL)

> 
>   CPU 0 Unable to handle kernel paging request at virtual address 1fc00000, epc == 800167b8, ra == 800e2860
> 
> 0x1fc00000 is in the range where the SoC peripherals are so I'm
> thinking that is the problem. But then again that is a virtual address
> so maybe it's just a co-incidence.

0x1fc0_0000 should be accessed via KSEG0/1 since the physical address is
within the first 512MB of physical memory so it should not cause a
translation fault since it is unmapped.

> 
> Anyway I'd really appreciate any guidance that anyone could provide on
> this. Even if it's just "go look at this SoC".
> 
> Thanks,
> Chris
> 
> 

-- 
Florian
