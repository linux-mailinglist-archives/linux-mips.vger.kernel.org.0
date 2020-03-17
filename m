Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA5D1187D76
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2020 10:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgCQJxf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Mar 2020 05:53:35 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35148 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbgCQJxf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Mar 2020 05:53:35 -0400
Received: by mail-lj1-f194.google.com with SMTP id u12so22054657ljo.2
        for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2020 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ahtq2mQzZ/hKQzTlMcOpLhf6uob8xhN3CPDjeFKWyEM=;
        b=aGfwBsRGZVXeDImvcp1rxaXVNVG6sI22MgbooYe+Fj1c8fxvBgW1JJUhESsKVK12dh
         YGCH6QRWdfHOjrZGqWX5n5US/FhYIpo3wJovZ2G868vnRoVPGYgf1htRfNqFhBuToyPu
         DABPhm4gTU6Rekp3tY5L5NbchKoy0A+oaLQu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ahtq2mQzZ/hKQzTlMcOpLhf6uob8xhN3CPDjeFKWyEM=;
        b=bUHvk79Idm0gh63+BBx1hplQdMNX2P1kDckVUBr8YZGrBu2Sj34wkVA7ETumUNL05K
         s2AhBf24/0PiBgD5Cn7EpbiKq7qXfqH0g7/XqBcykGf72sxQU/HB76R/L0XYJYhM/p1e
         i6Kwl+7hhqyYGE4MqzC5HFGxiOHkERLMfionxMfyUr70Hb15xoIUoGsihy571APWUG2A
         dJ62O89Esu5YNuSdU1ANvM791jX4WOO0O4+j7mq2+oQqLVmGHuvGoW4AI69WQo8v3oB6
         v3QotJM3AcyFknYYVV3IryBEf1SxTPwptfaGMwrPqJ+fvUztq0SomWL0+eEuuUxPEn6n
         2sVw==
X-Gm-Message-State: ANhLgQ3hyrTNZiMzi/cmNdejJutM+lOJuIagoU9w5StcpEw0pNUYIlf3
        D7hGlqhD3aIaQjQgmRdizMzc0SfSEdz+xkOFX0Uhuw==
X-Google-Smtp-Source: ADFU+vvxuOLt1IwGKsrImxS13GFlvtmnCJR669U9slmviidnh+ZhPft+usarUg8t0soUz8b6zMNszgIWOKrVO9BWE+A=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr2344374ljg.157.1584438812259;
 Tue, 17 Mar 2020 02:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200317040742.12143-1-rayagonda.kokatanur@broadcom.com> <e94bbb2c-6f36-61bb-d26a-2ce3e1a139e0@cogentembedded.com>
In-Reply-To: <e94bbb2c-6f36-61bb-d26a-2ce3e1a139e0@cogentembedded.com>
From:   Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Date:   Tue, 17 Mar 2020 15:23:20 +0530
Message-ID: <CAHO=5PEiPK=uF_rEJ+ujaP=oq2fPR1VHvczjZ1JQAqDdjTsMHQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] firmware: tee_bnxt: remove unused variable init
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 17, 2020 at 2:39 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>
> Hello!
>
> On 17.03.2020 7:07, Rayagonda Kokatanur wrote:
>
> > Remove unused variable initialization.
>
>     I think it's not an initialization, it's an assignment. :-)
Thanks  will fix it and send v2.
>
> > Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> > ---
> >   drivers/firmware/broadcom/tee_bnxt_fw.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/firmware/broadcom/tee_bnxt_fw.c b/drivers/firmware/broadcom/tee_bnxt_fw.c
> > index ed10da5313e8..6fd62657e35f 100644
> > --- a/drivers/firmware/broadcom/tee_bnxt_fw.c
> > +++ b/drivers/firmware/broadcom/tee_bnxt_fw.c
> > @@ -143,8 +143,6 @@ int tee_bnxt_copy_coredump(void *buf, u32 offset, u32 size)
> >       prepare_args(TA_CMD_BNXT_COPY_COREDUMP, &arg, param);
> >
> >       while (rbytes)  {
> > -             nbytes = rbytes;
> > -
> >               nbytes = min_t(u32, rbytes, param[0].u.memref.size);
> >
> >               /* Fill additional invoke cmd params */
>
> MBR, Sergei
