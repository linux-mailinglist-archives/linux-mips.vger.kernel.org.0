Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F268E3A3D65
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 09:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbhFKHn6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Jun 2021 03:43:58 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:35629 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbhFKHn6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 03:43:58 -0400
Received: by mail-vk1-f173.google.com with SMTP id l7so2325422vkk.2
        for <linux-mips@vger.kernel.org>; Fri, 11 Jun 2021 00:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BBdAwSczaNf+rHArQaHJIC7Mgb+GZNj+B0A18W96i2I=;
        b=DDuRUkgGQ2gwm4MrE0GMH0YF2qaeIgqXCeXFS+9TFihSQOe6GGs8L2y7GNz4se7hbS
         ZzVkLsktgUG+PQ58w0GtxC71EPdJvGoY/UL3Zbmy9YJjpJgmYFg3mxnA/QztGkSqDCYR
         YHIIXFPWP06gtKoCz9kdKQkRh1mA551lwU+IZFz7gWdypUxsdwIrTqSJqnyeM+WFcAcV
         KZVVyf6CU4f6Y3O7iFYCbXe8ASiSeE6k0Fie2qc18UVZ07ybB3G2R0J/48F8iUwySD/7
         fqS+s5NrH2gLXdjfryaS8pCFdZSWOEg8+rk2z/bbewPt/p1x/J9JjVYuOkYWlXcWhXLp
         wcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BBdAwSczaNf+rHArQaHJIC7Mgb+GZNj+B0A18W96i2I=;
        b=uBzClNX0IexJhEiEBIwOJqYKL1ifhPXhvKjv5zUoMfJ3/v5Dz0GPPe9xqsSz2WiVru
         VsHoNgOLD7ubgbNLGHb3xLGh/LrUnIU7xYUSdsJpbvp5KIGD4VYAwUTSLHKUhqg9hER1
         CX5MD06t2sLZwrNhRcQh4XvMjyOy6588mpwG21Qz92znlDyBv8T+gz/qbJ1GcWAo/b6E
         9OAkrm+BM7jnqtazV6rDGrw3ODfcxRoOk6qktotUSZiXWzIGNa1vCdWEhZ8SKJ5YAb2f
         RK4MS0jb1lvn/YzlkCcp/05+2HkqxQ5dTdfn7zZopc3JLVRDWDbAMeXL6u2Lbu7gStKP
         936Q==
X-Gm-Message-State: AOAM53058I4Er/YQLFOp08h/PomOT82H6Y23vy68zA/XAQQNPReXu604
        b/TDO7ga+wmP5bBN0ElRIBx78ZOiYQXg1d67J/an5Q==
X-Google-Smtp-Source: ABdhPJxmj6fYMIapIuKq25TWJPMsAbZwQIFmsiOZFWnQReFEn4Z81dnBenUXepsXJ8aQSZIqkG2yB3XvcuNtapnOMmY=
X-Received: by 2002:a1f:9542:: with SMTP id x63mr7317524vkd.15.1623397247116;
 Fri, 11 Jun 2021 00:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <1623329930-14387-1-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1623329930-14387-1-git-send-email-zhouyanjie@wanyeetech.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 11 Jun 2021 09:40:10 +0200
Message-ID: <CAPDyKFqyB=rL-aLX3YLAoE7qEsR4sDP7zqmS2io2-aoCVsQyzQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for JZ4775
To:     =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 10 Jun 2021 at 14:59, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie)
<zhouyanjie@wanyeetech.com> wrote:
>
> v1->v2:
> 1.Add support for probing mmc driver on the JZ4775 SoC from Ingenic.
> 2.The drive clock selection and sample clock selection have been
>   supported since JZ4775, not X1000. So support for these two
>   functions has been added for JZ4775 and JZ4780.
>
> =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (2):
>   dt-bindings: mmc: JZ4740: Add bindings for JZ4775.
>   mmc: JZ4740: Add support for JZ4775.
>
>  Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml | 1 +
>  drivers/mmc/host/jz4740_mmc.c                          | 5 +++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe
