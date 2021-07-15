Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6690F3C9955
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 09:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhGOHHe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 03:07:34 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:43920 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhGOHHd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 03:07:33 -0400
Received: by mail-vk1-f175.google.com with SMTP id bb26so1070851vkb.10;
        Thu, 15 Jul 2021 00:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xBOQfVAHN/gMLaUVEeV1YaP5S3H67lxPpg5yEoNNiuo=;
        b=WqFO7Si+3aa10ibEzQA2l1JL2Tz9dozZ7c0V0ko9/lHa6Pwr/tkpgwmaJ0CebtK7Fj
         ELecca2Qk8V3BTg24wyRggeSI5HmqZpAH4KvbfuxeR79/VMEHrZCFOqiT0p7q+8nV2sN
         3tG0coDl3IyZZAbjyEXzzop8rPCFjcrikjP5OTv/MeZUQji8TeY47RG6E6aT3farY5yt
         McXvR0gZ4ZMnk4yijYJZ9z1T6nRkuRNhIDgwIrtoskKNEFzTEe8PIz7FuXtm/OA3xwzD
         1QiSTxNOTTNyMmYbLfspD12s+WZ0OWw9nvNxaYtqG/jqvm7yOGoWRtvyGjcHGMNx/ihO
         Bldw==
X-Gm-Message-State: AOAM531CCOgdcBO+EKznbrSDHsyagbrhAHCb3oN+X9xARZ1vJBBaj0ZW
        a+vP8sPqMGtgwG4d7q/RKSz97NyadENblIbvdrk=
X-Google-Smtp-Source: ABdhPJxvuSCKs4nNWipZBNmXh2CTjft10x3JzQYRUm2U2sGpN09CMRCNFB3O03+tm8bk1s/KXtvErvV2rWkm04pxE4E=
X-Received: by 2002:a05:6122:a12:: with SMTP id 18mr4016447vkn.1.1626332679580;
 Thu, 15 Jul 2021 00:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210714151130.2531831-20-geert@linux-m68k.org> <202107150434.SylYq7Cs-lkp@intel.com>
In-Reply-To: <202107150434.SylYq7Cs-lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Jul 2021 09:04:28 +0200
Message-ID: <CAMuHMdUf4C=+vUk6QRm5rO8meZCRZat3MrhktPBW7wUkZOxhug@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] auxdisplay: ht16k33: Add LED support
To:     kernel test robot <lkp@intel.com>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        kbuild-all@lists.01.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 14, 2021 at 10:50 PM kernel test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:

> >> ld.lld: error: undefined symbol: devm_led_classdev_register_ext
>    >>> referenced by ht16k33.c
>    >>>               auxdisplay/ht16k33.o:(ht16k33_probe) in archive drivers/built-in.a

Thank you, the driver needs to select LED_CLASS. Will fix in v4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
