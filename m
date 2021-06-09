Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABB03A11A0
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jun 2021 12:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237409AbhFIKyV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Jun 2021 06:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33410 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238458AbhFIKyK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Jun 2021 06:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623235935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VZPPxlVuFpma5nN0KBwsgNEj1D60a3U+wCT7M5MPOro=;
        b=Km5r1M+sxIq4QxvZF6wtjHOv+NX0GD/tnBHzME3FShlP42FQZPxI28LSs2skwcRMKR6KJh
        0XJz2rmTh/jJT0lX2DtPOYM/XEAPwKAOmVwutgOGYzNlj3DmYYtDvRxwcjs6H58IXcjOxC
        UvVr5TV7PvMy2NUxlLSDVJZr9BvC36k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-a464Zmr6OCGzfxBvrrO12Q-1; Wed, 09 Jun 2021 06:52:14 -0400
X-MC-Unique: a464Zmr6OCGzfxBvrrO12Q-1
Received: by mail-wr1-f69.google.com with SMTP id m27-20020a056000025bb0290114d19822edso10597637wrz.21
        for <linux-mips@vger.kernel.org>; Wed, 09 Jun 2021 03:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=VZPPxlVuFpma5nN0KBwsgNEj1D60a3U+wCT7M5MPOro=;
        b=hNySQ80QpWpOGYKrYmbmrsn9yGzyI9tiyeQ3fG+Id63EkubAYJrb4W85wiU2Dozcn/
         yYrkFCFF9fY29FbU/hwldu6UXzpAHoZDF2hu1QPS2Vpg63C2Hns5zMbCdeJuhfxMgaY6
         ZcfPzHBztOaTV+GkdM95HhMjqYqXE3vuJA7szxuTtvN3/0NfW7EEqsJ8SV5qtBCQ4IkU
         8gJNpef7kLKo0ptRh5WSCsmuoYWNi4jQKzGDWh8/51Rv+SZUkLq9OK6cU6TRy+dWFd/z
         vyCeGxrKGWTxQ9PHAuR/uhrYPDsYMUNwUAewSviIpvChGDfcdFxQSbLb3CswZo6buflG
         ntRw==
X-Gm-Message-State: AOAM533ea2qe7VhJvyRVJ4dGp/vOkj2gojwTpoDaAtFxJEnS8OBp+vpU
        v9A3OnBgYHFbQytgGVQv4p68IiC/+ZCbFU/KJy0kkjhnoa77m0fIGX5KewWtvaO79Oh0bfACCPJ
        wMiNKHpHpfoTJM3HEdz+GMw==
X-Received: by 2002:a05:600c:c9:: with SMTP id u9mr26528255wmm.156.1623235933485;
        Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOhpm0kR/qb02GnRlZAdwrQqqdavzoWPuk2BGBrMztminfq9lmdrK+j2M/FH+Xh9QtwaeMHg==
X-Received: by 2002:a05:600c:c9:: with SMTP id u9mr26528228wmm.156.1623235933268;
        Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
        by smtp.gmail.com with ESMTPSA id 89sm25391165wrq.14.2021.06.09.03.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 03:52:13 -0700 (PDT)
Subject: Re: [PATCH 2/9] arc: update comment about HIGHMEM implementation
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Richard Henderson <rth@twiddle.net>,
        Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-3-rppt@kernel.org>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2764dca8-f395-f76a-0939-215eccdfd82e@redhat.com>
Date:   Wed, 9 Jun 2021 12:52:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-3-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Arc does not use DISCONTIGMEM to implement high memory, update the comment
> describing how high memory works to reflect this.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   arch/arc/mm/init.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
> index e2ed355438c9..397a201adfe3 100644
> --- a/arch/arc/mm/init.c
> +++ b/arch/arc/mm/init.c
> @@ -139,16 +139,13 @@ void __init setup_arch_memory(void)
>   
>   #ifdef CONFIG_HIGHMEM
>   	/*
> -	 * Populate a new node with highmem
> -	 *
>   	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
> -	 * than addresses in normal ala low memory (0x8000_0000 based).
> +	 * than addresses in normal aka low memory (0x8000_0000 based).
>   	 * Even with PAE, the huge peripheral space hole would waste a lot of
> -	 * mem with single mem_map[]. This warrants a mem_map per region design.
> -	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
> -	 *
> -	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
> -	 * populated with normal memory zone while node 1 only has highmem
> +	 * mem with single contiguous mem_map[].
> +	 * Thus when HIGHMEM on ARC is enabled the memory map corresponding
> +	 * to the hole is freed and ARC specific version of pfn_valid()
> +	 * handles the hole in the memory map.
>   	 */
>   #ifdef CONFIG_DISCONTIGMEM
>   	node_set_online(1);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

