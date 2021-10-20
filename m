Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FCD4346DB
	for <lists+linux-mips@lfdr.de>; Wed, 20 Oct 2021 10:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbhJTIaD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Oct 2021 04:30:03 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:40570 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhJTIaD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Oct 2021 04:30:03 -0400
Received: by mail-ua1-f54.google.com with SMTP id e2so5076779uax.7;
        Wed, 20 Oct 2021 01:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9qbWNnmOS9ewt1IIN1OcfZDAH5iLC7O1G6fIHR9IJTY=;
        b=iGd8AOd6yqH7CxN0z30wbM00KE2Ct61RRd1cMwWWWX3X7ytwglAHYk5I5qp7lcqM4c
         u4OPiRDa7B0fNXd0TqWXHtjPNuC9S1ABJM3nTuCSZACSx7DzNwxcbCbXFFu2rFe6jeMc
         iRrSou94JiBhnmWrnMI6kr0UZ1MzEHRYwiSRDZcVSdUrMcWO11wBSqtPEHYMpOIzl/uC
         cxo/2vGqkk1+xqGqL83Hra+QxRh9M7CTG8kAummNpDllg73SHcPwRyYiUflsBPS4w6Ie
         mHBGvOimHiSqzEGtrnkO0kS8DxexYP+gTsmhhEzq28/OwVshXPkoclEBeIE66qrDlTyk
         tJpA==
X-Gm-Message-State: AOAM532Nsov9hanSp6EyDtPArR/D1DFaqVdQmvj0FUyqgO0+9etJx74A
        c+Kou3S19TqxR/oUvu/usXDojQqt1f+ZDw==
X-Google-Smtp-Source: ABdhPJy8g1dB3Ql2G4/bvKkNwONBJg74ugTyzZLorLFUJtXp6Ad71m7wZdNaKHaYv0+G6ZhqoBs/Cg==
X-Received: by 2002:a67:3244:: with SMTP id y65mr40825101vsy.10.1634718468245;
        Wed, 20 Oct 2021 01:27:48 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id t69sm910738vkc.32.2021.10.20.01.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 01:27:47 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a17so5013756uax.12;
        Wed, 20 Oct 2021 01:27:47 -0700 (PDT)
X-Received: by 2002:ab0:3d9a:: with SMTP id l26mr5914512uac.114.1634718467216;
 Wed, 20 Oct 2021 01:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211019144520.3613926-1-geert@linux-m68k.org>
 <20211019144520.3613926-4-geert@linux-m68k.org> <CANiq72nJS_rxwB7BQJ30iEeFcX8_7VznkF0DvueM_Ym+Wqd94A@mail.gmail.com>
 <CANiq72nGPzDEeiQccTQ6QCeionfkfp01EDjp4btBfYKabXzGrg@mail.gmail.com>
In-Reply-To: <CANiq72nGPzDEeiQccTQ6QCeionfkfp01EDjp4btBfYKabXzGrg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Oct 2021 10:27:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBhBs3dpLFHo8VmUr22DkbXpPqMSwqkCVzpYYNA-5g4A@mail.gmail.com>
Message-ID: <CAMuHMdWBhBs3dpLFHo8VmUr22DkbXpPqMSwqkCVzpYYNA-5g4A@mail.gmail.com>
Subject: Re: [PATCH v8 03/21] auxdisplay: img-ascii-lcd: Fix lock-up when
 displaying empty string
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Miguel,

On Tue, Oct 19, 2021 at 11:09 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Oct 19, 2021 at 10:50 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Unrelated to this patch (and no need to change it), but we could
> > remove the conditional guarding the devm_kfree below to match this
> > one.
>
> Yeah, you did it when moving the code later on -- I guess we could
> have done it before too, to match, like the sysfs_emit change does it
> before, but it is not that important.

As this patch fixes a DoS that can be triggered from userspace,
I wanted it to be a fix as small and concise as possible.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
