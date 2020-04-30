Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9E21BF141
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 09:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgD3HXZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 03:23:25 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35836 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgD3HXZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Apr 2020 03:23:25 -0400
Received: by mail-io1-f68.google.com with SMTP id y26so429472ioj.2
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 00:23:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rbz6a41oHXcHZfLGDGnieeCp1RXBVcwL2tdJ/CczE4E=;
        b=fdfkBdjEICtxGraFCuizlipTU/lVWRinaVFN1oe8CuZ71USuMOLScmyWI6x9q8utNT
         7IJcBqeqMOVIwA6iAzm7tH2U8WZi3qcAzanlJkMvHg72EdpL3eqfZu6qyupL3gGJvYmR
         LbCtiWxzRsU9f0b7ZNK0qrvWb7+Z0eZa5BQC50+y5NhZJvR5JzAUlamesAuUaVaYw2yE
         edIP6VkhKHI/zNwMLaMmnAcVPCSBnUeGc4UwqH8LqSddmvflKzUy8svewTBHZ/ESURe+
         mb8nIh0YRR3QN6rlBPwgODm4lu0TwB8ZTxdopd/NwP+h07QQjwAbVkteyXR53JSwVCDR
         xNyw==
X-Gm-Message-State: AGi0PuYhmKc/7ke/IA/RVpKo+DX7fcZh8o1DauF2OML73a7sqVryCPJI
        A7aYUWpcnGiiluiUfbYxibjKvRdLDRTv+ak56QE=
X-Google-Smtp-Source: APiQypJ/6iMaQ7treqg7b+hm0ksya5gEsfvJsw4oCRozJyHBKtrzZtwwfLis4irEYxcr4Y+YbNoLbQp1czcXKrlig7Q=
X-Received: by 2002:a6b:7317:: with SMTP id e23mr576693ioh.72.1588231404266;
 Thu, 30 Apr 2020 00:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <1588145170-9451-1-git-send-email-chenhc@lemote.com> <20200429182231.GA21158@alpha.franken.de>
In-Reply-To: <20200429182231.GA21158@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Thu, 30 Apr 2020 15:30:55 +0800
Message-ID: <CAAhV-H6j9ktHZ2C2Psk6X+0jmh-L9GMgOmKM95x0iXHo0d7TqA@mail.gmail.com>
Subject: Re: [PATCH V2] MIPS: perf: Add hardware perf events support for new Loongson-3
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Thu, Apr 30, 2020 at 2:33 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Wed, Apr 29, 2020 at 03:26:10PM +0800, Huacai Chen wrote:
> > New Loongson-3 means Loongson-3A R2 (Loongson-3A2000) and newer CPUs.
> > Loongson-3 processors have three types of PMU types (so there are three
> > event maps): Loongson-3A1000/Loonngson-3B1000/Loongson-3B1500 is Type-1,
> > Loongson-3A2000/Loongson-3A3000 is Type-2, Loongson-3A4000+ is Type-3.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  .../asm/mach-loongson64/cpu-feature-overrides.h    |   1 +
> >  arch/mips/kernel/perf_event_mipsxx.c               | 358 +++++++++++++++++++--
>
> checkpatch warns about missing break/fallthrough statement and indention
> problems, could please look at this ? And as all the new code is only
> usefull for loongsoon CPUs could you try to only compile it in, if it's
> enabled for the image ?
OK, I will solve the "fallthrough" warnings and indention warnings.
But the other problem is I should use #ifdef CONFIG_CPU_LOONGSON64 to
guard all new code in this file? I remember that Paul Burton suggest
us to avoid use #ifdef and use runtime detection instead.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

Regards,
Huacai
