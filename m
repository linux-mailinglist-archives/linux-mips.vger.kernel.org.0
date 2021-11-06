Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6B6447025
	for <lists+linux-mips@lfdr.de>; Sat,  6 Nov 2021 20:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234945AbhKFTg5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Nov 2021 15:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234937AbhKFTg4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Nov 2021 15:36:56 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3B2C061570;
        Sat,  6 Nov 2021 12:34:15 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id j4-20020a9d7384000000b0055c7c162ed9so2206275otk.8;
        Sat, 06 Nov 2021 12:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oOe3b0kcwXyjGf+xbfObtBH/XEAjq5Cq4hXTOy1UI/M=;
        b=dXIjWkuaHIWUFpMn58TTxdAHThTZhYq9Zg6wJeiC/c/JlRAXlF4u01QeRD91GgYGEh
         8d91Ru6y6m68A5ke6hguEuYi9qkYlne0K1Wjz6U1oHv7fQB7n9BwgT0uVUX+b6F7MWYI
         4PyKuQGgJ9xPiEw+vNFo/17DsQsrkX9UVghUE4xlWZ6BH52mxt60jEvYFKIOP0fPcVtf
         Y9N3022qQHcZJa7hvUZFJ0C19dTSmG2pyA+31lneh3v6pVnGTezoCZwsXJbE0LTbbJCx
         ZZuByCqMxiSjqm5k3E93L/EqIeRtu5BpyXxpoQi5tBFwmgvN72hmaLPHBaBuoRzpmrcY
         lfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oOe3b0kcwXyjGf+xbfObtBH/XEAjq5Cq4hXTOy1UI/M=;
        b=YrsFbbT0MzlkarWKqaiaJJ32ev9EHlUt+F4W2/CFniJLicAB8wkLysh2k72FJjuiUg
         /C0lEMcFrIJ1b3L1s+VWvM5st+nN5w3dKlNL2NOfrWMG7nxWYlnN1g/IaVraX5thCBQ4
         sd0MVbuE32Ig4bhMIbcEpHF/nn91vHdYATSsKd1luTnGmfxgEW4xPfwoG6gu/83dH/he
         MjoAOqapBGMheoa3tEvg3B4VMZ4DKZ+KZPlSRA946fb4kJWnAbY54BHiQfgJ8WlD3t5J
         cznVxtpkpWnr++JoGMDho1men/AOvlmIcaJeD+R3t9CHYa8D380f8/BUYQbf61vAdWqz
         HFBA==
X-Gm-Message-State: AOAM531JXtpqZsCpLEa4BDYEdCHEmiCkNHQnj95PG2ctbc3Z35rT+rks
        C+hZSM67mJzd0V8Cgw7PWIzzzRroGOw=
X-Google-Smtp-Source: ABdhPJwIsNvCiZpfeyeyoXHFW5Sl2vSe9R1JcLd9vuIwsBhcM32hMdHnb5C8B/eI+R2rxcq77UA2mQ==
X-Received: by 2002:a05:6830:1aee:: with SMTP id c14mr23933778otd.25.1636227254567;
        Sat, 06 Nov 2021 12:34:14 -0700 (PDT)
Received: from [192.168.1.2] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.googlemail.com with ESMTPSA id r22sm659584oij.36.2021.11.06.12.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Nov 2021 12:34:13 -0700 (PDT)
Subject: Re: [PATCH v2] mips: BCM63XX: ensure that CPU_SUPPORTS_32BIT_KERNEL
 is set
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Maxime Bizon <mbizon@freebox.fr>,
        Ralf Baechle <ralf@linux-mips.org>
References: <20211106154911.26222-1-rdunlap@infradead.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <33e97b1c-448a-ca46-724c-b10539d5e811@gmail.com>
Date:   Sat, 6 Nov 2021 12:34:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211106154911.26222-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Le 06/11/2021 à 08:49, Randy Dunlap a écrit :
> Several header files need info on CONFIG_32BIT or CONFIG_64BIT,
> but kconfig symbol BCM63XX does not provide that info. This leads
> to many build errors, e.g.:
> 
>    arch/mips/include/asm/page.h:196:13: error: use of undeclared identifier 'CAC_BASE'
>            return x - PAGE_OFFSET + PHYS_OFFSET;
>    arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>    #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
>    arch/mips/include/asm/io.h:134:28: error: use of undeclared identifier 'CAC_BASE'
>            return (void *)(address + PAGE_OFFSET - PHYS_OFFSET);
>    arch/mips/include/asm/mach-generic/spaces.h:91:23: note: expanded from macro 'PAGE_OFFSET'
>    #define PAGE_OFFSET             (CAC_BASE + PHYS_OFFSET)
> 
> arch/mips/include/asm/uaccess.h:82:10: error: use of undeclared identifier '__UA_LIMIT'
>            return (__UA_LIMIT & (addr | (addr + size) | __ua_size(size))) == 0;
> 
> 
> Selecting the SYS_HAS_CPU_BMIPS* symbols causes SYS_HAS_CPU_BMIPS to be
> set, which then selects CPU_SUPPORT_32BIT_KERNEL, which causes
> CONFIG_32BIT to be set. (a bit more indirect than v1 [RFC].)
> 
> Fixes: e7300d04bd08 ("MIPS: BCM63xx: Add support for the Broadcom BCM63xx family of SOCs.")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-mips@vger.kernel.org
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Maxime Bizon <mbizon@freebox.fr>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Suggested-by: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks Randy!
-- 
Florian
