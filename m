Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AF324AC61
	for <lists+linux-mips@lfdr.de>; Thu, 20 Aug 2020 02:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgHTArj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 20:47:39 -0400
Received: from relay4.mymailcheap.com ([137.74.80.156]:49986 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbgHTAri (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Aug 2020 20:47:38 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id AFB4D3F1CF;
        Thu, 20 Aug 2020 02:47:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id D133F2A347;
        Wed, 19 Aug 2020 20:47:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1597884453;
        bh=mik3lkRm3XRBmorjbLDSLfkE+H+yosrvlTUTCU822gE=;
        h=From:To:Cc:Subject:Date:From;
        b=LJzveso3gj8dnZsFw+VJpm5yBKI2WKywUBQddHpAPUT0azZYIQRC3UhnSu2zB4KWf
         feO0KHEVsM5p1oONBEZzMAlajWhnuEjCrfRvK0rE3Z4dvDm2AALzmrd6F9Ptuehqml
         bNiP7/pxuC6xbDnEnarx05AKOYB8HulrJjNEM4II=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qv2Em2NnE3zr; Wed, 19 Aug 2020 20:47:32 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 19 Aug 2020 20:47:32 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 4175041737;
        Thu, 20 Aug 2020 00:47:30 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Kwi2FqS8";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [117.136.8.126])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1D5F741184;
        Thu, 20 Aug 2020 00:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1597884186;
        bh=mik3lkRm3XRBmorjbLDSLfkE+H+yosrvlTUTCU822gE=;
        h=From:To:Cc:Subject:Date:From;
        b=Kwi2FqS8GCKvfVLdPIhmnkSV/mg4bRYyGlAFcnobZVNJHsSK9mJ2fyAXjup75YFr0
         tiGoMYp293OwUeMdkZaZayZ5AX1hxfNr3C2T97fkLJp5Sdw16fwC5XOHyyZ16s4ze8
         lC3PsDfnr6z1j3dcCOI2MpEBf9jIweP4pKmX+91o=
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/2] Fix cacheinfo
Date:   Thu, 20 Aug 2020 08:42:48 +0800
Message-Id: <20200820004253.3418-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4175041737
X-Spamd-Result: default: False [4.90 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[117.136.8.126:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[7];
         MID_CONTAINS_FROM(1.00)[];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is causing lscpu segfault. So probably worthy to
include it as a part of mips-fixes. 

Jiaxun Yang (2):
  MIPS: cacheinfo: Add missing VCache
  MIPS: Loongson64: Set cluster for cores

 arch/mips/kernel/cacheinfo.c | 34 ++++++++++++++++++++++++++--------
 arch/mips/loongson64/smp.c   |  2 ++
 2 files changed, 28 insertions(+), 8 deletions(-)

-- 
2.28.0
