Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F21622DD4C
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 14:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726828AbfE2Mjp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 08:39:45 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34018 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfE2Mjp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 May 2019 08:39:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id f8so1699563wrt.1
        for <linux-mips@vger.kernel.org>; Wed, 29 May 2019 05:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7YrwTFYWMt7logeXSO4Lorars1DzvdxNw1b7gzhWlH0=;
        b=R3o/HtZTjGQoAzRdJQKabb5bMN8HLiz1RxsP2sBr8iaJcdcwJj3oaw6ihSN3RV2BBv
         8ug4GtEstyRAm0c07HAgmfs3hmqLtngBUtHRJjaQblinhm+2LWZxDNHqoW6HTK46hkjd
         tDds2ZbXwjMoM09jxT8gPfUKN/ZoCJOrrc8cD+WJ09BhIlEN9yBc7nhodv+8VoScHXHH
         x7MqezXCVVft4nufM7UGRKyv5Lg2zUXC3vMhp+261VzfyQ4uF/q1Nzu79spgA3aGT2pr
         fxFxel6zWz+SaNp+c9i8xfu6maU2i/hVtJsB5iZtr6vdzRFg+7igTFbJz8YqvL5lsOw/
         opbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=7YrwTFYWMt7logeXSO4Lorars1DzvdxNw1b7gzhWlH0=;
        b=GDJxE/pawI+0iCGvYLS8x31fbnw7ZCv5XFbtF0c9eDrA32WRmMYZk2vu1It0FD3s5s
         nTNejPy3bCbNMIIH+6aj52wPCskZTwI5g/sT64gTg4WPAuxBoGelmlMQ9mebjOC/RlRU
         JuUqM6hirlHrObMNWaQnRsoeFTvlF1pN5iIEFB6eqG4HPX0CUKTOMOi24BoGmBeGxim9
         yRQbOLee/DtZaR1s707LghQPTeeWPM6AkqKage2bCwo0/m+ZOw59U89ufLnX/490tt1/
         h/jmkdrR0Q1rl91Qiv2vybfRXhpUeyiLvk3mqFTQu6m9Gtvzu2auxfY0/bltRIALsoKF
         uNsA==
X-Gm-Message-State: APjAAAUpb1p4NgG0bQ7ip8kNvbl/gHrz9IZNvarq892tbtXqvKBPlDwo
        6c4PdJF/FMJh4CZFPoIr/X4=
X-Google-Smtp-Source: APXvYqysGzF0VhdY7xHgtKrRqzd0fnl8HkB/2ZJdsoWb8D8SCnJFPsdSSOHgdgQa08b73bYhM0PkHg==
X-Received: by 2002:a5d:510c:: with SMTP id s12mr18399819wrt.338.1559133583547;
        Wed, 29 May 2019 05:39:43 -0700 (PDT)
Received: from [10.32.224.40] (red-hat-inc.vlan560.asr1.mad1.gblx.net. [159.63.51.90])
        by smtp.gmail.com with ESMTPSA id g2sm16918809wru.37.2019.05.29.05.39.42
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 05:39:42 -0700 (PDT)
Subject: Re: [PATCH 2/2] MIPS: Make virt_addr_valid() return bool
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>
References: <20190528170444.1557-1-paul.burton@mips.com>
 <20190528170444.1557-2-paul.burton@mips.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <01b5bc7a-9e31-cc45-ba91-4a332ee0fcb4@amsat.org>
Date:   Wed, 29 May 2019 14:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528170444.1557-2-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/28/19 7:05 PM, Paul Burton wrote:
> virt_addr_valid() really returns a boolean value, but currently uses an
> integer to represent it. Switch to the bool type to make it clearer that
> we really are returning a true or false value.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> 
>  arch/mips/include/asm/page.h | 2 +-
>  arch/mips/mm/mmap.c          | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
> index 6b31c93b5eaa..a25643d258cb 100644
> --- a/arch/mips/include/asm/page.h
> +++ b/arch/mips/include/asm/page.h
> @@ -249,7 +249,7 @@ static inline int pfn_valid(unsigned long pfn)
>  #define virt_to_pfn(kaddr)   	PFN_DOWN(virt_to_phys((void *)(kaddr)))
>  #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
>  
> -extern int __virt_addr_valid(const volatile void *kaddr);
> +extern bool __virt_addr_valid(const volatile void *kaddr);
>  #define virt_addr_valid(kaddr)						\
>  	__virt_addr_valid((const volatile void *) (kaddr))
>  
> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
> index 7755a1fad05a..50ee7213b432 100644
> --- a/arch/mips/mm/mmap.c
> +++ b/arch/mips/mm/mmap.c
> @@ -201,12 +201,12 @@ unsigned long arch_randomize_brk(struct mm_struct *mm)
>  	return ret;
>  }
>  
> -int __virt_addr_valid(const volatile void *kaddr)
> +bool __virt_addr_valid(const volatile void *kaddr)
>  {
>  	unsigned long vaddr = (unsigned long)vaddr;
>  
>  	if ((vaddr < PAGE_OFFSET) || (vaddr >= MAP_BASE))
> -		return 0;
> +		return false;
>  
>  	return pfn_valid(PFN_DOWN(virt_to_phys(kaddr)));
>  }
> 
