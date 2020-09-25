Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6684279112
	for <lists+linux-mips@lfdr.de>; Fri, 25 Sep 2020 20:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729816AbgIYSrR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Sep 2020 14:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729740AbgIYSrQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 25 Sep 2020 14:47:16 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034B2C0613CE
        for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2020 11:47:16 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v12so4493634wmh.3
        for <linux-mips@vger.kernel.org>; Fri, 25 Sep 2020 11:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g/BH1U9GUunsIrnO/GbdPQWxTeH46s0MtJm8Rv2PmQg=;
        b=dRgYAI+Il/XnGvkuGcGG/lsBUKoJIpFGsPVq7bdfwYbSWBuKZWhEyZ/C6V2T06d7l+
         MlGVte7aAMEe5kn/Xzgvbo6wkmehHB6utltBuTWLjuy10bgK9jfUtimOpRmqNVZ/PDb7
         pPEsfddSQturiPpnwk/9j/tF8/GG+ViphzAqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g/BH1U9GUunsIrnO/GbdPQWxTeH46s0MtJm8Rv2PmQg=;
        b=P20+Kd6+T99tUg32W6+hH1nf1mECtwf088Blwaa3g5iCOV8A2sCQL6WTILGJlSMos7
         Webdl1HPdiJgTP/qKEjh/0V+7rID8FwbLcXrodQUto3orLlKmG3wblBgdOh5Axr9JRpO
         9Qd08q/gPRO1B9rI+39BzFW5M+44Psul6CD5irzfALHJFZm4Stf1ji7EfL3SnbpvMi5d
         UsOEF7zA00YJAYYZ7Lg/I7eVJQEJATPLjJo6tAwJlP2R1vV+7i9BQ1YIOC+0ms3eVUQG
         5MuQ9AJtLW6Si1Es/k49ZSVTV+Pg86foGh3ZRQKZrFzAfg31jLYJAoKBJjpwsGoNyPIK
         sL+Q==
X-Gm-Message-State: AOAM5300GvUeMKkYUOumdtKUwpdY+aLydpepk7kQSrhn1cFhoZMKDAgK
        6Xe8hGNAq5YFydoXYY5LtUAglg==
X-Google-Smtp-Source: ABdhPJwizv9lDNCgaSezSHmDHMwhCyQSsePLifiuaYRBnBvcSMHXRWloRU3D/0rZv64JO/qSChFcJg==
X-Received: by 2002:a1c:2d86:: with SMTP id t128mr4754086wmt.189.1601059634661;
        Fri, 25 Sep 2020 11:47:14 -0700 (PDT)
Received: from chromium.org (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id w15sm3841044wro.46.2020.09.25.11.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 11:47:13 -0700 (PDT)
Date:   Fri, 25 Sep 2020 18:47:12 +0000
From:   Tomasz Figa <tfiga@chromium.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        iommu@lists.linux-foundation.org,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        linux1394-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        nouveau@lists.freedesktop.org, netdev@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        alsa-devel@alsa-project.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH 01/18] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
 flag
Message-ID: <20200925184712.GC3607091@chromium.org>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-2-hch@lst.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Christoph,

On Tue, Sep 15, 2020 at 05:51:05PM +0200, Christoph Hellwig wrote:
> From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> 
> The patch partially reverts some of the UAPI bits of the buffer
> cache management hints. Namely, the queue consistency (memory
> coherency) user-space hint because, as it turned out, the kernel
> implementation of this feature was misusing DMA_ATTR_NON_CONSISTENT.
> 
> The patch revers both kernel and user space parts: removes the
> DMA consistency attr functions, rollbacks changes to v4l2_requestbuffers,
> v4l2_create_buffers structures and corresponding UAPI functions
> (plus compat32 layer) and cleanups the documentation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  .../userspace-api/media/v4l/buffer.rst        | 17 -------
>  .../media/v4l/vidioc-create-bufs.rst          |  6 +--
>  .../media/v4l/vidioc-reqbufs.rst              | 12 +----
>  .../media/common/videobuf2/videobuf2-core.c   | 46 +++----------------
>  .../common/videobuf2/videobuf2-dma-contig.c   | 19 --------
>  .../media/common/videobuf2/videobuf2-dma-sg.c |  3 +-
>  .../media/common/videobuf2/videobuf2-v4l2.c   | 18 +-------
>  drivers/media/v4l2-core/v4l2-compat-ioctl32.c | 10 +---
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  5 +-
>  include/media/videobuf2-core.h                |  7 +--
>  include/uapi/linux/videodev2.h                | 13 +-----
>  11 files changed, 22 insertions(+), 134 deletions(-)

Acked-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz
