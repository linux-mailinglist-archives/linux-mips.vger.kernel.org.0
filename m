Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEE153CC52
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jun 2022 17:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239376AbiFCPax (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 3 Jun 2022 11:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245537AbiFCPav (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 3 Jun 2022 11:30:51 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B201B78C
        for <linux-mips@vger.kernel.org>; Fri,  3 Jun 2022 08:30:50 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id y4-20020aa7ccc4000000b0042df06d83bcso5692558edt.22
        for <linux-mips@vger.kernel.org>; Fri, 03 Jun 2022 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=fMZMTLJ9FbLGF8IQBWmVylevhQp4qltV6HGP9Id+kGY=;
        b=Pcu0h6LiOYR/kJeVYfhJh+8MHDDe/Uwbw7udn6YiSh/qDg4c403rqqOuULIU1JN7bz
         jNsLn3Tb4TQFX02wYeMm26e31GymDkP7V5E+R9z2FzvMYFfD+zNkH46Ai+/JFCdIy8rv
         7HTOO/sSLrBk39Nst+IN8ZwbWjivyNr90PRvO9O15VaQRjBE4HAzNlrHeqdiDEkvGBUc
         Mgd0Y5FbQOmka+EobeGLo8eJJ+EvNPny2vsggh7kclThpP5cvC9LjKCDjRVeKAcHfAeg
         mSnHBaL3z4Tk5Aa9r6c+jwzsR1CwWsD9fWUjrrfhvEH1OrWTDhWN5MLSPkOShyfKpgda
         AgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=fMZMTLJ9FbLGF8IQBWmVylevhQp4qltV6HGP9Id+kGY=;
        b=TLsBWQPc60bra/bj/Ji8o+miUVwUwnPW0Hkwhdmgr6jOYBJS8ePImcv9w4v3DCCzSf
         hrOvqBbyqLPQiush+A3AkdcecO8l5ZNh0UrzIxkYE/8RLiD3oc+zTwWoh/FbUupylGI1
         vpV7DRYnnGsq3vjEkiSL/ZuMUmZ6IOKwLyswJcgC6dICZshq8Kxna4POplIIb9oTYL53
         W6Ye29H+uEndctvkOpRGi+sF7NWq2FHwMA6A+Eiz6En77geDR129Jti3FXyTLD2g6q6U
         AkCHI7vpLCSm5VHulJqG/SlqtUSrX5UV3EotRGyPjPIsHoG5c9QZGmug15W1wl2alA+z
         NRsg==
X-Gm-Message-State: AOAM531e4tu+zy6v2OkXZdEabrWiNoXPhUcb4lkSOfA5VPVUe3Lc2m0n
        7ikO1ANxbfJpflw6Xx62l4vLC/CRlomyHg==
X-Google-Smtp-Source: ABdhPJyr1Y9T7wz1KbFWNdw9nlZGwS6APool1e/4ZmI+YA+61Phwkr56HtYDN7y0umzvuuHISYhj9lLm7bFJ9A==
X-Received: from tef.lon.corp.google.com ([2a00:79e0:d:209:758b:79ee:2dff:316d])
 (user=gprocida job=sendgmr) by 2002:a05:6402:6cc:b0:42d:bd2d:9f82 with SMTP
 id n12-20020a05640206cc00b0042dbd2d9f82mr11507400edy.59.1654270248788; Fri,
 03 Jun 2022 08:30:48 -0700 (PDT)
Date:   Fri,  3 Jun 2022 16:29:50 +0100
In-Reply-To: <20220406111125.GB19718@alpha.franken.de>
Message-Id: <20220603152950.3057543-1-gprocida@google.com>
Mime-Version: 1.0
References: <20220406111125.GB19718@alpha.franken.de>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: Re: [PATCH net-next] net: atm: remove the ambassador driver
From:   Giuliano Procida <gprocida@google.com>
To:     tsbogend@alpha.franken.de
Cc:     3chas3@gmail.com, arnd@kernel.org, dan.carpenter@oracle.com,
        davem@davemloft.net, jj@chaosbits.net, kuba@kernel.org,
        linux-atm-general@lists.sourceforge.net,
        linux-mips@vger.kernel.org, myxie@debian.org,
        netdev@vger.kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
        Giuliano Procida <gprocida@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 6 Apr 2022 at 13:11:25 +0200, Thomas Bogendoerfer wrote:

> On Tue, Apr 05, 2022 at 09:16:27PM -0700, Jakub Kicinski wrote:
> > The driver for ATM Ambassador devices spews build warnings on
> > microblaze. The virt_to_bus() calls discard the volatile keyword.
> > The right thing to do would be to migrate this driver to a modern
> > DMA API but it seems unlikely anyone is actually using it.
> > There had been no fixes or functional changes here since
> > the git era begun.
> >
> > In fact it sounds like the FW loading was broken from 2008
> > 'til 2012 - see commit fcdc90b025e6 ("atm: forever loop loading
> > ambassador firmware").
> >
> > Let's remove this driver, there isn't much changing in the APIs,
> > if users come forward we can apologize and revert.
> >

I contributed this driver (and the horizon one) over 20 years ago. I
doubt the hardware has been used in 20 years.

I just spoke today with David Miller about finally removing them and
found that you've already started.

Please remove horizon as well, analogously. Thanks!

> > Link: https://lore.kernel.org/all/20220321144013.440d7fc0@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > ---
> > CC: myxie@debian.org,gprocida@madge.com
> > CC: Jesper Juhl <jj@chaosbits.net>
> > CC: Dan Carpenter <dan.carpenter@oracle.com>
> > CC: Chas Williams <3chas3@gmail.com> # ATM
> > CC: linux-atm-general@lists.sourceforge.net
> > CC: tsbogend@alpha.franken.de # MIPS
> > CC: linux-mips@vger.kernel.org
> > CC: p.zabel@pengutronix.de # dunno why, get_maintainer
> > ---
> >  arch/mips/configs/gpr_defconfig  |    1 -
> >  arch/mips/configs/mtx1_defconfig |    1 -
> >  drivers/atm/Kconfig              |   25 -
> >  drivers/atm/Makefile             |    1 -
> >  drivers/atm/ambassador.c         | 2400 ------------------------------
> >  drivers/atm/ambassador.h         |  648 --------
> >  6 files changed, 3076 deletions(-)
> >  delete mode 100644 drivers/atm/ambassador.c
> >  delete mode 100644 drivers/atm/ambassador.h
>
> Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>

Acked-by: Giuliano Procida <gprocida@google.com>
