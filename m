Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267616F28F9
	for <lists+linux-mips@lfdr.de>; Sun, 30 Apr 2023 15:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjD3NDp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 30 Apr 2023 09:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjD3NDo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Apr 2023 09:03:44 -0400
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D22A10DB;
        Sun, 30 Apr 2023 06:03:41 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so16017321276.0;
        Sun, 30 Apr 2023 06:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682859820; x=1685451820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7WF7SpO6yLlGrM65QrDk8wld6xpe3XopvGtDDxj/oU=;
        b=b1d08zJ62G08B0tzTrAn7ooNE+ea9969/G2AEOxxbvuVhyJtJUrlLlDsX1pWtdB7+I
         IHUvHOmC68r7b4swDWXtKrPYD8rID2BaL6rVtuXdFUuZHcKZc/JkDPRYZ2qonTU+HwdN
         DDlsZoWIUfolyWcJBfK2mYWxhAKq7JqbqFvIoZlrXCxYytqjnjMjzIOOqkYhi6DMHBOx
         CneY6s1Xuv4BMD7LrHgyJe3dlL3F61VqBTWVyvSK73PI0oSSwRTCaxPzfC0X2+w3w82l
         DU+YBE5K7HbvfgQ4XREtILVOyxvYH0KVm9JGsMH/GkDlxtY7MPz6vvjQTSWF3uUE7Tf3
         +omA==
X-Gm-Message-State: AC+VfDyKr1H5mi9Zt7Xmc+5rgSENr99I7bJ5a6BFZck981Uxfvaw1Ej9
        P0RpbzJHyc5EKyZ68KAfcyKM0QA7UvDjrw==
X-Google-Smtp-Source: ACHHUZ6FRhlovl/iKVtUV2Fz1wira6l+eMUCPrG7OihQsUHYcOm6KZcCsyrwfR6/rk5Ul8/4KP8OjA==
X-Received: by 2002:a81:9c1:0:b0:559:e21e:6f44 with SMTP id 184-20020a8109c1000000b00559e21e6f44mr4635938ywj.16.1682859819785;
        Sun, 30 Apr 2023 06:03:39 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id x128-20020a818786000000b00545a08184bdsm5173331ywf.77.2023.04.30.06.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 06:03:38 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so16017212276.0;
        Sun, 30 Apr 2023 06:03:37 -0700 (PDT)
X-Received: by 2002:a81:5253:0:b0:54f:b615:1e44 with SMTP id
 g80-20020a815253000000b0054fb6151e44mr9871377ywb.7.1682859817683; Sun, 30 Apr
 2023 06:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <74a647f7-cf5f-4c23-aad6-77bf5b04e116@app.fastmail.com> <mhng-8d0e378d-10f7-4107-99aa-b204c3d2a619@palmer-ri-x1c9a>
In-Reply-To: <mhng-8d0e378d-10f7-4107-99aa-b204c3d2a619@palmer-ri-x1c9a>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 30 Apr 2023 15:03:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVVgAETQPzYNgEnSijt8K6LE86xM2GuJdh7b6_SNCFj2w@mail.gmail.com>
Message-ID: <CAMuHMdVVgAETQPzYNgEnSijt8K6LE86xM2GuJdh7b6_SNCFj2w@mail.gmail.com>
Subject: Re: [PATCH] libgcc: Add forward declarations for generic library routines
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, geert+renesas@glider.be,
        akpm@linux-foundation.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        chris@zankel.net, jcmvbkbc@gmail.com, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Palmer,

On Sat, Apr 29, 2023 at 10:20 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Fri, 21 Apr 2023 13:38:52 PDT (-0700), Arnd Bergmann wrote:
> > On Fri, Apr 21, 2023, at 16:54, Geert Uytterhoeven wrote:
> >> With W=1 on platforms that use the generic gcc library routines
> >> (csky/loongarch/mips/riscv/sh/xtensa):
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Link: https://lore.kernel.org/oe-kbuild-all/202303272214.RxzpA6bP-lkp@intel.com/
> >> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Nice, this is one I don't have in my series,
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > I have patches for a lot of other missing prototype warnings, plan
> > to send them out after -rc1.
>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

> I think I've merged some stuff around here before, but it's probably
> better for some more generic tree?  LMK if you guys wanted me to pick
> these up, though, I've got a smattering of small stuff already so I'll
> have another PR either way.

Too late ;-) Already upstream via akpm's tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
