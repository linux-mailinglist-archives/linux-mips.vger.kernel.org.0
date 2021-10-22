Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D3A437871
	for <lists+linux-mips@lfdr.de>; Fri, 22 Oct 2021 15:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhJVN4P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Oct 2021 09:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbhJVN4P (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Oct 2021 09:56:15 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 843D8C061764;
        Fri, 22 Oct 2021 06:53:57 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id x27so3792729lfu.5;
        Fri, 22 Oct 2021 06:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JDGZ2oZ787PFJ80Bsn+Uu3NsiipCswVB48H6PNEzt3k=;
        b=je+/Dl0CPED9Z4wP2VpCLh5+VjlqOPnLaNGQKxUr2NAi1x2JSBAK7p+VWAL1WMZi07
         diBnx+iy0S16qRPIhyAZT/m3Jc2V9Dn5Gkzvnw74K+Uhy5aXKnlZjOxS19aO52+ttBEb
         SA95UvYNGfm5SUj2WrxnHJ1W00Ti6stbNOq25Wp6EuNGxM64l4ObNkTJjcENFT516+Q9
         PHAAZXSlc03ykwPsGo2uCDabpRc92GuLme0q2MPwFhpO+abOKTYu7+dIX+vT4XByOCU5
         IkeOP3SRGgNnhh2NoXeb8bOgv4fNxn6HliOpFwE7oI6v8cf3qSyB/3irO5uwJ7fdfKFf
         u7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JDGZ2oZ787PFJ80Bsn+Uu3NsiipCswVB48H6PNEzt3k=;
        b=e3MURTfrv/dmb3jRIklnHWiRL1mCjZOKSJQQ2TYM4N8oBa02zUJpg/hHS82Zw5McYe
         AfS9v+L4jlTiA/n4nGSq8TtSPjLUAcBn26Nj+ziavIcpArzmCLUE211YENRO132DoGnG
         Ykg8fN+oZSyd22PQNBWwm7n7qZbeT75VaDd3QsBBhVRgvRN7OnUfIiOjrgqyPan2UjQ6
         J9G36tyP3zhKhKN89952oJnhwXcJ9K70BQTs9ff4OXw8NzUqHpJDq5FvQ+JDa5C5W2dk
         IpPUCWcmhjhPtJJo+RHlOfu6QOJ8aaXRaauk1s2SBf9YBDOYaTrNlZrNkfOgpNXNARkb
         t8NQ==
X-Gm-Message-State: AOAM530idcipQGbMfiDHSaciYyFXLVsG0oTC0UXcFsn9hHQmy7ukPzlz
        fUdsLqf1hPtV9jKyZjuenmo=
X-Google-Smtp-Source: ABdhPJxZl/vLrfIjXHs837W6IU49nrh6C2H1pINONpc8dRCaydwMmj0VulGb9m4uLKw4eO7K5hdRqA==
X-Received: by 2002:a05:6512:220d:: with SMTP id h13mr11225362lfu.623.1634910835891;
        Fri, 22 Oct 2021 06:53:55 -0700 (PDT)
Received: from mobilestation ([95.79.132.211])
        by smtp.gmail.com with ESMTPSA id t20sm905465lji.44.2021.10.22.06.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 06:53:55 -0700 (PDT)
Date:   Fri, 22 Oct 2021 16:53:53 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, f.fainelli@gmail.com,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 0/3] genirq: Make irq_cpu_{on,off}line() an Octeon-special
Message-ID: <20211022135353.ibze6z67xokbwkts@mobilestation>
References: <20211021170414.3341522-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021170414.3341522-1-maz@kernel.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Marc

On Thu, Oct 21, 2021 at 06:04:11PM +0100, Marc Zyngier wrote:
> Now that Florian has updated BMIPS to not rely on irq_cpu_offline [1],
> it is pretty tempting to totally get of this misfeature. We can't
> really do that because Octeon uses it like crazy, but the couple of
> other users are easy to convert.
> 
> Once this is done, these helpers are hidden behind a config symbol
> that depends on the Octeon platform being selected. When Octeon is
> finally removed from the tree, we'll be able to drop this as well.

The whole series has been tested in kernel 5.13 running on
Baikal-T1 SoC (2x P5600 cores) with MIPS GIC used as the clock source
and clock event device.
Acked-by: Serge Semin <fancer.lancer@gmail.com>

-Sergey

> 
> 
> Marc Zyngier (3):
>   MIPS: loongson64: Drop call to irq_cpu_offline()
>   irqchip/mips-gic: Get rid of the reliance on irq_cpu_online()
>   genirq: Hide irq_cpu_{on,off}line() behind a deprecated option
> 
>  arch/mips/loongson64/smp.c     |  1 -
>  drivers/irqchip/irq-mips-gic.c | 37 ++++++++++++++++++++++++----------
>  include/linux/irq.h            |  5 ++++-
>  kernel/irq/Kconfig             |  7 +++++++
>  kernel/irq/chip.c              |  2 ++
>  5 files changed, 39 insertions(+), 13 deletions(-)
> 
> -- 
> 2.30.2
> 
