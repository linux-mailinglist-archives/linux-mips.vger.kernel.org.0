Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3214042ECFC
	for <lists+linux-mips@lfdr.de>; Fri, 15 Oct 2021 10:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236284AbhJOJBj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Oct 2021 05:01:39 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:34589 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236084AbhJOJBd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Oct 2021 05:01:33 -0400
Received: by mail-ua1-f53.google.com with SMTP id h4so16642553uaw.1;
        Fri, 15 Oct 2021 01:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=87lZBJy41uccEyREADShDZPFqyw1UVkLf2MRGpTsDXM=;
        b=Yzi8lfQT7vM55/d1gdFGJVgvNFXBWelN7WV8bVEaso2AFB5COIdjLKfdBmM+L0fjuc
         sC8dnMB2CMwpGJ6QZUnqLj5lyoQQ1Rpfnx8MOPPisJr+13NG+FeQ2KQ6qDnh/MEUFCLU
         aY8DbadjoyIs+X+VnhPy7W2Lr65o/cBXypN6x3+UoK+j/TxXLNjwnMxAhd+02o+YFeMV
         F1kE49FsiVeSzSOdZkM0HQdCVmTB3PoNXJSHlwRoeU8dI8aa9y1OtlgmE2a5Rtu+6R1O
         7IgOpqbWzryokKL5jP1vAOZ6OtTufz3NfasnoXhlIyAhMuS8TOyqEeF9dduu3f6XACEp
         0hgw==
X-Gm-Message-State: AOAM530TQ7kyAuztXq89pjzDMRuC0FOPgjq/1A43j3+dUbmDAolLMNe4
        Pp3Xt3Kewn5L0s7zJHYufGfMcAtXOe73JQ==
X-Google-Smtp-Source: ABdhPJymSmn5HpYV//IRj0M2AznJ8APn71BEAWWd9W9jlPP5R2t2zCv1sWOhpQ9aNexpFYQbhQ+oBQ==
X-Received: by 2002:ab0:6dcd:: with SMTP id r13mr11454479uaf.74.1634288366147;
        Fri, 15 Oct 2021 01:59:26 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id c124sm3324081vkc.10.2021.10.15.01.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 01:59:25 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id f3so16553829uap.6;
        Fri, 15 Oct 2021 01:59:25 -0700 (PDT)
X-Received: by 2002:a67:d111:: with SMTP id u17mr12430501vsi.37.1634288364926;
 Fri, 15 Oct 2021 01:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211012183327.649865-19-geert@linux-m68k.org> <202110150246.UAF2lniv-lkp@intel.com>
In-Reply-To: <202110150246.UAF2lniv-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 Oct 2021 10:59:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6MA5HK-Kazr0kCZVV6-fU3fJsB2i-bPp1+jYR6hT+yQ@mail.gmail.com>
Message-ID: <CAMuHMdW6MA5HK-Kazr0kCZVV6-fU3fJsB2i-bPp1+jYR6hT+yQ@mail.gmail.com>
Subject: Re: [PATCH v7 18/21] auxdisplay: ht16k33: Add support for segment displays
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, Miguel Ojeda <ojeda@kernel.org>,
        kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Dan,

On Fri, Oct 15, 2021 at 10:48 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/auxdisplay-ht16k33-Add-character-display-support/20211013-025705
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: i386-randconfig-m031-20211012 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> include/uapi/linux/map_to_14segment.h:87 map_to_seg14() error: buffer overflow 'map->table' 128 <= 255
> include/uapi/linux/map_to_14segment.h:87 map_to_seg14() error: buffer overflow 'map->table' 128 <= 255
> include/uapi/linux/map_to_14segment.h:87 map_to_seg14() error: buffer overflow 'map->table' 128 <= 255
>
> vim +87 include/uapi/linux/map_to_14segment.h
>
> d26423994040a7 Geert Uytterhoeven 2021-10-12  85  static __inline__ int map_to_seg14(struct seg14_conversion_map *map, int c)
> d26423994040a7 Geert Uytterhoeven 2021-10-12  86  {
> d26423994040a7 Geert Uytterhoeven 2021-10-12 @87        return c >= 0 && c < sizeof(map->table) ? __be16_to_cpu(map->table[c])
>                                                                          ^^^^^^^^^^^^^^^^^^^^^^

Nice catch, thanks a lot!

> This needs to be c < ARRAY_SIZE(map->table) instead of sizeof().

I don't think we can use ARRAY_SIZE() in uapi (although there are
two users, which thus rely on an external definition), so I'll
open-code it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
