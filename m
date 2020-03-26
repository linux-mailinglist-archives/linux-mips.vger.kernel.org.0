Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA5D193AD9
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 09:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgCZIbF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 26 Mar 2020 04:31:05 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34240 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgCZIbE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 26 Mar 2020 04:31:04 -0400
Received: by mail-qt1-f195.google.com with SMTP id 10so4591412qtp.1;
        Thu, 26 Mar 2020 01:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1uL6T0AlsEjbmQmM6hXpAIWUikHWCOqgCwWrHStOPM4=;
        b=JH3O4DFcQPzWFJmBjC/6CSDEMrX1UAowmp4PKE4vqLdFoiKqXriar8u53ExFjXN7wR
         KapHDumX8ckM5BRYaqLwhT0TzsOvgmkbaJJAJEcpRtaqROujK51FlxjgO/7p8jXaNvWg
         Pi/r326GHl07uzTo8ZESydPHPwEsKwt2HdD05EQhsNIkUI4BtNNfYXmJr4JPPqvmS0/V
         JpSbD06R1HVaJXdAMws0Qxhq3bao/4/K9MR1wjGNlCGD+vGApDevKPIXkxXg1oBNVIPN
         AWSIyWgxpFOxz9+vqGZ6YJQ1Dtemiusnr95jTXYnCaXCmDJx4DD7x1O0Aqj0TONMmsTW
         rnCQ==
X-Gm-Message-State: ANhLgQ2fvmi7DBGwwJWpnv8fq30xkfcNcUlKbTndNi9CcuiFKlqTOJv6
        suub27wH7GWmXgk2evrxJLaWQOvh3b0U0F0M4ic=
X-Google-Smtp-Source: ADFU+vvrb2nktbpRKwccTTwusZLhub3zTLR2A0M333GepHEiS4/SHtpcUDWp6ciSQJVRM0eIRQ3W5cCMQVXrKGlpkc4=
X-Received: by 2002:ac8:7449:: with SMTP id h9mr7109717qtr.386.1585211464008;
 Thu, 26 Mar 2020 01:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200322095527.397716-1-syq@debian.org> <827f0ae8-2e97-5eeb-387d-275d8aac98ad@gmail.com>
In-Reply-To: <827f0ae8-2e97-5eeb-387d-275d8aac98ad@gmail.com>
From:   YunQiang Su <syq@debian.org>
Date:   Thu, 26 Mar 2020 16:30:52 +0800
Message-ID: <CAKcpw6XsJVYP=4k+fjSF+JLM_J7ab9sV7nYFwUduzvNvWPzmBw@mail.gmail.com>
Subject: Re: [PATCH v2] getauxval.3: MIPS, AT_BASE_PLATFORM passes ISA level
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc:     linux-mips <linux-mips@vger.kernel.org>, linux-man@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Michael Kerrisk (man-pages) <mtk.manpages@gmail.com> 于2020年3月26日周四 下午4:12写道：
>
> Hello YunQiang Su
>
> On 3/22/20 10:55 AM, YunQiang Su wrote:
> > Since Linux 5.7, on MIPS, we use AT_BASE_PLATFORM to pass ISA level.
> > The values may be:
> >   mips2, mips3, mips4, mips5,
> >   mips32, mips32r2, mips32r6,
> >   mips64, mips64r2, mips64r6.
> >
> > This behavior is different with PowerPC.
>
> Thank you for the patch. I see that this is scheduled for
> Linux 5.7 (for which the merge window is not yet open).
> How certain is it that the feature will land in 5.7?

It is in mips-next and linux-next now.

>
> Thanks,
>
> Michael
>
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e585b768da111f2c2d413de6214e83bbdfee8f22
> > Signed-off-by: YunQiang Su <syq@debian.org>
> >
> > ----
> > v1 -> v2: fix typo
> > ---
> >  man3/getauxval.3 | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/man3/getauxval.3 b/man3/getauxval.3
> > index 456371c6a..bcc116dd2 100644
> > --- a/man3/getauxval.3
> > +++ b/man3/getauxval.3
> > @@ -60,9 +60,10 @@ values are present on all architectures.
> >  The base address of the program interpreter (usually, the dynamic linker).
> >  .TP
> >  .BR AT_BASE_PLATFORM
> > -A pointer to a string identifying the real platform; may differ from
> > -.BR AT_PLATFORM
> > -(PowerPC only).
> > +A pointer to a string (PowerPC and MIPS only).
> > +On PowerPC, this identifies the real platform; may differ from
> > +.BR AT_PLATFORM "."
> > +On MIPS, this identifies the ISA level (Since 5.7).
> >  .TP
> >  .BR AT_CLKTCK
> >  The frequency with which
> >
>
>
> --
> Michael Kerrisk
> Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
> Linux/UNIX System Programming Training: http://man7.org/training/
