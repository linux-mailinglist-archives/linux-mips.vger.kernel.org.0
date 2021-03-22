Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFEF344DBE
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCVRvt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 13:51:49 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:33670 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhCVRvo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 13:51:44 -0400
Received: by mail-ua1-f50.google.com with SMTP id h5so1865546uaw.0;
        Mon, 22 Mar 2021 10:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R0q69RlwrnHwvmn0kwWgXbeTi/kWGjbwa2T7nZwSfRI=;
        b=e8K5yHxTW0GfwXp0bvyWpbgnkmCxq6K84/SsCiJwG6EtCJ+szKS5+23n5s8ZsjL2yE
         e0M1qD6WCFU4pJ+XTOJCFLS+R89vKQSHRspoBWQ9gmuTyqCtah1zrVNLo+7OuKZUw4vD
         e1wnmxwYvMwXrcvGfrgmdQtGdKcKYL4n+4tFQ9Xgliu5u6GWGK7ZgmkIXGUufl7WSjbc
         z6f+AulClnJruLTKn+RHIMkDZbVE+XoTMjAUOnalYoNTcml1U3PKm7JVB+IaH5ElHzNt
         md1s6hDSrKTkX7j9i+ZmTDq9LSjon7QbgaV6klm14xMeZ897WCVihn3W165p2cNUlDGx
         93Fg==
X-Gm-Message-State: AOAM533aWEJmAZ5JCJpDiCSGfnIrR1qSamPJTx6UbORuZdodHYzl6f+r
        0JduR8rCsFS1u6BSy9PINUzVdGTotw6p60iCyMmzS/Xm
X-Google-Smtp-Source: ABdhPJzcSTTwbSmzXa4uAWaIkZpkhYccxFid3E9uvKEp+10qAcxzJUuD1a9e8gobpDPFGna1x4iMOG2Xg4395m2lgSk=
X-Received: by 2002:ab0:64cf:: with SMTP id j15mr975994uaq.4.1616435503853;
 Mon, 22 Mar 2021 10:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-2-geert@linux-m68k.org> <CANiq72nL=BRz8XE_mSUvOMZg8ssJ6jO43QoVD5SyLsiqgQpDEg@mail.gmail.com>
In-Reply-To: <CANiq72nL=BRz8XE_mSUvOMZg8ssJ6jO43QoVD5SyLsiqgQpDEg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Mar 2021 18:51:32 +0100
Message-ID: <CAMuHMdXaiQ2sKUffQJqCxvUuTb+JL5WuzJnzKgKg4W-qtvC8UQ@mail.gmail.com>
Subject: Re: [PATCH 01/17] uapi: Add <linux/map_to_14segment.h>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miguel,

On Mon, Mar 22, 2021 at 6:05 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Mar 22, 2021 at 3:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > You can find an image of the full character set at
> > https://drive.google.com/file/d/1h3EYFBWHIjh8B_cwPA5ocAD-lFYipRie/view
>
> Should we put it in e.g. the Docs or just alongside this file?

I don't know.  We don't have the image for the 7-segment display mapping
in the docs either.
Perhaps I should push the programs I wrote to create the images (for
7-seg and 14-seg) to github?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
