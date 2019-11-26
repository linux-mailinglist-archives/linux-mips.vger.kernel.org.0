Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC6C109916
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 07:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbfKZGSr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 01:18:47 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25815 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfKZGSr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 01:18:47 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574749096; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=LObZM9VFdF+cBLRpF0yhb4JQkKoHZd/KusW9r+M1Xwg9v/19XDo3eyXPrTfgf+sDKOTj0Jdub1W6ZVvSWuEqR98Fj78GyTS/NhrQI9wQMIEgF+yblHRVytTct90BYxMhX5iXT09glt0NuINGBd5xvr0x3MEu19gwASWaliCg3z8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574749096; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=dvZg84VkcqwBmc78zKOGCifweoOcK+GUFaohJDt5iZw=; 
        b=QX6oF5doT2o29Ma7orehYiDhuyRkm51xGReo/kX0vI+psSDV4tNecS4C488CvGuc0E/G3ajgjq5MzHxf8TUdqQH3ha+kRMffVMmu6qq4JPwT13B8LZozpzO9U34PL4A7C5bdwKPy7NeDnDMtm1Y47N8B+7w4wNTmtIJgNfhfU0o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=LjzlkTR+aUMFb5dxsKRfbcFueclvECvqatNCNufZYqF1J9GNE3VmCDFnEe8a6XvexP5JdDcS+onG
    uB7DQ03i+fue4X1PkikdPQenvNqfyCbG0zQXb50b6n9rAiTlpuPG  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574749096;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=dvZg84VkcqwBmc78zKOGCifweoOcK+GUFaohJDt5iZw=;
        b=hdtv7kPFO/d2DHqve7u6ojWJRBMk4nCQ+2IqpazV/69L2E5NVJKhcTqKF+T383y6
        X6bDCqzVVhPc+jAoP0r0KmEwIkuawGSBwiy+X2qh+F1fb7nSCm9VN+spnHLjQVgbw76
        ESLW/YpCU4wsoqcGrWcR9jSgruh65/7G7PWpPxew=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1574749094818297.2479841837486; Mon, 25 Nov 2019 22:18:14 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        fancer.lancer@gmail.com, syq@debian.org,
        yamada.masahiro@socionext.com, tglx@linutronix.de,
        malat@debian.org, paul@crapouillou.net, jiaxun.yang@flygoat.com,
        sernia.zhou@foxmail.com
Subject: Add Ingenic X1830 system type.
Date:   Tue, 26 Nov 2019 14:17:54 +0800
Message-Id: <1574749075-99329-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add X1830 system type for cat /proc/cpuinfo to give out X1830.
2.Add "PRID_IMP_XBURST_REV2" (X1830 belongs PRID_IMP_XBURST_REV2)
  and rename "PRID_IMP_XBURST" to "PRID_IMP_XBURST_REV1".


