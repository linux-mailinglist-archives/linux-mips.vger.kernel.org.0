Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC55241C79
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 16:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgHKOev (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 10:34:51 -0400
Received: from relay4.mymailcheap.com ([137.74.80.154]:39845 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbgHKOeu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 10:34:50 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id C54E13F1CF
        for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2020 16:34:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id F30802A3A8
        for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2020 10:34:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1597156486;
        bh=6dJqrA1NPRsTFmML6GzvdCbUbd5EBnq3u5eeThyw6Xk=;
        h=To:From:Subject:Date:From;
        b=UVMqkN5Q/wc9a5wTLpJ/sgr7Gn2TSHvbZlXM+bSRvLdpxRZ2x0e61bZ4y7wj2qAKa
         nbDrjpANRAmIWAY6ao50maAoWSEXxwDujt5nIZGvRa+NjV5jUbm0PmBHiYjFwcIHl9
         91I0/ljReViqlb2u+3avqaD2y4/tZ6Nmkt/mkIMo=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mpekS-yCfzqV for <linux-mips@vger.kernel.org>;
        Tue, 11 Aug 2020 10:34:44 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS
        for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2020 10:34:44 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 936B240855
        for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2020 14:34:41 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Hy9VAlV7";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (n11212042148.netvigator.com [112.120.42.148])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id C981640855
        for <linux-mips@vger.kernel.org>; Tue, 11 Aug 2020 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1597156457;
        bh=6dJqrA1NPRsTFmML6GzvdCbUbd5EBnq3u5eeThyw6Xk=;
        h=To:From:Subject:Date:From;
        b=Hy9VAlV7An7r5GXHN5HcbnhSEBF5TO3J9F9FMJ4RA5P3a85NBFoDoI8JekuLYBPW/
         KwDEqKJ4vjyFrYknxuhlPpF8skQOdldXbCy+MkkKsch4fCWYUPCNt9cZWFHuPHDIoa
         EOSun+P2qK9YH7Bf+F9RKYze+jIDvskBrbiaGmKk=
To:     "open list:MIPS" <linux-mips@vger.kernel.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: All linux-mips lists archives are now available at lore
Message-ID: <8eafef86-1c29-842c-c35b-de0df9d386fb@flygoat.com>
Date:   Tue, 11 Aug 2020 22:34:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Rspamd-Queue-Id: 936B240855
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         PREVIOUSLY_DELIVERED(0.00)[linux-mips@vger.kernel.org];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_ONE(0.00)[1];
         ML_SERVERS(-3.10)[213.133.102.83];
         TO_DN_ALL(0.00)[];
         DKIM_TRACE(0.00)[flygoat.com:+];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
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
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

I have collect all the lists archives of linux-mips, from the SGI era to 
linux-mips.org era,
to lore.kernel.org, including the first mail of SGI's MIPS list [1].

At least we won't lost these treasures if linux-mips.org down :-)

Btw:
Due to some personal reasons I will be inactive until December.
Sorry for the inconvenience.

Thanks.

[1]: 
https://lore.kernel.org/linux-mips/199602241021.CAA19391@cthulhu.engr.sgi.com/

- Jiaxun
