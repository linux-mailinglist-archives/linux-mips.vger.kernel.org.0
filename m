Return-Path: <linux-mips+bounces-206-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E3F7F5CAF
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 11:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9613281937
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 10:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A5218B13;
	Thu, 23 Nov 2023 10:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihKsQelF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B4D1B3;
	Thu, 23 Nov 2023 02:42:44 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5079f6efd64so859286e87.2;
        Thu, 23 Nov 2023 02:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700736162; x=1701340962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xrnV7nS3OBUBQAMEeIHmejCmPI+DcGisAbLFB1tJJtQ=;
        b=ihKsQelF2Kp1+pl96PMTqiTbLQQPnrSpURkqKgxbEzNYIbw/fMzYFgBlcc7RdyHn+p
         lA1L83OraB+VyZwL6o+hZgOp7kxSRWJfPy7rInxqKWzzwfKRCeu0WtBrRv/sySgfOqgP
         1OZntgL/lJnuX8bhgAHIcWHZ2w67+ojk+e6RajSBicH/1/zvqA4N5YdySQuUeQ9AYWrW
         vspsMmWwhaFqr9RLPI2rxRNZP3fHf9jCb9iy4OLBM+nhYuMRThWPCWDXxY8FHAo7R2X9
         BmGE3hZm0hWKdwc6/AXUts7ohGl+XmPHO9y1NbH06XTTtaiZK43eRIV8kzMAgs597ViJ
         BxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736162; x=1701340962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrnV7nS3OBUBQAMEeIHmejCmPI+DcGisAbLFB1tJJtQ=;
        b=nNNXLZpzmgwetx58MFkjOG4/jAtVtHt8Qhp72RExjJjuSjnnDgHepJxrYDB4m6yG4I
         SpVVKmm+FamfuHxX1nzLWCILbEjGwOhgO3BbGShNH6HYI1HDbJiNFFKeZmHGx5z8zRGk
         mxP/6dv7cKLu3GZIT3Y1DPxhcmZbz8Ja8+deTnTnwvpY+ej9x757pm7xNa39GseylDUm
         NkLochNvz/HYvpv+/la4zgBtm54xjWS4IVQmvhkir3TzFUlLkbvYdtUT7l6QfzlrOppi
         3TXp4soEbAU2ru/gNs0JRl6ZFyijXQkG7wLVf2UKgceRjm6QEI7cbwKMjuCBSKz7hijN
         27xA==
X-Gm-Message-State: AOJu0YxBkiaTNEEnw5A93z0VpbE6keAP6MhylOaG0rnL8E0J7+OGnkXw
	OHSRkgzL/Vf+236ypTcMJ+o=
X-Google-Smtp-Source: AGHT+IEuC/FGMJEnoXd87iYw2NkrDXJnpZSKeimjdsQ3wY+a6LvOITJ0oxi7Cu1NFybJIeJdq/Tumw==
X-Received: by 2002:a05:6512:1584:b0:503:f:1343 with SMTP id bp4-20020a056512158400b00503000f1343mr4033443lfb.19.1700736162201;
        Thu, 23 Nov 2023 02:42:42 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id u5-20020ac25185000000b004fe47879d93sm152758lfi.106.2023.11.23.02.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 02:42:41 -0800 (PST)
Date: Thu, 23 Nov 2023 13:42:39 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, Arnd Bergmann <arnd@arndb.de>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, Chao-ying Fu <cfu@wavecomp.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Yinglu Yang <yangyinglu@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Marc Zyngier <maz@kernel.org>, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] mm/mm_init.c: Extend init unavailable range doc info
Message-ID: <ehlzzv37o4exdn4smmu653wzjdotzdv3dhr3bduvemxssp37ro@sgegnyprquk4>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
 <20231122182419.30633-6-fancer.lancer@gmail.com>
 <20231123101854.GF636165@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123101854.GF636165@kernel.org>

Hi Mike

On Thu, Nov 23, 2023 at 12:18:54PM +0200, Mike Rapoport wrote:
> Hi Serge,
> 
> On Wed, Nov 22, 2023 at 09:24:03PM +0300, Serge Semin wrote:
> > Besides of the already described reasons the pages backended memory holes
> > might be persistent due to having memory mapped IO spaces behind those
> > ranges in the framework of flatmem kernel config. Add such note to the
> > init_unavailable_range() method kdoc in order to point out to one more
> > reason of having the function executed for such regions.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > 
> > ---
> > 
> > Please let me know if the IO-space pages must be initialized somehow
> > differently rather relying on free_area_init() executing the
> > init_unavailable_range() method.
> 

> Maybe I'm missing something, but why do you need struct pages in the
> IO space?

In my case at the very least that's due to having a SRAM device
available in the middle of the MMIO-space. The region is getting
mapped using the ioremap_wc() method (Uncached Write-Combine CA),
which eventually is converted to calling get_vm_area() and
ioremap_page_range() (see ioremap_prot() function on MIPS), which in
its turn use the page structs for mapping. Another similar case is
using ioremap_wc() in the PCIe outbound ATU space mapping of
the graphic/video cards framebuffers.

In general having the pages array defined for the IO-memory is
required for mapping the IO-space other than just uncached (my sram
case for example) or, for instance, with special access attribute for
the user-space (if I am not missing something in a way VM works in
that case).

-Serge(y)

> 
> > ---
> >  mm/mm_init.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/mm/mm_init.c b/mm/mm_init.c
> > index 077bfe393b5e..3fa33e2d32ba 100644
> > --- a/mm/mm_init.c
> > +++ b/mm/mm_init.c
> > @@ -796,6 +796,7 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
> >   * - physical memory bank size is not necessarily the exact multiple of the
> >   *   arbitrary section size
> >   * - early reserved memory may not be listed in memblock.memory
> > + * - memory mapped IO space
> >   * - memory layouts defined with memmap= kernel parameter may not align
> >   *   nicely with memmap sections
> >   *
> > -- 
> > 2.42.1
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

