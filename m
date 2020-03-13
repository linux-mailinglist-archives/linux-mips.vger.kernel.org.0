Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DEAF18468B
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2020 13:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCMMLm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Mar 2020 08:11:42 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42508 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCMMLm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Mar 2020 08:11:42 -0400
Received: by mail-pf1-f193.google.com with SMTP id x2so4763381pfn.9;
        Fri, 13 Mar 2020 05:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6pLOYM/wMftQVvIWBklYCx0bBHtmwvN52ahcTq9SXzM=;
        b=QtVBy8T48g1pj7JzZyGaclO9dhcLzRY7Xi2RHei3fL1mJZ+FRUjNj62H2cAzhlasXt
         wA8lEpV8VITfq7KWRV/4pyQjsmiPTeqRywQSa+ZpipY4/js79ZWsF8Cgto2ZBejyQi1w
         WkOmNEeQ2JI2EqL7IRxuEOVx8dQBwXpBspAOIWGRe1ab4GiDcfWbLbfkhdY2Fgveg5LX
         rfCLk6qz2ixcK3mhqh5XfMG2rXCAryb2xtluJO14lVHUFb6mFKgRPQmy4R82Yz3GRwlh
         hK5uSrxVOLuc/++mh9H2l4VFlK9i1McjApEz9khl9TYxEkuun1wNcTOrDqFlcJQ8TK6v
         KxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6pLOYM/wMftQVvIWBklYCx0bBHtmwvN52ahcTq9SXzM=;
        b=JvEmsZR0XvqI0fXj4Vqs+x/h4JVlV8Wyx6Vk0EXW6LKWNg+LbAt8pkuiMpJ3wB3H4y
         +M1OtnobYMc10O/wdbcn8dY8AJ3Lban/HtNC+fRkdHS6p3RI81I0SJanzP6uvEqtyUaA
         PnEvpnXi+Tx4wcbOZQQ98kTCymsNy5BMWlUK8T2Zyesr46xSoDHp/Fyj93EIUj+GJYam
         HSCjypNkhhiMS7eMiuzb7Ue28dLHMJA9d8ibR879WRWqVbo/UBjvzLphglNlzKByakKz
         coVoNxW7pn3l21Np6qqS7TpixNVtpFzt4uq6Olln0Fl1+Yb0Ave+EJJf0WuVd7MJ0Pdo
         QTkQ==
X-Gm-Message-State: ANhLgQ0dnQkxSGA0vDjQzWZv7srpeJBWLDmmgu3kr+MS93cICgQXH9sF
        8LQjg1lKX4nCIwGrb6Y7HBQ=
X-Google-Smtp-Source: ADFU+vuI3AZc29TPjoDNG9AKhYUD8KrpBf3iaqjAYWCzJytkiNPe7Uk51hL1KEI1JJXwEXqdDXFnOA==
X-Received: by 2002:a63:e053:: with SMTP id n19mr13222973pgj.64.1584101501300;
        Fri, 13 Mar 2020 05:11:41 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id nl7sm2991587pjb.36.2020.03.13.05.11.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 05:11:40 -0700 (PDT)
Date:   Fri, 13 Mar 2020 17:41:38 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200313121138.GA5985@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
 <20200311090308.GA5060@afzalpc>
 <20200311104217.GA10615@alpha.franken.de>
 <20200311131210.GA5115@afzalpc>
 <20200311160307.GA15464@alpha.franken.de>
 <20200311163249.GA4984@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311163249.GA4984@afzalpc>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Wed, Mar 11, 2020 at 10:02:49PM +0530, afzal mohammed wrote:
> On Wed, Mar 11, 2020 at 05:03:07PM +0100, Thomas Bogendoerfer wrote:

> > case ? I guess using handler as dev_id does a better job here.

> > And before doing that, lets clean up some of the IRQF_SHARED usage first.
> > All sni IRQF_SHARED can go away, the interrupt lines are exclusive there. 
> > 
> > loongson2ef/lemote-2f/irq.c: looks like the only user of
> > LOONGSON_NORTH_BRIDGE_IRQ, so IRQF_SHARED could go as well.
> > Could someone confirm that ?
> > 
> > All other need to stay, IMHO.

i am thinking of sending a new patch, with,

1) IRQF_SHARED removed from sni/{a20r.c,pcit.c,rm200.c}
2) IRQF_SHARED kept in,
        kernel/cevt-r4k.c
        dec/setup.c
        pmcs-msp71xx/msp-time.c
        loongson2ef/lemote-2f/irq.c
    and use handler as dev_id in those

Let me know if you have any other thoughts.

Regards
afzal
