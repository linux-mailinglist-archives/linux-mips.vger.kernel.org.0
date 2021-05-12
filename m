Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9A037B4CD
	for <lists+linux-mips@lfdr.de>; Wed, 12 May 2021 06:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbhELEMp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 May 2021 00:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbhELEMo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 May 2021 00:12:44 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6833EC061574
        for <linux-mips@vger.kernel.org>; Tue, 11 May 2021 21:11:37 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso19418258otb.13
        for <linux-mips@vger.kernel.org>; Tue, 11 May 2021 21:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ZVDcTMbC1aiWsLtnnQkNmtuDQK56GjzbJG6dgvkY6Y=;
        b=gyDmRiMY3fF4stRtW2YLntDpQV69V4WHa/ApTt2f3of6WZxE/xk7681QmOwd7ee4ju
         bvGa5p5z156sgYA9G+G8mCdYErWiyFDewuE/q/Sso4VhnxdlbHa7kUFurfHh15KjAR0J
         dgZS99WzOMtLifcNjRulLMDyzUPAhgUHviuDlDXpPAjhbWf7zbKrnNk2NLjyHWk5mdJc
         WsfSuz+PHVFO8g/eJ1wMdybzclDOl8TWUgsbGZ6uAMdaISZKG/6LtdY9UI8cRz5IHjC1
         UFkvSEJbu2vBz0i+ANEpF3bZ9SeYNGvW2jJvTLeAYD5wdNicaIQdfPCujNNw6Cl8Hp1h
         ZeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ZVDcTMbC1aiWsLtnnQkNmtuDQK56GjzbJG6dgvkY6Y=;
        b=GAc6xPYYytfClp811ljYzNavxphfHQIBdp6/xfJ8sret4YNUMI2zGoywcx5g3mCmtO
         k8lLaxuoqwy9FWRntNpdJD0TZ6HfjxVvfh6XMnkN7WBIyRQQl4JOIehS/NXGIFXaJHGZ
         zSlxn27D9fZtKIakjLqzsXX1EpdKXylBqDf4jV4Ck9VhmXuCUD3bsAITpWj2XxNjCZF5
         zt3/4c/TQ65rCzNgj6Pei0pOQ7dj6LFerlhiCP+1Gzrx4v2NACcLclhDbQil5VAzWoeF
         HfQ0H97BGXKr0KAnccdGHfd/QtDluEDM2B4UGU7Ym+qhhrsnn3m3iAx1pux/FVE9gAaM
         zTxQ==
X-Gm-Message-State: AOAM530q2U8RdpZmKhp1+zoOsov8R0al1TcaT8ysrslcGUJVAs6hyT1/
        gDD0IZ8QG+9BUn/orYGexVg0x+uF+BNf+MyG4U4=
X-Google-Smtp-Source: ABdhPJxukURS5VskjkpMQX+3qeDMmAefANqTt+R52x8btgKpfpTR0p8ud7jPVz6NkRG2Zkn8noPlDXCz3HQy4F75ZKM=
X-Received: by 2002:a9d:2ae8:: with SMTP id e95mr29656787otb.72.1620792696803;
 Tue, 11 May 2021 21:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhs-H-1f72=7C3j1jCmdLU8+5LurPO6nRVcvPJO_rxPitQBnA@mail.gmail.com>
 <20210511204758.GD18185@alpha.franken.de>
In-Reply-To: <20210511204758.GD18185@alpha.franken.de>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Wed, 12 May 2021 06:11:25 +0200
Message-ID: <CAMhs-H_4YPevS5KuuTrhXAzMVfPrTiosg88Ch8s=iXYrkJ2biw@mail.gmail.com>
Subject: Re: Some doubts about mt7621-pci mainline place
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

On Tue, May 11, 2021 at 10:48 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, May 10, 2021 at 08:43:51AM +0200, Sergio Paracuellos wrote:
> > in staging and is properly using the pci generic APIs instead of the
> > PCI_LEGACY which seems that all other drivers in 'arch/mips/pci' are
> > using. The driver is generic enough but it needs mips iocu region
> > configuration that is done in the driver itself. So here it is where
> > my questions come. Is 'arch/mips/pci' the place to move this driver?
>
> moving to arch/mips/pci would work for me. Could you look at converting
> the driver to PCI_DRIVERS_GENERIC instead of LEGACY ? I want to
> get rid of PCI_LEGACY...

Driver is already using PCI_DRIVERS_GENERIC, so as soon as I get
bindings validated I will send patches to move into 'arch/mips/pci'.

>
> > Is the driver the correct place to configure the iocu related with
> > pci?
>
> I see no problem with this at the moment.

Ok, good to know :).

>
> Thomas.
>

Thanks,
    Sergio Paracuellos
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
