Return-Path: <linux-mips+bounces-202-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4007F5B17
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 10:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 664B3281774
	for <lists+linux-mips@lfdr.de>; Thu, 23 Nov 2023 09:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEFA721111;
	Thu, 23 Nov 2023 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBYdpA2u"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229CD19E;
	Thu, 23 Nov 2023 01:32:29 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5094727fa67so852167e87.3;
        Thu, 23 Nov 2023 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700731947; x=1701336747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tqEJ9Wsu9O4u7Ifl6pZ1YDAaPyCTLMsbbJ4KpzLqR9M=;
        b=WBYdpA2uJh485xa1UMp0bVUiKwfXPnC+e/G0ZnrpY2/7JB+Y7gAg11qbLB4lWq5fa5
         zyHYX4z3jgWPbyruYfjxyT2F7aZcbbrj/Ne/4EgJA15VrGGYvEIFq/CfLD5ldCu1utdr
         xvO/RbIkgixdciZ4ZeunItPc6ZZl2GU+GJ65jZwzFbmkpIYfzc9mOaPDC7mAkVWZFus+
         lZdyNS2S9mpXvAzhqPxP1qYPIyDAOc9RQQMF3ox3mgj1tQ69gfVMrPLG6w/G1AHlrLjZ
         JXOHX3qaoUWqeDtgByXIxdYrvhBPoYUlMBu3vmcxMgedInLAmIwGBKb5vtOTzODoIOLY
         rZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700731947; x=1701336747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqEJ9Wsu9O4u7Ifl6pZ1YDAaPyCTLMsbbJ4KpzLqR9M=;
        b=JFAMv0wduZ0oZ29l1zX5zkZygs7OYbrF2Tf/M/x0ARRsS+LxF1dZdoULh6Ucdzi2Ba
         tiuGxyY3XsjNNqcRbuG8fVItvG327yI8ZHaCxBzRlozKPJLLn5oDjRe9egc1bQ1ffEps
         uNCxQevrdwENQUf8heLtXpPwkpZSo0FImwv9qBpKCjL+4FW6TKFRjjbplIkwxuobvOHQ
         B//pbEIVtDyytAr0/Ej42FVhXEfZK9fP7gtAKzQ+CVdJIJo6AUf+JPQTq4yY2RSWcFks
         epRHPvoQRHmC91ptDeEGLT6UfqBEeSjbmZWmkQfXELF/ERtoxWNLzTClVaEWfRjq6p1A
         ISzg==
X-Gm-Message-State: AOJu0YxnSysB3YesRvqIlve1ZjtLCXVRUCn+zUXJ/wKaY6HyXu+rDogJ
	rtS2Q6pNrXu4ZAk19CVhnjg=
X-Google-Smtp-Source: AGHT+IEEH3l1v05pUmE2AaeJ8W/B4nA+a7iA1maBjDbATrhvBv1FofrOnDthOQ+pWUtvH83CSBIElw==
X-Received: by 2002:ac2:4911:0:b0:507:9d70:b297 with SMTP id n17-20020ac24911000000b005079d70b297mr2872785lfi.60.1700731947096;
        Thu, 23 Nov 2023 01:32:27 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id p15-20020a19f00f000000b0050a7052409fsm135201lfc.121.2023.11.23.01.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:32:26 -0800 (PST)
Date: Thu, 23 Nov 2023 12:32:24 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Yinglu Yang <yangyinglu@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>, Chao-ying Fu <cfu@wavecomp.com>, Marc Zyngier <maz@kernel.org>, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] mips: dmi: Fix early remap on MIPS32
Message-ID: <c7cuvhuu6py5vxhhvkhekv6ned5sro4a3wzzn7v45oahfw42ud@gyqmucagt5e2>
References: <20231122182419.30633-1-fancer.lancer@gmail.com>
 <20231122182419.30633-2-fancer.lancer@gmail.com>
 <b996b542-4cd3-4f9d-b221-00b2d5ef224e@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b996b542-4cd3-4f9d-b221-00b2d5ef224e@app.fastmail.com>

Hi Arnd

On Wed, Nov 22, 2023 at 08:35:01PM +0100, Arnd Bergmann wrote:
> On Wed, Nov 22, 2023, at 19:23, Serge Semin wrote:
> > dmi_early_remap() has been defined as ioremap_cache() which on MIPS32 gets
> > to be converted to the VM-based mapping. DMI early remapping is performed
> > at the setup_arch() stage with no VM available. So calling the
> > dmi_early_remap() for MIPS32 causes the system to crash at the early boot
> > time. Fix that by converting dmi_early_remap() to the uncached remapping
> > which is always available on both 32 and 64-bits MIPS systems.
> >
> > Fixes: be8fa1cb444c ("MIPS: Add support for Desktop Management Interface (DMI)")
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> >  arch/mips/include/asm/dmi.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/include/asm/dmi.h b/arch/mips/include/asm/dmi.h
> > index 27415a288adf..525aad1572d1 100644
> > --- a/arch/mips/include/asm/dmi.h
> > +++ b/arch/mips/include/asm/dmi.h
> > @@ -5,7 +5,7 @@
> >  #include <linux/io.h>
> >  #include <linux/memblock.h>
> > 
> > -#define dmi_early_remap(x, l)		ioremap_cache(x, l)
> > +#define dmi_early_remap(x, l)		ioremap_uc(x, l)
> 

> Please don't use ioremap_uc() in new code, we are in the (long)
> process of removing it from the kernel for everything except
> x86-32, and it already returns NULL on most of them.
> 
> Would the normal ioremap() work for you here? It seems to
> do the same thing as ioremap_uc() on mips and a couple of 
> other architectures that have not yet killed it off.

Ok. Thanks for the heads up. I'll fix the patch to be using ioremap()
in v2. ioremap_uc() is just an macro-alias of ioremap() on MIPS.

-Serge(y)

> 
>    Arnd

