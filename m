Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F166A2AFE11
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 06:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgKLFdV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 00:33:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgKLFX6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Nov 2020 00:23:58 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD19CC0613D4;
        Wed, 11 Nov 2020 21:23:57 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id k3so4440017otp.12;
        Wed, 11 Nov 2020 21:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NU0FnSXQ52zfzOppTtAfZgow5m+SuejdPqh1x/iQhIo=;
        b=cPsUI/o6jcDroRRF15FPKRzNWt/KUk/CDMBgqp+Sepr12C45no3YzDny+TA3uTQXDX
         xjpSwQcnKxfLjTDGOZtFlnmgs9nmDXv1k1yJVI2PgvuOO4W77RLSiaC4++J3Cbap89rU
         LXozxq7vhFRkQnlZBRtRYQnreuU98uqKspZ6lDsXTzkwTdEMDOkWYlhkkRJSh4n4ZAMt
         n3yq0Sr8C72i8m4Sx0mPmUEnOTNWWk+lNGCILpy2/IGnyVLkAMqvdUH0svCROz73rBLQ
         UdFI4Nit/dBaUbNxQXtHhUUGiBIrPBJnuqFF0bTc+ptDt8mZYs1G5rTgoJNHMx6OtBeC
         CY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NU0FnSXQ52zfzOppTtAfZgow5m+SuejdPqh1x/iQhIo=;
        b=EklYhzJzQws8NxYzOI4AqBaoWTHBnWkB9xqOEaKWmuJde5IT6pxiyI20AZcISYmZnO
         lEldhzYiQmTPRHNFlKyALIyOI3U7ApxsHkQeUYKAC5NYDaUf4QUZwd7FYkcv1jN/wGNN
         3JPbOAzHyOQ4/RnUJY091hnhu/0TaCG4KIFp2o9Zd+kfUyrnvaQtJAVs+7nntyAO4EeB
         zcUNsF58Bt8puKfdIwmrdi4XzAE3o5kKg2/lPhYcFO0u8e1iu1+ex7zSbsfaCyWJHbX5
         k2Iy52a75d1i3b4xrSmkmnm2Nt228NGEydn8i5zGLhTcTaKUiDIj11mMLAaLIi+tM55c
         NZKA==
X-Gm-Message-State: AOAM530es8uatiTmFefVPwKL+nsb4zodJYKpxu/MCGyD/6luyoPQVbJd
        c5YmyHnvfWqQLW5S74e88m+q+nfz0J851xW2jdQ=
X-Google-Smtp-Source: ABdhPJzgCBqL5XPCfRFxa2JBTGNwdjwYjw4dXs6Iin9lcc6LxT6/9ubBVjPvC14EPwoe8wCcM9g7m/ZnXV5uhc7d+Zs=
X-Received: by 2002:a9d:4704:: with SMTP id a4mr19589584otf.236.1605158637343;
 Wed, 11 Nov 2020 21:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
 <CAJsYDVJtPqd-aPjJZFC76R2fbv1i=tVzRR7S1VFAMzp1QcPbiQ@mail.gmail.com> <CAJsYDVKWuygjbBErQt1B5XD8Bp06-TdrziBzDdYmMGhU_8X-aA@mail.gmail.com>
In-Reply-To: <CAJsYDVKWuygjbBErQt1B5XD8Bp06-TdrziBzDdYmMGhU_8X-aA@mail.gmail.com>
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Thu, 12 Nov 2020 06:23:46 +0100
Message-ID: <CAMhs-H85RCK=a_y+fVm-oR3hOEfr=rtVcLvX09YH4F65enz3oA@mail.gmail.com>
Subject: Re: [PATCH 0/7] MIPS: ralink: add CPU clock detection and clock gate
 driver for MT7621
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, jiaxun.yang@flygoat.com,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Thu, Nov 12, 2020 at 2:34 AM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> On Thu, Nov 12, 2020 at 9:26 AM Chuanhong Guo <gch981213@gmail.com> wrote:
> >
> > I've already said in previous threads that clock assignment in
> > current linux kernel is not trustworthy.
> > I've got the clock plan for mt7621 now. (Can't share it, sorry.)
> > Most of your clock assumptions above are incorrect.
> > I've made a clock driver with gate support a few months ago.[0]
> > but I don't have much time to really finish it.
> > Maybe you could rework your clock gate driver based on it.
> >
> > [0] https://github.com/981213/linux/commit/2eca1f045e4c3db18c941135464c0d7422ad8133
>
> hsdma/eth/pio clocks are still missing in mediatek doc and
> I just made them up in the driver. Correct clock frequency for
> them aren't really important for them to work though.
> And another part I didn't finish is checking clock support for
> every drivers mt7621 used. Many drivers don't explicitly
> enable the clock and may be problematic when kernel
> gates unused clocks.
>

Well, I think they are not important either. Also, by default gate
register has all the gate bits enabled. When a gate driver is added,
the kernel by default will try to disable those clocks that haven't
been requested. To avoid weird behaviour because of some drivers are
not using properly clocks we have the CLK_IGNORED_UNUSED, which as you
can see is currently being used in my code. Using that all seems to
work as expected as it is now.

> --
> Regards,
> Chuanhong Guo

Best regards,
    Sergio Paracuellos
