Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6E631F2B3
	for <lists+linux-mips@lfdr.de>; Fri, 19 Feb 2021 00:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhBRXAk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Feb 2021 18:00:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21603 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229952AbhBRXAi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 18 Feb 2021 18:00:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613689151;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PKI2EI2akMTifDNZ7stGxIBdP3HZn3yIh1zXVcGhwwI=;
        b=ZFnK5iwzcWYOUxXmy3dvz7NrtScQdDi0EoWm5lNBExzV/70QXXlXQKgwBMmgN1frTmXn4B
        vTrGLob0Aa6D20HmNt0Uu7Nn9rdLFfFpQTsbCe4Vp4obH8ai6YpDDY7ZQjxVeW7dGBJP8Z
        KNcBipmVmTgBVGXShrc6+dCh/MTBfBs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-VnlPUIA6Oay6f3VeBI4Q9w-1; Thu, 18 Feb 2021 17:59:07 -0500
X-MC-Unique: VnlPUIA6Oay6f3VeBI4Q9w-1
Received: by mail-qk1-f198.google.com with SMTP id i11so2286765qkn.21
        for <linux-mips@vger.kernel.org>; Thu, 18 Feb 2021 14:59:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PKI2EI2akMTifDNZ7stGxIBdP3HZn3yIh1zXVcGhwwI=;
        b=WvC3CcUNApjK3XONRUNnb1QB5b2ajc/4JhZfy071CbpGpe1Hn7VVrNIvBhbqr7EmJn
         vL4vwiaejDow7IguNrQokWwKCc2HoexN4tsohG62TRtmYKHyIiYkT9LAbtqxBS7f12VD
         U46wFLWc3Ztk8T6nKaXQP705j4RML0oGgGjhjJQMhqwLm77YTKPeVI5+2+NpJ2CqNxjd
         jv0UvlBmyMIv+SKMdAo7un/TcHSo9c5kjCtAw3qy+Am1tg+21Dipbgq/ZgdmG8bQXG+a
         JJtqMtQeAP1DcFYzpTA9haHXHkyvrPU5JpSjrao9pxrbhihX66a9A7p/sBc+kUozgf9w
         GJSg==
X-Gm-Message-State: AOAM531z58EmyodnL8+tlLtTr8CBP+sa/Ad97MksYaB9IPZkA+D9qJIC
        nf8wfsG/jXWt1rAmkNy8qjOaocMA6fnUgl0gkpPPOr4PriWqlZt89B7NKX8wTKIoD0XWotuAp+/
        jkm/I/siGwSSAgA+0YU2+yQ==
X-Received: by 2002:a05:622a:307:: with SMTP id q7mr6527673qtw.211.1613689147178;
        Thu, 18 Feb 2021 14:59:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmNDEim01hYlaOLCBph1TMgm3UzsW+W0hEZou2jGGlO0sciL3i5yzo2yWdc/gQPQKN5MZMSg==
X-Received: by 2002:a05:622a:307:: with SMTP id q7mr6527629qtw.211.1613689146890;
        Thu, 18 Feb 2021 14:59:06 -0800 (PST)
Received: from xz-x1 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
        by smtp.gmail.com with ESMTPSA id v75sm4944965qkb.14.2021.02.18.14.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 14:59:06 -0800 (PST)
Date:   Thu, 18 Feb 2021 17:59:04 -0500
From:   Peter Xu <peterx@redhat.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Hocko <mhocko@suse.com>,
        Oscar Salvador <osalvador@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Minchan Kim <minchan@kernel.org>, Jann Horn <jannh@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dave Hansen <dave.hansen@intel.com>,
        Hugh Dickins <hughd@google.com>,
        Rik van Riel <riel@surriel.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH RFC] mm/madvise: introduce MADV_POPULATE to
 prefault/prealloc memory
Message-ID: <20210218225904.GB6669@xz-x1>
References: <20210217154844.12392-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210217154844.12392-1-david@redhat.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, David,

On Wed, Feb 17, 2021 at 04:48:44PM +0100, David Hildenbrand wrote:
> When we manage sparse memory mappings dynamically in user space - also
> sometimes involving MADV_NORESERVE - we want to dynamically populate/
> discard memory inside such a sparse memory region. Example users are
> hypervisors (especially implementing memory ballooning or similar
> technologies like virtio-mem) and memory allocators. In addition, we want
> to fail in a nice way if populating does not succeed because we are out of
> backend memory (which can happen easily with file-based mappings,
> especially tmpfs and hugetlbfs).

Could you explain a bit more on how do you plan to use this new interface for
the virtio-balloon scenario?

Meanwhile, here you seemed to be talking about file-backed mem, however later
it sounds more like for anonymous, so I'm slightly confused.

Thanks,

-- 
Peter Xu

