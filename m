Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECCA21CCCF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2020 03:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgGMB3x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jul 2020 21:29:53 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:41340 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgGMB3x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Jul 2020 21:29:53 -0400
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.119.155])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id AEE4B20095
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2020 01:29:50 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 537D43F1CC;
        Mon, 13 Jul 2020 03:29:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id 30D9D2A8BF;
        Mon, 13 Jul 2020 03:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1594603786;
        bh=DzARRrthKRNYxBkHCyNw7Uw/T70usSbNBg4MU6C4hEA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=atIIb9266zB7mZ5nb5Qkxm7bodxDyGsaFXLKbMbdeb1lGdLMzzalIxJYYmRTg3232
         tPg2rViYVK4SYpAMnTolhNGGoLCVmmujM8hwh8SSaYP9QX1CQyFxCJvZesx9IO/aV7
         uAsbcQCPbhs7Eq7W6R0oo5x1Yz25rAo3sBSYRfCY=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xFHZdzoDGxTk; Mon, 13 Jul 2020 03:29:44 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Mon, 13 Jul 2020 03:29:44 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id EDA1E4013E;
        Mon, 13 Jul 2020 01:29:41 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="RKBl6Ztq";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.89])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0CD8A4013E;
        Mon, 13 Jul 2020 01:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1594603779;
        bh=DzARRrthKRNYxBkHCyNw7Uw/T70usSbNBg4MU6C4hEA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RKBl6ZtqeDEqk8COpA4GInyYpTDhbFfTxnoz816sBdFjWa8kK0if0iGaMmFqA4YKE
         3lyuMGzdsAwUjorJJn1IpAzs33hga4tKDcRfVX6VJ1MVYztEyM1c7dKOk0qvSAtWy0
         l4ABvFvaR/cON+zl7QcvNGT3CRuG7dIYdq2fI8Fw=
Subject: Re:
 arch/mips/alchemy/devboards/db1300.c:(.text.db1300_wm97xx_probe+0x2c):
 undefined reference to `wm97xx_config_gpio'
To:     linux-mips@vger.kernel.org
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        manuel.lauss@gmail.com
References: <202007121804.QJogPzGx%lkp@intel.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <45336876-6739-e23d-5c02-81d14ee7fb54@flygoat.com>
Date:   Mon, 13 Jul 2020 09:29:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202007121804.QJogPzGx%lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EDA1E4013E
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[lists.01.org,vger.kernel.org,alpha.franken.de,gmail.com];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

在 2020/7/12 18:01, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   0aea6d5c5be33ce94c16f9ab2f64de1f481f424b
> commit: ff487d41036035376e47972c7c522490b839ab37 MIPS: Truncate link address into 32bit for 32bit kernel
> date:   9 weeks ago
> config: mips-randconfig-c023-20200712 (attached as .config)
> compiler: mipsel-linux-gcc (GCC) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     mipsel-linux-ld: arch/mips/alchemy/devboards/db1300.o: in function `db1300_wm97xx_probe':

Well this seems unrelated with my changes.

Just wonder if alchemy still alive?
Should I fix it or just drop alchemy support?

- Jiaxun

>>> arch/mips/alchemy/devboards/db1300.c:(.text.db1300_wm97xx_probe+0x2c): undefined reference to `wm97xx_config_gpio'
>>> mipsel-linux-ld: arch/mips/alchemy/devboards/db1300.c:(.text.db1300_wm97xx_probe+0x4c): undefined reference to `wm97xx_config_gpio'
>>> mipsel-linux-ld: arch/mips/alchemy/devboards/db1300.c:(.text.db1300_wm97xx_probe+0x74): undefined reference to `wm97xx_register_mach_ops'
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
