Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF64CDC6A
	for <lists+linux-mips@lfdr.de>; Mon,  7 Oct 2019 09:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfJGHdO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Oct 2019 03:33:14 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46907 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfJGHdO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Oct 2019 03:33:14 -0400
Received: by mail-oi1-f195.google.com with SMTP id k25so10767342oiw.13;
        Mon, 07 Oct 2019 00:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vDq/pScz6jDxm0R1Wr3UxFtVaahc4nNp9ESIiu3grQ=;
        b=s3eJWchQ16nFXtkfJ2UQBd+AfE95m2lQs07wXcaZhR1iSbkYAshro4awmHnlSzmu0l
         HX23csbR2Gf9pZTcqap5eITuFM+5QgoTZGp2+jvmz/FvmeCRjkU9qhOBysVKM+mJtZQO
         /brkvJE7Xyuptn05jmAc09MTkvGRgTqt2EPqPd38o4c0Oa0g/kfhhAmnT+re7arKKcQC
         udM9RBCPr1eTrxjdSjwjkRKE1j/knCme3v7z2BNjTxJcxRAKHOLBI5YaS+ay18xaJZmU
         UkyWsaXPnGdtML4tpy5xBOFe/cv5wZuhzKzj8zuoGVpnguzJoFfwGL00pWggvB8RM1Li
         Ouog==
X-Gm-Message-State: APjAAAUNcA6c73yojCBhqPC1SzHruHeHzcO5By7Fu0SJJXKF6qRDAItw
        Hg/UbG+QzaoM4drAkgu1vjjYV3tphThoL8i4SUGj4Q==
X-Google-Smtp-Source: APXvYqzpMU2bz1x2++O6c1yoiktedX4e6ww9JL1FRY2sBVVT/0DPBbWguSUrzKnsAcSZIlWKzK9iPrbIzuuH+5SkJeY=
X-Received: by 2002:aca:3908:: with SMTP id g8mr17418460oia.54.1570433592975;
 Mon, 07 Oct 2019 00:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191007071829.13325-1-geert@linux-m68k.org>
In-Reply-To: <20191007071829.13325-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Oct 2019 09:33:01 +0200
Message-ID: <CAMuHMdXvu+BppwzsU9imNWVKea_hoLcRt9N+a29Q-QsjW=ip2g@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.4-rc2
To:     Paul Burton <paul.burton@mips.com>
Cc:     linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Oct 7, 2019 at 9:20 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> JFYI, when comparing v5.4-rc2[1] to v5.4-rc1[3], the summaries are:
>   - build errors: +5/-10

  + /kisskb/src/drivers/staging/octeon/ethernet-defines.h: error:
'CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE' undeclared (first use in this
function):  => 30:38
  + /kisskb/src/drivers/staging/octeon/ethernet-defines.h: error:
'CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE' undeclared (first use in this
function); did you mean 'CONFIG_MDIO_OCTEON_MODULE'?:  => 30:38
  + /kisskb/src/drivers/staging/octeon/ethernet-rx.c: error:
'CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE' undeclared (first use in this
function):  => 190:6
  + /kisskb/src/drivers/staging/octeon/ethernet-rx.c: error:
'OCTEON_IRQ_WORKQ0' undeclared (first use in this function):  =>
472:25
  + /kisskb/src/drivers/staging/octeon/ethernet-rx.c: error:
'OCTEON_IRQ_WORKQ0' undeclared (first use in this function); did you
mean 'OCTEON_IS_MODEL'?:  => 472:25

mips-allmodconfig

> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/da0c9ea146cbe92b832f1b0f694840ea8eb33cce/ (233 out of 242 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c/ (233 out of 242 configs)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
