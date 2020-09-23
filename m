Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA47E275929
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 15:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgIWNwf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 09:52:35 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:57486 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgIWNwf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 09:52:35 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.102])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id B98AC200FE;
        Wed, 23 Sep 2020 13:52:31 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id E32623F201;
        Wed, 23 Sep 2020 13:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id C65E22A3E1;
        Wed, 23 Sep 2020 09:52:29 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600869149;
        bh=a1LfviR3VbyZh4Nk0FS3MktFMmLYUmJVZmOzx2yNj4I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=bzb85VRtpR5KbG3Hle892IR0MymCtj/orGQBUvKdBkfZ6CSEmgH2Y0msmjpeRA9EI
         7lZQqvXFua3mciZjyIDRBszrqGdZ7G2VLqqy6++w/hiBpvG5uPZxw3wmyvOoBkNZyq
         DYEQV3M4CAZLBKfuT227757MMIBIAoPjDK7bZ1hw=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ONeU5LxvPo8z; Wed, 23 Sep 2020 09:52:28 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 23 Sep 2020 09:52:28 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 1892340FE5;
        Wed, 23 Sep 2020 13:52:27 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="mK0J2bVT";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id BE6A040FE5;
        Wed, 23 Sep 2020 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600869059;
        bh=a1LfviR3VbyZh4Nk0FS3MktFMmLYUmJVZmOzx2yNj4I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mK0J2bVTzX8X3SgzueDarkdVc/Yx6n7wd8GQNjfT8bPuqTkAWu4+/L+HY5v/rsPce
         fv7YINuAGlcsOC69s6yMRB50o83iEj3ZUiJJAJKd9VoOMruucM3LvI7lW87qzy4hb4
         ZUA0Mz2/iqv3NWdcL4IcD+ss0pxwYSM8kIsyCoY4=
Subject: Re: [PATCH 1/4] rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
To:     WANG Xuerui <git@xen0n.name>, linux-rtc@vger.kernel.org
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>
References: <20200923075845.360974-1-git@xen0n.name>
 <20200923075845.360974-2-git@xen0n.name>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <100edde4-c9cf-75bd-d8e5-727ed6dc4cc0@flygoat.com>
Date:   Wed, 23 Sep 2020 21:50:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200923075845.360974-2-git@xen0n.name>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1892340FE5
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
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/9/23 15:58, WANG Xuerui Ð´µÀ:
> This RTC module is integrated into the Loongson-2K SoC and the LS7A
> bridge chip. This version is almost entirely rewritten to make use of
> current kernel API.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: WANG Xuerui <git@xen0n.name>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

This driver have been out of tree for around 10yrs,
thanks for shaping it to mainline quality!

- Jiaxun

> ---
