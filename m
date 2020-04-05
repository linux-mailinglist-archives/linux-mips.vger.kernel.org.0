Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C210D19ECD1
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 19:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgDERQz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Apr 2020 13:16:55 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:47792 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgDERQy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Apr 2020 13:16:54 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991372AbgDERQvZEzH1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org> + 2 others);
        Sun, 5 Apr 2020 19:16:51 +0200
Date:   Sun, 5 Apr 2020 18:16:51 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and
 prom_free_prom_memory
In-Reply-To: <20200405163052.18942-1-masahiroy@kernel.org>
Message-ID: <alpine.LFD.2.21.2004051813150.4156324@eddie.linux-mips.org>
References: <20200405163052.18942-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 6 Apr 2020, Masahiro Yamada wrote:

> As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> CONFIG_SGI_IP32 is enabled.
> 
> The use of EXPORT_SYMBOL in static libraries potentially causes a
> problem for the llvm linker [1]. So, I want to forcibly link lib-y
> objects to vmlinux when CONFIG_MODULES=y.

 It looks to me like a bug in the linker in the handling of the EXTERN 
command.  Why not fix the linker instead?

  Maciej
