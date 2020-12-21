Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6472DF995
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 08:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgLUHu0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 02:50:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgLUHuZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Dec 2020 02:50:25 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8EB0C0613D3
        for <linux-mips@vger.kernel.org>; Sun, 20 Dec 2020 23:49:39 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id o19so21490313lfo.1
        for <linux-mips@vger.kernel.org>; Sun, 20 Dec 2020 23:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1EopmgL6rAwO5/C8DTw5+LeWnQUTpgVqJGW2n1Fr0c4=;
        b=Okc8UqL4zeKtiU5a0oIZ+y8LiXR0C5JoanW7TmIa0YYRzbDExZ/wh906QfO4ChxHWf
         aqObwBjrw34uyJg7+v2AOTE393WDcrZ8sjUmNubjIU9o/LHMBRtyZ1J2LcmLaJpL9p2h
         OvvAUifbMNIjLvRMj9OhHfUGrHBXa2RZTdcC6LQNhfAGk7cyXEd8oTmUmE8NCaFTWHWo
         GL7XP6uGFchl3WHhWYNsIM5X88VOLKSfmYi/W0DSgJ1uY37qtgUhwqVWp4LfMzUr5qlS
         lgDSpI3lq7LddMgWCoITSlm/Gku4TmKATrvvAYUzyA+/oXr01xn17cm8uodZyl75tlN+
         HF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1EopmgL6rAwO5/C8DTw5+LeWnQUTpgVqJGW2n1Fr0c4=;
        b=sEi4VrwhF168P1goHb0fs/cukh8qVo1nNHDnSXlVj0bpki4oIaBoJR3C515bSYdsCb
         TPUGBDlewm8UI9oHl5hbiemq4SVBCKqYhSEZ9VdPhqEASVsrc8CgjtDAklUtTMS0V9z9
         ofbzhlhN0BppJnSrgyuk7wWAxZ9B4HbUUokS03THgfzJ0Yemq9+h2nENQF7J5sJY7lxO
         bfZ9F9O+rSnMq2zdUjAkoLmw6WnFvEiaHP0pO+k8pi3EaHdvu0pe4gbjnQtNo0GR60xv
         KUu9bJDX+ElZ7GKFd5jR4zP6KtzVV937eVxwgqH7js4Gi909ocOFjyalpnxbSPNbVPZU
         yCkA==
X-Gm-Message-State: AOAM531tPFd/17cp2z2n+//5xKa+tuaxug3TrnWsZ3hsVXXQ051dTf/D
        fO2Sa98X7yfsqxXs1tNG490=
X-Google-Smtp-Source: ABdhPJxujiyGSvG7ZFx0ZoaYZdKzUnL90Fh5Pi8OIqG/pHVq+duER0SydVVw8hBzBhrwDsaE7YUcGQ==
X-Received: by 2002:ac2:5689:: with SMTP id 9mr6339821lfr.175.1608536978377;
        Sun, 20 Dec 2020 23:49:38 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
        by smtp.gmail.com with ESMTPSA id a207sm1928032lfd.101.2020.12.20.23.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Dec 2020 23:49:37 -0800 (PST)
Date:   Mon, 21 Dec 2020 10:49:36 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     YunQiang Su <wzssyqa@gmail.com>
Cc:     Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Roman Stavtsev <Roman.Stavtsev@baikalelectronics.ru>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: CPUs with EVA support
Message-ID: <20201221074936.dr4wrr6lh5hgcvro@mobilestation>
References: <20201220193201.GA3184@alpha.franken.de>
 <d45cb374-f3dc-8c26-6b0f-27bec45854a9@flygoat.com>
 <20201221070434.yom3neoeir43ek2k@mobilestation>
 <CAKcpw6UsWWfJqnZX00f5CtfR8CPW1nfpgHVcEKgg6odo5BynUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKcpw6UsWWfJqnZX00f5CtfR8CPW1nfpgHVcEKgg6odo5BynUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello YunQiang,

On Mon, Dec 21, 2020 at 03:37:08PM +0800, YunQiang Su wrote:
> Serge Semin <fancer.lancer@gmail.com> 于2020年12月21日周一 下午3:05写道：
> >
> > Hello Thomas, Jiaxun
> >
> > On Mon, Dec 21, 2020 at 08:38:00AM +0800, Jiaxun Yang wrote:
> > > 在 2020/12/21 上午3:32, Thomas Bogendoerfer 写道:
> > > > Hi;
> > > >
> > > > I've started looking how to get rid of get_fs/set_fs for MIPS and
> > > > my current obstacle is EVA support.
> > > >
> > > > Looking for CPUs supporting EVA I only found P5600, are there more ?
> > >
> > > Hi Thomas,
> > >
> > > It is a optional feature for M14k but nobody enabled it :-(
> > >
> > > >
> > > > Does someone sell boards with an EVA enabled CPU ?
> > >
> > > Baikal-T1 supports EVA.
> >
> > Yeap, Baikal-T1 SoC does support EVA since based on P5600 does.
> > Moreover the feature is enabled in my CSP code by default, but
> > the segments mapping is initialized to fully match the legacy
> > MIPS address space layout.
> >
> > Regarding the boards with Baikal-T1 to purchase. It's available and
> > demonstrated on the company site:
> > https://www.baikalelectronics.com/products/339/
> >
> > Currently a single retailer selling the item is Russian-based:
> > https://www.chipdip.ru/product/bfk3.1?from=suggest_product
> > (Alas the site doesn't have an English version, so please use the
> > Goog-xlate.)
> > If for some reason you still won't be able to purchase it from there
> > please send me an email directly.
> >
> > (Today I've got a suspicious message on my corporate inbox from a guy
> > - Yunqiang Su with email domain @cipunited.com, who stated that CIP
> 

> Yes. It is me.
> CIP is holding the business of MIPS in China (including HK, Macao).
> And now I have a budget for MIPS eco-system: for team and devices.

Oh, sorry for being suspicious. Then I'll give you an answer to
the question here. First you can try to purchase the boards on the
site:
https://www.chipdip.ru/product/bfk3.1?from=suggest_product

If for some reason you won't be able to do that, please reach me one
more time and we'll try to figure out what to do then.

(I've added my managers in CC so they would be aware of the issue.)

-Sergey

> 
> > United wants to purchase one or more of them for you and requested to
> > give them the company sells contacts. I didn't response, because the
> > message structure looked more like a spam, than an official request.
> > It was also strange not to see you in CC.)
> >
> > Regarding the Baikal-T1 boards being finally supported in the kernel.
> > I am still working on it. There are several more SoC-device drivers
> > to fix and I'll be ready to submit the CSP/BSP code to the MIPS arch
> > subsystem.
> >
> > -Sergey
> >
> > >
> > > >
> > > > How good is EVA support in qemu ?
> > >
> > > EVA is functional in QEMU.
> > > I had tested it with P5600 malta system.
> > >
> > > - Jiaxun
> > >
> > > >
> > > > Thomas.
> > > >
> > >
> 
> 
> 
> -- 
> YunQiang Su
