Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 013CD1F277
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2019 14:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbfEOLLL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 May 2019 07:11:11 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42930 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729102AbfEOLLL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 May 2019 07:11:11 -0400
Received: by mail-wr1-f66.google.com with SMTP id l2so2184300wrb.9;
        Wed, 15 May 2019 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RfpyiRccRRz5dbumgmGOhQSt6RCKbWXqfWgcImNA2S8=;
        b=K8t4CDah4BvgpilXqXw5zfSnz0BO2nlRqhLz2gBt2pODiwL4kv8u3l6llr5cwm1NMz
         cgjs8gfhoBuBlaXma2hIzzXKOHnJIY55Z/RQyQEz9GQRx0FTCMyRfQQ0kZoQLqZ8toG2
         URD0M9gTxxP3ivyMbkmXAVXh0xlkLqK7wON2A/Md2d7bN+7V1FSBsJFbiLEfdAPl11HY
         q2QgOryr7QcwIHGew7YmpsJY2YsmBnZh4byZbIyNgyt2awx0qzkJlOcGGENIf8hH0k41
         E2/+zrNVGv5uXVDKvKDWd8knOGnk3aafQyO7ChMWO5weTw5myZirdUM1jeu643nFh8mW
         qWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RfpyiRccRRz5dbumgmGOhQSt6RCKbWXqfWgcImNA2S8=;
        b=F8PeZ7ZZN9eBEaEvWcJIFwXcUz79YIhgpoZ7jNxQXYzFWHuilcIRl86zFam2ihalUW
         gmYw81Zo1U45ogI4h5F3ppaBAtUyYZn7quUND+5X4Du+k9GN7xU6PdQH8G+u7Yiij7G9
         j5aNvdFEPkheTOmoe2AvyrcDlgLMzMxGYLPGeI+P9vwY2vMmUouHdXc+CZGQ6DJ0vjEO
         3HxOKZAxXYZNXUQbwf1KBVvOmasuoQ5TZ9t4up5/GQ6GQDhtlyNIXREgLATRMid33Fi6
         54bLAjYYx9fvBkGvqmsmR5+tA886O0vj4x8/2IxHT4JUEDgtYI1MBJEPo2B+fRmaI3RK
         eedA==
X-Gm-Message-State: APjAAAWWAGWS8TF8NWT/yNzrZBQ91zB3pOPb1YGDGSzOUf5k1RgLk+2b
        27tYawGyK1pqYJrG7nW8Ty1M3ZcsoCEV/GxODMs=
X-Google-Smtp-Source: APXvYqwy9wBDuoVo1pQ2ozYfDPbfcbqcr1FX+HUxx/FMBvDgFydGuewMLp2+gLO8zuWIDfWHm/LYc3Kw0RoFoklukJQ=
X-Received: by 2002:a5d:440a:: with SMTP id z10mr10309482wrq.157.1557918668653;
 Wed, 15 May 2019 04:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190509173849.11825-1-hch@lst.de> <20190509173849.11825-3-hch@lst.de>
In-Reply-To: <20190509173849.11825-3-hch@lst.de>
From:   Manuel Lauss <manuel.lauss@gmail.com>
Date:   Wed, 15 May 2019 13:10:32 +0200
Message-ID: <CAOLZvyG14NvbgX4PA5aafk=reLcHbqDswqS-8j4+7QJMx02d7A@mail.gmail.com>
Subject: Re: [PATCH 2/3] au1200fb: fix DMA API abuse
To:     Christoph Hellwig <hch@lst.de>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux-MIPS <linux-mips@vger.kernel.org>,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Servus Christoph,

On Thu, May 9, 2019 at 7:39 PM Christoph Hellwig <hch@lst.de> wrote:
> Virtual addresses return from dma(m)_alloc_attrs are opaque in what
> backs then, and drivers must not poke into them.  Similarly caching
> modes are not supposed to be directly set by the driver.  Switch the
> driver to use the generic DMA API mmap helper to avoid these problems.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/video/fbdev/au1200fb.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)

Runs fine on my test system.

Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
