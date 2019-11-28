Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 189B510C6D7
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfK1Kiq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:38:46 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25876 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1Kiq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:38:46 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937489; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=XPqbXeBMXRdabPgNXCuXemkp9NfG7XufPrdRSGOrlGNKMc4at2sSg33OVaWvSIXErHhgQjwNtowJ+9Xzau/HtQofBt6cbCOfv5DT6jCJsqyAgce+n8ZNKS1OW80YsXS2fFqDYRNRE1pCrGqU12Hx9zRbABrzwYBryY14eF7j7Xg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937489; h=Cc:Date:From:Message-ID:Subject:To; 
        bh=yxfZjaSzvJmmIF3/UDAUmKpxvOzSWUdEnx1zq5UN/00=; 
        b=edt0plzyFotImPqliddn1VNt+ejQtm0cj+LjaVGldNOsUpECRwNpGt0B4uRaKS32IqXUgujPny3J+vHgVnWS/fJLV8dAehZwxiyXBV6ZAZiU6vSO3hXWaUlfLFjn5v/t7gceS1icjjJecAdgWN8af4qrx7HKGWyODSscFky6s5Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id; 
  b=Io2VzhN8FYm+jCGBn/nLbNTlVcpCWv3hs1b2ku2MD775kJ7bubjrri20OYkDI6pF8TFJFvjoBXU2
    l/Sc5UuK6Q80LD0n3caDC2rZfvna1fLebb4z1COopR/8aLE0+AWF  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937489;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=yxfZjaSzvJmmIF3/UDAUmKpxvOzSWUdEnx1zq5UN/00=;
        b=k5YupAEv7Akw3gLKEWaNctmtE9vvoYUt29NR6PCdiv8UyyFzPxzhhwb4tMtbpOmp
        IoWMz4WooSgEEqW+pyrlpvpZ2mCkNAOGH+nTmnbK7OkW9DeHyamhXxzY8md7EiQeh/Z
        VuN2u1slKce+YE7qgpQ8QEu7sQYMcdZ+m9zvdIM4=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574937487395663.3286323165637; Thu, 28 Nov 2019 02:38:07 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Subject: Add initial support for Ingenic X1000 SoC and Y&A CU Neo board v5.
Date:   Thu, 28 Nov 2019 18:37:37 +0800
Message-Id: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v4->v5:
1.Adjust item naming to prevent conflicts with subsequent "CU Geo" boards.
2.Rename "cu1000" to "cu1000-neo" to prevent conflicts with subsequent boards
  such as "cu1000-geo", and so on.
3.Remove "CONFIG_HZ=100" and "mem=32M@0x0" from defconfg, and update defconfig
  for msc controller and rtc.
4.Add msc controller and rtc DT node, and modify incorrect comments in DT.


