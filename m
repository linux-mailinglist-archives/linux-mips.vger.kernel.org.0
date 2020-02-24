Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79EDF16A022
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2020 09:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgBXIg0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 24 Feb 2020 03:36:26 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:38253 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgBXIg0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Feb 2020 03:36:26 -0500
Received: by mail-yb1-f194.google.com with SMTP id x9so2188053ybl.5;
        Mon, 24 Feb 2020 00:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q0jb5gMjGa4PfJxdPglKntQPi2NqeTmaCRfMvu23RV8=;
        b=WNgoh0XuXoFzcKX+dQU7yQ1yXjbDE6pPQSogkShURYVgLpfW7eAFnrh1av99H5ZmIC
         gU6WjPifLKnSqtc3Ls9TPZ9vcGR1tJjqMWWsjdgw6HsT3foRGRFFJS9P/MrsIxg2FCHJ
         k8VERC9O7WsTdiSINmFRkj8ofRZknXDPZlohNEefFw5m3e6RWekbqKb2aFf6LqXSZTTY
         uY27SF1WaqGSdFenF4HPCnwBWzWH31FcKeGDZ5qG2Ed4rqBRyg+RfABUW4L4pOU6Hfx9
         Cmh89fnFbHEiGrtF3GRTS2aqn149M9w2jEn3AJVCkx/xSgboLEVkcx7evQaOtzlDtOwh
         AzEw==
X-Gm-Message-State: APjAAAVyGMH7yKljspGAc07muN2tdgiJ/xRAK1e2tRG+h8xRCo/Weyyn
        CH0Uo9xn32UuwsAdqf4srtx1L52eGCWJ8z4IaNA=
X-Google-Smtp-Source: APXvYqzcev14sMikUL9qbmJCdEphDWOt+vCkyAYC6iit4CnQoj+xQqI9JRB/zqHvmgJQYuBZ2Xk3P7OYqWGMwW4W7z0=
X-Received: by 2002:a25:99c3:: with SMTP id q3mr41717240ybo.323.1582533385430;
 Mon, 24 Feb 2020 00:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20200222170417.1531867-1-paulburton@kernel.org>
In-Reply-To: <20200222170417.1531867-1-paulburton@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Mon, 24 Feb 2020 09:36:13 +0100
Message-ID: <CAAdtpL6_zMhuRC48K=-jaircv1KppGkfmad0OMDz32Yy8STOSg@mail.gmail.com>
Subject: Re: [PATCH v2] MAINTAINERS: Hand MIPS over to Thomas
To:     Paul Burton <paulburton@kernel.org>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Feb 22, 2020 at 6:04 PM Paul Burton <paulburton@kernel.org> wrote:
>
> My time with MIPS the company has reached its end, and so at best I'll
> have little time spend on maintaining arch/mips/.
>
> Ralf last authored a patch over 2 years ago, the last time he committed
> one is even further back & activity was sporadic for a while before
> that. The reality is that he isn't active.
>
> Having a new maintainer with time to do things properly will be
> beneficial all round. Thomas Bogendoerfer has been involved in MIPS
> development for a long time & has offered to step up as maintainer, so
> add Thomas and remove myself & Ralf from the MIPS entry.
>
> Ralf already has an entry in CREDITS to honor his contributions, so this
> just adds one for me.
>
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
> Changes in v2:
> - Merge the 2 patches & add Thomas :)
> - Drop the link to Ralf's git tree
> ---
>  CREDITS     | 5 +++++
>  MAINTAINERS | 6 ++----
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/CREDITS b/CREDITS
> index a97d3280a627..032b5994f476 100644
> --- a/CREDITS
> +++ b/CREDITS
> @@ -567,6 +567,11 @@ D: Original author of Amiga FFS filesystem
>  S: Orlando, Florida
>  S: USA
>
> +N: Paul Burton
> +E: paulburton@kernel.org
> +W: https://pburton.com
> +D: MIPS maintainer 2018-2020
> +
>  N: Lennert Buytenhek
>  E: kernel@wantstofly.org
>  D: Original (2.4) rewrite of the ethernet bridging code
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a0d86490c2c6..86e70a216ab1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11114,14 +11114,12 @@ S:    Maintained
>  F:     drivers/usb/image/microtek.*
>
>  MIPS
> -M:     Ralf Baechle <ralf@linux-mips.org>
> -M:     Paul Burton <paulburton@kernel.org>
> +M:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>  L:     linux-mips@vger.kernel.org
>  W:     http://www.linux-mips.org/
> -T:     git git://git.linux-mips.org/pub/scm/ralf/linux.git
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git
>  Q:     http://patchwork.linux-mips.org/project/linux-mips/list/
> -S:     Supported
> +S:     Maintained
>  F:     Documentation/devicetree/bindings/mips/
>  F:     Documentation/mips/
>  F:     arch/mips/
> --
> 2.25.1
>

Thank you Paul for your MIPS work.
Thank you Thomas for stepping in :)

FWIW:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
