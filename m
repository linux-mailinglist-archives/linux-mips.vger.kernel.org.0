Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFF5269266
	for <lists+linux-mips@lfdr.de>; Mon, 14 Sep 2020 19:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgINRC4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Sep 2020 13:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgINRCp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Sep 2020 13:02:45 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BC5C06174A
        for <linux-mips@vger.kernel.org>; Mon, 14 Sep 2020 10:02:45 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l15so6279781wmh.1
        for <linux-mips@vger.kernel.org>; Mon, 14 Sep 2020 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XBsBN4g4WydhGxWoeGf4IyB73ADZjcR/c1AieyhiWwM=;
        b=TVpqwhRGl8uCFTVBhKXTj2ew41sAH7bBSKeGCXZ2x1i0BmskYB6XAIUcAjezGBFWsg
         Njzbq/518D+Z/5y0QzPUAWX+zP3ltC3gdgl6TnL01l5e07Vo2ZjNavpnUfdE3IUAxajy
         BOtbaM5VqR3XVTqhzrPdQG2c/qnLnnN0wCgaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBsBN4g4WydhGxWoeGf4IyB73ADZjcR/c1AieyhiWwM=;
        b=XmJuRcb5zbUtamTaNauOKW1pHVnlQR6gUdv7frrsKodUCeBmaHijPZTADin0zU0qcy
         Zhqxz0o074LW0VKzlTRNk+PSq7y7Lp2w0ssngVAn6l6uSTl71jpsIQs3WyOpxLB/S5Fd
         fecTdEk/DqdN9IxQVJhOWFNA+7dhouRr2ol39RnB1fjjI52UrHCsFYSAXFAnsKZ/Fs4P
         AwmqQXJSlbp+0u42YgFTL8rHNq4UyhMy1jt8oivNLv5TezUafXEVX+TOnXcnAHIy0Tl+
         38MYjzFmQHvfLYdnHShrlGnJlc3AVD2fOAWU5CYFqZ8gMojByjgvtMvUgdEeobD4SHMI
         izFw==
X-Gm-Message-State: AOAM532Cw2F2nqA46b6IfMYBmz6E4y8i+7jENgqqzwxLxgYp+nahG39S
        ahl6jrZE12N+5GTOr0slf85rmRbPCIk+7kkdi8R0Pppgr44=
X-Google-Smtp-Source: ABdhPJyLcp0SNDqyD1tDe2dF/Gmd6ajPcTyhHVQXfdJcEXkvuAIb6mvX1Hgg+eil+8E5rfUz0K99hRB/EtJweYNc6Bw=
X-Received: by 2002:a1c:408a:: with SMTP id n132mr310643wma.45.1600102963699;
 Mon, 14 Sep 2020 10:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200908164512.15379-1-james.quinlan@broadcom.com> <20200910093709.GA10310@alpha.franken.de>
In-Reply-To: <20200910093709.GA10310@alpha.franken.de>
From:   Jim Quinlan <james.quinlan@broadcom.com>
Date:   Mon, 14 Sep 2020 13:02:32 -0400
Message-ID: <CA+-6iNyvkvwPvr-_R8zivnKLtkwmYG34vephdYUJ7ywCqNmjMg@mail.gmail.com>
Subject: Re: [RESEND PATCH v1] MIPS: uasm: false warning on use of uasm_i_lui()
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 10, 2020 at 5:37 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Sep 08, 2020 at 12:45:06PM -0400, Jim Quinlan wrote:
> > Currently, the example uasm code
> >
> >       uasm_i_lui(p, tmp, 0xa000);
> >
> > issues a warning at Linux boot when the code is "assembled".  This is
> > because the "lui" instruction is defined by the macro "Ip_u1s2(_lui)" -- I
> > believe it should be Ip_u1u2(_lui) -- and its definition is associated with
> > the SIMM macro -- I believe it should be the UIMM macro.  The current code
> > takes a 32bit number and checks that it can be converted to a 16bit signed
> > immediate.  This check fails of course for an immediate such as 0x0000a000.
>
> IMHO SIMM is correct as the upper 16bits will be sign extended on 64bit
> CPUs.
>
Hi Thomas,

Got it.

Thanks,
Jim

> Your example looks like to try to load a KSEG1 address, so just use
>
> uasm_i_lui(p, tmp, uasm_rel_hi(0xa0000000));
>
> which even makes it clearer, what this is about.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
