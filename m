Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2839D494D08
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jan 2022 12:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbiATLba (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jan 2022 06:31:30 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:41607 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbiATLba (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jan 2022 06:31:30 -0500
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MEmAV-1n4EPL2s5z-00GIik; Thu, 20 Jan 2022 12:31:28 +0100
Received: by mail-wm1-f54.google.com with SMTP id v123so11435280wme.2;
        Thu, 20 Jan 2022 03:31:28 -0800 (PST)
X-Gm-Message-State: AOAM532Q+V/htI0HjZQUIoqM/QY9mz678j9dSvszABA/eXb0dAZXH03t
        ME52xWkDv7w5k/6J3K84vlK6hBgG1n+g56MyMhI=
X-Google-Smtp-Source: ABdhPJxEAFXYVk6DktXv3061JPbB7MqrKutmOAXqbVu5eyk6Pz36dhnH8dbuNkOxd7GlFiEfJn/5TzSKv0rhSZwiTMY=
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr8113766wmj.82.1642671479094;
 Thu, 20 Jan 2022 01:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-14-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-14-guoren@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 20 Jan 2022 10:37:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
Message-ID: <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
Subject: Re: [PATCH V3 13/17] riscv: compat: signal: Add rt_frame implementation
To:     Guo Ren <guoren@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
        Anup Patel <anup@brainfault.org>,
        gregkh <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        inux-parisc@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MBzIprHDOa3SzB0+T5ChBSzej2u80ojeEpq+xqkuQ/Prskszuvt
 WumxaLuEb2Iw69vjaRrK0/eWb637CDSakwighP8kzBauYNjUK9QeQYk4GNE4AmdqGoApl94
 t7zfqtrO8ovpxYARSK6Mj6mDIp/UVF2jgh/wIA45A7ZVNMOV3Za+W64D6iq0lANeblVzewO
 rYS9CfUWvLDx+GNZMBxCQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4ERhXve4t1s=:IxauRkgBG6ugw1kR1AGhn+
 yxsT1aRhPpbjmDMj153stbnHDb33GhpiQR4zkDstTGiSKu1bA+QJrPodiMjUAwCi73ibDitTO
 z7HDuqFdh+m6meGe/h3SUGuzUWJi5eJxWYoUEJEcIx8Do54vM5gppPAvru8GV4pyiJK5AfPZa
 Rkvi4D3vgTgq1jKOv6gb/POxnbIHGati+qg/ilIwCrWWv0TbNV6PJxd61NABcRhfZAFQzaWJZ
 3GJm6TpUT6XQQW+HwiMEB14Q28dmtuKtEt28Fd7yD7jaEkzIeKSlXv6Vg0RK/olNeW2E2DKLP
 J7PemXNSl7tuMp5ryDj4fTU58wkGrQ3zhRJGgsn2pqLTjUKEonb+/IWr7NYGUcotc3pRsAJJD
 r/OhBnIE1SYQoAoLj3Q/3ovX5j8iLMhNP7XTsndoWBXjD9s3oXPAwwZjSDhFAP6KAnazBydQ9
 CSuHBWJ3TWBkjgo/lIprMiAMUzENCfFXKuBFkngvR5Q0i6x96gXTvIyFCqSUnOJbLeVPlt8fz
 LGUowoX+h52XYTJEc/J3Tnf/ighrjnXkwfvFlZuWLt4TLW9oIFa10hGwErAck0S5/ipLJ2UCe
 2j9ehotKy/DlMGj4nUudWbl1bl+5GS6UHHMV8ctN/hVLBCyiljUZC9pYh5joEU9dBYLbOkSpZ
 MPtUtU4RA3G9JZsNQvyjmu2sh1x0v1OqDQyrn/Mn7KVDFJNneXz8ZeI3OLMSQYAN9vdjw4Uny
 V8dAbGtfPrtFr/Fqdenty1vpfkIs2t+cUGfumkdT+kQZsZYWWQWzvCyhuSxQTmgJx9f9p1aW2
 A401KvBkCk2SBYZpgBZv9ZuUdndRvyEvlkXInIOobnDyvaHRcU=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement compat_setup_rt_frame for sigcontext save & restore. The
> main process is the same with signal, but the rv32 pt_regs' size
> is different from rv64's, so we needs convert them.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

I hope someone else can properly review this part, it's not my area
but it looks complex enough that it could bring subtle bugs.

       Arnd
