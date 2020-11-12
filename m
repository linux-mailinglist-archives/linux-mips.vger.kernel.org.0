Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECCB22AFF19
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 06:44:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgKLFdU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 00:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbgKLBfY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Nov 2020 20:35:24 -0500
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56155C0617A7;
        Wed, 11 Nov 2020 17:34:08 -0800 (PST)
Received: by mail-io1-xd43.google.com with SMTP id s10so4379781ioe.1;
        Wed, 11 Nov 2020 17:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rbpdEV5oJs5EmTQ4qqBH8SAi38sGGbLtW6CQKc149hs=;
        b=QJHjI8PK16X+WFhTxpfikEQQBKesGLQy41FaqcLf/NYWYbNYkYVVY4hbzUW3/zu83+
         6LTXMHmPce3IvwNpRjh0UUYuL8X2qLjhdPiIxy706lUXRXEcc5pz3fkpGu81jquaTH+9
         sKFgqy3n4wBPlNcT5mJDERmYeN35oyrxsu0A2IODkzQbLooR+w4nqX9mslkCSt5ISpS2
         hAOgwGk6EzZkHldzpAi2aA1iEPC24vJwF3F0I3wnDGCMxZNCiJ+4sYLrw62wSb4ZpKWO
         KLFcdzbICoZltLeOVJSc2VZdHIqo2dbcpMPLoj+e9cmoqk0LKNPsI5f4H+WHK2mpZ1s/
         Z/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbpdEV5oJs5EmTQ4qqBH8SAi38sGGbLtW6CQKc149hs=;
        b=l4cASASad9JJNOv4xWs3ONSWG2rOPeeHfWvBoknAR+Lsg1GkQoNV9ZCqx7rc1yy5W4
         AdCc27hgkS9GpUtl59QsX2J6InI8CKHcKv/hXnSJLzazxp0iQvwX0/QPAr2+hMCKwBXv
         OMniIiOz84UwhNKJXj0k0AnrKmuEfbyVkaJxUwFrv2tPV4/j08aH/8AQhbWP4ckhS+5L
         DzYgKcsybhBmeBqWfGkKDftNzGBmrPydptBkg6o0OsGXVfL4pGgbS/GP4VxmHtQmVBGM
         Scj/6yY/5aQSBLwHkVCaSPNBxdEgkm7Wnia7BrbdmwmCUrKr/g8P593Hw806IDaxxUjx
         xmaQ==
X-Gm-Message-State: AOAM533ooXar4WQVB+Xox/elZBWTwy8LtsI8y6wAabT3blSFHPrc4qu3
        FUU2VYePOzHMiLPuMes/s0H5HXUaYJsfARuuxc0=
X-Google-Smtp-Source: ABdhPJx9s5i1TWJ7IiZOclN/QEVz3COO+bkdo4SQu9Uhi7hDY6mOuJ+30tEBzttD211kuDsTR9BIV8uhKO5AcbH9RrA=
X-Received: by 2002:a02:a793:: with SMTP id e19mr21883768jaj.45.1605144847713;
 Wed, 11 Nov 2020 17:34:07 -0800 (PST)
MIME-Version: 1.0
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com> <CAJsYDVJtPqd-aPjJZFC76R2fbv1i=tVzRR7S1VFAMzp1QcPbiQ@mail.gmail.com>
In-Reply-To: <CAJsYDVJtPqd-aPjJZFC76R2fbv1i=tVzRR7S1VFAMzp1QcPbiQ@mail.gmail.com>
From:   Chuanhong Guo <gch981213@gmail.com>
Date:   Thu, 12 Nov 2020 09:33:56 +0800
Message-ID: <CAJsYDVKWuygjbBErQt1B5XD8Bp06-TdrziBzDdYmMGhU_8X-aA@mail.gmail.com>
Subject: Re: [PATCH 0/7] MIPS: ralink: add CPU clock detection and clock gate
 driver for MT7621
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
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

On Thu, Nov 12, 2020 at 9:26 AM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> I've already said in previous threads that clock assignment in
> current linux kernel is not trustworthy.
> I've got the clock plan for mt7621 now. (Can't share it, sorry.)
> Most of your clock assumptions above are incorrect.
> I've made a clock driver with gate support a few months ago.[0]
> but I don't have much time to really finish it.
> Maybe you could rework your clock gate driver based on it.
>
> [0] https://github.com/981213/linux/commit/2eca1f045e4c3db18c941135464c0d7422ad8133

hsdma/eth/pio clocks are still missing in mediatek doc and
I just made them up in the driver. Correct clock frequency for
them aren't really important for them to work though.
And another part I didn't finish is checking clock support for
every drivers mt7621 used. Many drivers don't explicitly
enable the clock and may be problematic when kernel
gates unused clocks.

-- 
Regards,
Chuanhong Guo
