Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C03264C7D6
	for <lists+linux-mips@lfdr.de>; Wed, 14 Dec 2022 12:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237972AbiLNLXl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Dec 2022 06:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238068AbiLNLXi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Dec 2022 06:23:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4E22ACB
        for <linux-mips@vger.kernel.org>; Wed, 14 Dec 2022 03:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671016975;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yxc01zNwMiugjthmgVOlTrtXQnLfLvXjRGMFtbZZLpc=;
        b=TRsRFy5HWKRJqqxwbSC38MkkVL+pzQVaN48RIhRUvbQBZyedt24vDxP9faiB3QhLUvtPSW
        jUDazLShTTjthZ9qY/reRE4y5Cap5trYiKq0KlvknrQ+4PgoYPXpD9HQWOo6Qg6rAtYfiW
        /1ZfU7LhfXDdM3IHhUpPVAiJXEkDOlY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-zegnz7XqOjq4y5N4gV2-qQ-1; Wed, 14 Dec 2022 06:22:54 -0500
X-MC-Unique: zegnz7XqOjq4y5N4gV2-qQ-1
Received: by mail-wm1-f72.google.com with SMTP id f20-20020a7bc8d4000000b003d1cda5bd6fso4042290wml.9
        for <linux-mips@vger.kernel.org>; Wed, 14 Dec 2022 03:22:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yxc01zNwMiugjthmgVOlTrtXQnLfLvXjRGMFtbZZLpc=;
        b=CQRGkrE0L9eUdzisfdnXlQAFdGfVzDwi6/ggdOO5wgNuPhOfYI+ht4+byQuEyjZmEk
         u3NTK9g8t/QdQsiY0Xp+PQnRX/NRVkQFR/dbe3IEtdFNpav4etXQe1GBOms7830p5YKE
         xCxJTfBQEoflXmBldwEr4MuVndxx8PbdNEZJO9bqfwP7oJjeFc2It84Is8958v081AxA
         AHcR+Ghb0xxFxvgk6g1hlZ8YHV1EP7GZZXMNhbFTtRfAWexhtZJF2TJqYqZ4xcdw/KYb
         zdD+ZM6pDD5x0mjz+S4f8dHs/j4NRPiV+zgnZtTHlkKo/nhIKk5BwKe2SylyaMjnk939
         CdQQ==
X-Gm-Message-State: ANoB5pkHCMGDz6tBV+zbhC+LCF1K6ONqS7PcwMJhdS1zGsRHX7FL+pxd
        5clAPcIgaZKf6hedoekpTQkw7FR5p1P3Mh+8xtee6ht/9uivkw/NPyBN1pYrphArBbPLP7eQDPE
        +dJ8sx/iS1pB0Kdt4p8q7lg==
X-Received: by 2002:a05:600c:1da2:b0:3cf:5fd2:87a0 with SMTP id p34-20020a05600c1da200b003cf5fd287a0mr17488487wms.40.1671016973459;
        Wed, 14 Dec 2022 03:22:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4UNUk6/OXN07sN3FMRll3MrS2ehO8GnTfEO+JQv3BigUvXvNgLJLKqkas5vWijxjr/1KiucA==
X-Received: by 2002:a05:600c:1da2:b0:3cf:5fd2:87a0 with SMTP id p34-20020a05600c1da200b003cf5fd287a0mr17488468wms.40.1671016973157;
        Wed, 14 Dec 2022 03:22:53 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:7700:dd7c:92f8:481f:b96b? (p200300cbc7037700dd7c92f8481fb96b.dip0.t-ipconnect.de. [2003:cb:c703:7700:dd7c:92f8:481f:b96b])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c510300b003cfa3a12660sm8504320wms.1.2022.12.14.03.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 03:22:52 -0800 (PST)
Message-ID: <10bd4fc0-4fc0-bd98-6926-7d721a3bb12e@redhat.com>
Date:   Wed, 14 Dec 2022 12:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH mm-unstable RFC 00/26] mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all architectures with swap PTEs
Content-Language: en-US
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Hugh Dickins <hughd@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Yang Shi <shy828301@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Nadav Amit <namit@vmware.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
        x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Chris Zankel <chris@zankel.net>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Nicholas Piggin <npiggin@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Richard Weinberger <richard@nod.at>,
        Rich Felker <dalias@libc.org>,
        Russell King <linux@armlinux.org.uk>,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vineet Gupta <vgupta@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20221206144730.163732-1-david@redhat.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221206144730.163732-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06.12.22 15:47, David Hildenbrand wrote:
> This is the follow-up on [1]:
> 	[PATCH v2 0/8] mm: COW fixes part 3: reliable GUP R/W FOLL_GET of
> 	anonymous pages
> 
> After we implemented __HAVE_ARCH_PTE_SWP_EXCLUSIVE on most prominent
> enterprise architectures, implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE on all
> remaining architectures that support swap PTEs.
> 
> This makes sure that exclusive anonymous pages will stay exclusive, even
> after they were swapped out -- for example, making GUP R/W FOLL_GET of
> anonymous pages reliable. Details can be found in [1].
> 
> This primarily fixes remaining known O_DIRECT memory corruptions that can
> happen on concurrent swapout, whereby we can lose DMA reads to a page
> (modifying the user page by writing to it).
> 
> To verify, there are two test cases (requiring swap space, obviously):
> (1) The O_DIRECT+swapout test case [2] from Andrea. This test case tries
>      triggering a race condition.
> (2) My vmsplice() test case [3] that tries to detect if the exclusive
>      marker was lost during swapout, not relying on a race condition.
> 
> 
> For example, on 32bit x86 (with and without PAE), my test case fails
> without these patches:
> 	$ ./test_swp_exclusive
> 	FAIL: page was replaced during COW
> But succeeds with these patches:
> 	$ ./test_swp_exclusive
> 	PASS: page was not replaced during COW
> 
> 
> Why implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE for all architectures, even
> the ones where swap support might be in a questionable state? This is the
> first step towards removing "readable_exclusive" migration entries, and
> instead using pte_swp_exclusive() also with (readable) migration entries
> instead (as suggested by Peter). The only missing piece for that is
> supporting pmd_swp_exclusive() on relevant architectures with THP
> migration support.
> 
> As all relevant architectures now implement __HAVE_ARCH_PTE_SWP_EXCLUSIVE,,
> we can drop __HAVE_ARCH_PTE_SWP_EXCLUSIVE in the last patch.
> 
> 
> RFC because some of the swap PTE layouts are really tricky and I really
> need some feedback related to deciphering these layouts and "using yet
> unused PTE bits in swap PTEs". I tried cross-compiling all relevant setups
> (phew, I might only miss some power/nohash variants), but only tested on
> x86 so far.

As I was messing with sparc64 either way and got debian to boot under 
QEMU, I verified that the sparc64 change also seems to work as expected 
(under sun4u).

-- 
Thanks,

David / dhildenb

