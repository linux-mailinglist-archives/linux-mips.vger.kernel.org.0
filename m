Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B97187218A
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2019 23:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389269AbfGWVam (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jul 2019 17:30:42 -0400
Received: from mout.gmx.net ([212.227.17.21]:39241 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731616AbfGWVam (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 23 Jul 2019 17:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563917421;
        bh=ToULRC4irrsdH84boQnpkm5KiZJ47FZlgR9fRYxOddQ=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Mw172/vXJLuMiXnhcNcxkFLc+1aKNWEZ8PiRunLmcf3dhaVRLy3tt6tEfy4Hy2XqC
         PyJ35c47qRSvmmSrJacGYW026ubBeNnkC3r0iI352l8MRe5TksbAyXXfEfq2ZaSc1L
         AXwOe3IbD6QKY7TOSbx6Apv6B+fCU/iCs06Tt8DM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [172.17.9.180] ([87.191.208.243]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LtVLE-1iWxrd16mq-010plk; Tue, 23
 Jul 2019 23:30:21 +0200
Subject: Re: Build regressions/improvements in v5.3-rc1
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     linux-um@lists.infradead.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-mips@vger.kernel.org,
        Parisc List <linux-parisc@vger.kernel.org>
References: <20190723080441.19110-1-geert@linux-m68k.org>
 <CAMuHMdVuVqXnW8SEnpcbvh8agYvPh775rv9tmV9kGUa6Q2wcwA@mail.gmail.com>
From:   Helge Deller <deller@gmx.de>
Message-ID: <738c1891-6ef3-8cd1-d25e-b9a36255e3e7@gmx.de>
Date:   Tue, 23 Jul 2019 23:30:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVuVqXnW8SEnpcbvh8agYvPh775rv9tmV9kGUa6Q2wcwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:T+b1tb8faTODi5y7+U6ZeYg349SPA/Fh6VMkO4Lv68DcHiqWs38
 yMSq6plB/gXOGf08wjD9XUjitvj8jKdC/8/JaMSNHP9vDAOO7Co7tl7rnvZFkj9FzwyC3he
 Osdq0XH55YVvzrSSpZfz5GyKiXcltMbOZz4gbER+z1VPvO52/fBz44TmPn60QnwkG/uiNZp
 Qd7uZwcF8lw5s0lW1uARg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SryDnYPWR3k=:YfaURXV31fWbWOLAGMHGGV
 Dmnik+n3qAhqkld+yRDUq/ad82uys9dQKsblccpGM1v+nWFWNXHRGjJnWpTHthVgl5MjKareW
 S8+A4ILBwxCub+9qb285MgdDuTPxS7dGZzzs1i1PXNIU4ej6gydgwM3z7ULTsFyJRl8wF1WoB
 Ciz5DIEkIBiRgLcXVj6nyJH3dJGRtqSPguFrXaPSrV/pmj04wTImaGupFmt+NfX1jhjZjXIcr
 DMhTnVxONS3fiOhWtR/1DjnBOcBw26ctyW1tDbpN2jcDeuXM9VjIYVRCYv75waepvsgzx6z+6
 Y+w+9q+vzUpjB64NgLoPSebj8q0PWxcv5LCm5+4zx+WmEhLPdPZBeZ3593O31bsHpcyWwRKlm
 zM8DeFk6vuhWjzB7chszUwcyxFIzn/PowsWGt7KTEenxppLvGxPwYXGj4xyFsBQoN3YhLxyIn
 3VE0LcZj3lyD8jeXPQ1tQI2xy+8m1GNDoLpvwW310SEdE2L7UmtfHZ1C9mspC4HKXI4f5MuLX
 wLPTjfr/7eWbl51HcUY2Tozd1IZXhusmqwm+BOXN2AancGej6DJ9BFL+DQfuOaZBlhgugp4An
 UPf8cUynTng/Rs2/LqzKmQmFYtRBSwc37YTxiJO3cIayyLWJDbGidsCRXBjke2Yn2rQpG1vht
 huUmUsiUoIhg6pB0qZEQ6xIf/PdZc0yPvuesx1caABIUUpM3BECtj42ujta5WGmAhrZbK45az
 s0J9qGk2Pf2ZLZyzOGkrgEKjuYspigu8gz2zY93ySXrp/r3sKgUEhrYtc9ZmYkmwz1K2Z8I0m
 e+IcH6RAD5eBsI/TPmjBiBJnnIEpQ/D9j7EjFzCPIFvRKsU6q1kMfeD+1KecjIzSJo4APWbVM
 y2pUQKKW0TSl0QYD02OZ+XNA8gvg+sq9vXPt5e5ZEnthuujlO0Eeaj2TRtYqKx5yaWUkyjkuP
 G26mwOYKDQHdZnvffvqtvcy+HW7DI5GEwBhXj0VE5yPPHcWfD9FUXXe3KfDV/StdlSwan7SVK
 1ZVRDKGDPYLYW7zOY4L6y0bPCt3UEF7Naw7mqyC7SZzElpiiuBTVJ0jUZNIrfQr6ybEOJqPYZ
 RapDmKg7odABSY=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 23.07.19 17:39, Geert Uytterhoeven wrote:
> On Tue, Jul 23, 2019 at 5:22 PM Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>> Below is the list of build error/warning regressions/improvements in
>> v5.3-rc1[1] compared to v5.2[2].
>
>> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/5f9e832c13707=
5045d15cd6899ab0505cfb2ca4b/ (241 out of 242 configs)
>> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/0ecfebd2b5240=
4ae0c54a878c872bb93363ada36/ (all 242 configs)
>>
>>
>> *** ERRORS ***
>> ...
>>    + /kisskb/src/include/linux/kprobes.h: error: implicit declaration o=
f function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'? [-Wer=
ror=3Dimplicit-function-declaration]:  =3D> 477:9
>
> parisc-allmodconfig

I've a patch queued up for the next pull request (in the parisc git tree) =
to fix this:

https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/co=
mmit/?h=3Dfor-next&id=3Df5e03d3a04978d2866f82cb11cc7a6b808c8ce07

Helge
