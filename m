Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118D41E08D5
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 10:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgEYIbT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 04:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbgEYIbT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 May 2020 04:31:19 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30468C061A0E
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2020 01:31:19 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x22so10067468lfd.4
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2020 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UN2FWfxtmTvTgPTJlbLtgk/SxaHl1REeGMaSieqXqSI=;
        b=u22PWsRgh+Pany9OAxyDn2k94bv97PI6epfpRyZTQ+fViTRdQoEWDoPfZzo00mjeQ+
         sSXDFsUPY11Hq37eVFahHLar+m4navcmilAJ6lHVJr14/NAxtb7uol3s8fenjfX69Tid
         tyFdSa1jyTlsTjKnVHLKq35ReM2tiKILhe5V/NnN9/lF/Vutj+6IRjqxiN9dpU1gIPy1
         qE0hDBb/efmwgpzi9WSf+D6vKPRbM1zWt3Mmoz9wW9CiFwbEqv2fkxQ+n1VUqotExZeA
         kTL9MH9VOsFLthgd6KICtDowzmrYhtgfVWs7pVjlgE/eP2AL6Jb0clDxgGunf26jpRko
         dYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UN2FWfxtmTvTgPTJlbLtgk/SxaHl1REeGMaSieqXqSI=;
        b=OZP6EJrxbqNGGiOeqSp7Qf62ubf9+gBnB0zMCPdMqz6sgdgFo/YZfjzcFI4I7xqxEt
         3/b4Ll0+MLBNRSdW6s9juku73wmpLH5PG15Tt5/4E2mqnrQg6xweOraqgWmGIyCpnRJc
         lXbZCgz9NhF5hmkLELOeDchdgDVGQ9A5QD8xy+bx9pFG2uBsKG/owxPgNn1LZSNfN+lu
         7hV7B7jItRMzWSNmo/P2v8aSePhgibOycsPZJMljuBudD/b9caMVDKyqZjt5t8gFDC6+
         In3+//fQeb6xBuJdYMf0KtoZn2TdK6MgONOaebkr/x8cYnZ2Qj7T+LWl8ajCC77VCkH6
         ZtBg==
X-Gm-Message-State: AOAM532YUFfDoSSbXPuIA2aTYkobs83cJfuqqaXLwKqMxH5HwICG+E6l
        xdYwEHCZPKn/igaSxyR1XGDeoQ==
X-Google-Smtp-Source: ABdhPJyR5fkxUwkWlOiAAx7vI6e0PEUGQvedASQSlIpBX120GGr9MWkesmZ8ZC1n5xD0Ynqz+r28HQ==
X-Received: by 2002:a19:8447:: with SMTP id g68mr14007451lfd.132.1590395477604;
        Mon, 25 May 2020 01:31:17 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:425b:15e7:251c:5b3:d625:2d43? ([2a00:1fa0:425b:15e7:251c:5b3:d625:2d43])
        by smtp.gmail.com with ESMTPSA id b15sm4643322lfa.74.2020.05.25.01.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 01:31:16 -0700 (PDT)
Subject: Re: [PATCH v6 1/4] MIPS: Do not flush tlb page when updating PTE
 entry
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To:     Bibo Mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
 <79778fc3-c029-272b-358e-4f8f8e5772d3@cogentembedded.com>
Message-ID: <0a38f25d-dba0-688f-4588-345c861325aa@cogentembedded.com>
Date:   Mon, 25 May 2020 11:31:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <79778fc3-c029-272b-358e-4f8f8e5772d3@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 25.05.2020 11:12, Sergei Shtylyov wrote:

>> It is not necessary to flush tlb page on all CPUs if suitable PTE
>> entry exists already during page fault handling, just updating
>> TLB is fine.
>>
>> Here redefine flush_tlb_fix_spurious_fault as empty on MIPS system.
> 
>     Need empty line here.
> 
>> V6:
>> - Add update_mmu_tlb function as empty on all platform except mips
>>    system, we use this function to update local tlb for page fault
>>    smp-race handling
>> V5:
>> - define update_mmu_cache function specified on MIPS platform, and
>>    add page fault smp-race stats info
>> V4:
>> - add pte_sw_mkyoung function to implement readable privilege, and
>>    this function is  only in effect on MIPS system.
>> - add page valid bit judgement in function pte_modify
>> V3:
>> - add detailed changelog, modify typo issue in patch V2
>> v2:
>> - split flush_tlb_fix_spurious_fault and tlb update into two patches
>> - comments typo modification
>> - separate tlb update and add pte readable privilege into two patches
> 
>    It was a bad idea to keep the version change log in the 1st patch only,
> we have either cover letter for that, or all the individual patches...

    Sorry for noticing this only now. With 4 patches, you should have a cover 
letter anyway...

>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> [...]

MBR, Sergei
