Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A9F35799B
	for <lists+linux-mips@lfdr.de>; Thu,  8 Apr 2021 03:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhDHBmf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Apr 2021 21:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhDHBmd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Apr 2021 21:42:33 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DADC061760;
        Wed,  7 Apr 2021 18:42:22 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id b10so520215iot.4;
        Wed, 07 Apr 2021 18:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hEbxsKyvPB4WaA/JF5KCSLaPOKy2OJ90cI9ruVXu8Ag=;
        b=cIIgCrczi7soAJWb7wbr3THEdxooLse5FbW+b6uXaKE45XezUIn6mdGylL4JcvNkl8
         vuW3BcFj7xBPoD5+6z4XM01QA/TL2FbwoHwVm02bVOi7iwmZ7Q9iqMItsbQ+mLCAk+8K
         VQ3LITksqznvYlIe8shstRcxpXjpELEmkswliB393xdZ4X5Latdo3VAyxZHjYRFEjJSu
         9UumhHXi4oqIFaCS/I5VZsgMsoE2X5wQCIjZhCuP/UNchCozihCjPuM4ijf9+/jEFpUP
         oGMjmMRaN8TYiw/6kzkGsCG3o46WC8lqjRNEtp/bxzjYeotlvk2rGp8YfiSnSYXwYniy
         5Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hEbxsKyvPB4WaA/JF5KCSLaPOKy2OJ90cI9ruVXu8Ag=;
        b=M538yNXfImouJuIHt2ovK7LiONHLL0dp0+3lUcLTrSRdrt0bBBBK84ScrryPtBw83h
         RNRvusEIrb77xjoLRTDtDoZNV0Kl03gS80OJ3fP50d6yaPRMxbE6eQkem+GVX7PfCXqy
         fsSz2T5ADwhS8InyExLyADYz3Eyn1k5+OpPuDebA6cqDJH33rZj24OJTXE3jHtazQ5Um
         bXvBqrp2evgqrT0+r3PHEOVEYw9dJ463vE4500W0VbCwLESPDQJ1WTx5wR1ZD0jvwFV4
         Apoh60KvlmC445uxPQmrN4DhYXp6pBVWKVkyVapzWZMIq6UI23Fv+9S4ocs5DF2fm6ah
         ED/A==
X-Gm-Message-State: AOAM533Yz/6G94E1AVvxSmSfGDUAszvrmbqSPzk9o1VXPTCDMBgh+ewz
        X07Dbh/7+Bauxv7lktDMKzNnrUYVebyW8a8VyE4=
X-Google-Smtp-Source: ABdhPJw7HF8Ti6ob9YFbXMsdu8QKI7BSSxqfMIT+QvaTXb8L+1Caw71Ptr9NFfRUGYqLINnb6NQipXmXgkPnPtYl5zs=
X-Received: by 2002:a5d:9e09:: with SMTP id h9mr5013527ioh.178.1617846142381;
 Wed, 07 Apr 2021 18:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <YG35ULOblq/gUZmh@debian>
In-Reply-To: <YG35ULOblq/gUZmh@debian>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Thu, 8 Apr 2021 09:42:11 +0800
Message-ID: <CAKcpw6VrbA2+mq42=0FjE7Y9e6OM-Q9WxvYPWtAF4t0hRWKB1A@mail.gmail.com>
Subject: Re: build failure of malta_qemu_32r6_defconfig
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sudip Mukherjee <sudipm.mukherjee@gmail.com> =E4=BA=8E2021=E5=B9=B44=E6=9C=
=888=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:26=E5=86=99=E9=81=93=EF=
=BC=9A
>
> Hi Thomas,
>
> I was building v5.10.28 with malta_qemu_32r6_defconfig and noticed that
> it fails to build, so tried next-20210407 to see if it has been fixed.
> But linux-next also has the issue with gcc-10.
>
> The error is:
>
> ./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_clock_ge=
ttime':
> ./arch/mips/include/asm/vdso/gettimeofday.h:103:2: error: the register 'l=
o' cannot be clobbered in 'asm' for the current target
>   103 |  asm volatile(
>       |  ^~~

this operation try to save lo and hi register, while they are not
exisiting on r6.
We are working on figure out a patch for it.

> ./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_gettimeo=
fday':
> ./arch/mips/include/asm/vdso/gettimeofday.h:33:2: error: the register 'lo=
' cannot be clobbered in 'asm' for the current target
>    33 |  asm volatile(
>       |  ^~~
> ./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_clock_ge=
tres':
> ./arch/mips/include/asm/vdso/gettimeofday.h:123:2: error: the register 'l=
o' cannot be clobbered in 'asm' for the current target
>   123 |  asm volatile(
>       |  ^~~
> ./arch/mips/include/asm/vdso/gettimeofday.h: In function '__vdso_clock_ge=
ttime64':
> ./arch/mips/include/asm/vdso/gettimeofday.h:57:2: error: the register 'lo=
' cannot be clobbered in 'asm' for the current target
>    57 |  asm volatile(
>       |  ^~~
>
> Any idea how to fix this? Please ignore if it has been reported before.
>
>
> --
> Regards
> Sudip



--=20
YunQiang Su
