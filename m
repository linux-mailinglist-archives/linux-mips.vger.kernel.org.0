Return-Path: <linux-mips+bounces-11563-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 57209BA62C0
	for <lists+linux-mips@lfdr.de>; Sat, 27 Sep 2025 21:20:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CF57189AC06
	for <lists+linux-mips@lfdr.de>; Sat, 27 Sep 2025 19:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AE07235354;
	Sat, 27 Sep 2025 19:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmXL504U"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663F122F77E
	for <linux-mips@vger.kernel.org>; Sat, 27 Sep 2025 19:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759000830; cv=none; b=sY3NMT5G52+PhShwGYZ8xJctqY9DaE3/wNgjS9xbJzkSZW1FAeLRgHN+dmR6ImbTEwPO2EVDpe1hOppJJDH6LWT2bmlR7cTq5fdEO9S3YHGFg1JrsCWoRFtwy7PZuRYoCv+0XUrKFrw7T37w492tO3xQ94W7+/Cc3+NbLp4dyts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759000830; c=relaxed/simple;
	bh=yoeBWfsz0Rxzfbgk6BToAOC/vOnboIpPuqC1fyVrHZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWtWuK690bAWFh8DOIVPUcK8Gqs7Ysdv/Onm+ufl2QAVy+UkFGnQzSgqqWkwkfQ8DNbTxefKHjiShfkMxDmYkMsM3/xuxDM40kA5T+XqfMtt5XOjen0wDsxl2FyaamJb0hUPpDGdiPPtwosZ1SuJGMhFo9ADk+16aF0REhe7WOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmXL504U; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63486ff378cso6468618a12.0
        for <linux-mips@vger.kernel.org>; Sat, 27 Sep 2025 12:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759000827; x=1759605627; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpNpqT8E7PV/s4bEDWlZ98/qvJvoxkZccIvsTmWeJBY=;
        b=LmXL504U0c1QG2jy3KW+WIDtc8+FAs3E23849eS0e2Vkfl6p7fq4KCBQzcNYUmMMIn
         bO0wPHikSYdv/aQEZohRb1KS8AH0g5iWXW18Pok5gfQIfrLPlXE8xgPLz0wMe6Et9dqY
         1UF4yCh+HhhIWiJYUyYS+Rt26rLu5/8v+kDBoYFTm3wwiU3GCB42340BcFn7AfOte65Z
         sSHHLLPoaIcQhBGE0YW7htO5AiI2qeQIqcYmyE67vPfGJi6ZVV23XOcsazphMjXG7MCS
         HjtXRnd2nZGBgrVo6mX9eSs5xkZiwhHmhjUSkhNFCoZk4zaIwt9nZJcW+BgI1CKJcZzn
         QWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759000827; x=1759605627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpNpqT8E7PV/s4bEDWlZ98/qvJvoxkZccIvsTmWeJBY=;
        b=XYJX3bsF8+iu9p8GoAUQCPGXWGbqsp/ut0n2ouzIYL70s1gOxVXuhR+9uHJSJwAqAz
         HhTmAo1KuPKNDyZ0MfManI8xBzvw/eJGcP8OS0eB7yOpm1xJTzix2rABThjiD2esM5WS
         VzLVBbi9scmYKjaoOgxO1ioRnnl1kWMbG0pWvzE/rS0+d6lUhztXL5eTJGzXsGesyncM
         HxOxpspALjnaFqZjMOipdG8r2pt4aX/Bg2/vLVwslOX9Bzeo+wvHq/XiY843FA8JWNhT
         rnyzlw/bdedcclRgX8nIvVDeKqNp9qxqROrgziEn5BdSckDjVe5+S7FJWesfr+5ieV6i
         HxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUk5o87neNqKRWK1VUZWmLjxm2oz/8JW805owDKjPVV0YjLERR7YgxMfQ6RrRd0sMq8kKDQpEXBZVs5@vger.kernel.org
X-Gm-Message-State: AOJu0YyP+0Cp5lDVyuuN1t/EkIGH7T2Ww5yzOtjFA5SyuPQJ6D2DEEKl
	kmGRmFigE7YSG+aWdeC4+OfeDAG2qpCAOZ9HEfPcX/lFlfFQJGno6ZiVIHr4BjQNAQFYYei8YJX
	V2+RLhZ3f/o307P33dkFYFHUOi7+Dskk=
X-Gm-Gg: ASbGncvI0J1LO8lYQjpo0LRiO2+mxhiEJ/iGF18/GxLUBVQU0opOXqtpfHe85QyeUbZ
	eWRt3yisx7qyzcvkdepH9TUIL8mCVu43VQyWOwyWGylviQ7C8YNAj6dL6KZmCXt+/aZ9sBebMm5
	HoZ5nHDDsjLkcZrtZMN/0VQnncNWP3jyB0zd4jqipBeISqZ7Q0rWwbsZTj211nGvk+MsZF6ERNJ
	0B0urPnJbQsdCV+LzE=
X-Google-Smtp-Source: AGHT+IE6MMpG/TRiFXxnrxz1Vvo3fuH5ytNgtdVEgpXL0NxXawEVfUDFtb+tMcdRPN344hi95Su67MTI32H6Ub9xTJM=
X-Received: by 2002:a17:907:7b8b:b0:b3c:5f99:dac7 with SMTP id
 a640c23a62f3a-b3c5fa9674amr74488566b.21.1759000826450; Sat, 27 Sep 2025
 12:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com> <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
In-Reply-To: <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sat, 27 Sep 2025 21:20:15 +0200
X-Gm-Features: AS18NWCUkmopfgQP7FxvlAuimXjc1tmQlQb-89CTajXeb-5Nlye2dR2BnBQqzEg
Message-ID: <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> > Suggest testing the same branch with the alpha patch reverted just to
> > rule out any issue in the core code. If it reproduces suggest to
> > bisect Leon's branch.

Hi again, I've booted up the ES40 again with the kernel build from Leons
branch, it boots up but message log is full off messages like
"EXT4-fs error (device sda4): ext4_find_extent:939: inode
#16257327: comm init: pblk 65114257 bad header/extent:
invalid magic"

The filesystem is broken after just booting with the kernel.
This time fsck did not fix it, I needed to re-install gentoo stage3.
So it's for sure reproducible as well as destructive.  It's not possible to
revert all the commits individually, since this will leave the source tree
in a state where the kernel doesn't build. I've started off by reverting
the following commits:

e78a9d72517a88faa6f16dab4d1c6f966ed378ae
(dma-mapping: remove unused map_page callback)

d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
(alpha: Convert mapping routine to rely on physical address)

3cd47242d513050d7a81ac6e7020fd3ef5462ad4
(block-dma: properly take MMIO path)

7950995bef32aa7e5f74699c7d0fdac41d2dad14
 (block-dma: migrate to dma_map_phys instead of map_page)


After reverting the above commits, I'm able to build a working kernel,
that is, no filesystem corruption occurs. I'll take a closer look at this
after the weekend.

Regards

Magnus

