Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7469A4A49DC
	for <lists+linux-mips@lfdr.de>; Mon, 31 Jan 2022 16:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349180AbiAaPIc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Jan 2022 10:08:32 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:53371 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242493AbiAaPIb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Jan 2022 10:08:31 -0500
Received: from mail-oi1-f171.google.com ([209.85.167.171]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mqrs9-1mRgsP1MDx-00muV1; Mon, 31 Jan 2022 16:08:28 +0100
Received: by mail-oi1-f171.google.com with SMTP id q186so27161597oih.8;
        Mon, 31 Jan 2022 07:08:27 -0800 (PST)
X-Gm-Message-State: AOAM531ArSmyPNT2zDbO0BAwADbNSvZCdsObrLuklzR2O6UTzDjz+Jx8
        4158Hkp6OE5AcFXeV6R2jmngk0bW+KYGAiuHd0I=
X-Google-Smtp-Source: ABdhPJxqzdad29yoPfVQVqkeuINyquIZpxlEvxSx06sdTnz4rryvUZKfSJUaDKGmBUmu6Be3uaLlJuvMhrTHZxz8Zkc=
X-Received: by 2002:aca:f03:: with SMTP id 3mr13235991oip.102.1643635190773;
 Mon, 31 Jan 2022 05:19:50 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org> <20220129121728.1079364-6-guoren@kernel.org>
 <YffUqErSVDgbGLTu@infradead.org> <CAK8P3a1jZyVBW70K6_u3mvXYNowV4DTBxivKc2L=HbRK8SgRXg@mail.gmail.com>
 <YffdbErmAjAWYuD9@infradead.org>
In-Reply-To: <YffdbErmAjAWYuD9@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 31 Jan 2022 14:19:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0VZt8PF1C4W0X4+SNhP=NbHAigq3N6fEawNpPd-RZDjw@mail.gmail.com>
Message-ID: <CAK8P3a0VZt8PF1C4W0X4+SNhP=NbHAigq3N6fEawNpPd-RZDjw@mail.gmail.com>
Subject: Re: [PATCH V4 05/17] riscv: Fixup difference with defconfig
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        gregkh <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Anup Patel <anup.patel@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:B7uYZm6BSOcndg7Pih7L4iMd0uyp8WiU4EGM8oDHCSAF54eyV5e
 BhZw7/Y27szH94pGBNcAgsLiq/7xUESPZA3wANRgNI6Ktu30MJCdBMuVjXNBt+6JbfoZydl
 DyPNTyOWMM1egsQya/XcIKeamdh1/73pNIb+QRU7bQSAaYZgr2IK4QqMK/beXiaXWE+nCkr
 BUv9kFoCV/ggq0p26b45A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:domFXOMNj8E=:WeQkqDz1VLzM9CLAjWfrAY
 anHFoiFnbhbyO76GFWArXb9hzfxNVWQYyV5AWh6Th4Hn4WePjkllV5vgZ+CLtGhiHuwy09pfZ
 qLfubreMP7ZjSHSgVUAotH3yryMyYpl1RnauHUg1i/1abQUhKi9jjOmrNpGc0P7RzWlYCGXy7
 AWeetWN9V1fSafwAuJZlT1oz2ucTUw6BaUuEV2+WKdmY+wqC+Ey3kk7CkrRK02uj4UpmTtWat
 3p+n/fa53QDOWAiks7USmFZ2bBMXMJsJr2Usrv+NEHzlb9Uo5ktmFLSpvUDEcfnxvnxRM4uAl
 9r1Pa/yQAPtq6mnTqWT2+YcoSjQY3oxQtJ53Wodvo5dJE2QQSRTOuLmWNpmtPviFhS9fMvM2J
 Hn289d5Jd62q8MG4b5UHeO0/ycY4KEAjG6FZSAcZ6T8oNsgDcVFSVd182QGSDCmTnH5entLG9
 x4PnQs0J9SbaN5mIkiVy4nDEHpHjW3cfnbSoLTOP/RrLaFmE4WLEfFeQlWI5EFZ+asfDuK0uR
 7WFvifMjs16riXlO1AxQlJDMol7CuBh30HozDaNqPQKnoZK5GWq2XIRlAk0O01JKPaxJ4fcw7
 9ogzd//dIPO7vd52mOaAquoJTfHsPx3pzJT7SOtiLp7IjrKYo2mn3N7QLFMrXzuAj4uV/ItEZ
 d658UkAUFJ0xcMGLI4O1UuCMKWaXEJeVBzlwfiD3rgAeqy8pQBQt1AIApwUkcV5J9XkNM8kjB
 w4pnQC8oRFFppXcUWzJP25DcUw+Z6Elu+B0B9LOhSN88KqextdT5ntV6ySeGHYpnlRvKu25Ny
 DJr4bA0R2UxOlZWBjulnD+RALTraB/SHNaVBLlU7h3HwgS/Hp4=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 31, 2022 at 2:00 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Jan 31, 2022 at 01:48:58PM +0100, Arnd Bergmann wrote:
> > I thought that is what the patch does, there is already the normal 64-bit
> > defconfig, and the new makefile target makes this shared with 32-bit
> > to prevent them from diverging again.
>
> I ment using a common fragment and the deriving both 32-bit and 64-bit
> configs from it. The 64-bit specific fragment will be empty for now,
> but we will sooner or later have an option that can only go into the
> 64-bit defconfig.

Ah right, that should work as well, not sure if it makes much of a difference.

I suggested this method because it is the same thing we do on powerpc.

        Arnd
