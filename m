Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99BA1F6583
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2020 12:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbgFKKTl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Jun 2020 06:19:41 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:40354 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgFKKTl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Jun 2020 06:19:41 -0400
X-Greylist: delayed 462 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Jun 2020 06:19:39 EDT
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 907BA20155
        for <linux-mips@vger.kernel.org>; Thu, 11 Jun 2020 10:11:55 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 1FADB3F163;
        Thu, 11 Jun 2020 12:11:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 68AD72A3AC;
        Thu, 11 Jun 2020 06:11:52 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1591870312;
        bh=lFVM0oCa4IpFGmLJjyXmQ0ZPQZYOCCecy/kX/a1fIKI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=vkmNhT/7moA5rKKbYX7QPkEvRPVS928UsGvOg7axCt1P/vr62e3NmBVLI+zkyC0X7
         0WXEF/lROJSjWyYBatsQ4AyGCAPIHEBo6rTrI+WDEUx2fRzMDv7Es2Ug4gXIUoEtNq
         bgSViokVsfvA5TiTBkhv1HfGQ5WbqUxTNfKCJ0hA=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id w0o95cKqQUeT; Thu, 11 Jun 2020 06:11:50 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Thu, 11 Jun 2020 06:11:49 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 977A440EA9;
        Thu, 11 Jun 2020 10:11:46 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Tc0jV9dD";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (n219078103103.netvigator.com [219.78.103.103])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id BE8C340EAA;
        Thu, 11 Jun 2020 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1591870275;
        bh=lFVM0oCa4IpFGmLJjyXmQ0ZPQZYOCCecy/kX/a1fIKI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Tc0jV9dD48NNJvf3iOHpNWUc+gRK/wuoeb6hKuBd/ao1zPlC7rPMLdJEOJ3oobLgs
         Saj3rKrSoiVZpiclzikZUBLko/g1a6OcQOhIjOsQU7oM0Cx4IlwQwBuV5J9yV/RcDs
         B/+sNll+Teqrp+9PN22ha48oomDtbJ5qSYaJKF7Y=
Subject: Re: [PATCH] MIPS:Loongson-2EF:disable fix-loongson3-llsc in compiler
To:     Lichao Liu <liulichao@loongson.cn>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     yuanjunqing@loongson.cn, linux-mips@vger.kernel.org
References: <20200611095924.29910-1-liulichao@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <41f8ac2d-7cf7-dec3-e7e1-32108aa4c7eb@flygoat.com>
Date:   Thu, 11 Jun 2020 18:11:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200611095924.29910-1-liulichao@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 977A440EA9
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
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/6/11 17:59, Lichao Liu Ð´µÀ:
> Firstly, Loongson-2EF support ll/sc instructions, but
> doesn't need fix-loongson3-llsc compile option.
> 
> Secondly, fix-loongson3-llsc will cause kernel startup
> fail at futex_init, because compiler will add 'sync' before
> 'll', which will affect __ex_table.
> futex_init will pass NULL uaddr parameter to
> futex_atomic_cmpxchg_inatomic.
> futex_atomic_cmpxchg_inatomic will access uaddr directly,
> which will cause page fault exception, the exception should be
> handled by __ex_table's nextinsn if the exception insn exsit in
> __ex_table. Because __ex_table is affected by compiler,
> the exception can not be handled, and
> futex_atomic_cmpxchg_inatomic will crash.
> 
> Error code as below:
> __ex_table.insn = 1b, which is 'sync' compiled with
> fix-loongson3-llsc, but the actual exception instrction is ll.
> So, do_page_fault will not find the correct inst in __ex_table, and
> can not handle this exception.
> 
>          "1: "user_ll("%1", "%3")"               \n"
>          "   bne %1, %z4, 3f             \n"
>          "   .set    pop                 \n"
>          "   move    $1, %z5                 \n"
>          "   .set    "MIPS_ISA_ARCH_LEVEL"           \n"
>          "2: "user_sc("$1", "%2")"               \n"
>          "   beqz    $1, 1b                  \n"
>          "3: " __SYNC_ELSE(full, loongson3_war, __WEAK_LLSC_MB) "\n"
>          "   .insn                       \n"
>          "   .set    pop                 \n"
>          "   .section .fixup,\"ax\"              \n"
>          "4: li  %0, %6                  \n"
>          "   j   3b                  \n"
>          "   .previous                   \n"
>          "   .section __ex_table,\"a\"           \n"
>          "   "__UA_ADDR "\t1b, 4b                \n"
>          "   "__UA_ADDR "\t2b, 4b                \n"
>          "   .previous
> 
> Signed-off-by: Lichao Liu <liulichao@loongson.cn>

Ahh, some distro may enable that option for default, although they're 
far from 2EF's era.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Btw: Please obey the format of previous commits, add *space* after ":", 
that can make kernel much more tidy.

Like:
MIPS: Loongson-2EF: Disable fix-loongson3-llsc in compiler

Thanks.

-- 
- Jiaxun
