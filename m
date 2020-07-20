Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C127225E67
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 14:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbgGTMVH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 20 Jul 2020 08:21:07 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:32999 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728460AbgGTMVG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 08:21:06 -0400
Received: from mail-qk1-f182.google.com ([209.85.222.182]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M7JrG-1juCT63Gf6-007j4f; Mon, 20 Jul 2020 14:21:04 +0200
Received: by mail-qk1-f182.google.com with SMTP id z15so8193088qki.10;
        Mon, 20 Jul 2020 05:21:04 -0700 (PDT)
X-Gm-Message-State: AOAM533ithWRD6Gv/yS3ySVZQWpH2Ee5Al0wJnqfzEI4CJ1n+FiGWbc2
        A7To4/S700mp6SLZ0Nhe0ACYXyBN8pi2Q3iiU+A=
X-Google-Smtp-Source: ABdhPJxnDaps2mzwyIsQu5vg0Fu3YsCdpchsfKZVpyRu8MsSM9Gcl79g+mqxBm6tfbp35cPwGB+thoVnqL5sOIIyG+c=
X-Received: by 2002:a37:b484:: with SMTP id d126mr21267846qkf.394.1595247663277;
 Mon, 20 Jul 2020 05:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
 <20200720074249.596364-4-jiaxun.yang@flygoat.com> <CAK8P3a13vZJyOGZ1FpS98ytVC57P6NgmQpSfhf2h9b7meQLtcw@mail.gmail.com>
 <d927b5b6-e33e-4a94-c997-b1794dbde411@flygoat.com>
In-Reply-To: <d927b5b6-e33e-4a94-c997-b1794dbde411@flygoat.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 20 Jul 2020 14:20:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2=qrp6x4yLUXhQU2MwcMa4HpEzAdVs_zW8f14GZ-_zqQ@mail.gmail.com>
Message-ID: <CAK8P3a2=qrp6x4yLUXhQU2MwcMa4HpEzAdVs_zW8f14GZ-_zqQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Provags-ID: V03:K1:cD2rRfBF59CX61+zemVyUHT3Z9YhsV3/Z+NHlrBTDAPsD74CR0L
 nyOgRYZuZYWmOQ2dgYtQBxgKLiR8eRiobdfquNJBUmWhlELJvehIDi1zkyxyrSWStMdLGnE
 OgRNitBOvmix2W8l+2rfol9HM+hEQ56iSqiLcrpSXrvCKcscoKnYp791ja9DCybxgedZtJj
 zct3LJCXapc7Sq1jzSQVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i+f8y2Tjuhc=:mVrdaKEhHPMW8V6+dV4jQW
 ROk0WSCY8QIJdWAhzb6FXwEw7ggXgk1TmicrFRJx/FbseVg95qETX7IeNgLWpmFsBU9oXB2KQ
 csYOxouwX/KSa5ivE5iyS6CwBATpJS9lV/I/aS0DkBrvJHc7gOziL56qd26INwBZx9j7FSdtN
 paje5DUiViHp+Y7GrMNVq8EbT7+mQI19nOoMtMxVRFMbtgUBqPGHkey2/3hnFlCwQ7tKoQZq7
 JHwjcPX9kkHabQbbj9a3hPRfTZBERjAt+5P5yNrkwz0SulYAbtw7GuvM0jxlW7sReuYOpL1rw
 R1J2+5jJfdHcU7vsltqFIQT9I0j2Etkm6PyA+2b3CxXU0X4ZJY2iqdY6kX2thMvfh/qSPubwf
 4EbBVR/LBuDN6bNEK7bMK6Pz4/cZTKeYHUQWto4uRE2wF8/TU9jnGR2a7wSVfRdGCnqMcvo0M
 5uZ/7hpe99LyFrq0dvdeW10hgz13M/yKZ9z3gV4zA6o3TWMwwk/UnQvQ6CqZCS/23oytKm5/z
 PMINa6JaSTx2DRLr5ELMtRvvk82D6oe4A69D1aENJejMgMK+nkNEBUMnagtPjLJJ9vgQRvrK6
 S2pc7HpF03GBBl6QfHJJ8Vcni+Q0RHQVrAqvkS+C1Jl3az715Edj5QqtswBH7f3u81zNODgWU
 hMriL68NeNzDwdu1LhEcF+I0ShqCJBshf6VPziZUKYcpEjtQ3gp0uJ+2bCbwHDzffbzYTwmNn
 DMuF0ZNtpMncFCq8zJg23yjCmmKn4Tpu09yQYTn2pO4xHWxPSQGPQPCFij+xpBeKCYEWCtRe7
 444JyFoq3lqVFA0wVJBPXHJMBoHvtQqG5z7M5/34zXqnFcJ5gzBUuxVZlPekUPeBqyn7u0Piq
 t6PQqlLRePlGHr7BTjTwjYrP2EG5tlvb9S5CHPxfcieit9A5UJ/F26YEmP3A9sY02hbL5w0Xf
 GoD1xswEp58IHmLgdsMsJPzKOCu3u+nyn5+ajvCZGjpZzjaiMgU7y
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 20, 2020 at 2:07 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> 在 2020/7/20 下午6:45, Arnd Bergmann 写道:
> > On Mon, Jul 20, 2020 at 9:44 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >> It can be very big on LS7A PCH systems.
> > In practice, one should rarely need more than a few kb worth of
> > port numbers, unless you expect to see hundreds of legacy PCI
> > devices.
> I must blame stupid hardware design here. The LPC Controller (for ISA
> device) can eat
> up to 0x20000 IO BAR, and we can't resize it. Thus we have to enlarge
> the I/O Space.

Ok, I see.

       Arnd
