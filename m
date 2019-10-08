Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2330DCF32A
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 09:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbfJHHEQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 03:04:16 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39591 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729693AbfJHHEQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Oct 2019 03:04:16 -0400
Received: by mail-io1-f66.google.com with SMTP id a1so34289792ioc.6
        for <linux-mips@vger.kernel.org>; Tue, 08 Oct 2019 00:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=34Qs6lEqooNmiYP3hoa4wNrIEl5OJr/MJlhlvnNS5iU=;
        b=Z8VECYz1gTIWeQHRlKdc8SyMgazW9sGE5FRaFnb4wPNbmLE7P17UhsC3x6SsDN0xJ5
         3DPYK3nYNJL4MirNqGVboW9NlYmBBD9cX+E8e4Zn2eGeLa6z/ODZLgDNQFBAfLgki6xb
         CCv/e8z8+uY5KBwmZevYqaXpJOt888tP6YTcSiJcxvzXb4DqWmbuudtzZ7jSHb3bDZkI
         qJffH7qES56ZdjvnVVmSoPr5iuDxM/P2tVXm3m6SWafdk+ymEHpfKhHvOzhFWgHCdXhd
         FY4uXcJIVFbFds6fBul5NLCIv+P832Q6E6h4gi8UCZWZY7mWhna0fT06Or/Q2mb29BfD
         MULg==
X-Gm-Message-State: APjAAAXeCeLyYZuPwgXmtHTJFcbdIl9dX4XEyZxtpxiwdsFpsL2X1M+F
        dakIkTlJM6DF+kVXXHAMyrwaOgqvoe2Hs7XVVpuVQ5ka
X-Google-Smtp-Source: APXvYqzJAtXFR0E5nXrGUg1nsQTyK+IzccXxedVQnMIkPDUALUWIGCqctRcJpk8E+MHgqJc3s6oC0GcxrFEScVjinpo=
X-Received: by 2002:a5d:8247:: with SMTP id n7mr19185778ioo.35.1570518255715;
 Tue, 08 Oct 2019 00:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com> <MWHPR2201MB1277326D98BD1BFE0A5263BDC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
In-Reply-To: <MWHPR2201MB1277326D98BD1BFE0A5263BDC19B0@MWHPR2201MB1277.namprd22.prod.outlook.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 8 Oct 2019 15:09:27 +0800
Message-ID: <CAAhV-H5Lt8N5PQLXO7-VQbOkrWD3eRZC2sOKPcBb3LmK9GN-BQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] MIPS: Loongson: Add CFUCFG&CSR support
To:     Paul Burton <paul.burton@mips.com>
Cc:     Paul Burton <pburton@wavecomp.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul,

I found that there is a typo in the title, please change CFUCFG to
CPUCFG, thanks.

Huacai

On Tue, Oct 8, 2019 at 1:51 AM Paul Burton <paul.burton@mips.com> wrote:
>
> Hello,
>
> Huacai Chen wrote:
> > Loongson-3A R4+ (Loongson-3A4000 and newer) has CPUCFG (CPU config) and
> > CSR (Control and Status Register) extensions. This patch add read/write
> > functionalities for them.
>
> Series applied to mips-next.
>
> > MIPS: Loongson: Add CFUCFG&CSR support
> >   commit 6a6f9b7dafd5
> >   https://git.kernel.org/mips/c/6a6f9b7dafd5
> >
> >   Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> >
> > MIPS: Loongson: Add Loongson-3A R4 basic support
> >   commit 7507445b1993
> >   https://git.kernel.org/mips/c/7507445b1993
> >
> >   Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
> >
> > MIPS: Loongson-3: Add CSR IPI support
> >   commit ffe59ee36aaa
> >   https://git.kernel.org/mips/c/ffe59ee36aaa
> >
> >   Signed-off-by: Huacai Chen <chenhc@lemote.com>
> >   Signed-off-by: Paul Burton <paul.burton@mips.com>
>
> Thanks,
>     Paul
>
> [ This message was auto-generated; if you believe anything is incorrect
>   then please email paul.burton@mips.com to report it. ]
