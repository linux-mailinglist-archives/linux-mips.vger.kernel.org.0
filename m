Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3DD3B5C5D
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 12:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232609AbhF1KUS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 06:20:18 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:45784 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbhF1KUR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 06:20:17 -0400
Received: by mail-ua1-f43.google.com with SMTP id c20so6751598uar.12;
        Mon, 28 Jun 2021 03:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pr9HGl4FqzQBvqaKGGPpCfCz3bY0d+qLj1EnCPHyL5w=;
        b=GG/8FZgTQ4sb8MR9WkCWQpfEyY88VrqJ5OijB8p0S/lcbLVLcMRKJEio4KhvQO692w
         GVcWYJ+edxkHMM8bwRf8OFulFcCQCHn4BYyBafG6b7XfWP5JgBg6TyxtTYHYLmvR3F5n
         ykE4+h5wXLqtt3AUEE9hoDSYKVdljWjqtmCN0t1zFKw0z0+JCo7f9SHbdZvVURuByQ8E
         B71RqoSP5hyjAUWATBoZweiiY0PfyF4Qx1S2u4YEDIM4rybmQa0f+/JvLMwBI0xM/94S
         /S/JPLo5ZOV6lJ0ZcnsT36ZCp/pDrXbydP8RBxbTpknYYEigOTHOYnO6AO8vzqztpmZn
         PBTg==
X-Gm-Message-State: AOAM5330ubTFLMlWSHlEYiE52DBi3ADM1nmwm0hlZv8uiUS69EN0MTgV
        ZLwUe39pC4ipoAHJaUrUHSLMSeFPF36tCGNyzFI=
X-Google-Smtp-Source: ABdhPJyqF1aSJLgvFbmkLMYCnsnTPHiPUAsGhIVM99tOcWI2ZbGEjju2EsKV4xbyE6jUD9q959uT/dX1hb0S6FovsPA=
X-Received: by 2002:ab0:1e4c:: with SMTP id n12mr19573056uak.58.1624875470758;
 Mon, 28 Jun 2021 03:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210625125902.1162428-7-geert@linux-m68k.org> <202106260719.fU3KdM6r-lkp@intel.com>
In-Reply-To: <202106260719.fU3KdM6r-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 12:17:39 +0200
Message-ID: <CAMuHMdVf=9XQ49BJ3VcpfJAS1SmEpopqUhkYGqp4fmP-XMBJwg@mail.gmail.com>
Subject: Re: [PATCH v2 06/18] auxdisplay: Extract character line display core support
To:     kernel test robot <lkp@intel.com>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, kbuild-all@lists.01.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Kernel Test Robot,

On Sat, Jun 26, 2021 at 1:36 AM kernel test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on staging/staging-testing linus/master v5.13-rc7 next-20210625]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/auxdisplay-ht16k33-Add-character-display-support/20210625-210014
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> config: powerpc-allmodconfig (attached as .config)
> compiler: powerpc64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/5505aedee505055e2fe16a718203e24fd8519e2a
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Geert-Uytterhoeven/auxdisplay-ht16k33-Add-character-display-support/20210625-210014
>         git checkout 5505aedee505055e2fe16a718203e24fd8519e2a
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: ".kernfs_create_link" [drivers/auxdisplay/img-ascii-lcd.ko] undefined!

Thanks a lot!

This helped me finding compat_only_sysfs_link_entry_to_kobj(), which
I hadn't found before, and which does an even better job than my custom
sysfs_create_file_link() implementation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
