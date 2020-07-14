Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A6121F27F
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 15:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbgGNN2u (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 09:28:50 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:58533 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgGNN2t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 09:28:49 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mn2eN-1kcL7X03RH-00k5oM; Tue, 14 Jul 2020 15:28:48 +0200
Received: by mail-qk1-f174.google.com with SMTP id j80so15536709qke.0;
        Tue, 14 Jul 2020 06:28:47 -0700 (PDT)
X-Gm-Message-State: AOAM531qKUh7ffI+aZwsrrvalHeMo6Kw2FghBcGwH/7htbL574Rjtx/H
        wgykE67Hijc2xPNjOM1j6wW9NlxQX2TjuvDZqMo=
X-Google-Smtp-Source: ABdhPJxHPIXfmlqcGBqu9OXRIk6erH/D8djWlmD0b3P/vROxLbkhNRC4oaHHQrBV5XAH3EWaILtop2qaNksWBICgIYg=
X-Received: by 2002:a37:a496:: with SMTP id n144mr4552372qke.286.1594733326751;
 Tue, 14 Jul 2020 06:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru> <20200714125753.22466-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200714125753.22466-6-Sergey.Semin@baikalelectronics.ru>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 14 Jul 2020 15:28:30 +0200
X-Gmail-Original-Message-ID: <CAK8P3a09RW+zCMJ9Luh2C3NkYPdY4Esu6EKk_QX_i4faV-rUjg@mail.gmail.com>
Message-ID: <CAK8P3a09RW+zCMJ9Luh2C3NkYPdY4Esu6EKk_QX_i4faV-rUjg@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] bus: cdmm: Add MIPS R5 arch support
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, James Hogan <jhogan@kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vSOlFJOMQtdcJW89Ot+xnzfTZOdqBnZJxvDGkZWxoieSiauq1Op
 TvKnJgap7NWslsMnVLDKFa79aabknwkWqafsgAlp1tDn/DGziuHYcYcjgwiUKhvV7T9rcWo
 fM2xHMb7zUXmGw9vfG8OHy1S2//lUWhDxvtsurupdW+FDKk3LUoP2SYn7cHzjUHxfNRWa6P
 LTLKkz8F1HIYaOzr2k3vw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jfoq56SE9Eg=:FVzCfhKgZlrrfI14j/B23F
 VlKbX2/PArHmzzmT95EvRA5ecpEwrE7S9JHf66okVxVIbTdy3OmGoWb/MpMfAHHVcQYUWY9sO
 6Ltwc3+3zOg4uTfy2yJHN9KqSufBohHgnySm5bKCGybyybpUuBSA7UJt0MbqtQA15veNGYLAn
 OEMZ2CETRQ14pCcRCqnz/9p4vLP00LsYgp+Qh7PrtAJDsoqcwkj1uUmYtvNgv2JQOct29nPM7
 mH2i6lyYHKEuRnh5IrbFUn8rvQf9frSoCqyZfWmc7RBPqPghps0/WJUi5Z6Ds4tZs+Se+Ttfi
 ef/ScXnCmi6HOgHtVu9fKuH5s+VEjzvhkeXqimwuipX3t9l7QGwleGEBkypHhSGlt5k1h1c/0
 lJl4+96LY2LvbwY1HNUe9o0UBf1BQp73pj5tddwMr8VGWt9fhes2q22zCptGuCtrnhlrdotN5
 YSxWSUMqRRfzD9r08/DEXssmqQLZ3380LESWWaM+HBLXJO5tGZsDj7K5fkcADkz3ACn2gvIWQ
 8Fq8O2y4dqE5LxxpVmBN/Ndf4K0Ruo52Is+jaH+9an9ORv8g5yCeaBwQ1zwvZ4aYEFn6qJnL7
 hEoJnoK11mf6mwTIWMIFKFv2rqSYuv2vbsmdIhU2Tk3/tzHEQ86ZCG/shO5wqqhYr9oxVOkoE
 9TGvSp1IU+1a3ih+YIKnIy99sxsxox/JS4Hx5AXj4tNltY5/B3DZ37ZNz/5/6rOwpFCnfV6V9
 vluyZTgkTE5XamkC0fh8thJEIaeeekMho2IbV4owJUSbFfS2aMqOBKtdAwk8WftIJSWPQNCta
 KAVjMitGUB6/OTMXees0ctH2rUsib8XNrQ4jaf8EWUEUZylNNQMMBFDG9fFITZPZVPwnJlr4+
 afBEunCKaJ3PyJYaLMAXyyWyOvzfH/hBMkzhHLKOrEJG6uWYG6lT7rbtoSecJwXAB6WT63b1n
 DZb/gxcqyErWgzFLjgcHEnv7AN5AEQsQ2fxd73VaFCGCZEUcNy15g
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 14, 2020 at 2:58 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
>  config MIPS_CDMM
>         bool "MIPS Common Device Memory Map (CDMM) Driver"
> -       depends on CPU_MIPSR2
> +       depends on CPU_MIPSR2 || CPU_MIPSR5
>         help

Wouldn't a kernel built for P5600 have CPU_MIPSR2 set already?
I thought R5 was just a backwards-compatible extension of R2.

If not, what about R3?

      Arnd
