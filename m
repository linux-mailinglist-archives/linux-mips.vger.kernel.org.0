Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A45118DA14
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2020 22:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgCTVYa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Mar 2020 17:24:30 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:52820 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbgCTVYa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Mar 2020 17:24:30 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992645AbgCTVYZhCTr9 (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Fri, 20 Mar 2020 22:24:25 +0100
Date:   Fri, 20 Mar 2020 21:24:25 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     Manuel Lauss <manuel.lauss@gmail.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Linux-MIPS <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: Loongson: Add model name to /proc/cpuinfo
In-Reply-To: <788597FA-6AD6-4218-886F-35C0916EA3F2@flygoat.com>
Message-ID: <alpine.LFD.2.21.2003202109190.2689954@eddie.linux-mips.org>
References: <1583908414-22858-1-git-send-email-yangtiezhu@loongson.cn> <CAOLZvyHEnnpWWhEAWx9RZASVjjQ=6HTREqwY+LK0hm=J4Wd8Xg@mail.gmail.com> <788597FA-6AD6-4218-886F-35C0916EA3F2@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 11 Mar 2020, Jiaxun Yang wrote:

> __cpu_name[] will be displayed as "cpu model" in cpuinfo, however
> in x86 world, the name line is started with "model name".
> Most user applications like lscpu, hwinfo is following x86's rule, we don't have superpower to move all of them.
> 
> Also rename "cpu model" will break current ABI, so just create a new array
> for it would be a better option.

 Well, /proc/cpuinfo is not an ABI, it's meant for human interaction (use 
`sysfs' for machine processing).

 If tools want to use it anyway, then fine, but they need to adapt to the 
relative volatility of the free-form text interface, and also learn all 
the world is not x86 (just like all the MIPS world is not Loongson, so if 
you argue about adding effectively a duplicate field, then that would have 
to be applied across all the platforms).  IOW fix the tool and do not work 
its deficiencies around in the kernel just because it seems easier for you 
to do.

 Here's how example /proc/cpuinfo looks like on RISC-V/Linux BTW:

processor	: 0
hart		: 1
isa		: rv64imafdc
mmu		: sv39
uarch		: sifive,rocket0

[...]

-- every Linux platform is different in this respect and tools have to 
live with that.

  Maciej
