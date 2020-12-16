Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261D22DC234
	for <lists+linux-mips@lfdr.de>; Wed, 16 Dec 2020 15:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgLPObO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Dec 2020 09:31:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:56008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726398AbgLPObO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 16 Dec 2020 09:31:14 -0500
Date:   Wed, 16 Dec 2020 11:30:47 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608129034;
        bh=Gm2OmL7sloFp1/bWPP0VoHXKQ0hOgQx7X5GHfkx5RNI=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=HKhqYHkkk9WUO+fFdwda3W58t5Hn9VmzMizNQpLl0K/tkIxaOzAzteEPzslvfnX7/
         ZegbNRtnnk/Qpb1697ZlI41FtvNrCXadYupXMj+x0doMjGSrDA3ysag4jdXGj73Moc
         qUv6WkBYDAdmC/q/DMRN+jpyb8vhZFCmXQkZBIlGufCjukSc7lazLm7Chy2ZMuV61C
         Km+TW8Z1G75XWSOW5A6/RTamjsbx7HPovlRf0qs63tpJDFdAxwwdbDCorMSpnwGxdj
         jHNTV5+pW80FEpGftrRQ0IEZvhyPWNEeLZHIJ0GSWbBVW1JIwPaeYrIDCh+bYrfiiM
         +OJZ1r4YfN3HA==
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Ralf Baechle <ralf@linux-mips.org>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Archer Yan <ayan@wavecomp.com>,
        David Daney <david.daney@cavium.com>
Subject: Re: [QUESTION] support perf record --call-graph dwarf for mips
Message-ID: <20201216143047.GC294100@kernel.org>
References: <97fb66bf-51f8-a491-9eb4-10b2314cf82f@loongson.cn>
 <90c7db1a-8e1a-e253-79ca-f93dbac014c2@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90c7db1a-8e1a-e253-79ca-f93dbac014c2@flygoat.com>
X-Url:  http://acmel.wordpress.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Wed, Dec 16, 2020 at 07:14:02PM +0800, Jiaxun Yang escreveu:
> 
> 
> 在 2020/12/16 下午6:05, Tiezhu Yang 写道:
> > Hi,
> > 
> > In the current upstream mainline kernel, perf record --call-graph dwarf
> > is not supported for architecture mips64. I find the following related
> > patches about this feature by David Daney <david.daney@cavium.com> and
> > Archer Yan <ayan@wavecomp.com> in Sep 2019.
 
> AFAIK ddaney left Cavium at 2018 and Wave Computing Shanghai is defuncted...
 
> Feel free to take over if you like, there is no licenses issue, just
> remember to credit
> others properly.

Ralf, can you take a look at the kernel part? The user space part seems
ok.

- Arnaldo
> 
> > [1/2] Support mips unwinding and dwarf-regs
> > https://lore.kernel.org/patchwork/patch/1126521/
> > 
> > [2/2] Support extracting off-line stack traces from user-space with perf
> > https://lore.kernel.org/patchwork/patch/1126520/
> > 
> > Is this a work in progress?
> > Could you please give me some feedback?
> > Thank you for your help.
> > 
> > Thanks,
> > Tiezhu
