Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76FA61DF455
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 05:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387509AbgEWDKQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 23:10:16 -0400
Received: from [115.28.160.31] ([115.28.160.31]:55094 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S2387492AbgEWDKP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 May 2020 23:10:15 -0400
Received: from [192.168.9.172] (unknown [112.65.48.98])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DFD236006D;
        Sat, 23 May 2020 11:10:00 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590203401; bh=dXIuR4GvghqLfh+VpO11e76Rpw5OrYtwXCk9lSqrVwE=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=QQWt4b01ahogis/4BfiUPbPlyI9zylJlfO4ffyUfJKoksmgAA72o0/4cZ3bpXcYIV
         NxnZlx2vVgmeBOxR0Ef/BOOxZ9MRpnxCXrc1+oxB4PxMgCOd+92tQCqCFxEy3bYphz
         /vq5rod45Qyqdbam5EFCwwU49V6YznvGGpZKcDEg=
From:   WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH v3 0/1] CPUCFG emulation on older Loongson64 cores
To:     =?UTF-8?B?5q+b56Kn5rOi?= <maobibo@loongson.cn>
Cc:     linux-mips@vger.kernel.org
References: <20200521181403.6078-1-git@xen0n.name>
 <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn>
Message-ID: <3a0306fa-cf76-d0b0-416f-0095f9fd2ea0@xen0n.name>
Date:   Sat, 23 May 2020 11:10:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <4701b93c.f740.1723c46a295.Coremail.maobibo@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020/5/22 20:06, 毛碧波 wrote:

> Sorry for late reponse.
> I just want to know how to solve compatibility on older kernel.
> It is ok to run user application with cpucfg instr on new kernel with this
> patch, however what if the application is running on older kernel without
> cpucfg simulation?

Hi Bibo,

A bit of detailed analysis is always good, so here we go:

1. Application targeting old kernels.

These applications never have guaranteed CPUCFG availability to begin 
with, nor will they ever have. So they simply parse /proc/cpuinfo or do 
CPUCFG while handling SIGILL. This will work on all kernels, so no problem.

2. Application targeting upstream kernel.

First, let's pretend Loongson-1 and Loongson-2EF do not exist. Then 
*all* Loongson have CPUCFG. It's basically like going back in time and 
retro-fitting all legacy chips sold with the new instruction, but only 
with newer kernels. Then we have:

2a. Applications that still want to run on old kernels;
2b. Applications that simply don't care and just go ahead to invoke CPUCFG.

For case 2a, the developers always realize they actually belong to case 
1, sooner or later. Typically after seeing the first customer bug report 
and deciding that the compatibility is required.

For case 2b, indeed such applications will break on the moment they 
encounter a legacy kernel, but it does not matter. Very likely there is 
no such possibility to begin with; but even if such a situation does 
happen, it is the *downstream developers* making the decision to rely on 
newer kernels to "blame".


It is not acceptable to stagnate development, just because someone 
decides to not update their software. All legacy hardware and software 
die eventually, and those that remain probably do not receive updates, 
so they are irrelevant to this discussion either.


P.S.: please kindly fix your email client, it is mangling the block 
quotes, apparently HTML-escaping the characters. And please don't 
top-post while you're at it...

> regards
> bibo,mao
