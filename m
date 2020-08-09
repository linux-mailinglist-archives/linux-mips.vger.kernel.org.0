Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6740923FFB4
	for <lists+linux-mips@lfdr.de>; Sun,  9 Aug 2020 20:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgHISki convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 9 Aug 2020 14:40:38 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:37487 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgHISki (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Aug 2020 14:40:38 -0400
Received: by mail-ej1-f66.google.com with SMTP id qc22so7229083ejb.4;
        Sun, 09 Aug 2020 11:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RZ2r2fEGzTZM9l6ALM21HkIBfxbLLAFJENwfeQcKsXs=;
        b=oxwahWGK8RsgRJDqLrzRbV0pYraaXpTSsphw57FNZKxk8quXc5a3oChoATV9nM5cM4
         cK5GOPjwItxGITR5M4Fgov+/XlE7oQ1E1TVnJwNqsB9WWmXzb/W+a4hibYzLCj9ndY6P
         rThZ6TSKUoQshXYsNl+s6paCfQTF4sYtuNJkXcnN5UImrNGfpi28XA98DGEnTXU3xOPB
         FXewKP2ITKWeOpZ/Yits7Pxhm7cLXCL1pKdh8+fpFvv95KH+cj2uViunYqTc5GmgQOVk
         HZppZvIoq/89K2ZMHpUX57+zy3pWy8NcMLaXEGGa7GR8139yThGXX8vHtovT9VgjgC2X
         XA2A==
X-Gm-Message-State: AOAM531fSpNt0tCMD5c194KACHqWZLZzYJaIBnQX9lW9CjF1yxX2rDLT
        2T8mI/Ch/DrjTb2Q7Dz3qzldN28R+eICt1WwEYdwJAu0
X-Google-Smtp-Source: ABdhPJwdaNQKUc35CAq1Vl+g4p0CKN8xjonX62rbI+Usre2BHByWTnCU4SNyNAUh+RC0zEUvP1W2rHdr75LflYZlZhg=
X-Received: by 2002:a17:906:f914:: with SMTP id lc20mr18351445ejb.138.1596998435939;
 Sun, 09 Aug 2020 11:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200807100411.2904279-1-noltari@gmail.com> <20200807100411.2904279-2-noltari@gmail.com>
In-Reply-To: <20200807100411.2904279-2-noltari@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Sun, 9 Aug 2020 20:40:24 +0200
Message-ID: <CAAdtpL4EydRG0jLqCKuggc4SvKe=qk3Z1aYuD51vnXp8DoRT5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] MIPS: BCM63xx: remove duplicated new lines
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 7, 2020 at 12:06 PM Álvaro Fernández Rojas
<noltari@gmail.com> wrote:
>
> There are 3 duplicated new lines, let's remove them.
>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
=)

> ---
>  v2: no changes.
>
>  arch/mips/bcm63xx/boards/board_bcm963xx.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> index 230bf27c1fb8..744aa16bab12 100644
> --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> @@ -32,7 +32,6 @@
>
>  #include <uapi/linux/bcm933xx_hcs.h>
>
> -
>  #define HCS_OFFSET_128K                        0x20000
>
>  static struct board_info board;
> @@ -337,7 +336,6 @@ static struct board_info __initdata board_96348gw_11 = {
>                 .force_duplex_full      = 1,
>         },
>
> -
>         .has_ohci0 = 1,
>         .has_pccard = 1,
>         .has_ehci0 = 1,
> @@ -580,7 +578,6 @@ static struct board_info __initdata board_96358vw2 = {
>                 .force_duplex_full      = 1,
>         },
>
> -
>         .has_ohci0 = 1,
>         .has_pccard = 1,
>         .has_ehci0 = 1,
> --
> 2.27.0
>
