Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65A41F51A0
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 11:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgFJJz4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 05:55:56 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:40887 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727966AbgFJJz4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 05:55:56 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.102])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 455C42632D
        for <linux-mips@vger.kernel.org>; Wed, 10 Jun 2020 09:55:53 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 046213ECE3;
        Wed, 10 Jun 2020 05:55:51 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id D1F352A3AB;
        Wed, 10 Jun 2020 05:55:50 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1591782950;
        bh=qkIvV28wJk59OLxALLf3BLKbl9EBb3Pvsepqpq9voow=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I/NS7TACB6fzAsbLaS1qB2VVaKSdDR3iarfY4ZcjZ2CLCEltMzMZ8hY+7t82DVVgD
         W5kUaFkh0gp7pBOVUyNNIKF2q1IdQ9RB83kUzTTTd1WjCR/qKKf2KOTx/8s0MpIA01
         EagBhDM2tmS2oJvpHaojmvSR1u0LnFnbVTvswYdA=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NRgzJQTyvagZ; Wed, 10 Jun 2020 05:55:48 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 10 Jun 2020 05:55:48 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id D6308403ED;
        Wed, 10 Jun 2020 09:55:46 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="N1ECOWI5";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [192.227.170.24])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 09508403ED;
        Wed, 10 Jun 2020 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1591782938;
        bh=qkIvV28wJk59OLxALLf3BLKbl9EBb3Pvsepqpq9voow=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=N1ECOWI5JzPlyK2V3u8StREeW1oiNzxxq3fyIaHbf+s0ZDJKNBHYGhVsD9u7gbw5I
         tbfIou6MIR/YeuFVRIIcL6rlIXYjLZ8hmSvnYElq3i0OB/ykP9bDfIZg43z3zcyWdU
         G6QPwCJUdAkaqt2DccTi4R1aCNPQC8tqD7dnbBp0=
Subject: Re: [PATCH] MIPS:Loongson64:Add support for Loongson 2k processor.
To:     Lichao Liu <liulichao@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     yuanjunqing@loongson.cn, linux-mips@vger.kernel.org
References: <20200610093919.875-1-liulichao@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <eae9fb4e-68a6-563c-701b-b0025e71eb7c@flygoat.com>
Date:   Wed, 10 Jun 2020 17:55:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610093919.875-1-liulichao@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D6308403ED
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/6/10 17:39, Lichao Liu Ð´µÀ:
> Add minimal support for Loongson 2k processor:
> 1,startup with 2 cores;
> 2,irqchip driver support Loongson 2k;
> 3,test boot ramfs ok.
> 
> Core modification points:
> 1,Loongson 2k only parse dtb, do not process UEFI parameters;
> 2,Loongson 2k doesn't support NUMA;
> 3,Loongson 2k's interrupt controller support 64 irqs, so modify
>    linintc dirver to support Loongson 2k;
> 4,add new dts file and def config.
> 
> Signed-off-by: Lichao Liu <liulichao@loongson.cn>

Thanks for your patch, although it certainly doesn't meet mainline 
requirments, however, we have another in-progess mainline plan for 
Loongson-2K, with corrected booting protocol and sharing kernel image 
with other Loongson64 processors.

We've already got acknoledgement from Loongson Embedeed department about 
our plans, and they're now working on it to.

Here's our works[1] [2], if you're interested you can get in touch with 
Qining Ye <yeqining@loongson.cn>, he is the director of Loongson-2K's 
community projects in your company.

Btw: We're also trying to establish full devicetree based booting, but 
far from Loongson's current approach.

Thanks.

[1]: https://github.com/FlyGoat/linux/tree/next-testing-2k
[2]: https://github.com/flygoat/pmon-ls2k

- Jiaxun
