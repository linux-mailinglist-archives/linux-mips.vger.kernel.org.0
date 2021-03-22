Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AADFE344DC9
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCVRxb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 13:53:31 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:41683 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbhCVRxM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 13:53:12 -0400
Received: by mail-vk1-f173.google.com with SMTP id o85so3997492vko.8;
        Mon, 22 Mar 2021 10:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=51zGCqBXl43ZX311IoQVz5nD7uSEuSK9azOqp9/NNbM=;
        b=p+uTj9SB+SWIOU4RI9xGoSOSVyDFLxRwwLxzxlzFOV6/FlvsyhDj11e3dV65r3Fn4X
         7I6IntLTgOqaJH3RxykloS+jyz3k9gRoVlFiFJVNfu6ZGDlPPam6LHC3TcivMOBaXg1S
         YyV8lJwlQ2TogEAQHtTOGeCwtbAHjqH/hSH/Llp6wepTAjA7RtxrN7ua5Epj4OwAqhYd
         o9b7NjBmnQ34kIaLAtjdYaERw0awpSQsyvoMxfLlIkLEBzhh6BG7scZrjD22wJ/NGOa0
         IxR/6YzhZT+i7tZDi/EwbePkRW9yoxAjOUlsdaaSJqrVX46MgmXiS3W6w+d4lOnGemSx
         wKKg==
X-Gm-Message-State: AOAM530UgN9k6YJWeZMTx0xcsriPWW8E2tFmpPqxO1NP0D1vUVRwRtrg
        A2q+rHNGp/bWtdlhpGPmaT/zcaS4hTrUMVMyt0k=
X-Google-Smtp-Source: ABdhPJwV75rRcQ1W+AfL+sk8wmoLPCnpP/A7gDAMFs4WtMd7EVrylU6+gzXqmOlYAkXlJrsD2M3/fRhvURo7Acq/Drs=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr875345vkl.5.1616435591316;
 Mon, 22 Mar 2021 10:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-5-geert@linux-m68k.org> <CANiq72ng1J210QwAGO_qFQrJ_1REizLGkejieuxbpOJ0Bmm_Cg@mail.gmail.com>
In-Reply-To: <CANiq72ng1J210QwAGO_qFQrJ_1REizLGkejieuxbpOJ0Bmm_Cg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Mar 2021 18:53:00 +0100
Message-ID: <CAMuHMdWhabjJ9MLJ4OZA45Paa5FQ8LJ3id0HVqBoDdGtyVDQEA@mail.gmail.com>
Subject: Re: [PATCH 04/17] auxdisplay: img-ascii-lcd: Add helper variable dev
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

On Mon, Mar 22, 2021 at 5:59 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, Mar 22, 2021 at 3:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > +       struct device *dev = &pdev->dev;
>
> Do we want helpers like this to be `*const` (assuming they can)? (same
> for patch 12).

No, e.g. the devm_*() functions need to make changes to the device's
structure.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
