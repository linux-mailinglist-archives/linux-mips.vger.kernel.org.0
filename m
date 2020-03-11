Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 966C8181692
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 12:14:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgCKLOK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 07:14:10 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]:45932 "EHLO
        mail-qk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgCKLOK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 07:14:10 -0400
Received: by mail-qk1-f182.google.com with SMTP id c145so1587574qke.12
        for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2020 04:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aD2Zr6k4zso1adZJ/bYrs3VBW+v83plBtx81RUhQteE=;
        b=LVLz3yUg8H5G25kkH1qX1nsDd46KltMrMPmI+mpwlichDqYjW9/XzhsQ6gWqPWyc0d
         0tIzOndnkTUvRS5zmLpXPN/VfDAib6df0Mwf3HrYNmXP/MvPOQ/MXLAWs4AN3nyq78cs
         FhGjvhuqDO0XHaPR81/5WdR/vhdyCoeb45ovV7Su7muXARProGwUPc+uF+u7FVTLpymy
         wfUmSqyHaNErKvt3MnalihgtqKL9/jvcYvwiVrmjVm3VhP3p+MKOhWhon/oQ+6gesK6q
         fnm1rMtNFZ6fMFeY1TQQD1CrJlDsmJeEGlwW+CubVrfsZaqVjQixYOg6rD7jJggUN8SM
         SS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aD2Zr6k4zso1adZJ/bYrs3VBW+v83plBtx81RUhQteE=;
        b=pY3njkKkBEHIwI30bNsm3VkA52KgeCY9ei0NX5SWVValrbA9jkDjicri8mhpS7h6Sr
         EjTXMU5bzcIiMgdylDWYAvq8jwsq7usyqItnIwhAJFBpCJ5imd01bRvkHeg4wN3viFYP
         tLI8oQIqs9l9OYeGwLE3ZNfn581zUFr3ldz4hAKd3hK86CENDXPh8k2NFYmQ59grmoQH
         vnEgn7YdWGH7xgxT606tBRz8AfDhFaA7Zt0BDSq6wRqllXLgkO/dWdolG2WFqeTc23jj
         alnwxWTsP37LSPsW7asCxHiDzuaI8vqsPgOnzMiyha0M64gzG7MuyZNFVeICycS63Vn8
         k8xg==
X-Gm-Message-State: ANhLgQ2EwrPdUUNYMdPyrNjp7fLOrenvuxihdzL2mNKaGkCH9zGyFYim
        Vrl+ohKBo76ehJ0AjZkiU/BKGcHCc30aLQoKE+wYAg==
X-Google-Smtp-Source: ADFU+vt6H8uOcqcMQqiiFH1YWc6HowiCgJtY0l7adzD4/QImv2h/f2MuaOlkFOTpEaKJhXjap6UI3MvyzTdwQb30kb4=
X-Received: by 2002:ae9:e202:: with SMTP id c2mr2303288qkc.224.1583925249203;
 Wed, 11 Mar 2020 04:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200227144910.GA25011@alpha.franken.de> <20200311110754.GA10734@alpha.franken.de>
In-Reply-To: <20200311110754.GA10734@alpha.franken.de>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Wed, 11 Mar 2020 19:13:57 +0800
Message-ID: <CAKcpw6Uew4e4Qus2Ox0+0RubwbfQQp+37CVKftK8EKYyrwWKsQ@mail.gmail.com>
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thomas Bogendoerfer <tsbogend@alpha.franken.de> =E4=BA=8E2020=E5=B9=B43=E6=
=9C=8811=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:08=E5=86=99=E9=81=
=93=EF=BC=9A
>
> On Thu, Feb 27, 2020 at 03:49:10PM +0100, Thomas Bogendoerfer wrote:
> > [..]
>
> Thank you everybody for giving me information about your hardware.
>
> So we have following system types without users:
>
> LASAT Networks platforms (LASAT)
> IMG Pistachio SoC based boards (MACH_PISTACHIO)
> NEC EMMA2RH Mark-eins board (NEC_MARKEINS)
> NEC VR4100 series based machines (MACH_VR41XX)
> NXP STB220 board (NXP_STB220)
> NXP 225 board (NXP_STB225)
> PMC-Sierra MSP chipsets (PMC_MSP)
> Toshiba TX39 series based machines (MACH_TX39XX)
> Toshiba TX49 series based machines (MACH_TX49XX)
> Mikrotik RB532 boards (MIKROTIK_RB532)
> Cavium Networks Octeon SoC based boards (CAVIUM_OCTEON_SOC)

We are using it for our Debian build farm, and they are quite important.

> Netlogic XLR/XLS based systems (NLM_XLR_BOARD)
> Netlogic XLP based systems (NLM_XLP_BOARD)
>
> As you might have guessed already I'm thinking about dropping dead platfo=
rms.
>
> Looking at git history these are my candicates for dropping in 5.8:
>
> LASAT Networks platforms (LASAT)
> NEC EMMA2RH Mark-eins board (NEC_MARKEINS)
> PMC-Sierra MSP chipsets (PMC_MSP)
>
> If there are still users of that platforms, please speak up !!!
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]



--=20
YunQiang Su
