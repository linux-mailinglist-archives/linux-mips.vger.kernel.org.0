Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3382E3EC9F0
	for <lists+linux-mips@lfdr.de>; Sun, 15 Aug 2021 17:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhHOPZg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Aug 2021 11:25:36 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:39620 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhHOPZg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Aug 2021 11:25:36 -0400
Received: by mail-ot1-f48.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so1057537otf.6;
        Sun, 15 Aug 2021 08:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ekgt3OAtYmB5Rrl1lZKK9+oa72a0Us/2FQEAMO/EQak=;
        b=nx7ht6GXvngZvY5EaLytK+E3shHTaI+pvIm5G0uk/RrQupL7M0RPgUvNudJHzWh/KZ
         +olF3xnvqRQvCbLjn4kC7dWnd+ih4Ml7i0huglwEPr6QCLVBfi/CPbhggoR5PbkRJVxF
         yMgq0Hkkm2e0Zzv2dip0+u3qfZ/oX+9gBr/FXdiPBnUx885C4inAhmsEEDUduKulHzPm
         1Omsbklx1enhMz7RF4IooaQo4TLvBZLVQtm4n7A88TEz1Mu69NIS1tdrM7yJxy1IrY7N
         DSNd5gDL0hmxXL+9/hDoyLWRpnQatktnTFfqe1iVwUpEUpH/qZBsIbzfBMl9MvC4HJYd
         mFDA==
X-Gm-Message-State: AOAM531/RuDEGi5cf6NnPjrfTmsWIDHyLlMWzsccaBQNEZH+a79s+Znj
        PLL8uUCAls+BDhl7t7rggw==
X-Google-Smtp-Source: ABdhPJzjr4gT4FE0xwAVG4uG4LG0+RSUbEqBTWj+LfaNdV32tQZ0vqtZTO/Ia6yG79/x3EO0MD/S6w==
X-Received: by 2002:a9d:6306:: with SMTP id q6mr9594009otk.290.1629041105852;
        Sun, 15 Aug 2021 08:25:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p8sm1717971otk.22.2021.08.15.08.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 08:25:05 -0700 (PDT)
Received: (nullmailer pid 3767739 invoked by uid 1000);
        Sun, 15 Aug 2021 15:25:03 -0000
Date:   Sun, 15 Aug 2021 10:25:03 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
Message-ID: <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds generic support for parsing DT properties related
> to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> the "/chosen" node), makes use of it on arm32, and performs a few
> cleanups.  It is an evolution of the combination of [1] and [2].

The DT bits look fine to me. How do you expect this to be merged? I'm 
happy to take it if arch maintainers can ack it.

> 
> The series consists of 6 parts:
>   1. Patch 1 prepares architecture-specific code (needed for MIPS only)
>      to avoid duplicating elf core header reservation later.
>   2. Patch 2 prepares the visibility of variables used to hold
>      information retrieved from the DT properties.
>   3. Patches 3-5 add support to the FDT core for handling the
>      properties.
>      This can co-exist safely with architecture-specific handling, until
>      the latter has been removed.

Looks like patch 5 doesn't have any dependencies with the series?

>   4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
>      riscv.

I thought this should be applied for 5.14?

>   5. Patches 7-8 convert arm64 to use the generic handling instead of
>      its own implementation.
>   6. Patch 9 adds support for kdump properties to arm32.
>      The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add
>      DT properties to crash dump kernel's DTB"[3], which is still valid.

This one can be applied on its own, right?

Rob
