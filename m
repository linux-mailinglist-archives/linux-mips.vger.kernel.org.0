Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6361BFF455
	for <lists+linux-mips@lfdr.de>; Sat, 16 Nov 2019 18:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbfKPRZU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Nov 2019 12:25:20 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25875 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbfKPRZU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Nov 2019 12:25:20 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573925085; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=C9IwIUv3annQOK/uXg8xW7bgb0YLWGaZBO/5F4/vF+UXBiv0/w2yuKtP2irqfa2OFceo64VBAxCqAPSdJEAMscH4cE8oA3gT7x6hyQZLvYTZV6JQVOX2wTZQwtrcFgT4AvXTkgMWFYg2qtVOOPYKGmM9Br5hm4RC+Baz7+by65I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573925085; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=aTRALQR4CqEiHU4NP8b+N6b7uKzFr3/nKzjBNaaQ8aA=; 
        b=N77MvAtQGuRDtv5b80PhG/WrvgDczo31G3CuRcEuz/mGfCPtb+sZty1RKXth4ksN8BCGfxGifLZFG0US9GiM11Q7rkwY1stjIdVidfrFLpZAgqiTu8be5QJjntYkD/Lm6qojdwxJmY8DPBPAc+zTKaTIfKisr0UoAtaA2pF8nrQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=WDcYye248Ef4WLcTgZNmH++c+Qec57Ck32liLJ0jU8FRy4V+NUfh0UImAqcmt5yzEGn0dIXvBj7k
    pzybZQlnYiRbfWVzbKJNfkqQXp7tSYzgJ/5PqX6NUpy9a5rXzHIa  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573925085;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=222;
        bh=aTRALQR4CqEiHU4NP8b+N6b7uKzFr3/nKzjBNaaQ8aA=;
        b=InRKYcgVT10rrBSb9sZjUoCxspKWVZgeucAnMRsO95e9zYZC9AtgqR+UPRdUS4jV
        jgoSrieKx54+jbVCzQIdn7usALXrTX8J5LfdBCPZNYqIOlcHS4TGFcWw+hWu7uTTZAV
        gdlTh1/laTpXgK/QI9l955odVgyhaDYtFALEI+R8=
Received: from localhost.localdomain (171.221.112.210 [171.221.112.210]) by mx.zohomail.com
        with SMTPS id 1573925083240419.3296852839269; Sat, 16 Nov 2019 09:24:43 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, paul@crapouillou.net,
        malat@debian.org, chenhc@lemote.com, jiaxun.yang@flygoat.com,
        tglx@linutronix.de, allison@lohutok.net
Subject: MIPS: Ingenic: Disable abandoned HPTLB function v2.
Date:   Sun, 17 Nov 2019 01:23:56 +0800
Message-Id: <1573925038-100744-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v1->v2:
1.use "cp0 register 5 sel 4" instead "cp0 config5 sel4".
2.use "write_c0_page_ctrl" instead "__asm__ ()".
3.use "XBURST_PAGECTRL_HPTLB_DIS" instead magic number "0xa9000000".
4.use switch to cleaner the code. 


