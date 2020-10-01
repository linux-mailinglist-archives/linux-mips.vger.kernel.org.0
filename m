Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905EE27FA7A
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 09:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgJAHqU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Oct 2020 03:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgJAHqF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Oct 2020 03:46:05 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54ABBC0613D0
        for <linux-mips@vger.kernel.org>; Thu,  1 Oct 2020 00:46:04 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id j2so4585826eds.9
        for <linux-mips@vger.kernel.org>; Thu, 01 Oct 2020 00:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FrPg4td8G2Qt7V9A77qbswQsY+lnjAcu9L1LEPRn1eQ=;
        b=FjOZVTlz2oOyZpoARCwXlynA4b81GjjKZGZFE8YJ2UWm//cCeuSy7LKy6L98lCJnBu
         zmh3EQLBxlT/CDLmFHip+kNeaHdfGzZZPTsSocozxt3c3KOkLGbAJqlf0ukMEWH3f8y2
         Hy5hDv9inBBT+0w6MjtbMr1KhYMZQ1UlrXd0FG5iJdpZFnt1VJwNfhiZWSHJvyrWveJY
         WmXZyFQpUHJAhtiL37bN8nzAcHrr/KxkhAz+KuoeF4cgz7PgbMAeL7Mx4EwuVyxiI9r0
         jdbjK8g7UX2Y5+F9puR5MsWOTpzHDxM/v31SXbNC962vpC9cmPtdqLxR8pviLXq90Y3O
         x+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FrPg4td8G2Qt7V9A77qbswQsY+lnjAcu9L1LEPRn1eQ=;
        b=UgtqDC/+ndXDT3zD9xMSWbH/Gfkk8zHQ2GkU2nc3WW9wc1DpROrmo3iZFcpUmpmn1V
         JeTiIN1GzR40fKoQbv5FT44o0KeH2UTxGVqjrsDZPl6XQ5H7zl63AVs9WTviPguvW4L0
         CffzBk0VlmxTwQb4v/DBK/HpVz0xAdhwjsS2EX8cx4npCPyh6aqKPkunpG4gNY9UFLzb
         GOY3Ahm7IY9rDqdOEpmsI7rU/loXruKdGqqFTDk0Nd7znTk6/2KY8bsRiPe3ySSnaw7R
         u/ux/o5gRGOR4ex6OI/w32p2N/KUBBpJocm4ifBsfAeaRlKvGoZUTljM7AmvUVeKG4tv
         o6gw==
X-Gm-Message-State: AOAM530wcUd8ofnf2L6V+0tT7hijZBoKWTSnUdKoN59ymG2PWxlu3nzu
        ZIy8kEfXByHfjujupd7HfcUAixzkvw7Y+d+op+r6kg==
X-Google-Smtp-Source: ABdhPJxbpQG86t5w8S+sGfWvSdUVUnR0wFoLlDs9sx3yHdL+Bt4uyDejsxkJcx6nqbbCs4bcJ3NiwfP4l4dqlzEHvd0=
X-Received: by 2002:a05:6402:cb4:: with SMTP id cn20mr6815465edb.369.1601538362884;
 Thu, 01 Oct 2020 00:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200821031228.31231-1-r@hev.cc> <20200930111644.GA19903@alpha.franken.de>
In-Reply-To: <20200930111644.GA19903@alpha.franken.de>
From:   Hev <r@hev.cc>
Date:   Thu, 1 Oct 2020 15:45:52 +0800
Message-ID: <CAHirt9i06fyHxinkurR-AA8rW2_Qm=UmAFgCPABsj=K9YADT2Q@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Optional SYNC emulation
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        "Maciej W . Rozycki" <macro@linux-mips.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Thomas,

On Wed, Sep 30, 2020 at 8:48 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Fri, Aug 21, 2020 at 11:12:28AM +0800, Heiher wrote:
> > MIPS ISA defines several types of memory barrier, of which Type-0 (full barrier)
> > is required, and the others are optional. In some vendor implementation (such as
> > Loongson), all optional parts are implemented to emit an illegal instruction
> > exception. Here, emulate to full barrier to ensure the functional semantics.
> >
> > If an implementation does not support SYNC 0, it should also not support SMP, so
> > the `smp_mb()` is only a compilation barrier.
>
> I see your point, but isn't taking an exception already more than a
> compiler barrier ? Does the missing sync hurt in real life ?

As far as I known, the optional sync instruction has been used in user
space programs (such as firefox), and the illegal instruction
exception does not include the semantics of the memory barrier, so if
the optional sync instruction is not simulated, the memory access
order of these programs it may be different from the order in the
code.

About the compiler barrier, What if the hardware does not support SYNC
0? I think it does not support SMP, so smp_mb() is only a compiler
barrier and will not cause infinite recursion in the simulation.

Thank you

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

-- 
Best regards!
Hev
https://hev.cc
