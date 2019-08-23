Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B39D9B55B
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2019 19:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388954AbfHWRUo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Aug 2019 13:20:44 -0400
Received: from forward103j.mail.yandex.net ([5.45.198.246]:51221 "EHLO
        forward103j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387564AbfHWRUo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 23 Aug 2019 13:20:44 -0400
Received: from mxback6g.mail.yandex.net (mxback6g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:167])
        by forward103j.mail.yandex.net (Yandex) with ESMTP id 65E4767413D4;
        Fri, 23 Aug 2019 20:20:41 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [2a02:6b8:0:1a2d::28])
        by mxback6g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 3fs3t5Ed0p-KeYGwhm6;
        Fri, 23 Aug 2019 20:20:41 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566580841;
        bh=HCfQk+lp2IYEPHvc/jOS+MEDhRuUKRgnwmD3P++Ia0s=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=HD8P6lqkikCw0UYZ3ArNM6/29/RnatBP0rZxIZnsYAKxMPpoQulJrekkaS9cfiRu1
         kDWJEfDhIpPlAHMvlOR/LZsiROFSrBi4s8oDZjZtZ+Cqi+6njHXr/98qfnlSaZQUCk
         6peU2xHWyKV9BcueyTPy9CR8OPEp14rj5gYgeAUQ=
Authentication-Results: mxback6g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id TykmlPKvh4-KZoawNx4;
        Fri, 23 Aug 2019 20:20:38 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH v1 0/8] MIPS: Drop boot_mem_map
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>,
        "yasha.che3@gmail.com" <yasha.che3@gmail.com>,
        "aurelien@aurel32.net" <aurelien@aurel32.net>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
        "matt.redfearn@mips.com" <matt.redfearn@mips.com>,
        "chenhc@lemote.com" <chenhc@lemote.com>
References: <20190819142313.3535-1-jiaxun.yang@flygoat.com>
 <CY4PR2201MB1272B48BC8DCEACB50038F09C1A40@CY4PR2201MB1272.namprd22.prod.outlook.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <783425a8-3067-f61b-9f7f-e01ca7fed121@flygoat.com>
Date:   Sat, 24 Aug 2019 01:20:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CY4PR2201MB1272B48BC8DCEACB50038F09C1A40@CY4PR2201MB1272.namprd22.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/8/23 下午10:45, Paul Burton wrote:
> Hello,
>
> Jiaxun Yang wrote:
>> v1: Reording patches, fixes according to Serge's suggestions,
>> fix maar section mismatch.
>>
>> Jiaxun Yang (8):
>>    MIPS: OCTEON: Drop boot_mem_map
>>    MIPS: fw: Record prom memory
>>    MIPS: malta: Drop prom_free_prom_memory
>>    MIPS: msp: Record prom memory
>>    MIPS: ip22: Drop addr_is_ram
>>    MIPS: xlp: Drop boot_mem_map
>>    MIPS: mm: Drop boot_mem_map
>>    MIPS: init: Drop boot_mem_map
>>
>>   arch/mips/cavium-octeon/dma-octeon.c |  17 +-
>>   arch/mips/cavium-octeon/setup.c      |   3 +-
>>   arch/mips/fw/arc/memory.c            |  24 +-
>>   arch/mips/include/asm/bootinfo.h     |  16 --
>>   arch/mips/include/asm/maar.h         |   8 +-
> Series applied to mips-next.

Sorry Paul, there are some build issues suggested by kbuild test boot, 
I'm going to send v2 later.

--

Jiaxun Yang

