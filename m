Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4C943A105D
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jun 2021 12:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238148AbhFIJn1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Jun 2021 05:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234720AbhFIJn0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Jun 2021 05:43:26 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D9DC061574;
        Wed,  9 Jun 2021 02:41:31 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id j12so18978861pgh.7;
        Wed, 09 Jun 2021 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mhMcjERsi3wx3J0HCHYpS+goiMXBDBgg8cMNxlYjvGA=;
        b=ADcj1YVvHTLC+vKMpsqWPDJsBSDbQj9Juth1j7LfkjKpeyQiAv4eLJia7JtZshRFtJ
         A+TDHANIoo9IOJ4Kh0lYPvrrYa5nHWPVMBPmA405nRsS3sz38uj/ZBeAXl2ZMbNQjV+D
         mqkGmibxA5nlTggMZR8xaJL9mgWWlN0qvJ13j0sbvH5mcxMOF9754ReExqahIfdHqL2I
         NGrYqKJ6VLkatC3yXMel7BVvJXeid1JTMV2nRKXWSqgMLC4VnNuNxzIDSde7bQegncwu
         8i1TuPOBXCJ8KzJ7C/7oFxid3upfTcHVU7lyPDQqvDi7b+rtEOCs4e9uougdvb5+gY72
         zPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mhMcjERsi3wx3J0HCHYpS+goiMXBDBgg8cMNxlYjvGA=;
        b=ZwyFoZ53V0dbFpm6oVmzTiQtyyCEfJTI9z3MPc9OY6EFJpmkkteZ466t9mbB5u0PDr
         nAZuYLqz0rmGo0DwpVMMQRuQ3SMl8CWcW4PFTX1eUY9CiAZu6tGnMNo2XxHGqmvlddcb
         sXnh1tIBj+z7ojFXEqIxre4fvESjSTZnpKupLIG/WJHYvUDZofFm6LojcgB+5cJfPl24
         EwR/p11kAdrynFD3/D8gGUMMKHsGr5UHcWP6LWMZK2nnfnQhjBQTdez7GJl97vntFceA
         0x7zb2KVcxPmywj4V2S25Jnz70/PJOW5QLnEuVsaYFh0Cf9UOoGvcd6RcxTvmFheJWxi
         WNjw==
X-Gm-Message-State: AOAM532QXMwSk4MEFV1rcDXVB7QZVtWxnWlHpHTZg05X2MhAeWTbBR+N
        XeOnMRYimKy1lcoWHAL7v0u0hhqTCzQuHQS5GOXjkVZ/dhWXvg==
X-Google-Smtp-Source: ABdhPJwAXk5XLhiYZ2SCv5KKecZJLPTCdFzz10ao0FJv/DCA2fGlPOpnYQTjWTA/Q177jVl11ZJJ3bM2RHXJ7omJZKU=
X-Received: by 2002:a6b:287:: with SMTP id 129mr18520979ioc.182.1623231195095;
 Wed, 09 Jun 2021 02:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210608160603.1535935-1-hch@lst.de> <20210608160603.1535935-5-hch@lst.de>
In-Reply-To: <20210608160603.1535935-5-hch@lst.de>
From:   Ilya Dryomov <idryomov@gmail.com>
Date:   Wed, 9 Jun 2021 11:33:13 +0200
Message-ID: <CAOi1vP8Xe1ZqE8fe=8KcU00xDjRrvaRONAC_TYYctsE1dns0Og@mail.gmail.com>
Subject: Re: [PATCH 04/16] bvec: add a bvec_kmap_local helper
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        linuxppc-dev@lists.ozlabs.org,
        Ceph Development <ceph-devel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 8, 2021 at 6:06 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper to call kmap_local_page on a bvec.  There is no need for
> an unmap helper given that kunmap_local accept any address in the mapped
> page.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/bvec.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/linux/bvec.h b/include/linux/bvec.h
> index 883faf5f1523..d64d6c0ceb77 100644
> --- a/include/linux/bvec.h
> +++ b/include/linux/bvec.h
> @@ -7,6 +7,7 @@
>  #ifndef __LINUX_BVEC_H
>  #define __LINUX_BVEC_H
>
> +#include <linux/highmem.h>
>  #include <linux/bug.h>
>  #include <linux/errno.h>
>  #include <linux/limits.h>
> @@ -183,4 +184,9 @@ static inline void bvec_advance(const struct bio_vec *bvec,
>         }
>  }
>
> +static inline void *bvec_kmap_local(struct bio_vec *bvec)
> +{
> +       return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
> +}
> +
>  #endif /* __LINUX_BVEC_H */

Might be useful to add the second sentence of the commit message as
a comment for bvec_kmap_local().  It could be expanded to mention the
single-page bvec caveat too.

Thanks,

                Ilya
