Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCB2B35A00A
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 15:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhDINkV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 09:40:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45453 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231638AbhDINkU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Apr 2021 09:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617975606;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lsrzJwlfstULCCREnSPVP3WRVuSyvEw5HXvTFd2r4do=;
        b=OMtcyd0Ey8henN7DdHOa64TG6+RcQ3yQtd9qJqu4fIbwhvuSElxbzysNjju/dUo5Tg7ydo
        MlYxJSNpyADshpWO3/0QogVaZ3JdMf3ol84JxmiAetnJVVMvG4GV3wa3TtZ+fewuLtpPJ5
        jJArafTsuWFRRzZd2bJyiA+Iiq6zuQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-3MzYaf2pNUSmKJKsGUehFg-1; Fri, 09 Apr 2021 09:40:02 -0400
X-MC-Unique: 3MzYaf2pNUSmKJKsGUehFg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB324C73AD;
        Fri,  9 Apr 2021 13:39:57 +0000 (UTC)
Received: from [10.36.115.11] (ovpn-115-11.ams2.redhat.com [10.36.115.11])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E60C619801;
        Fri,  9 Apr 2021 13:39:48 +0000 (UTC)
Subject: Re: [PATCH v3] drivers: introduce and use WANT_DMA_CMA for soft
 dependencies on DMA_CMA
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Eric Anholt <eric@anholt.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Peter Collingbourne <pcc@google.com>,
        Suman Anna <s-anna@ti.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
References: <20210409112035.27221-1-david@redhat.com>
 <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <53ec94ac-ffe3-d0bc-d081-3489fa03daa1@redhat.com>
Date:   Fri, 9 Apr 2021 15:39:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a31uKNcim0n99=yt3zjZ+LQSw4V4+8PS8daLsBdS0iSYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09.04.21 15:35, Arnd Bergmann wrote:
> On Fri, Apr 9, 2021 at 1:21 PM David Hildenbrand <david@redhat.com> wrote:
>>
>> Random drivers should not override a user configuration of core knobs
>> (e.g., CONFIG_DMA_CMA=n). Applicable drivers would like to use DMA_CMA,
>> which depends on CMA, if possible; however, these drivers also have to
>> tolerate if DMA_CMA is not available/functioning, for example, if no CMA
>> area for DMA_CMA use has been setup via "cma=X". In the worst case, the
>> driver cannot do it's job properly in some configurations.
>>
>> For example, commit 63f5677544b3 ("drm/etnaviv: select CMA and DMA_CMA if
>> available") documents
>>          While this is no build dependency, etnaviv will only work correctly
>>          on most systems if CMA and DMA_CMA are enabled. Select both options
>>          if available to avoid users ending up with a non-working GPU due to
>>          a lacking kernel config.
>> So etnaviv really wants to have DMA_CMA, however, can deal with some cases
>> where it is not available.
>>
>> Let's introduce WANT_DMA_CMA and use it in most cases where drivers
>> select CMA/DMA_CMA, or depend on DMA_CMA (in a wrong way via CMA because
>> of recursive dependency issues).
>>
>> We'll assume that any driver that selects DRM_GEM_CMA_HELPER or
>> DRM_KMS_CMA_HELPER would like to use DMA_CMA if possible.
>>
>> With this change, distributions can disable CONFIG_CMA or
>> CONFIG_DMA_CMA, without it silently getting enabled again by random
>> drivers. Also, we'll now automatically try to enabled both, CONFIG_CMA
>> and CONFIG_DMA_CMA if they are unspecified and any driver is around that
>> selects WANT_DMA_CMA -- also implicitly via DRM_GEM_CMA_HELPER or
>> DRM_KMS_CMA_HELPER.
>>
>> For example, if any driver selects WANT_DMA_CMA and we do a
>> "make olddefconfig":
>>
>> 1. With "# CONFIG_CMA is not set" and no specification of
>>     "CONFIG_DMA_CMA"
>>
>> -> CONFIG_DMA_CMA won't be part of .config
>>
>> 2. With no specification of CONFIG_CMA or CONFIG_DMA_CMA
>>
>> Contiguous Memory Allocator (CMA) [Y/n/?] (NEW)
>> DMA Contiguous Memory Allocator (DMA_CMA) [Y/n/?] (NEW)
>>
>> 3. With "# CONFIG_CMA is not set" and "# CONFIG_DMA_CMA is not set"
>>
>> -> CONFIG_DMA_CMA will be removed from .config
>>
>> Note: drivers/remoteproc seems to be special; commit c51e882cd711
>> ("remoteproc/davinci: Update Kconfig to depend on DMA_CMA") explains that
>> there is a real dependency to DMA_CMA for it to work; leave that dependency
>> in place and don't convert it to a soft dependency.
> 
> I don't think this dependency is fundamentally different from the others,
> though davinci machines tend to have less memory than a lot of the
> other machines, so it's more likely to fail without CMA.
> 

I was also unsure - and Lucas had similar thoughts. If you want, I can 
send a v4 also taking care of this.

Thanks!

> Regardless of this,
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 


-- 
Thanks,

David / dhildenb

