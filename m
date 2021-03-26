Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC95F34ADC6
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 18:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbhCZRqI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Mar 2021 13:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhCZRpr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Mar 2021 13:45:47 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0636BC0613AA;
        Fri, 26 Mar 2021 10:45:47 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id bx7so7214234edb.12;
        Fri, 26 Mar 2021 10:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HP9NF/F/VoCDRFLsA2MzGotnBAMPYRt3VzYsF38PQ/I=;
        b=KgCnW/aAUlyl+biTmFWMzPhlT5dnB6BQEgvjtJ0TdcnGeX+GOUNR0p/HufpvHpNXMZ
         NtBq5gqL8cBaoOfnpz2023+lKFAinFqV2/Wz+j1xEzoMihRaMYBAqZbL16Svysj6ep3X
         HNcnG7ImlOsL0LG0I3Vk8DsZ/VIXMTpPFp8+5rjuwXnQOt0eTUANZ8HXJKRPpD88yZlk
         ody6n0Ierft1cNi0sHkZLspIyx9snYvkEbaGb7mEtDmuGdEmgAtZru5hZihvvqIowF21
         a3garIDz86jCm9NvgLFlerAgCV/TdjLypMXvvJJLZMHmgEC6BId4QXmbmV09n4thaeEv
         4txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HP9NF/F/VoCDRFLsA2MzGotnBAMPYRt3VzYsF38PQ/I=;
        b=q+dxgkfM2PqC7gDKOuBOv0aopaCJVuAyjyd0yOpbGCZTvTbMUalPv97JWyB7pI/6Vy
         M4NXAYSPVcDxm+jH1L/p0/j9KE+EL3pKwKN02ts1phINdB5BdSA/mxrvr6Y7Zk7G2LJQ
         IVYOIngun2eGskYnjZzw2HS/nl8Y/xMQwuhA7Wg5ryKbmiHP32s5+Hjj9kcK0w712FlJ
         SolaqeAmO8rTKnLNi0RAQ7FM0E+P4t6ZfaadViYcKrJHWVnsjOfvVJXleDmMa3cZcMbK
         Jv4A+qJ8S/aohVpzsQm9+N2PXK/7RtTbxqJPr225HPWgx5AturL5bw84+PHQyH/kibVE
         keDg==
X-Gm-Message-State: AOAM532ETpP2O56H6rLSTLVYAoXw4pIRgf+7Comgmjn7NkrfaedmMyBQ
        3fOnbvqJzEgNH1MPzHBRd4lTNqSsUak=
X-Google-Smtp-Source: ABdhPJxsyOw8OHy5rn980YHIsaB99WG4lxL+wVbCSSFSpGf0ASAx1p8HsagEsST8sIRvRdK3FaYMQg==
X-Received: by 2002:aa7:dad7:: with SMTP id x23mr16397200eds.292.1616780745354;
        Fri, 26 Mar 2021 10:45:45 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id ga28sm4018738ejc.82.2021.03.26.10.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 10:45:44 -0700 (PDT)
Subject: Re: [PATCH v2] MIPS: Add support for CONFIG_DEBUG_VIRTUAL
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Jinyang He <hejinyang@loongson.cn>,
        Vlastimil Babka <vbabka@suse.cz>,
        Yousong Zhou <yszhou4tech@gmail.com>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Michel Lespinasse <walken@google.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20210323222103.34225-1-f.fainelli@gmail.com>
 <20210325095739.GB5775@alpha.franken.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <439e06b6-d26a-e43d-1e09-c8fd41aea6ed@gmail.com>
Date:   Fri, 26 Mar 2021 10:45:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325095739.GB5775@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 3/25/2021 2:57 AM, Thomas Bogendoerfer wrote:
> On Tue, Mar 23, 2021 at 03:20:43PM -0700, Florian Fainelli wrote:
>> Provide hooks to intercept bad usages of virt_to_phys() and
>> __pa_symbol() throughout the kernel. To make this possible, we need to
>> rename the current implement of virt_to_phys() into
>> __virt_to_phys_nodebug() and wrap it around depending on
>> CONFIG_DEBUG_VIRTUAL.
>>
>> A similar thing is needed for __pa_symbol() which is now aliased to
>> __phys_addr_symbol() whose implementation is either the direct return of
>> RELOC_HIDE or goes through the debug version.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>> Changes in v2:
>> - fixed sparse warning in arch/mips/kernel/vdso.c
> 
> checkpatch warns about a missing SPDX license in arch/mips/mm/physaddr.c,
> can you please add one ?

Yes.

> 
> And as checkpatch is also unhappy about the volatiles, do we really
> need them here ?

This is just following the existing prototypes for virt_to_phys()
declared in arch/mips/include/asm/io.h. This can be changed to unsigned
long if you prefer?
-- 
Florian
