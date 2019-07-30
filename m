Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5CC47B04B
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 19:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbfG3Rko (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 13:40:44 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25586 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731376AbfG3Rkn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jul 2019 13:40:43 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564508416; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=g4LGaIvQNpMGUs/jZXDatNFKtnS4/nFZP4x4f7vMpcNI59QKnfbJitpRT2cRZ3Tw+O78KOxjFa8s7EAdatS86K0AdiUsbsO0+zXqTZ4PhEMbm1avK4zoij+P34wNvYkliqtv3Vdk6jEi5W98VSKXtwztisSfh+5eNLLMFaAs3So=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564508416; h=Cc:Date:From:Message-ID:Subject:To:ARC-Authentication-Results; 
        bh=IRMit1Bx9LNproZk4USQ9Jc73ih13ah/rrgGBBqPMJw=; 
        b=mU0g4zZZ8ZwE+I2HCiOEMmJ9aKL+hlHQWjIzxYVX3tuQPBf2b8Lb9MRZGnPwhtjgbRNxcyGUZ0XwputZ6ow6XVcBadDw4rwNihqPg243L+z3sIr8d1zo1ynD4A6n/zAbdZeCJLnhdZ5mFLFCIIMIAdwwsK2AZ2qxpARNZvnBRRU=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=ubdkKWzmtxtTHzdx4Qzog2eZ3ark31rEbPYPwZwWwM45Ubu7qYswEqeikgT8RKTi30NvVoX0WBhG
    37k92uXkTepH5h8qFYohmd8I+Rd69CKHFotln3B4pcCfFAuc+xn3  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564508416;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id; l=153;
        bh=IRMit1Bx9LNproZk4USQ9Jc73ih13ah/rrgGBBqPMJw=;
        b=G18Xy2VCFtws+KMyYYaiUx/aIrKRgEaf20dgO3KkyzGNcsLpMwc/GRymQCYC1dJ7
        yUlAz+LktH6aGSm8DuFKOcAgFNSBfnu3kIp4v723i4lZabQX+tWKJjidZLCEUMyhbDc
        gfHXj2T/xop1uN7Uvg4f2QL0MLA4vg7OkBy8PFl8=
Received: from localhost.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564508415899610.9807695501638; Tue, 30 Jul 2019 10:40:15 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, chenhc@lemote.com, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, jiaxun.yang@flygoat.com
Subject: MIPS: Ingenic: Fix bugs when detecting X1000's parameters.
Date:   Tue, 30 Jul 2019 22:55:09 +0800
Message-Id: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.fix bugs when detecting L2 cache sets value.
2.fix bugs when detecting L2 cache ways value.
3.fix bugs when calculate bogoMips and loops_per_jiffy.


