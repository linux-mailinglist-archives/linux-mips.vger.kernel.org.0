Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252A223E5B2
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 04:08:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgHGCID convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 6 Aug 2020 22:08:03 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33772 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgHGCIC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Aug 2020 22:08:02 -0400
Received: by mail-io1-f66.google.com with SMTP id g14so451054iom.0;
        Thu, 06 Aug 2020 19:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/3E1czSRtJ2NM8tCCNBLnDvuWpSz15DONo1WQYWWOmM=;
        b=MiCRjK8cGnrCImbbdviOQENjAOCMC026IJKKUa68848pqumbBUsCWTqnIi3SxXUaNG
         ChLVUc1cAxrLVuW4JLG2wr00+fECFDCLVJ+fPiPk4MOhR6Bk2xvmLBIpFycGDAHGpaPu
         5pogRXDxBbnp6Y4h3l2VIZXdperNMIcY7/FWYF/Oqk5ZWgYvjtZ1HJGDIxgsh76e/ieS
         zAjFT01VtU3o7+hb15t0MdEtNXfCkCACadI6Pyy9i0gVvt2sa3julLFYg+ZHqMdW5cDL
         asaYPyDlQHUqN4nBfMEI6is5/3BDfRAkPiHs6mc45WMk3gwA8iqYAtscHgkCTeC5lXSB
         Oabg==
X-Gm-Message-State: AOAM53266xO4WD9qLcWIjsb1duUQACz3ITUlxQlF9ryDZRstOf48LYFF
        4DHkvto8LolYOLUckh9FwXGo04PTQP9JSXzbBY8=
X-Google-Smtp-Source: ABdhPJxr/YQEpf+/6x2NfWQSE6YvvpF1iaILStGtfR0ZSXXvpGbB2zw9A901yxdCaEmHiVZjTvXelGpeGTaMTolh+74=
X-Received: by 2002:a02:84c1:: with SMTP id f59mr2361109jai.106.1596766081446;
 Thu, 06 Aug 2020 19:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200801061147.1412187-1-jiaxun.yang@flygoat.com>
 <d03a350c-842c-c041-f11b-017ec68e3de4@flygoat.com> <9823ab9b-1f02-c8af-7d62-80a1d24aaaa3@xen0n.name>
In-Reply-To: <9823ab9b-1f02-c8af-7d62-80a1d24aaaa3@xen0n.name>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 7 Aug 2020 10:07:50 +0800
Message-ID: <CAAhV-H4AP-57fA31dxEGcTrvCH9NpPcKmbP-T9nm7ZUygczszw@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: Provide Kconfig option for default IEEE 754
 conformance mode
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        WANG Xuerui <git@xen0n.name>,
        Serge Semin <fancer.lancer@gmail.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Xuerui,

On Thu, Aug 6, 2020 at 6:54 PM WANG Xuerui <kernel@xen0n.name> wrote:
>
> Hi Jiaxun,
>
>
> On 2020/8/5 21:59, Jiaxun Yang wrote:
> >
> >
> > 在 2020/8/1 14:11, Jiaxun Yang 写道:
> >> Requested by downstream distros, a Kconfig option for default
> >> IEEE 754 conformance mode allows them to set their mode to
> >> relaxed by default.
> >>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> Reviewed-by: WANG Xuerui <git@xen0n.name>
> >> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> >> Reviewed-by: Huacai Chen <chenhc@lemote.com>
> >>
> >> --
> >> v2: Reword according to Xuerui's suggestion.
> >> ---
> > Hi Thomas,
> >
> > Is it possible to get this patch into 5.9 merge window?
> > I think it have got enough review tag, and the config option was
> > requested
> > by a Debian developer. The next Debian release will take 5.9 lts
> > kernel and
> > they don't want to ship a non-bootable kernel in a major release.
>
> I have an idea. Can the downstream packagers make use of the builtin
> command line config options, to inject the "ieee754=relaxed" or whatever
> option necessary? If it is acceptable this patch should not be necessary
> in the short term.
Built-in "ieee754=relaxed" is already in upstream for Loongson-3.

Huacai
>
> >
> > Thanks.
> >
> > - Jiaxun
