Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CE802BA9A8
	for <lists+linux-mips@lfdr.de>; Fri, 20 Nov 2020 12:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgKTL5p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Nov 2020 06:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgKTL5o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Nov 2020 06:57:44 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFAF5C0613CF;
        Fri, 20 Nov 2020 03:57:44 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id 2so8300422ybc.12;
        Fri, 20 Nov 2020 03:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gxcx568MbenUBQL8qRrYNH7PiNalGtjlP2qusXbObJ4=;
        b=UmNZ4qbkM8AGFVGQ0gdCGBUWClZgLoGn6GuHgLUs8nhBnQYk7PvGzChRppV3DP//Ah
         r7a26LEAcSy2RUdc2rjNBRUSlc0sB9E4WCI7H5nbDSwh8Rx8a45MJJw3+ybvaI+avhoL
         BiedAe4VpT82HL1iibmI6aLgxssRXEQmpZ4plfdntmsy+W6+0xodgQVQvIsIeb+f022w
         r4LlYntpu89Hc4g5HeeLGwfG7uz4mHktQ1Hh3MuqMwhEMsKjnNSpugePmwzKRSMYlD2z
         sIdQ/MppN/hMrBRNhM+XEhPTkv/2LAUXwJhMNN5FaabUC/h52sW9cv0hG2OuJDi83DrY
         6/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gxcx568MbenUBQL8qRrYNH7PiNalGtjlP2qusXbObJ4=;
        b=bQil+4LbKWzGOnu/mOMbzdtQ6/yw7csVihE0paeV6SJPEl2bwZ464hdtRi2nYrMVFo
         p5YjkaOcgItF9hKIAWEmuHLwu/T6EoyLtmXWlqz0z6QZZ0YNJMJQk+kM1f3FvdaNjYTL
         CTH5sJ8LaHWPW6Er02XxgXldl5qCMxl/x+jdaWNk6WgAAEe7PQF4lrJ1Qj+ZILGdd6rj
         U9+ftkQboIthzls2tXnDbxazPzypjV/5JrYRRPCLYiXXgjimdqdcj+rq6YbXhSSmfzVB
         umAW4h7fe5l+2WiwG3QVbaO4XWgpnV3JEXOFdBDL4v6+6O833oJeIBRoO+SqimRE3gJa
         zjKw==
X-Gm-Message-State: AOAM5304m4ocub1fV8p8+ee/ksk0/SVbhqwGHaIPAnLl+NyHylHHl7hq
        y0UB8tiUNrRqSfxUkdDIMuSnrC4sRa1Fvak24Dku6Qjg3Ef/QQ==
X-Google-Smtp-Source: ABdhPJznPp55KdRTACETWjNz0ss4tcdPuFnqYg0BJZso5gthhIdbOxQnEYn7HmiYuLqp2RbqzURSGIx501YXCqRgZgM=
X-Received: by 2002:a25:16c4:: with SMTP id 187mr9656935ybw.39.1605873463954;
 Fri, 20 Nov 2020 03:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20201120165614.0830df43@canb.auug.org.au>
In-Reply-To: <20201120165614.0830df43@canb.auug.org.au>
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date:   Fri, 20 Nov 2020 11:57:07 +0000
Message-ID: <CADVatmPzUv4zzzHJx23rFJgop1dHZrr7ReVoh48+Q5NAOkhzXA@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 20
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Fri, Nov 20, 2020 at 5:59 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Changes since 20201119:

mips allmodconfig fails for next-20201120 with the error:
/home/sudip/linux/drivers/video/fbdev/udlfb.c: In function 'dlfb_ops_mmap':
/home/sudip/linux/drivers/video/fbdev/udlfb.c:343:52: error:
'PAGE_SHARED' undeclared (first use in this function)
  343 |   if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))

Which has been caused by 0df162e1377a ("MIPS: mm: Clean up setup of
protection map") which removed "PAGE_SHARED".


-- 
Regards
Sudip
