Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C609721859B
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jul 2020 13:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgGHLJw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 07:09:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:54234 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728700AbgGHLJw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 8 Jul 2020 07:09:52 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jt7xR-0008Fx-00; Wed, 08 Jul 2020 13:09:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A20CDC07CE; Wed,  8 Jul 2020 11:33:30 +0200 (CEST)
Date:   Wed, 8 Jul 2020 11:33:30 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/2] MIPS: Loongson: Rename CPU device-tree binding
Message-ID: <20200708093330.GA9458@alpha.franken.de>
References: <1592201057-28151-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592201057-28151-1-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 15, 2020 at 02:04:16PM +0800, Huacai Chen wrote:
> Loongson-3A R1/R2/R3 and Loongson-3B R1/R2 use the same package naming
> in dts, and Loongson-3A R4 will be different. In cpu.h the classic 64bit
> Loongson processors are called Loongson64C (C for classic, pre Loongson-
> 3A R4), and the new 64bit Loongson processors are called Loongson64G (G
> for generic, Loongson-3A R4+). To keep consistency and make extensible,
> we rename the classic "loongson3" prefix to "loongson64c", and the new
> prefix for Loongson-3A R4+ will be "loongson64g".
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  Documentation/devicetree/bindings/mips/loongson/devices.yaml      | 8 ++++----
>  arch/mips/boot/dts/loongson/Makefile                              | 2 +-
>  .../loongson/{loongson3-package.dtsi => loongson64c-package.dtsi} | 0
>  .../{loongson3_4core_rs780e.dts => loongson64c_4core_rs780e.dts}  | 2 +-
>  .../{loongson3_8core_rs780e.dts => loongson64c_8core_rs780e.dts}  | 2 +-
>  arch/mips/include/asm/mach-loongson64/builtin_dtbs.h              | 4 ++--
>  arch/mips/loongson64/env.c                                        | 4 ++--
>  7 files changed, 11 insertions(+), 11 deletions(-)
>  rename arch/mips/boot/dts/loongson/{loongson3-package.dtsi => loongson64c-package.dtsi} (100%)
>  rename arch/mips/boot/dts/loongson/{loongson3_4core_rs780e.dts => loongson64c_4core_rs780e.dts} (93%)
>  rename arch/mips/boot/dts/loongson/{loongson3_8core_rs780e.dts => loongson64c_8core_rs780e.dts} (93%)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
