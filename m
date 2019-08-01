Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826687DB32
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2019 14:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727248AbfHAMSD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Aug 2019 08:18:03 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25489 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfHAMSD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Aug 2019 08:18:03 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564661852; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=MQX0XvzBAMLn2m2cyb05mDOsj4CZfCuyYdSt4Ym/sfAI7oka4wWAImv2uYEYIRZWOABPCbisWtmxCspxtdqZp20n2+MyBYZaVbph4AJ9NiHRq8TVOThi0ccuEamTe8SFFlujICXaU8ZCAtF0E+PWNs1R3kN1qawKfSwobscTFrg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564661852; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=kJKEr88bIEfPIQzI901c1rM9db7qmdDjtUh5J1gMv3I=; 
        b=aVq3gqq7j3GHzbL2H1TVUcql2Uqy/zyFYbub5VCSCUGOk31FGKl0BheugEu4bu3gomjwAOa9syY+evBWrZHJarsv1Z4qV6CHGS5xF2K6RpxTufrjzBqfCT089/YpXR4u3RRMdG9W+Snk3m3scF7r46/JXhBlTmqWJ2145P9BmX8=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=mh5cTJAQ3xJYbtOdXBjWDfvQbK/g4c8+mf5mWkXuhe+F2x9vk2p3fAegIXSQL+8oAJ3nWAqlo5sw
    95IH2a7RldDWcQZgsTE1P9XUCKIQxOA+J9gZYHmwvpSTAkD8xeCg  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564661852;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=147;
        bh=kJKEr88bIEfPIQzI901c1rM9db7qmdDjtUh5J1gMv3I=;
        b=ArFvHgLE9StdNTNO7i/J8PF1RGzoH9hEL2IFFbn3gj/gI3cxdMVK9JkiB/K+KGm5
        zNAz6jPRDevV73XAIw/SpH9939PJp8TQ+i6xY0H7qaWr7S1Pcg5Ud18optiH85tCbVG
        wrxEEVGREj2hyff9xvsvbxcS1Ka6SLtJKIPQQMm4=
Received: from localhost.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 15646618517311010.5135306108771; Thu, 1 Aug 2019 05:17:31 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, chenhc@lemote.com,
        jiaxun.yang@flygoat.com
Subject: MIPS: Ingenic: Fix bugs when detecting X1000's parameters v3
Date:   Thu,  1 Aug 2019 20:16:29 +0800
Message-Id: <1564661791-47731-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2: Use "set_c0_config7(BIT(4))" to simplify code and add comment.
v2->v3: Split patch and use "MIPS_CONF7_BTB_LOOP_EN" to instead "BIT(4)".


