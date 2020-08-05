Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC9C23CC75
	for <lists+linux-mips@lfdr.de>; Wed,  5 Aug 2020 18:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgHEQrR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Aug 2020 12:47:17 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:53783 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbgHEQor (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Aug 2020 12:44:47 -0400
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 6623720138;
        Wed,  5 Aug 2020 14:05:40 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id F0D453ECDA;
        Wed,  5 Aug 2020 15:59:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id CD7802A520;
        Wed,  5 Aug 2020 15:59:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596635976;
        bh=S0OjsalZhEvIZt4IpeHX6PgqDxctcBe0fHDg4vfhXTE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=haHFXP6dVcbqJe8MN/VtNlyS/R1FGB3Mu3s8Z3Cf31PF9YC+SgaFOeobpW9T45EzK
         b1w/sBC6x27uGUzVZA400aMkbRj+UGXknHtHwJeX8Sks0ZLmf6VyfYKKKqb5IW52RE
         187wK/ajVONwrrntKIQb2oIUYffKwmQPMSBMX2l8=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QmimT9RVqYc1; Wed,  5 Aug 2020 15:59:35 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed,  5 Aug 2020 15:59:35 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 07D6D425BE;
        Wed,  5 Aug 2020 13:59:35 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="cTHYaMoE";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li986-206.members.linode.com [45.33.36.206])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 29486425BD;
        Wed,  5 Aug 2020 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596635964;
        bh=S0OjsalZhEvIZt4IpeHX6PgqDxctcBe0fHDg4vfhXTE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=cTHYaMoESq7+fGabHgADpG5oML+zWL7rnb/3QhjaU3nbEE4nFok5qmyEq0TMy43vW
         QJf4ZErjbupxtpgpkBbMmJAmjpESlGYjhabyjXt0otH5nq4BwFsWQmxgUNxMncOZmN
         LPPpHy0LDAvjgCCgQQNDI6/zhJMHMs0l3bIiGNYk=
Subject: Re: [PATCH v2] MIPS: Provide Kconfig option for default IEEE 754
 conformance mode
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     WANG Xuerui <git@xen0n.name>,
        Serge Semin <fancer.lancer@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200801061147.1412187-1-jiaxun.yang@flygoat.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d03a350c-842c-c041-f11b-017ec68e3de4@flygoat.com>
Date:   Wed, 5 Aug 2020 21:59:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <20200801061147.1412187-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 07D6D425BE
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com,zoho.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[xen0n.name,gmail.com,lemote.com,zoho.com,vger.kernel.org];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/8/1 14:11, Jiaxun Yang Ð´µÀ:
> Requested by downstream distros, a Kconfig option for default
> IEEE 754 conformance mode allows them to set their mode to
> relaxed by default.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> Reviewed-by: Huacai Chen <chenhc@lemote.com>
>
> --
> v2: Reword according to Xuerui's suggestion.
> ---
Hi Thomas,

Is it possible to get this patch into 5.9 merge window?
I think it have got enough review tag, and the config option was requested
by a Debian developer. The next Debian release will take 5.9 lts kernel and
they don't want to ship a non-bootable kernel in a major release.

Thanks.

- Jiaxun
