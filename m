Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9B362150C8
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2020 03:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgGFBNS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Jul 2020 21:13:18 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:41451 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbgGFBNS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Jul 2020 21:13:18 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id C875B2629C
        for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2020 01:13:14 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 3A4013ECE3;
        Sun,  5 Jul 2020 21:13:12 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 7B4002A7CF;
        Mon,  6 Jul 2020 03:13:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1593997991;
        bh=cIUKT3kvUhkbpQGfOxsi0y3f4skyd60Fz8gdY2z36oQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Zk+hr+5u0OQasWn9qbRI9C965Hvlu/Z7YMNd+Rc3RZcAK3JMVEtswvnqaj1xnUBht
         smDa1LuFtmRIKx4wbhCw+F6nX0RFhjantcugU+tpeaL9aWNlUDTS5avW19JrdvlpMV
         1oRPTDifTjCefY3tJzRLgxIMfmslnISScZuzKyKc=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zLh_b6CxX8h6; Mon,  6 Jul 2020 03:13:09 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Mon,  6 Jul 2020 03:13:09 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 398AF4165E;
        Mon,  6 Jul 2020 01:13:08 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="np8lB4/1";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (ec2-18-163-238-147.ap-east-1.compute.amazonaws.com [18.163.238.147])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 770CD4165E;
        Mon,  6 Jul 2020 01:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1593997981;
        bh=cIUKT3kvUhkbpQGfOxsi0y3f4skyd60Fz8gdY2z36oQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=np8lB4/1kEEZxHTI8Gf98oGiXjSqicaY5MyuYk4RrnHReWkpZMWCQvYMI3arWiGOQ
         c+8Z7VSRohXkuxDo1JImx6Q5zTpoC+c/o1lrnYHRNOF6/wo4bGrWyKNGyRnjUXr2pV
         z6lh7SFNsQQ6tp8t2MlG6q7ThPwDmt2/1K4izHNc=
Subject: Re: [PATCH 3/3] MIPS: handle Loongson-specific GSExc exception
To:     WANG Xuerui <git@xen0n.name>, linux-mips@vger.kernel.org
Cc:     Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>, wuruiyang@loongson.cn,
        hww@loongson.cn, wanghonghu@loongson.cn, jinguojie@loongson.cn
References: <20200705165050.2078964-1-git@xen0n.name>
 <20200705165050.2078964-4-git@xen0n.name>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <47d6eff4-364b-6d85-5e8e-e9b11d03e31e@flygoat.com>
Date:   Mon, 6 Jul 2020 09:12:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200705165050.2078964-4-git@xen0n.name>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 398AF4165E
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
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



ÔÚ 2020/7/6 0:50, WANG Xuerui Ð´µÀ:
> Newer Loongson cores (Loongson-3A R2 and newer) use the
> implementation-dependent ExcCode 16 to signal Loongson-specific
> exceptions. The extended cause is put in the non-standard CP0.Diag1
> register which is CP0 Register 22 Select 1, called GSCause in Loongson
> manuals. Inside is an exception code bitfield called GSExcCode, only
> codes 0 to 6 inclusive are documented (so far, in the Loongson 3A3000
> User Manual, Volume 2).
>
> During experiments, it was found that some undocumented unprivileged
> instructions can trigger the also-undocumented GSExcCode 8. Processor
> state is not corrupted, but we cannot continue without further knowledge,
> and Loongson is not providing that information as of this writing. So we
> send SIGILL on seeing this exception code to thwart easy local DoS
> attacks.
>
> Other exception codes are made fatal, partly because of insufficient
> knowledge, also partly because they are not as easily reproduced. None
> of them are encountered in the wild with upstream kernels so far.
>
> Some older cores (Loongson-3A1000 and Loongson-3B1500) have ExcCode 16
> too, but the semantic is equivalent to GSExcCode 0. Because the
> respective manuals did not mention the CP0.Diag1 register or its read
> behavior, these cores are not covered in this patch, as MFC0 from
> non-existent CP0 registers is UNDEFINED according to the MIPS
> architecture spec.
>
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

It's a shame for Loongson that community needs to do kinda "reverse 
engineering"
to "workaround" a hardware feature.

+ Some Loonson guys
Wish you guys can release necessary documents, or at least give us some
explainations on how to get it correct.

Don't be NVIDIA!

Thanks.

> Cc: Huacai Chen <chenhc@lemote.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
- Jiaxun
