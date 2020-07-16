Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43BA9222030
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 12:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbgGPKCP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 06:02:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:38176 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726996AbgGPKB5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 06:01:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw0iB-0008Mc-05; Thu, 16 Jul 2020 12:01:55 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 32DADC080E; Thu, 16 Jul 2020 12:01:08 +0200 (CEST)
Date:   Thu, 16 Jul 2020 12:01:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 2/4] MIPS: Loongson64: DeviceTree for LS7A PCH
Message-ID: <20200716100108.GI8455@alpha.franken.de>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
 <1594294424-26218-2-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594294424-26218-2-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 09, 2020 at 07:33:42PM +0800, Huacai Chen wrote:
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Add DeviceTree files for Classic Loongson64 Quad Core + LS7A boards and
> Generic Loongson64 Quad Core + LS7A boards.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/boot/dts/loongson/Makefile               |   5 +-
>  .../boot/dts/loongson/loongson64c_4core_ls7a.dts   |  37 ++
>  .../boot/dts/loongson/loongson64g-package.dtsi     |  61 ++++
>  .../boot/dts/loongson/loongson64g_4core_ls7a.dts   |  37 ++
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi          | 371 +++++++++++++++++++++
>  .../include/asm/mach-loongson64/builtin_dtbs.h     |   2 +
>  6 files changed, 512 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts
>  create mode 100644 arch/mips/boot/dts/loongson/loongson64g-package.dtsi
>  create mode 100644 arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
>  create mode 100644 arch/mips/boot/dts/loongson/ls7a-pch.dtsi

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
