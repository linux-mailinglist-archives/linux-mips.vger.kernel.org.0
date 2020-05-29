Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A171E802E
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 16:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgE2O0t convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 29 May 2020 10:26:49 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39068 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbgE2O0t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 10:26:49 -0400
Received: by mail-qt1-f196.google.com with SMTP id k22so2030787qtm.6
        for <linux-mips@vger.kernel.org>; Fri, 29 May 2020 07:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nKBg+KBAm9AMX5S67x4gASOAHBGKT/3jyOi0pbKL+HY=;
        b=a7nBgn2QbMzqEK4RyCy3Iwx9oNOwDQWBCgjN+h+XN4PP6OJMJ60hYlLV51+8Ynla71
         5KtkSIPYOdtgNOs4RTH+9jIU2ASaMxI8MU0gBopUvT5KD5JIwkKrBR1GIzbh+mswK5Gj
         InSbSDLTgNYqus5/U/NozWy2tR/1Nm9VTFGfzg/k/HWRsiP0DeLxqK4Px/QnMDKn6PWr
         rhpUUiFhlcZYXlegNu924zBcLNsPYYJfHgzsMCaW2ejJ5Jed/VPjDs4Z0uoEnjMurRfQ
         xjfde5+jhw5Xpz8Vd4d50oso9Yd8yDqHcPTtpb1F+R+eCf/QFmPTYaS3yBBBz9fpQJ4k
         xUsA==
X-Gm-Message-State: AOAM531jtbE1UKmUSwMSxHaNiB8qvRtYiS3kKyUZVE+8IGQu3w7CndSe
        qMsn+GtDM9ZGbY3bnj9+ln5UYlNcOHZBSKVu9jE1md81LYA=
X-Google-Smtp-Source: ABdhPJwmIHDaotg7MsqXSBveDjy0KO+vzLtFwioqn6V8h01zBqM3SbjaZW0k+Z3ANoEyEekWNd74AEXhFtLjIhYXXhA=
X-Received: by 2002:ac8:3267:: with SMTP id y36mr9527066qta.241.1590762407748;
 Fri, 29 May 2020 07:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200528231628.120171-1-syq@debian.org> <20200529110913.GA11310@alpha.franken.de>
In-Reply-To: <20200529110913.GA11310@alpha.franken.de>
From:   YunQiang Su <syq@debian.org>
Date:   Fri, 29 May 2020 22:26:37 +0800
Message-ID: <CAKcpw6VkZBtiewrczgT1YS6C1KWf5WnWGf2vZRg+-k24yOD3_Q@mail.gmail.com>
Subject: Re: [PATCH] mips: add o32_fp64 boot param to disable FP64 support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas Bogendoerfer <tsbogend@alpha.franken.de> 于2020年5月29日周五 下午7:09写道：
>
> On Fri, May 29, 2020 at 07:16:28AM +0800, YunQiang Su wrote:
> > When build with CONFIG_O32_FP64_SUPPORTS, even all of the userland
> > is FPXX, we cannot run any FP32 binary.
>
> I don't understand what this means. Can you explain what the problem
> is ?
>

Some or most CPU cannot run FP32 application if
CONFIG_O32_FP64_SUPPORTS is enabled.
So we switch the whole Debian archive to FPXX. But the golang cannot
support FP32 now.

So I wish provides a way to support FP32 and FP64 with a single kernel image.

> > Then we need to disable FP64 support temporarily with a boot param:
> >    o32_fp64=no/disable
>
> A boot parameter should IMHO be last resort. But I need to understand
> the problem first to think about different ways to solve this.
>

Yes, I guess that we have a better solution, but I have no idea how to:
   1. switch by /sys or /proc ?
   2. support per-process mode switch.

I think that the 2) should be better.

https://web.archive.org/web/20180828210612/https://dmz-
portal.mips.com/wiki/MIPS_O32_ABI_-_FR0_and_FR1_Interlinking




> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
